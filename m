Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFAE340361
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 11:33:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F157B16CA;
	Thu, 18 Mar 2021 11:32:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F157B16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616063627;
	bh=c9tLkcNIu5z/bkjAcPED5azNQrJVYIrVhlBaKivHoM4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rqzjNvX/s4XYf057MoTttIgzNUpUoHpjYYmcMPxZblWYEyDm7T4DTvi8dw/2jeP17
	 2E/wFTjVQs4sxH3N3/iemb5TTrJHH3Drwn39wHaiP2MECWG2/HGojiZm80T9vaWzAD
	 T8BZsJMo992W12lLhyXgB+7Wjv5kBlSZAraEHiPg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 808D8F8049C;
	Thu, 18 Mar 2021 11:30:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3121EF8032C; Thu, 18 Mar 2021 11:30:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04832F800C8
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 11:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04832F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="SVYH42K4"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="pxuTF8rw"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 6E71B1B14;
 Thu, 18 Mar 2021 06:30:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 18 Mar 2021 06:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=AjOYXZ58Q+cr+
 VClUUQ+0tm0jJD4/Rzv0HK7sxaudHc=; b=SVYH42K4JXDMbQXqbBJkGHgtc9zYF
 5k4KdEUvI7nHpeOvyhbbkvZbgUBsxQkIFGQlxThbpqCCqpnLSa15D9+KxcLhPmx4
 li4m4sHmz2rorQNVfmlAipzIjt3gMtLANst24xMbfdwMRLqEmC3M7Nrxi57g2fqP
 jpdS/9Ia4symh+am0SIkRoG8+Inua073rheiVfb7nEQp/OfIvlFQUltaYL813BBn
 eW0bViDUwNtRzn3QxQe5z6PewRLaRRmx/UMtc+ddnQVXBDv9J3KgqOaROLH9/o7+
 pT5Kpp1UT3O4s0k6BJ8NwnGIyZccYxDNxRDUt5C9qv1PzoAGyvSffXo/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=AjOYXZ58Q+cr+VClUUQ+0tm0jJD4/Rzv0HK7sxaudHc=; b=pxuTF8rw
 shPOn68uyUmJq/vZpgNDhL19TzvJyEZyR+NkuYg/p+ij9voSpc3zhbFHgZT5Q07j
 p7Irat0IGcdWIgibAE/DTVBfNdIbbS4VXNn5q49mRIpumExiQgCfAUWCGBOthnqJ
 0fZnM+gkwBc3NWl1qWxFRF+/eFhUStuM92jHbuaGjPpqRBkl22Y1a1Bj3AAE6ubb
 KG3Fz7SedenjHLg7Z/Td3VL3Xtj2ssGL0GNJ7Gnp/z1erU/HUKBOhOQKN8VExmdR
 CsSEIBm61SNspM56+5YhtU2rXrq24tDmHrSTbDzhMvcMX1Q9WpEulAhOEJ0WMSi6
 nPKJyaZXK4WIOQ==
X-ME-Sender: <xms:wCtTYOvLpz71sfnq7IsTrCXKPUd2KV8J0lZXVXeeMZLx96up04apIg>
 <xme:wCtTYD6r7EZwYbaXSDN83lQpD3hJtvUK4RdLPKsxU7vy2M950ot3hwVkNRDzeSrln
 -EedCisJon9RmW2X0k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:wCtTYKeZzT5G9M3DVR3LmBIRen676WwjPhm--ZxrMbJYeBk-QM4FeA>
 <xmx:wCtTYAxdVmVViaku2m6TT46CKT5o37afs9Rhw7-mg-fQt4kh6X-s1g>
 <xmx:wCtTYP-eFGAAom5WjSo8KZY_PoSvGOqeLEcXzcTHbabGPRd4fSTQ-w>
 <xmx:wStTYMZ2rbJ1slKiq49DIxkgpvrlEy7fSa0-3n4LOWseQNV5Ihwvtw>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175])
 by mail.messagingengine.com (Postfix) with ESMTPA id E202C1080057;
 Thu, 18 Mar 2021 06:30:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de,
	perex@perex.cz
Subject: [alsa-lib][PATCH 5/6] ctl: add API to compare a pair of control
 element IDs by one of algorithms according to tuple
Date: Thu, 18 Mar 2021 19:30:12 +0900
Message-Id: <20210318103013.265264-6-o-takashi@sakamocchi.jp>
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

This commit adds API for one of comparison algorithms. The fields except
for numid are used for the algorithm. The iface, device, subdevice,
name, and index fields are compared in the order, by arithmetic way. I note
that the structure includes some 'unsigned integer' type of fields. The
subtraction of the fields brings integer overflow as long as the
calculation is done in the same storage size of the type itself.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/control.h      |   1 +
 src/control/control.c  |  45 ++++++++++++++++-
 test/lsb/ctl-elem-id.c | 111 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+), 1 deletion(-)

diff --git a/include/control.h b/include/control.h
index 36953423..1b2cc0c6 100644
--- a/include/control.h
+++ b/include/control.h
@@ -427,6 +427,7 @@ void snd_ctl_elem_id_copy(snd_ctl_elem_id_t *dst, const snd_ctl_elem_id_t *src);
 int snd_ctl_elem_id_equal_by_numid(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r);
 int snd_ctl_elem_id_equal_by_tuple(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r);
 int snd_ctl_elem_id_compare_by_numid(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r);
+int snd_ctl_elem_id_compare_by_tuple_arithmetic(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r);
 int snd_ctl_elem_id_compare(snd_ctl_elem_id_t *id1, const snd_ctl_elem_id_t *id2);
 unsigned int snd_ctl_elem_id_get_numid(const snd_ctl_elem_id_t *obj);
 snd_ctl_elem_iface_t snd_ctl_elem_id_get_interface(const snd_ctl_elem_id_t *obj);
diff --git a/src/control/control.c b/src/control/control.c
index 00009614..fbc6aeb7 100644
--- a/src/control/control.c
+++ b/src/control/control.c
@@ -90,7 +90,9 @@ is available.
 
 Many algorithms can be defined to find ordered pair of #snd_ctl_elem_id_t.
 For one of the comparison algorithms according to the numid,
-snd_ctl_elem_id_compare_by_numid() is available.
+snd_ctl_elem_id_compare_by_numid() is available. For one of the comparison
+algorithms according to the tuple, snd_ctl_elem_id_compare_by_tuple_arithmetic()
+is available. They are useful for qsort(3).
 
 \section element_lists Element Lists
 
@@ -1893,6 +1895,47 @@ int snd_ctl_elem_id_compare_by_numid(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
 	return compare_unsigned_integer(l->numid, r->numid);
 }
 
+/**
+ * \brief compare two arguments as ordered pair by one of algorithms according
+ *	  to iface, device, subdevice, name, index fields.
+ * \param l opaque pointer to element ID structure.
+ * \param r opaque pointer to another element ID structure.
+ * \retval positive if left is greater than right, negative if left is less
+ *	   than right, zero if they equal.
+ *
+ * The structure underlying #snd_ctl_elem_id_t is compound one. The comparison
+ * algorithm for it is not single and unique. The API implements one of
+ * algorithm to find order in a pair of control element IDs, according to the
+ * values of iface, device, subdevice, name, and index fields, by below logic:
+ *
+ *  - find order in iface field by this order; card, hwdep, mixer, pcm, rawmidi,
+ *    timer, and sequencer.
+ *  - find order in device field by arithmetic comparison of its value.
+ *  - find order in subdevice field by arithmetic comparison of its value.
+ *  - find order in name field by using unsigned characters, implemented in strcmp(3).
+ *  - find order in index field by arithmetic comparison of its value.
+ */
+int snd_ctl_elem_id_compare_by_tuple_arithmetic(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	int res;
+
+	assert(l && r);
+
+	res = l->iface - r->iface;
+	if (res != 0)
+		return res;
+	res = compare_unsigned_integer(l->device, r->device);
+	if (res != 0)
+		return res;
+	res = compare_unsigned_integer(l->subdevice, r->subdevice);
+	if (res != 0)
+		return res;
+	res = strcmp((const char *)l->name, (const char *)r->name);
+	if (res != 0)
+		return res;
+	return compare_unsigned_integer(l->index, r->index);
+}
+
 /**
  * \brief compare one #snd_ctl_elem_id_t to another
  * \param id1 pointer to first id
diff --git a/test/lsb/ctl-elem-id.c b/test/lsb/ctl-elem-id.c
index 670ec252..02eb24fc 100644
--- a/test/lsb/ctl-elem-id.c
+++ b/test/lsb/ctl-elem-id.c
@@ -135,6 +135,106 @@ static void comparison_by_numid_3(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
 	assert(snd_ctl_elem_id_compare_by_numid(l, r) < 0);
 }
 
+// Case 3.0. The left object with lesser entry in iface field than right object
+//	     should result in negative.
+static void comparison_by_tuple_arithmetic_0(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	set_elem_id_by_tuple(l, SND_CTL_ELEM_IFACE_CARD, 0, 1, "A", 2);
+	set_elem_id_by_tuple(r, SND_CTL_ELEM_IFACE_HWDEP, 0, 1, "A", 2);
+	assert(snd_ctl_elem_id_compare_by_tuple_arithmetic(l, r) < 0);
+}
+
+// Case 3.1. The left object with greater entry in iface field than right object
+//	     should result in positive.
+static void comparison_by_tuple_arithmetic_1(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	set_elem_id_by_tuple(l, SND_CTL_ELEM_IFACE_SEQUENCER, 3, 4, "B", 5);
+	set_elem_id_by_tuple(r, SND_CTL_ELEM_IFACE_TIMER, 3, 4, "B", 5);
+	assert(snd_ctl_elem_id_compare_by_tuple_arithmetic(l, r) > 0);
+}
+
+// Case 3.2. The left object with lesser value in device field than right object
+//	     should result in negative.
+static void comparison_by_tuple_arithmetic_2(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	set_elem_id_by_tuple(l, SND_CTL_ELEM_IFACE_CARD, 1, 7, "C", 8);
+	set_elem_id_by_tuple(r, SND_CTL_ELEM_IFACE_CARD, 6, 7, "C", 8);
+	assert(snd_ctl_elem_id_compare_by_tuple_arithmetic(l, r) < 0);
+}
+
+
+// Case 3.3. The left object with greater value in device field than right object
+//	     should result in positive.
+static void comparison_by_tuple_arithmetic_3(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	set_elem_id_by_tuple(l, SND_CTL_ELEM_IFACE_HWDEP, 9, 10, "D", 11);
+	set_elem_id_by_tuple(r, SND_CTL_ELEM_IFACE_HWDEP, 1, 10, "D", 11);
+	assert(snd_ctl_elem_id_compare_by_tuple_arithmetic(l, r) > 0);
+}
+
+// Case 3.3. The left object with lesser value in subdevice field than right object
+//	     should result in negative.
+static void comparison_by_tuple_arithmetic_4(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	set_elem_id_by_tuple(l, SND_CTL_ELEM_IFACE_MIXER, 12, 1, "E", 14);
+	set_elem_id_by_tuple(r, SND_CTL_ELEM_IFACE_MIXER, 12, 13, "E", 14);
+	assert(snd_ctl_elem_id_compare_by_tuple_arithmetic(l, r) < 0);
+}
+
+// Case 3.4. The left object with greater value in subdevice field than right object
+//	     should result in positive.
+static void comparison_by_tuple_arithmetic_5(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	set_elem_id_by_tuple(l, SND_CTL_ELEM_IFACE_PCM, 15, 16, "F", 17);
+	set_elem_id_by_tuple(r, SND_CTL_ELEM_IFACE_PCM, 15, 1, "F", 17);
+	assert(snd_ctl_elem_id_compare_by_tuple_arithmetic(l, r) > 0);
+}
+
+// Case 3.5. The left object with name beginning lesser character in name field
+//	     than right object should result in negative.
+static void comparison_by_tuple_arithmetic_6(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	set_elem_id_by_tuple(l, SND_CTL_ELEM_IFACE_RAWMIDI, 18, 19, "A", 20);
+	set_elem_id_by_tuple(r, SND_CTL_ELEM_IFACE_RAWMIDI, 18, 19, "H", 20);
+	assert(snd_ctl_elem_id_compare_by_tuple_arithmetic(l, r) < 0);
+}
+
+// Case 3.6. The left object with name beginning greater character in name field
+//	     than right object should result in positive.
+static void comparison_by_tuple_arithmetic_7(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	set_elem_id_by_tuple(l, SND_CTL_ELEM_IFACE_TIMER, 21, 22, "I", 23);
+	set_elem_id_by_tuple(r, SND_CTL_ELEM_IFACE_TIMER, 21, 22, "A", 23);
+	assert(snd_ctl_elem_id_compare_by_tuple_arithmetic(l, r) > 0);
+}
+
+// Case 3.7. The left object with lesser value in index field than right object
+//	     should result in negative.
+static void comparison_by_tuple_arithmetic_8(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	set_elem_id_by_tuple(l, SND_CTL_ELEM_IFACE_SEQUENCER, 24, 25, "J", 1);
+	set_elem_id_by_tuple(r, SND_CTL_ELEM_IFACE_SEQUENCER, 24, 25, "J", 26);
+	assert(snd_ctl_elem_id_compare_by_tuple_arithmetic(l, r) < 0);
+}
+
+// Case 3.8. The left object with greater value in index field than right object
+//	     should result in positive.
+static void comparison_by_tuple_arithmetic_9(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	set_elem_id_by_tuple(l, SND_CTL_ELEM_IFACE_CARD, 27, 28, "K", 29);
+	set_elem_id_by_tuple(r, SND_CTL_ELEM_IFACE_CARD, 27, 28, "K", 1);
+	assert(snd_ctl_elem_id_compare_by_tuple_arithmetic(l, r) > 0);
+}
+
+// Case 3.9. The left object with the same values in iface, device, subdevice,
+//	     name, and index fields as right object should result in zero.
+static void comparison_by_tuple_arithmetic_10(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
+{
+	set_elem_id_by_tuple(l, SND_CTL_ELEM_IFACE_HWDEP, 30, 31, "L", 32);
+	set_elem_id_by_tuple(r, SND_CTL_ELEM_IFACE_HWDEP, 30, 31, "L", 32);
+	assert(snd_ctl_elem_id_compare_by_tuple_arithmetic(l, r) == 0);
+}
+
 int main()
 {
 	void (*entries[])(snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r) = {
@@ -150,6 +250,17 @@ int main()
 		comparison_by_numid_1,
 		comparison_by_numid_2,
 		comparison_by_numid_3,
+		comparison_by_tuple_arithmetic_0,
+		comparison_by_tuple_arithmetic_1,
+		comparison_by_tuple_arithmetic_2,
+		comparison_by_tuple_arithmetic_3,
+		comparison_by_tuple_arithmetic_4,
+		comparison_by_tuple_arithmetic_5,
+		comparison_by_tuple_arithmetic_6,
+		comparison_by_tuple_arithmetic_7,
+		comparison_by_tuple_arithmetic_8,
+		comparison_by_tuple_arithmetic_9,
+		comparison_by_tuple_arithmetic_10,
 	};
 	int count = sizeof(entries) / sizeof(*entries);
 	int fd;
-- 
2.27.0

