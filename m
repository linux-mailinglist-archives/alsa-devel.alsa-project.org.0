Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABBF34035A
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 11:32:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B644616C7;
	Thu, 18 Mar 2021 11:32:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B644616C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616063577;
	bh=VelX9uALV9t7Sj6UQGnLe1hVD7pZAgx1N3HYuS6zsnI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lyYg2zHgJoVRuLMK8ijVrhasByB+7uvJTRn/0b09RfmVyKLcoizeFRMHi14hXhR2f
	 prZkGOIGoLsyk30T0h5tDvxhi8xQ9aKCvJI/1NMTNqmphphBPYDD8/1hp3yztZJA0T
	 Rn/x13jJTh/cbQmBj3wiarr/iGrPr3aVH8lc0IZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63A79F80171;
	Thu, 18 Mar 2021 11:30:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0482EF802E3; Thu, 18 Mar 2021 11:30:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4616F80218
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 11:30:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4616F80218
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="l+DFRx3S"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fFP6Da4R"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id F19CA1B35;
 Thu, 18 Mar 2021 06:30:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 18 Mar 2021 06:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=BRVXpS5Lo+p0e
 NUL8b/+gXXlnZjnzgI5UEULIR9o/84=; b=l+DFRx3StCFtzhZ1i/M2mUHFEpigi
 E3i/5q9w6pZTJdtHy2//ap3mGsIO3/SjQOP8uYH61NeYg7kHIU7jftWIJOBcv5c/
 9rhOJq5VSAOARgWJ7Ko9e6w23BgRdGaxbOLHZsAB86gAhWPSArtGBhC5YHAL5lX8
 LdXsEsnmT27smlq6qhNYe8x8nNV9NdsUlUl379T8GvSxDmS9+UtWOBdbEdlOUMxy
 JydZ5Uqch8PtminZZRrNJo0WJcSbCwn68o/vC0atqdCjzw4Zw2PA6/9t4Djz9yR2
 OcwIwr3Mn1h4CWKxYwJkYze42VjyDhHB/mbOzHZXPij0r2MCe/8WXx74A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=BRVXpS5Lo+p0eNUL8b/+gXXlnZjnzgI5UEULIR9o/84=; b=fFP6Da4R
 znZilypEy4SAJA5wisfS16kLgEGZsO6P/cLKGTq8W4beiLMQUzhTq5F8yRqgIUAF
 Csm/r3RMSNpH0G4UNGixDeCWwom36rE5E29OimkisUmh0ut96TMYzNYD9lyLKCpF
 G9eahkIXeMxsOyPMjHMeCJByH3/rcgbLCssmMQm2/XnxDfyqe5Ks1Oi58z3BMW3J
 MUTHdTDYGVCPVMETpzusw2yYkyrOhkcok1dEtOswKFNcRqUzj5zQ/lIoiW9j5XTV
 wkH857EkBuxIldF+lwl9jPoSWk/yWVhjH9A/1FdekWbqjInJv3dR97elmMpw1P5N
 3fnQthMV6SzE7g==
X-ME-Sender: <xms:vytTYHQWTj_rxkoUL0qbmKr91SARzsKuS8nFc8I2-23pqCf4VWurLA>
 <xme:vytTYKTx_Oxpmv5t99qD9ujQPTtZPMb8UL2ots9x-YfOlpRycgjZI0zL57OdYJ55J
 TH0e89B_yEhv7vU3r8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:vytTYM73EVnZ0XkcJK3LZya2HgRtIsU3nBHDZmQ358bFLt_9NrC8bA>
 <xmx:vytTYG3wLSsYBl_8qRsVt0rYo2KmkCcXaGo1vP6ihGcYErbn0Q6Q3A>
 <xmx:vytTYHCURinuotXovWAQurul34h9uq6hnYKBX5VwD39Gz9zi5ixgew>
 <xmx:vytTYEAkK3o4VhLCfJWZENOl9z68glwmT9RK4RsE-ok5Y6uWHvjiig>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id 88912108006D;
 Thu, 18 Mar 2021 06:30:22 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-lib][PATCH 4/6] ctl: add API to compare a pair of control
 element IDs by numid
Date: Thu, 18 Mar 2021 19:30:11 +0900
Message-Id: <20210318103013.265264-5-o-takashi@sakamocchi.jp>
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

The structure for control element ID is compound one. It means that it's
not possible to decide single algorithm to find order of a pair of
control element IDs. For convenience of application developers, it's better
to produce API to decide the order by useful algorithm.

This commit adds API for one of comparison algorithms. The value of
numid field is used for the comparison. I note that the structure includes
some 'unsigned integer' type of fields. The subtraction of the fields
brings integer overflow as long as the calculation is done in the same
storage size of the type itself.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/control.h      |  1 +
 src/control/control.c  | 32 +++++++++++++++++++++++++++++++
 test/lsb/ctl-elem-id.c | 43 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/include/control.h b/include/control.h
index 8aca67e6..36953423 100644
--- a/include/control.h
+++ b/include/control.h
@@ -426,6 +426,7 @@ void snd_ctl_elem_id_clear(snd_ctl_elem_id_t *obj);
 void snd_ctl_elem_id_copy(snd_ctl_elem_id_t *dst, const snd_ctl_elem_id_t *src);
 int snd_ctl_elem_id_equal_by_numid(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r);
 int snd_ctl_elem_id_equal_by_tuple(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r);
+int snd_ctl_elem_id_compare_by_numid(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r);
 int snd_ctl_elem_id_compare(snd_ctl_elem_id_t *id1, const snd_ctl_elem_id_t *id2);
 unsigned int snd_ctl_elem_id_get_numid(const snd_ctl_elem_id_t *obj);
 snd_ctl_elem_iface_t snd_ctl_elem_id_get_interface(const snd_ctl_elem_id_t *obj);
diff --git a/src/control/control.c b/src/control/control.c
index 93f8f93d..00009614 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -88,6 +88,10 @@ snd_ctl_elem_id_equal_by_numid() is available. For equality check between a pair
 of #snd_ctl_elem_id_t according to the tuple, snd_ctl_elem_id_equal_by_tuple()
 is available.
 
+Many algorithms can be defined to find ordered pair of #snd_ctl_elem_id_t.
+For one of the comparison algorithms according to the numid,
+snd_ctl_elem_id_compare_by_numid() is available.
+
 \section element_lists Element Lists
 
 An element list can be used to obtain a list of all elements of the
@@ -1861,6 +1865,34 @@ int snd_ctl_elem_id_equal_by_tuple(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
 	       (l->index == r->index);
 }
 
+static int compare_unsigned_integer(unsigned int l, unsigned int r)
+{
+	if (l == r)
+		return 0;
+	else if (l < r)
+		return -1;
+	else
+		return 1;
+}
+
+/**
+ * \brief compare two arguments as orderd items by algorithm according to numid.
+ * \param l opaque pointer to element ID structure.
+ * \param r opaque pointer to another element ID structure.
+ * \retval positive if left is greater than right, negative if left is less
+ *	   than right, zero if they equal.
+ *
+ * The structure underlying #snd_ctl_elem_id_t is compound one. The
+ * comparison algorithm for it is not single and unique. The API implements
+ * one of comparison algorithms, according to the value of numid field.
+ */
+int snd_ctl_elem_id_compare_by_numid(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	assert(l && r);
+
+	return compare_unsigned_integer(l->numid, r->numid);
+}
+
 /**
  * \brief compare one #snd_ctl_elem_id_t to another
  * \param id1 pointer to first id
diff --git a/test/lsb/ctl-elem-id.c b/test/lsb/ctl-elem-id.c
index 39060a8e..670ec252 100644
--- a/test/lsb/ctl-elem-id.c
+++ b/test/lsb/ctl-elem-id.c
@@ -16,6 +16,8 @@
 
 #include <unistd.h>
 
+#include <limits.h>
+
 #include "../include/asoundlib.h"
 
 static void set_elem_id_by_tuple(snd_ctl_elem_id_t *elem_id,
@@ -96,6 +98,43 @@ static void equality_by_tuple_3(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
 	assert(!snd_ctl_elem_id_equal_by_tuple(l, r));
 }
 
+// Case 2.0. The left object with less value in numid field than right object
+//	     should result in negative value.
+static void comparison_by_numid_0(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	snd_ctl_elem_id_set_numid(l, 0xdeadbeef);
+	snd_ctl_elem_id_set_numid(r, 0xfeedc0de);
+	assert(snd_ctl_elem_id_compare_by_numid(l, r) < 0);
+}
+
+// Case 2.1. The left object with the same value in numid field as right object
+//	     should result in zero.
+static void comparison_by_numid_1(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	snd_ctl_elem_id_set_numid(l, 0xfeedc0de);
+	snd_ctl_elem_id_set_numid(r, 0xfeedc0de);
+	assert(snd_ctl_elem_id_compare_by_numid(l, r) == 0);
+}
+
+// Case 2.2. The left object with greater value in numid field than right object
+//	     should result in positive.
+static void comparison_by_numid_2(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	snd_ctl_elem_id_set_numid(l, 0xfeedc0de);
+	snd_ctl_elem_id_set_numid(r, 0xdeadbeef);
+	assert(snd_ctl_elem_id_compare_by_numid(l, r) > 0);
+}
+
+// Case 2.3. The left object with lesser value in numid field than right object
+//	     should result in negative. The subtraction shoud be calculated in
+//	     storage larger than the storage of 'unsigned int'.
+static void comparison_by_numid_3(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	snd_ctl_elem_id_set_numid(l, 0);
+	snd_ctl_elem_id_set_numid(r, UINT_MAX);
+	assert(snd_ctl_elem_id_compare_by_numid(l, r) < 0);
+}
+
 int main()
 {
 	void (*entries[])(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r) = {
@@ -107,6 +146,10 @@ int main()
 		equality_by_tuple_1,
 		equality_by_tuple_2,
 		equality_by_tuple_3,
+		comparison_by_numid_0,
+		comparison_by_numid_1,
+		comparison_by_numid_2,
+		comparison_by_numid_3,
 	};
 	int count = sizeof(entries) / sizeof(*entries);
 	int fd;
-- 
2.27.0

