Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA5A894BB8
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 08:46:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF137279C;
	Tue,  2 Apr 2024 08:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF137279C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712040373;
	bh=KGBViHtyWl4RTc5Yv34/CbkultLm1irMrCSdjeeHfsM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iv7dGj4l0zkizg6KspqU7CKGnKXS71wXyqwCUbKtnGU0YMeNfoqTj3gKcJGk7kFNa
	 YJRXfvNxXuL0RyP7u4+f7yTl9fmCPea2MrCZLEA4KsE9ZNvlNMUBJpevep3gP87IzL
	 ovvQTAJOVysZ5wRWS7LYrlaY0qa0sZwSa3G3LaUY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F537F8060E; Tue,  2 Apr 2024 08:45:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC60FF8060D;
	Tue,  2 Apr 2024 08:45:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 475E1F80236; Mon, 25 Mar 2024 04:45:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from mail.nfschina.com (unknown [42.101.60.195])
	by alsa1.perex.cz (Postfix) with SMTP id 98144F8015B
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 04:41:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98144F8015B
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 4E0ED6026BC81;
	Mon, 25 Mar 2024 11:41:22 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: arnaud.pouliquen@foss.st.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: sti: uniperif: fix the undefined bitwise shift behavior
 problem
Date: Mon, 25 Mar 2024 11:40:33 +0800
Message-Id: <20240325034032.1031885-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: suhui@nfschina.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DOUZJOXRBPPWG7CTGSANJ3DEVZ7YWTG4
X-Message-ID-Hash: DOUZJOXRBPPWG7CTGSANJ3DEVZ7YWTG4
X-Mailman-Approved-At: Tue, 02 Apr 2024 06:44:54 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Clang static checker(scan-build):
sound/soc/sti/uniperif_player.c:1115:12: warning:
The result of the left shift is undefined because the right operand is
negative [core.UndefinedBinaryOperatorResult]

When UNIPERIF_CONFIG_BACK_STALL_REQ_SHIFT(ip) equals to -1, the result of
SET_UNIPERIF_CONFIG_BACK_STALL_REQ_DISABLE(ip) is undefined.

Here are some results of using different compilers.
		1UL >> -1	1UL << -1
gcc 10.2.1	0x2		0
gcc 11.4.0	0		0x8000000000000000
clang 14.0.0	0x64b8a45d72a0	0x64b8a45d72a0
clang 17.0.0	0x556c43b0f2a0	0x556c43b0f2a0

Add some macros to ensure that when right opreand is negative or other
invalid values, the results of bitwise shift is zero.

Fixes: e1ecace6a685 ("ASoC: sti: Add uniperipheral header file")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 sound/soc/sti/uniperif.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sti/uniperif.h b/sound/soc/sti/uniperif.h
index 2a5de328501c..1cbff01fbff0 100644
--- a/sound/soc/sti/uniperif.h
+++ b/sound/soc/sti/uniperif.h
@@ -12,17 +12,28 @@
 
 #include <sound/dmaengine_pcm.h>
 
+#define SR_SHIFT(a, b)		({unsigned long __a = (a); \
+				unsigned int __b = (b); \
+				__b < BITS_PER_LONG ? \
+				__a >> __b : 0; })
+
+#define SL_SHIFT(a, b)		({unsigned long __a = (a); \
+				unsigned int __b = (b); \
+				__b < BITS_PER_LONG ? \
+				__a << __b : 0; })
+
 /*
  * Register access macros
  */
 
 #define GET_UNIPERIF_REG(ip, offset, shift, mask) \
-	((readl_relaxed(ip->base + offset) >> shift) & mask)
+	(SR_SHIFT(readl_relaxed(ip->base + offset), shift) & mask)
 #define SET_UNIPERIF_REG(ip, offset, shift, mask, value) \
 	writel_relaxed(((readl_relaxed(ip->base + offset) & \
-	~(mask << shift)) | (((value) & mask) << shift)), ip->base + offset)
+	~SL_SHIFT(mask, shift)) | SL_SHIFT(((value) & mask), shift)),\
+	ip->base + offset)
 #define SET_UNIPERIF_BIT_REG(ip, offset, shift, mask, value) \
-	writel_relaxed((((value) & mask) << shift), ip->base + offset)
+	writel_relaxed(SL_SHIFT(((value) & mask), shift), ip->base + offset)
 
 /*
  * UNIPERIF_SOFT_RST reg
-- 
2.30.2

