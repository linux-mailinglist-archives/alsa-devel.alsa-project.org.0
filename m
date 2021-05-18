Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CDB38745F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:49:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A7A616E1;
	Tue, 18 May 2021 10:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A7A616E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621327798;
	bh=dExvVoTGLf7U1Y9k+Y0xTSfVZ05c68Ggl5QdIFAnYRc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DlGqIagURqcAZQV6yKw9fybpTwoPFB8UpvRd6venQfFCrpgxwHGS0CSDCvKQTc8WS
	 ZMVr008J6tcD/nXCjNIM+IEShicaOgcJOh+3bwW3e7k496Xx4AqAhwOOV3qBgQLs1r
	 IOwYGHZGfXnrNpHGF7/MehauiRbKoDoOKbPGQogc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 614DEF804D8;
	Tue, 18 May 2021 10:46:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65567F801DB; Tue, 18 May 2021 10:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F3AAF801DB
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 10:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F3AAF801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="qOA/AIfO"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="HZKdR5XR"
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 844EE5C0127;
 Tue, 18 May 2021 04:46:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 18 May 2021 04:46:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Y7Op8L2qKUKtq
 pgpfwBcp5vvU/wt/qoca6pUELYbLoY=; b=qOA/AIfOSpmnGGzjp98OqmHNnuUSq
 +Bio3/gASrAp3eKausNg4QZVD+pzE27fKOBQ3dizGyD4Higm5EpiAmhj5VBzG6Eq
 s5QQAmBwxj14XKdnW3Qz0TQPFqjjZZaqlnOh0/Zk1Cnypww+qK2md3DlYedu/5pG
 fl7babag05sWs6WYORhbt4STBqd3J2YRzRlUnAAY3UsfJPkRAmI0DUp/Q0jJRObx
 GabNMFFb8xLoNhCj5eGdWZ6EhTHaocRi5mCBAANoIsakjcx4i/qzIhZHyZVxRrve
 TxDGxgtp8eZNTxR3ttfKR9hO/tFE96yZWbb81asuWZlf6M9XKUCZuZrMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Y7Op8L2qKUKtqpgpfwBcp5vvU/wt/qoca6pUELYbLoY=; b=HZKdR5XR
 2lEKiAaLjrnCaeaADU2Lf+/qOyTNPU2AWzlMnpTR28GNt7nmhdye6yLEsnJP6cNa
 oF+4LkZIVjy4RwUO3ElhgYREX6wU/uZs/a1JsiUL5BunFdf6b3E1vcdAIP2PL565
 m2sb6v/Ws4K9KIzHyv+QwMOtViyBEzwo4sEguEzLigRkPpzDFFzQLMdvCqS15Uzs
 rAZFXShkbIP+LB8Zoj8PSZgU0IEOM8Rk+SnqkHdAImwhc6fdC4LR/4tdYiVUoW4o
 apNvL/2OkoJcRLI/+ZWjMC5rgf8xOaiVSgU5m4JxXZnzSFk8lVOfjHFBxcDsvw4v
 DLVsWztPlNGQGg==
X-ME-Sender: <xms:036jYGAt4kCLcVtrTBJ2pzH59W26wvLovIIdp9uOc8v0ZEJCukOQDg>
 <xme:036jYAiuhzGRoVJwt3yhGLCXt2eUG3UNeIxTICXTYRRBnu03nsGIpCkL0vKb5l05X
 ykIAnalJzGeiPnDNjI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:036jYJmh4FMl-CZ1_jrHiE--6ArlUaK5XeMZuif5fKAPr54YPV7PEg>
 <xmx:036jYEyww3M7jxsWu3FzGJsABp5MDi3YIu1VZnHjqBq1lw563Wg4cQ>
 <xmx:036jYLQcCsWq2PXD6JBVz5Ph2tRou1ooasnqsWOaQf_jepTbAAhwUQ>
 <xmx:036jYM74vN5u6hiMZMzrq2n39QjgC4ZNi_9XfebFTGfVduM0DVtd1g>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 04:46:10 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v4 07/11] ALSA: oxfw: add comment for the type of ASICs
Date: Tue, 18 May 2021 17:45:53 +0900
Message-Id: <20210518084557.102681-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518084557.102681-1-o-takashi@sakamocchi.jp>
References: <20210518084557.102681-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, clemens@ladisch.de
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

ALSA OXFW supports two types of ASICS; OXFW970 and OXFW971. The former
is known to have a quirk we call 'jumbo payload' that some isochronous
cycles are skipped to transfer isochronous packets during handling
asynchronous transaction. The quirk seems to correspond to firmware
initially delivered by Oxford Semiconductor since the quirk is not
confirmed for Mackie Onyx Satellite in which the revised firmware is
available. The quirk is not confirmed in the latter.

This commit adds code comment to describe the quirk.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index e851149c5280..9a9c84bc811a 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -332,14 +332,30 @@ static const struct compat_info lacie_speakers = {
 }
 
 static const struct ieee1394_device_id oxfw_id_table[] = {
+	//
+	// OXFW970 devices:
+	// Initial firmware has a quirk to postpone isoc packet transmission during finishing async
+	// transaction. As a result, several isochronous cycles are skipped to transfer the packets
+	// and the audio data frames which should have been transferred during the cycles are put
+	// into packet at the first isoc cycle after the postpone. Furthermore, the value of SYT
+	// field in CIP header is not reliable as synchronization timing,
+	//
 	OXFW_DEV_ENTRY(VENDOR_GRIFFIN, 0x00f970, &griffin_firewave),
 	OXFW_DEV_ENTRY(VENDOR_LACIE, 0x00f970, &lacie_speakers),
-	// Behringer,F-Control Audio 202.
+	// Behringer,F-Control Audio 202. The value of SYT field is not reliable at all.
 	OXFW_DEV_ENTRY(VENDOR_BEHRINGER, 0x00fc22, NULL),
-	// Loud Technologies, Tapco Link.FireWire 4x6.
+	// Loud Technologies, Tapco Link.FireWire 4x6. The value of SYT field is always 0xffff.
 	OXFW_DEV_ENTRY(VENDOR_LOUD, 0x000460, NULL),
-	// Loud Technologies, Mackie Onyx Satellite.
+	// Loud Technologies, Mackie Onyx Satellite. Although revised version of firmware is
+	// installed to avoid the postpone, the value of SYT field is always 0xffff.
 	OXFW_DEV_ENTRY(VENDOR_LOUD, MODEL_SATELLITE, NULL),
+	// Miglia HarmonyAudio. Not yet identified.
+
+	//
+	// OXFW971 devices:
+	// The value of SYT field in CIP header is enough reliable. Both of blocking and non-blocking
+	// transmission methods are available.
+	//
 	// Any Mackie(Loud) models (name string/model id):
 	//  Onyx-i series (former models):	0x081216
 	//  Onyx 1640i:				0x001640
-- 
2.27.0

