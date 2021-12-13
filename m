Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6289647222E
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 09:14:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2AE418FE;
	Mon, 13 Dec 2021 09:13:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2AE418FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639383260;
	bh=PZERhRzyp0MutW2rW0b+4g9g4o6Fn2JHXXHq8M6tgu8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EBsqJ/D7c2k4diTG5d5CB3xU+hpLbpCBEQ2akm2HCFd3BhUYsb2z5x7en+oWMrMow
	 +UAbwdPJvYE6L2v1VeoYAq32Wzldf8XM0mWx5r3Vo8oXQcx5S8kpBaqJJ/PumKd58Y
	 Cog2A34zP5m+XxnVf+o2gWPuyb9qkOpWiZuS7uW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56843F8025F;
	Mon, 13 Dec 2021 09:13:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 826EFF8025D; Mon, 13 Dec 2021 09:13:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3623AF80161
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 09:13:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3623AF80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="g2NTyooq"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Y6g1uv95"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4ADBB5C00B2;
 Mon, 13 Dec 2021 03:13:01 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 13 Dec 2021 03:13:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=SdS1Bx3/1uGxDuDKFj4rTTaBRV
 4Q3PFrzvsINQF1Org=; b=g2NTyooqL7q3sN2O+53WxmRJbzEcSLjHN5Rzrz+zuj
 oX+NGAMChBpRE7BDbX1L+vH1UmjNb3f8paaMAZlD838Q408XPbnPfSBlM3NYSNB5
 jy27Pxt41D+qSic8KLYy/LR88NacHiEyutDJVPrqPGWyoXvlpPCsi8yog3Zl62hk
 zMv/9JjKQctj96RbO/SkTTEGI0K1dKzT6/0dVM+DF/4wGG7FGDcvorpxQzPHocj+
 KyNdWzht4BEaLUgrYRJiQu69Ags3UvGK5Ayr0CkkCCBYBG4O0cDfZSyAkQHCPgTh
 EsZY8C3y4W2SYngNLF71VU1/l+nwCNUU+8nOkTwE1zQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=SdS1Bx3/1uGxDuDKF
 j4rTTaBRV4Q3PFrzvsINQF1Org=; b=Y6g1uv95tJfut0tVvUZufw3fDhAv20d6r
 dEG5zWFxKXg/Yy2b7sJLsUk9gUe9ad9Knrvl+mcfidwfuJS604GS5Ozag3I5TeX5
 4dT/IPi3XV6HrqPN65y7Fah8jgKk/aMdDifuaZStW+m2zFb9daSqSzcB9BLxPmXn
 HjPInLkImzF8MotFl0FrdG5ihrmemiAi4jwRhh06b/dmHZQFJXkm96s7dfWwnFt2
 iUrS+1F4DvN3oTf0+OaQO4ua3empYSUV2EddptEL4W9pwWNlLEj/OE89C1kHULs/
 vEd9OgYm1aWRDK9aJ7N5mIkkr5jsuO4Tw/uZyu4E5vWMEuwrq77LQ==
X-ME-Sender: <xms:jAC3YQcebFDkkebcn4Z57Z2pYrMLWZ_QfofAKuCnh6HPuzRj08Ya8g>
 <xme:jAC3YSMvbWmoRoogG1tsVEu4mD4c0nkEh9s82nmdvElps5SMPIvIoAcza7Peqr7_C
 6AVSMGwiuvsP-kdJjE>
X-ME-Received: <xmr:jAC3YRjcesFEszftnOiijsxojlxuqRWa9MD75dJ-raq0NKIBScrV0fCmfw_SzSD8knD-2PVErbsgsme-BUL6r3cxtiYfVefisQ6Kmi2mgvB3SszpjJJp>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeejgdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhhothhouceoohdqthgrkhgrshhh
 ihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrthhtvghrnhepudejteelhfdttd
 ekgfdtueeilefhgfetjeejheekgeevuddvveegieehueeukeejnecuvehluhhsthgvrhfu
 ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkh
 grmhhotggthhhirdhjph
X-ME-Proxy: <xmx:jQC3YV-yEL5JLRcmd3DK_YealKIhDG5ZUoyfN-xrrTkj3woOrd8GAA>
 <xmx:jQC3YcsQNftFoUMZQg0Htk--1SGMXtL3Y-vNu8JaAZSjenS-P4p79A>
 <xmx:jQC3YcEkuajaodc4ekgL6HDpEBkzYBS_mIlXaXFTQwGmkxUe_QnI7g>
 <xmx:jQC3YS1kTh9ZcXUHJiUxaZ1qcttRdgG-MswLQMfBooi9Cl5-aVI7XA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 03:12:59 -0500 (EST)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: tiwai@suse.de
Subject: [PATCH] ALSA: uapi: use C90 comment style instead of C99 style
Date: Mon, 13 Dec 2021 17:12:57 +0900
Message-Id: <20211213081257.36097-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

UAPI headers are built with compiler option for C90, thus double-slashes
comment introduced in C99 is not preferable.

Fixes: fb6723daf890 ("ALSA: pcm: comment about relation between msbits hw parameter and [S|U]32 formats")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 include/uapi/sound/asound.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
index cf1d20e34167..1834f58b8ede 100644
--- a/include/uapi/sound/asound.h
+++ b/include/uapi/sound/asound.h
@@ -202,9 +202,11 @@ typedef int __bitwise snd_pcm_format_t;
 #define	SNDRV_PCM_FORMAT_S24_BE	((__force snd_pcm_format_t) 7) /* low three bytes */
 #define	SNDRV_PCM_FORMAT_U24_LE	((__force snd_pcm_format_t) 8) /* low three bytes */
 #define	SNDRV_PCM_FORMAT_U24_BE	((__force snd_pcm_format_t) 9) /* low three bytes */
-// For S32/U32 formats, 'msbits' hardware parameter is often used to deliver information about the
-// available bit count in most significant bit. It's for the case of so-called 'left-justified' or
-// `right-padding` sample which has less width than 32 bit.
+/*
+ * For S32/U32 formats, 'msbits' hardware parameter is often used to deliver information about the
+ * available bit count in most significant bit. It's for the case of so-called 'left-justified' or
+ * `right-padding` sample which has less width than 32 bit.
+ */
 #define	SNDRV_PCM_FORMAT_S32_LE	((__force snd_pcm_format_t) 10)
 #define	SNDRV_PCM_FORMAT_S32_BE	((__force snd_pcm_format_t) 11)
 #define	SNDRV_PCM_FORMAT_U32_LE	((__force snd_pcm_format_t) 12)
-- 
2.32.0

