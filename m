Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E2123CBC7
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Aug 2020 17:44:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69726844;
	Wed,  5 Aug 2020 17:43:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69726844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596642284;
	bh=uZUQ2p1lv1ROPJG3oE41TCnvm51J5T+KPI9JujCJgfs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EjmPY35ozy77D9Zjw1pREPT8S4CbKRUr7ON27w/lERD/qydKfGQRVncjs/4yaFy9T
	 k+M+903ccIe+e0Pr1BRX3yiS7WChCZ3b/dM6fPKOZCz11ePbojezNcf/sJ50Q+D2ni
	 GaVQdza6oC+Ot6iFb0ox8vqJtjkZzEajTu5cQfik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DD43F801F7;
	Wed,  5 Aug 2020 17:43:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 435C2F80218; Wed,  5 Aug 2020 17:43:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A294F80112
 for <alsa-devel@alsa-project.org>; Wed,  5 Aug 2020 17:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A294F80112
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id ADC9641A36;
 Wed,  5 Aug 2020 15:42:50 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
To: alsa-devel@alsa-project.org
Subject: [PATCH] alsaseq: fix constant objects in Python 3
Date: Thu,  6 Aug 2020 00:42:43 +0900
Message-Id: <20200805154243.64485-1-marcan@marcan.st>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Hector Martin <marcan@marcan.st>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In Py3 everything is a long, so we can't get away with duplicating the
integer object layout any more. Properly subclass PyLong_Type instead,
with a bit of a hack to add an extra name field after the variable-sized
data section.

Also get rid of the enum type stuff, which seems to be unused cruft, and
the numprotocol stuff, because the base type can take care of that (and
we can't map arbitrary arithmetic results back to constants anyway).

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 pyalsa/alsaseq.c | 149 +++++++++++++++++------------------------------
 1 file changed, 52 insertions(+), 97 deletions(-)

diff --git a/pyalsa/alsaseq.c b/pyalsa/alsaseq.c
index 0e7cc35..9d9b1a9 100644
--- a/pyalsa/alsaseq.c
+++ b/pyalsa/alsaseq.c
@@ -51,9 +51,6 @@
 /* the C variable of a constant dict */
 #define TDICT(subtype) _dictPYALSASEQ_CONST_##subtype
 
-/* the C enumeration of a constant dict */
-#define TTYPE(subtype) PYALSASEQ_CONST_##subtype
-
 /* defines constant dict by type */
 #define TCONSTDICT(subtype)			\
   static PyObject * TDICT(subtype);
@@ -71,7 +68,7 @@
 /* creates a typed constant and add it to the module and dictionary */
 #define TCONSTADD(module, subtype, name) {				\
     PyObject *tmp =							\
-      Constant_create(#name, SND_##name, TTYPE(subtype));		\
+      Constant_create(#name, SND_##name);		\
     if (tmp == NULL) {							\
       return MOD_ERROR_VAL;						\
     }									\
@@ -109,46 +106,6 @@
     }							\
   }
 
-
-/* num protocol support for binary Constant operations */
-#define NUMPROTOCOL2(name, oper)				\
-  static PyObject *						\
-  Constant_##name (PyObject *v, PyObject *w) {			\
-    int type = 0;						\
-    long val1, val2, val;					\
-    if (get_long1(v, &val1) || get_long1(w, &val2)) {		\
-      Py_INCREF(Py_NotImplemented);				\
-      return Py_NotImplemented;					\
-    }								\
-    val = val1 oper val2;					\
-    /* always asume left will be the type */			\
-    if (PyObject_TypeCheck(v, &ConstantType)) {			\
-      type = ((ConstantObject *) v)->type;			\
-    } else if (PyObject_TypeCheck(w, &ConstantType)) {		\
-      type = ((ConstantObject *) w)->type;			\
-    }								\
-    PyObject *self = Constant_create(#oper, val, type);		\
-    return self;						\
-  }
-
-/* num protocol support for unary Constant operations */
-#define NUMPROTOCOL1(name, oper)			\
-  static PyObject *					\
-  Constant_##name (PyObject *v) {			\
-    int type = 0;					\
-    long val1, val;					\
-    if (get_long1(v, &val1)) {				\
-      Py_INCREF(Py_NotImplemented);			\
-      return Py_NotImplemented;				\
-    }							\
-    val = oper val1;					\
-    if (PyObject_TypeCheck(v, &ConstantType)) {		\
-      type = ((ConstantObject *) v)->type;		\
-    }							\
-    PyObject *self = Constant_create(#oper, val, type); \
-    return self;					\
-  }
-
 /* sets the object into the dict */
 #define SETDICTOBJ(name, object)		\
   PyDict_SetItemString(dict, name, object)
@@ -328,21 +285,6 @@
 // alsaseq.Constant implementation
 //////////////////////////////////////////////////////////////////////////////
 
-/* alsaseq.Constant->type enumeration */
-enum {
-  PYALSASEQ_CONST_STREAMS,
-  PYALSASEQ_CONST_MODE,
-  PYALSASEQ_CONST_QUEUE,
-  PYALSASEQ_CONST_CLIENT_TYPE,
-  PYALSASEQ_CONST_PORT_CAP,
-  PYALSASEQ_CONST_PORT_TYPE,
-  PYALSASEQ_CONST_EVENT_TYPE,
-  PYALSASEQ_CONST_EVENT_TIMESTAMP,
-  PYALSASEQ_CONST_EVENT_TIMEMODE,
-  PYALSASEQ_CONST_ADDR_CLIENT,
-  PYALSASEQ_CONST_ADDR_PORT,
-};
-
 // constants dictionaries
 
 TCONSTDICT(STREAMS);
@@ -390,34 +332,66 @@ PyDoc_STRVAR(Constant__doc__,
   "Python number protocol."
 );
 
-/** alsaseq.Constant object structure type */
+/** alsaseq.Constant additional fields */
+/* This follows the variable length portion of the Long type */
 typedef struct {
-  PyObject_HEAD
-  ;
-
-  /* value of constant */
-  unsigned long int value;
   /* name of constant */
   const char *name;
-  /* type of constant */
-  int type;
+} ConstantExtraFields;
+
+/** alsaseq.Constant object structure type */
+typedef struct {
+#if PY_MAJOR_VERSION < 3
+  PyIntObject base;
+#else
+  /* NOTE: this only works if the value fits in one digit */
+  PyLongObject base;
+#endif
+  /* This field is actually offset by the base type's variable size portion */
+  ConstantExtraFields extra;
 } ConstantObject;
 
+#if PY_MAJOR_VERSION < 3
+/* PyInt is fixed size in Python 2 */
+# define CONST_VALUE(x) PyInt_AsLong((PyObject *)x)
+# define CONST_EXTRA(x) (&(x->extra))
+#else
+/* PyLong is variable size in Python 3 */
+# define CONST_VALUE(x) PyLong_AsLong((PyObject *)x)
+# define CONST_EXTRA(x) \
+    ((ConstantExtraFields *)( \
+        ((intptr_t)(&x->extra)) \
+        + abs(Py_SIZE(&x->base)) * Py_TYPE(x)->tp_itemsize \
+    ))
+#endif
+
 /** alsaseq.Constant type (initialized later...) */
 static PyTypeObject ConstantType;
 
 /** alsaseq.Constant internal create */
 static PyObject *
-Constant_create(const char *name, long value, int type) {
-  ConstantObject *self = PyObject_New(ConstantObject, &ConstantType);
+Constant_create(const char *name, long value) {
+#if PY_MAJOR_VERSION < 3
+  PyObject *val = PyInt_FromLong(value);
+#else
+  PyObject *val = PyLong_FromLong(value);
+#endif
+
+  PyObject *args = PyTuple_Pack(1, val);
+  Py_DECREF(val);
+  
+#if PY_MAJOR_VERSION < 3
+  ConstantObject *self = (ConstantObject *)PyInt_Type.tp_new(&ConstantType, args, NULL);
+#else
+  ConstantObject *self = (ConstantObject *)PyLong_Type.tp_new(&ConstantType, args, NULL);
+#endif
+  Py_DECREF(args);
 
   if (self == NULL) {
     return NULL;
   }
 
-  self->value = value;
-  self->name = name;
-  self->type = type;
+  CONST_EXTRA(self)->name = name;
 
   return (PyObject *)self;
 }
@@ -426,34 +400,16 @@ Constant_create(const char *name, long value, int type) {
 static PyObject *
 Constant_repr(ConstantObject *self) {
   return PyUnicode_FromFormat("%s(0x%x)",
-			     self->name,
-			     (unsigned int)self->value);
+			     CONST_EXTRA(self)->name,
+			     (unsigned int)CONST_VALUE(self));
 }
 
 /** alsaseq.Constant tp_str */
 static PyObject *
 Constant_str(ConstantObject *self) {
   return PyUnicode_FromFormat("%s",
-			     self->name);
-}
-
-/** alsaseq.Constant Number protocol support (note: not all ops supported) */
-NUMPROTOCOL2(Add, +)
-NUMPROTOCOL2(Subtract, -)
-NUMPROTOCOL2(Xor, ^)
-NUMPROTOCOL2(Or, |)
-NUMPROTOCOL2(And, &)
-NUMPROTOCOL1(Invert, ~)
-
-/** alsaseq.Constant number protocol methods */
-static PyNumberMethods Constant_as_number = {
- nb_add: (binaryfunc)Constant_Add,
- nb_subtract: (binaryfunc)Constant_Subtract,
- nb_xor: (binaryfunc)Constant_Xor,
- nb_or: (binaryfunc)Constant_Or,
- nb_and: (binaryfunc)Constant_And,
- nb_invert: (unaryfunc)Constant_Invert
-};
+			     CONST_EXTRA(self)->name);
+}
 
 /** alsaseq.Constant type */
 static PyTypeObject ConstantType = {
@@ -464,7 +420,7 @@ static PyTypeObject ConstantType = {
 #else
   tp_base: &PyLong_Type,
 #endif
-  tp_basicsize: sizeof(ConstantObject),
+  tp_basicsize: sizeof(ConstantObject) + sizeof(ConstantExtraFields),
   tp_flags:
 #if PY_MAJOR_VERSION < 3
   Py_TPFLAGS_HAVE_GETCHARBUFFER
@@ -474,7 +430,6 @@ static PyTypeObject ConstantType = {
   0,
 #endif
   tp_doc: Constant__doc__,
-  tp_as_number: &Constant_as_number,
   tp_free: PyObject_Del,
   tp_str: (reprfunc)Constant_str,
   tp_repr: (reprfunc)Constant_repr
@@ -1730,7 +1685,7 @@ SeqEvent_repr(SeqEventObject *self) {
   unsigned int ntime = 0;
   Py_DECREF(key);
   if (constObject != NULL) {
-    typestr = constObject->name;
+    typestr = constObject->extra.name;
   }
 
   if (snd_seq_ev_is_real(self->event)) {
-- 
2.27.0

