Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2179E38745C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 10:49:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DE7416B8;
	Tue, 18 May 2021 10:48:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DE7416B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621327769;
	bh=KLzOh5mkhUBfN+RzD99d17MfQxGzHdmxNaHuPOR3PzY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rFpFG2lDqv8QIMmIBwMeyRDznfFvx83UPxiYWpKR82dqz3rv5n68aAOZwKqbWM+EN
	 JxMqIC5d9KS0q8VLVoCCPWgmp9DNG3VE1pCXXJJeAhfvHA/VDG2Zz4TGFfGMGTYVeO
	 BrO03arGjagrX7N2CU0iavChqIVgLXkYvkKXJrfs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A417CF804B1;
	Tue, 18 May 2021 10:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59EB7F802C8; Tue, 18 May 2021 10:46:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE5D3F802C8
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 10:46:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE5D3F802C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="TjdVr4bo"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="tFXD/U8O"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0547D5C0121;
 Tue, 18 May 2021 04:46:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 18 May 2021 04:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=snVjiQ+JiUZKn
 0f6kKcYcN35k6cxRPHFAY/KaCgQYsY=; b=TjdVr4boYVKz7NXzzzqCKaMDta8jX
 0PxQPfFy1wB+qLufh0wI65t9r6okD++i+L7Msqnf2wqEYDIThYSvHrsoZcJ4UvLc
 nj8e4dXmSl8FnpUu9NIJFy7AamHEUrukWmT1rrrKJM8uczDM1K0yvWY41wwympm7
 b3e8PgB0uqJw7dkFBmLAn+m2NOLBv2ahZlsJd0lIVlssIrzTZtzg9xwFoifGGk8Q
 5Mr75yN+dP4Z3KpVJpWmoG/VCBPasvm7AwMgwqB0wrmsHZEbYsuBgps+mIJ3FgUl
 Hp2guE0IXFMK1EzWw75HOqp+mk/EPWeib13AYH5W/iMILLQnvQ6dKLItQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=snVjiQ+JiUZKn0f6kKcYcN35k6cxRPHFAY/KaCgQYsY=; b=tFXD/U8O
 +TK84JmsoBUJ5flhaV4ssavL82XRr781JOIMxd5bX9AZwcG27LTqbVOmDEjPallc
 9jiP7i47i7jfhYzvQ7dcpx57XQ5PFUxux4E5UFfWk6Cj3irocQPq8CycbYEHdRFm
 3SsScOH4vxyCGhIyric3Yi0AZP11oxvN2V3Dkq0uPgeOlJTNVibHQIZ45GQPC6ma
 1nK3g5eMYgfL0qlEd8YXTTAHz4qgt/Wtn+paOs4+d60DWcu2tnLVw03H0nAsZq3V
 lt/OQN8B4o8Vx3iKCDlqXuGY84Jwf2eC88M+QxMZhu7GEspGklicVZ4Isu2KB7T3
 ONK+yqiEAwimpA==
X-ME-Sender: <xms:0H6jYO0BLqL4QGtCGHDzBCyuRkJRjLWkX6C4TXKqKSCF31pUXVGDAg>
 <xme:0H6jYBHcw_dVTK7dI4e6JKMi8VL-xUlxd8-z8ylmXb5RKih5EFt7i8i-bpU3VpjM6
 9bMN6MTmSBaPIOHtvM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeijedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgr
 shhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepveefffefke
 etgfevgeefleehfffhueejtdejveethfekveektdejjedvtdejhfejnecukfhppedugedr
 fedrieehrddujeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjph
X-ME-Proxy: <xmx:0H6jYG5RKAv8yXtvrKKOurIN5GpS_AXjVpzntm0GQ5nB-KAKfjxUqw>
 <xmx:0H6jYP3rnrNgjOcW4JJvyr9mKyyVFeeFLBh-J-MErKPcdzsQ1nyKRA>
 <xmx:0H6jYBGNL3IZ7KPvq76CVAluspzv4ZqUG3tPW8Y2ro5K3-AvF_-vog>
 <xmx:0X6jYEPu-LmiC6TLjaGIs9H5Oj0-fHdR29ahNKjW1Ap4GxuCvpu4ng>
Received: from workstation.flets-east.jp (ae065175.dynamic.ppp.asahi-net.or.jp
 [14.3.65.175]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 18 May 2021 04:46:07 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH v4 05/11] ALSA: oxfw: add explicit device entry for Loud
 Technologies Tapco Link.FireWire 4x6
Date: Tue, 18 May 2021 17:45:51 +0900
Message-Id: <20210518084557.102681-6-o-takashi@sakamocchi.jp>
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

Loud Technologies Tapco Link.FireWire 4x6 is identified as the model
with OXFW970 ASIC.

This commit adds explicit entry for the model.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 sound/firewire/oxfw/oxfw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 2af72951ebf8..998f0da6fd5b 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -47,7 +47,6 @@ static bool detect_loud_models(struct fw_unit *unit)
 		"Onyx 1640i",
 		"d.Pro",
 		"Mackie Onyx Satellite",
-		"Tapco LINK.firewire 4x6",
 		"U.420"};
 	char model[32];
 	int err;
@@ -338,12 +337,13 @@ static const struct ieee1394_device_id oxfw_id_table[] = {
 	OXFW_DEV_ENTRY(VENDOR_LACIE, 0x00f970, &lacie_speakers),
 	// Behringer,F-Control Audio 202.
 	OXFW_DEV_ENTRY(VENDOR_BEHRINGER, 0x00fc22, NULL),
+	// Loud Technologies, Tapco Link.FireWire 4x6.
+	OXFW_DEV_ENTRY(VENDOR_LOUD, 0x000460, NULL),
 	/*
 	 * Any Mackie(Loud) models (name string/model id):
 	 *  Onyx-i series (former models):	0x081216
 	 *  Onyx 1640i:				0x001640
 	 *  Mackie Onyx Satellite:		0x00200f
-	 *  Tapco LINK.firewire 4x6:		0x000460
 	 *  d.2 pro/d.4 pro (built-in card):	Unknown
 	 *  U.420:				Unknown
 	 *  U.420d:				Unknown
-- 
2.27.0

