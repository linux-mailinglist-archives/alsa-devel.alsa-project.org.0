Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F02E340356
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 11:32:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB5A416AE;
	Thu, 18 Mar 2021 11:31:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB5A416AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616063525;
	bh=+bf65RS+gRw1mHwHB+jQfeOipEbN2r4u1pCLQOZElbw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cne24yUFhJqfXq8rDjiMHhMJ6+4F63cO+uEE/+eDvhGP6tMQaS4QJ5mBp1ubl4UQK
	 LOx+eHfy6HGwuihRHzQ/NM/F8oJFMgY+h3zLY9fTXeQCdB/l7euUisjgqOlDA19+FC
	 xSFM4hFgmUbUMTfS0HVhznkV/kUSboYqg2Rd5ECQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 879FBF80165;
	Thu, 18 Mar 2021 11:30:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E625F80165; Thu, 18 Mar 2021 11:30:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9B8CF80163
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 11:30:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9B8CF80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="ASjv7rIV"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="u6/iFno2"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 94D9A1B30;
 Thu, 18 Mar 2021 06:30:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 18 Mar 2021 06:30:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=vPPAzM9Nrw0k0
 Th4S6xkOXo+qRGQvJLxs+A0lxcZ0Og=; b=ASjv7rIVh2tIgaMdlBoklHXdPlGI8
 SY1Olo+mdCQ7p/mlgLLR3fwN+hxEW1aeL+vq/kjgOW3rrlAP/3ectgLCPHlbfOBv
 06lVeqdT0gc7uvLPIvRHljVYGyduQWDWD0WNNvtXIaffGtStDGksbjm4VYZosBXK
 2B+O/V92EVMizAZBaOolbzf6YcK+e349DaJwrEoiZz45C2ZfR390zgS0uX4ZVfxy
 Akvi4IsGIR2lhuquy65yzpkxMyfMVd/K0jz2WqYOdjGF4cQD9SlJkR2GrDCNQ+GG
 r4xLy/G87N39nydvxtW/BI9DpCZRH+d4C/e5tfDJ7bGsTleU54vVsweUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=vPPAzM9Nrw0k0Th4S6xkOXo+qRGQvJLxs+A0lxcZ0Og=; b=u6/iFno2
 A5NATgeCtGx0LlR6x+wv4oOTBbfw5ZIzoIw2AQHMF2QxiBQC1uHfiNeRnE2xrH9g
 R5+D23UTkb5aeEBAz89yyqRn2/n20ZsLqhpqdnW8kI7dTPyNokzxzmG3puk2N9Yb
 OKplEBg882fHurQ5+uC72BO175XbFh5dnPJUg/8raSFASYclTjeq94bCBFk/UsQ4
 w0scispSnVY4h172vef4bV8pqMqQ55UF1QjAcHC1um2EGq91XeJbVk0atnDulUEL
 wZGbHBAJOo13xZpDrq8BSkgU4uzCkgf3nrWwke+GZlXw/Z5LqHhwRJ3GpMqkt40x
 Vos3cZnJYzusrQ==
X-ME-Sender: <xms:vitTYOrbjUCm791h3BocbcOb-VQS9j1qBcmZCUXFFmSa-oTAeXnG5w>
 <xme:vitTYEZifYDWdBlE0b61nhYHSY9wZvSaLA713rT9AlgUBnqn3XT2ma_GT4Ep1JQPS
 UNks4_G7eQdynh0eYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:vitTYGQ3lxIJDLyCF-itHu40jAvfHTh4qeDzC3xkLXTOM8727b8IGA>
 <xmx:vitTYL7u55jZQ7jJs7_MZkyEOB8ukDFzg-F1ugjivJbpSaPYX8kahw>
 <xmx:vitTYLxkOsR7tKx8828ox2ZMkXnpfgJfPy1aLjPJgXet_KQbjVkI7A>
 <xmx:vitTYGTlmgB8V_KWCMFJkS6G0YpOC0cTErs5zb3a-JJLm8TdQ7Eo6g>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2E1B71080068;
 Thu, 18 Mar 2021 06:30:21 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-lib][PATCH 3/6] ctl: add API to check equality between a pair
 of control element IDs by tuple
Date: Thu, 18 Mar 2021 19:30:10 +0900
Message-Id: <20210318103013.265264-4-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210318103013.265264-1-o-takashi@sakamocchi.jp>
References: <20210318103013.265264-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tanjeff@cccmz.de
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

The structure for control element ID is hybrid. It has two ways to check
equality; e.g. equality of fields except for numid. Just checking equality
according to the fields, current alsa-lib take userspace applications to call
functions referring to the fields several times. It's better to add optimized
version of the equality check.

This commit adds API to check the equality of fields for a pair of control
element IDs.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/control.h      |  1 +
 src/control/control.c  | 26 +++++++++++++++++++++++++-
 test/lsb/ctl-elem-id.c | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/include/control.h b/include/control.h
index 260d7f30..8aca67e6 100644
--- a/include/control.h
+++ b/include/control.h
@@ -425,6 +425,7 @@ void snd_ctl_elem_id_free(snd_ctl_elem_id_t *obj);
 void snd_ctl_elem_id_clear(snd_ctl_elem_id_t *obj);
 void snd_ctl_elem_id_copy(snd_ctl_elem_id_t *dst, const snd_ctl_elem_id_t *src);
 int snd_ctl_elem_id_equal_by_numid(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r);
+int snd_ctl_elem_id_equal_by_tuple(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r);
 int snd_ctl_elem_id_compare(snd_ctl_elem_id_t *id1, const snd_ctl_elem_id_t *id2);
 unsigned int snd_ctl_elem_id_get_numid(const snd_ctl_elem_id_t *obj);
 snd_ctl_elem_iface_t snd_ctl_elem_id_get_interface(const snd_ctl_elem_id_t *obj);
diff --git a/src/control/control.c b/src/control/control.c
index 6d1eda15..93f8f93d 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -84,7 +84,9 @@ rare). The numid can change on each boot. In case of an USB sound
 card, the numid can also change when it is reconnected.
 
 For equality check between a pair of #snd_ctl_elem_id_t according to the numid,
-snd_ctl_elem_id_equal_by_numid() is available.
+snd_ctl_elem_id_equal_by_numid() is available. For equality check between a pair
+of #snd_ctl_elem_id_t according to the tuple, snd_ctl_elem_id_equal_by_tuple()
+is available.
 
 \section element_lists Element Lists
 
@@ -1837,6 +1839,28 @@ int snd_ctl_elem_id_equal_by_numid(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
 	return l->numid == r->numid;
 }
 
+/**
+ * \brief check equality between two arguments according to iface, device,
+ *	  subdevice, name, and index fields.
+ * \param l opaque pointer to element ID structure.
+ * \param r opaque pointer to another element ID structure.
+ * \retval zero if they equal, else zero.
+ *
+ * The structure underlying #snd_ctl_elem_id_t is hybrid one. It has two ways to
+ * check equality. The API implements one of the ways, according to the values
+ * of iface, device, subdevice, name, and index fields.
+ */
+int snd_ctl_elem_id_equal_by_tuple(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	assert(l && r);
+
+	return (l->iface == r->iface) &&
+	       (l->device == r->device) &&
+	       (l->subdevice == r->subdevice) &&
+	       !strcmp((const char *)l->name, (const char *)r->name) &&
+	       (l->index == r->index);
+}
+
 /**
  * \brief compare one #snd_ctl_elem_id_t to another
  * \param id1 pointer to first id
diff --git a/test/lsb/ctl-elem-id.c b/test/lsb/ctl-elem-id.c
index f499b268..39060a8e 100644
--- a/test/lsb/ctl-elem-id.c
+++ b/test/lsb/ctl-elem-id.c
@@ -64,6 +64,38 @@ static void equality_by_numid_3(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
 	assert(!snd_ctl_elem_id_equal_by_numid(l, r));
 }
 
+// Case 1.0. The same tuple should result in true positive.
+static void equality_by_tuple_0(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	set_elem_id_by_tuple(l, SND_CTL_ELEM_IFACE_CARD, 1000, 1010, "something", 1020);
+	set_elem_id_by_tuple(r, SND_CTL_ELEM_IFACE_CARD, 1000, 1010, "something", 1020);
+	assert(snd_ctl_elem_id_equal_by_tuple(l, r));
+}
+
+// Case 1.1. The different conpounds should result in true positive.
+static void equality_by_tuple_1(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	set_elem_id_by_tuple(l, SND_CTL_ELEM_IFACE_CARD, 1030, 1040, "something", 1050);
+	set_elem_id_by_tuple(r, SND_CTL_ELEM_IFACE_MIXER, 1031, 1042, "something", 1053);
+	assert(!snd_ctl_elem_id_equal_by_tuple(l, r));
+}
+
+// Case 1.2. The same value of numid field should result in false positive.
+static void equality_by_tuple_2(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	snd_ctl_elem_id_set_numid(l, 0xfeedc0de);
+	snd_ctl_elem_id_set_numid(r, 0xfeedc0de);
+	assert(!snd_ctl_elem_id_equal_by_tuple(l, r));
+}
+
+// Case 1.3. The different value of numid field should result in false positive.
+static void equality_by_tuple_3(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	snd_ctl_elem_id_set_numid(l, 0xfeedc0de);
+	snd_ctl_elem_id_set_numid(r, 0xdeadbeef);
+	assert(!snd_ctl_elem_id_equal_by_tuple(l, r));
+}
+
 int main()
 {
 	void (*entries[])(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r) = {
@@ -71,6 +103,10 @@ int main()
 		equality_by_numid_1,
 		equality_by_numid_2,
 		equality_by_numid_3,
+		equality_by_tuple_0,
+		equality_by_tuple_1,
+		equality_by_tuple_2,
+		equality_by_tuple_3,
 	};
 	int count = sizeof(entries) / sizeof(*entries);
 	int fd;
-- 
2.27.0

