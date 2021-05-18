Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 331DC387002
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 04:47:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FBC616AF;
	Tue, 18 May 2021 04:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FBC616AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621306070;
	bh=dExvVoTGLf7U1Y9k+Y0xTSfVZ05c68Ggl5QdIFAnYRc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cpqo3D5FOxgHdJWWmmZrb2xksYwlhRD8QMcvLek1Pvp1uUwIPba+mxzPC48LPJFdR
	 rKsjTqERtYPhFhcLuKWofM9lVerORTkGJih0ptsGFc+wLIEe/xX7iZQwWuRJiA2X/8
	 q1xiE/8LHEwsoeFrqymPtFcHTWHy0rn15lTLQgsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2283F804D8;
	Tue, 18 May 2021 04:44:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04932F804AC; Tue, 18 May 2021 04:43:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45DA2F80272
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 04:43:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45DA2F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="xkyTeIY4"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="oTL3Nnkd"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 71DDA5C0196;
 Mon, 17 May 2021 22:43:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 17 May 2021 22:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=Y7Op8L2qKUKtq
 pgpfwBcp5vvU/wt/qoca6pUELYbLoY=; b=xkyTeIY4txUIgV3ro0DwfWQkZE9wy
 I58PSmvfg4QhMdlH5dfmDkNPZSUTcaCtQVph/QaeYCWKZMvfQpNg8XCwbvowSSVo
 uVBAp6ul7zJe6vYq2zksLTDSbCxIZu0D70Lngj+f+I6ZvcfiZ2qSP9C9kRsZc/UB
 dhJWpSVsEUgKhwRECIRGf1FmCflwPdZuxkIoFDVCx7PmnNZr9QO/4N3ksKPjMeN9
 vRkNknkkrOrciDl+S+qMq3Qf4Qzv0uEj3w6UxfnmBAeKUOhmKt1pFYSx0ST2V5Xm
 xWgWzQhlF7XIMrkM1UMgTWUFC2jILqLdT85eynpKwsWDM2CGIDB2o7D6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=Y7Op8L2qKUKtqpgpfwBcp5vvU/wt/qoca6pUELYbLoY=; b=oTL3Nnkd
 ECw1z29BDuXEYY+f8OagCk+FezZS4ZsFzMkLnV4AMV4AQvjP9rYYX9gGlRd32JUy
 C+qQ1w3XU3ZRzZEmsaEHai4YuM3yHGDDtot+ETUVBZmg2Cbo3MUtOQvhLNKJQP6N
 DA/X+4nXUOHlBHVjbKnKhtN8LiBz+5VNtkIRbivUX6bK8UsAyWCN20dbDxQtDSCm
 niOOc48JB24bX6k3iOJiGvzzimfs6lSqmONXTxR/JeS0phqMa07jRAvCmQfHypyu
 oEepxLgp4oraassECPm+MdxReaD14QK2YajCdWe6/Pzd9vOUlgwjF8X8Vp9Zq1Jd
 BE2ejksBIVhTOA==
X-ME-Sender: <xms:3SmjYPN0CvApG_mr8NM7ciwEXz3gVYbVGXHJutYG7sTj3yr_l0CmKg>
 <xme:3SmjYJ85gGsQK_92T6eAab9bcQd3JxBgJWGufM78_qOEj2TJBq2D7SoVuqkoxfxuM
 UHxokklY80S4H3ZgEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeiiedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:3SmjYOS6UfFPiM8dlYQsFadhTz23BUi7UaKxbChUOrWgmicFUCHEhA>
 <xmx:3SmjYDvXyHT8sfn0RTaPd6QJySm3y9xEkER-GURwzlK9VyYCFFZSTw>
 <xmx:3SmjYHdqivvQ7o38eUujqrP_nNJiQuhmxi0jAymYl97YK2yQgmH-oA>
 <xmx:3SmjYHnQ3aW9R7qj6ED_87zfeBAN70zNz-QqfXxYDJLtPpFUTlM1ww>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 17 May 2021 22:43:40 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v3 07/11] ALSA: oxfw: add comment for the type of ASICs
Date: Tue, 18 May 2021 11:43:22 +0900
Message-Id: <20210518024326.67576-8-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210518024326.67576-1-o-takashi@sakamocchi.jp>
References: <20210518024326.67576-1-o-takashi@sakamocchi.jp>
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

