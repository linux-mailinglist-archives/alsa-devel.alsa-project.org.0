Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 820F81B529F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 04:40:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 147FB16E7;
	Thu, 23 Apr 2020 04:39:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 147FB16E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587609644;
	bh=T/xKIP/6dMLHaAEx5a0awJZWSmmSYUkFRd5dckf4SUQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KO7gTAivbREwqjBHasrbCk7MCbA+htXtwkff/g+YbSaUEusxZwjwHRa4b9/b7fZyT
	 fmIzDAAJDRiCIYE+Jr8UnSVXFDd6Jm2Z9t9RTqkoV1zF6KhtjjD0LkvxKHCHfbnccv
	 Wm4MpstX/VWBfeIHBDtioznxVVeR2LcBpK0UmOvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B7C3F801ED;
	Thu, 23 Apr 2020 04:39:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FB75F801EC; Thu, 23 Apr 2020 04:38:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CE55F80121
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 04:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CE55F80121
IronPort-SDR: H151l9299kwOpQULmDdIxRCWUU9YtobMqxjYkiQyM5HhcfszBmUjjIcNbsLqmPTNd7h3SfVHFb
 OMdQN+GJJPpg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 19:38:48 -0700
IronPort-SDR: puJ0u6Me41J+kW8WWuUvuTuLlXVf3W+ZCLN1ha0QUSQefA3i6IeN9QLEe0qROkFVE5A9ev83ev
 qDKW1Z0UaYHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,305,1583222400"; d="scan'208";a="402762454"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 22 Apr 2020 19:38:47 -0700
Received: from younglee-svr.sh.intel.com (younglee-svr.sh.intel.com
 [10.239.159.43])
 by linux.intel.com (Postfix) with ESMTP id BBEAD580665;
 Wed, 22 Apr 2020 19:38:41 -0700 (PDT)
From: libin.yang@linux.intel.com
To: perex@perex.cz,
	alsa-devel@alsa-project.org
Subject: [alsa-devel] [alsa-lib][RFC PATCH] ucm: reset config id of condition
 items
Date: Thu, 23 Apr 2020 09:58:55 +0800
Message-Id: <1587607135-20106-1-git-send-email-libin.yang@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: libin.yang@intel.com
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

From: Libin Yang <libin.yang@intel.com>

UCMv2 supports "If" statement and will merge the same items with
compound_merge(). If the items have the same id, it will fail to
add the config items. And the id of the item in an array is
automatically generated with the increased number. It is probably
that some items to be merged have the same id. Let's add prefix
in the id to avoid such situation.

For example:

If.seq1 {
	Condition {
		Type ControlExists
		Control "name='PGA1.0 1 Master Playback Volume'"
	}
	True {
		EnableSequence [
			cset "name='PGA1.0 1 Master Playback Volume' 50"
		]
	}
}

If.seq2 {
	Condition {
		Type ControlExists
		Control "name='PGA2.0 2 Master Playback Volume'"
	}
	True {
		EnableSequence [
			cset "name='PGA2.0 2 Master Playback Volume' 50"
		]
	}
}

If.seq3 {
	Condition {
		Type ControlExists
		Control "name='PGA3.0 3 Master Playback Volume'"
	}
	True {
		EnableSequence [
			cset "name='PGA3.0 3 Master Playback Volume' 50"
		]
	}
}

If seq1, seq2 and seq3 conditions are true, UCM will fail to initialize.

This patch rename the config id to avoid the same id conflict.

Signed-off-by: Libin Yang <libin.yang@intel.com>
---
 include/conf.h     |  2 +-
 src/conf.c         | 21 +++++++++++++++++++++
 src/ucm/ucm_cond.c | 28 ++++++++++++++++++++++++----
 3 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/include/conf.h b/include/conf.h
index 456b272..adb3d84 100644
--- a/include/conf.h
+++ b/include/conf.h
@@ -139,7 +139,7 @@ int snd_config_imake_safe_string(snd_config_t **config, const char *key, const c
 int snd_config_imake_pointer(snd_config_t **config, const char *key, const void *ptr);
 
 snd_config_type_t snd_config_get_type(const snd_config_t *config);
-
+int snd_config_of_array(const snd_config_t *config);
 int snd_config_set_id(snd_config_t *config, const char *id);
 int snd_config_set_integer(snd_config_t *config, long value);
 int snd_config_set_integer64(snd_config_t *config, long long value);
diff --git a/src/conf.c b/src/conf.c
index 50d0403..43d565b 100644
--- a/src/conf.c
+++ b/src/conf.c
@@ -435,6 +435,8 @@ struct _snd_config {
 	char *id;
 	snd_config_type_t type;
 	int refcount; /* default = 0 */
+	/* member of an array */
+	int of_array;
 	union {
 		long integer;
 		long long integer64;
@@ -1123,6 +1125,7 @@ static int _snd_config_make(snd_config_t **config, char **id, snd_config_type_t
 		*id = NULL;
 	}
 	n->type = type;
+	n->of_array = 0;
 	if (type == SND_CONFIG_TYPE_COMPOUND)
 		INIT_LIST_HEAD(&n->u.compound.fields);
 	*config = n;
@@ -1316,6 +1319,8 @@ static int parse_array_def(snd_config_t *parent, input_t *input, int *idx, int s
 	default:
 		unget_char(c, input);
 		err = parse_value(&n, parent, input, &id, skip);
+		/* this is a member of an array */
+		n->of_array = 1;
 		if (err < 0)
 			goto __end;
 		break;
@@ -1784,6 +1789,22 @@ snd_config_type_t snd_config_get_type(const snd_config_t *config)
 }
 
 /**
+ * \brief Returns the of_array of a configuration node.
+ * \param config Handle to the configuration node.
+ * \return of_array of the node
+ *
+ * The returned value indicates whether the node is a member of an array.
+ *
+ * \par Conforming to:
+ * LSB 3.2
+ */
+int snd_config_of_array(const snd_config_t *config)
+{
+	assert(config);
+	return config->of_array;
+}
+
+/**
  * \brief Returns the id of a configuration node.
  * \param[in] config Handle to the configuration node.
  * \param[out] id The function puts the pointer to the id string at the
diff --git a/src/ucm/ucm_cond.c b/src/ucm/ucm_cond.c
index 22b418d..725a69e 100644
--- a/src/ucm/ucm_cond.c
+++ b/src/ucm/ucm_cond.c
@@ -347,14 +347,15 @@ static void config_dump(snd_config_t *cfg)
 }
 #endif
 
-static int compound_merge(const char *id,
+static int compound_merge(const char *id, const char *cname,
 			  snd_config_t *dst, snd_config_t *src,
 			  snd_config_t *before, snd_config_t *after)
 {
 	snd_config_iterator_t i, next;
 	snd_config_t *n, *_before = NULL, *_after = NULL;
 	const char *s;
-	int err;
+	char s1[32];
+	int err, cnt;
 
 	if (snd_config_get_type(src) != SND_CONFIG_TYPE_COMPOUND) {
 		uc_error("compound type expected for If True/False block");
@@ -387,8 +388,22 @@ static int compound_merge(const char *id,
 		return -EINVAL;
 	}
 
+	cnt = 0;
 	snd_config_for_each(i, next, src) {
 		n = snd_config_iterator_entry(i);
+		/*
+		 * If n is an array member, n->id is automatically generated.
+		 * It is prossible that n->id is used by other array member,
+		 * which will be merged with this one. So let's add prefix
+		 * to the id to avoid the conflict.
+		 */
+		if (snd_config_of_array(n)) {
+			err = snd_config_get_id(n, &s);
+			if (err < 0)
+				return err; /* FIXME: this will never happen */
+			snprintf(s1, sizeof(s1), "%s-%d-%s", cname, cnt++, s);
+			snd_config_set_id(n, (const char *)s1);
+		}
 		err = snd_config_remove(n);
 		if (err < 0)
 			return err;
@@ -422,7 +437,7 @@ int uc_mgr_evaluate_condition(snd_use_case_mgr_t *uc_mgr,
 {
 	snd_config_iterator_t i, i2, next, next2;
 	snd_config_t *a, *n, *n2, *parent2, *before, *after;
-	const char *id;
+	const char *id, *cname;
 	int err;
 
 	if (uc_mgr->conf_format < 2) {
@@ -437,6 +452,10 @@ int uc_mgr_evaluate_condition(snd_use_case_mgr_t *uc_mgr,
 
 	snd_config_for_each(i, next, cond) {
 		n = snd_config_iterator_entry(i);
+		err = snd_config_get_id(n, &cname);
+		if (err < 0)
+			return err; /* FIXME: this will never happen */
+
 		before = after = NULL;
 		err = if_eval_one(uc_mgr, n, &a, &before, &after);
 		if (err < 0)
@@ -469,7 +488,8 @@ __add:
 				err = snd_config_search(parent, id, &parent2);
 				if (err == -ENOENT)
 					goto __add;
-				err = compound_merge(id, parent2, n2, before, after);
+				err = compound_merge(id, cname, parent2, n2,
+						     before, after);
 				if (err < 0)
 					return err;
 			}
-- 
2.7.4

