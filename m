Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F73381A9
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 01:13:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 499D71765;
	Fri,  7 Jun 2019 01:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 499D71765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559862796;
	bh=zajLJEfxb8oPgNELjrVzloR9yx9QUcJDbGbP6Av2IBo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jzFfPNWanVTLF8qwjs2Db8Y+DXB9Kza7ThhfkQ92RryTARtSoovuh7KP4dIUkC1tr
	 dcVQuRJQoHWtmJ/lTDcgA8ApXxG8SZjLRbHACZY7AfYzulajTE0GggwuO5Rw3tXcqn
	 l4fbngbkkT2Pn92lUMTiu+kT8cm9TgfltRJh77Hs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2181F896CE;
	Fri,  7 Jun 2019 01:01:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9EE31F896F7; Fri,  7 Jun 2019 01:01:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF243F8072A
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 01:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF243F8072A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AReiaJER"
Received: by mail-pl1-x641.google.com with SMTP id g9so31517plm.6
 for <alsa-devel@alsa-project.org>; Thu, 06 Jun 2019 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=12La436VbNM+cCSd7W2kZMhljrLWHemPkQdkpyh82vY=;
 b=AReiaJERh9zfxRcBRKv/f5ZBzgNxQuBHCtL/MVHd7MWiPpVT1CnFdhZULF9v76DzvI
 APLMydZtIIGHUOF8LV9te1yum4VCqoO+JJo8fP8KQK3tcqsZVLtZjJU3eGYyNSQ1T8Sj
 dPbD4GyBcbK8B2wpKq2m7HnmayAH2ojTkHIhzVJydEe23H3GiltSObE8Vmsh3WBHMTsL
 UCc6dTDfvgdqwHalbqqL7ixq6ZcHpMDgN7SMcCwQBeJVfHPuhsJfCgSUruUu+0Q9Eubl
 Yq1eOLubJF54PHrSBAmTqhrTv0L+bf5qtlvG89eMew8LVYpvRULeTKj6Hwc7A8tWVUFH
 9V5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=12La436VbNM+cCSd7W2kZMhljrLWHemPkQdkpyh82vY=;
 b=Uqhxc8iRByY0QATQCozBvDXBRdgUI4XTj7dwy/Of4N3RtrcdU0H8ed8/GS0R3Uj725
 Yn8bhsC8J5AB6ABuZHJeMhf9biqIWLRhM0fSlfdS48hZAkDgsv+UA4T0IXYL0/6IMrY5
 JAJzZO4qebN02OVLJMrmwDfBL3Vh1GeFiZrl5adRSPhX7rNuFgIp4W8cdrfTOurkf2uI
 4B6gdPti3mbUI1JDje/grI6uhfkmiWKgzGXhtiGaErBtq1xgW+NbDrOQ/9RoVDtJ6mER
 NOEJ6aSqI8GKE5YMBQHNoh3s+HqsmWhyMx4CyYhGuRVkcYPPMGeG2gl+B2iWvn8VufRa
 S2HQ==
X-Gm-Message-State: APjAAAVYWtU2NktrTjhBLYzO3U/oh0iae+8+XLB7MasHMiJIuWELUnvz
 zhbbzaxsT1urRllWlKPTO8M=
X-Google-Smtp-Source: APXvYqyJRnNHG/xd1j5UBLUN+f975Gpvky3R4SP3NlglwXTBLeJVJJ23pdeMLMfwRDTHpYXKxwk0/Q==
X-Received: by 2002:a17:902:694b:: with SMTP id
 k11mr38505043plt.307.1559862071919; 
 Thu, 06 Jun 2019 16:01:11 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id w190sm198049pgw.51.2019.06.06.16.01.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 16:01:11 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: shengjiu.wang@nxp.com,
	broonie@kernel.org
Date: Thu,  6 Jun 2019 16:01:05 -0700
Message-Id: <20190606230105.4385-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, timur@kernel.org, lgirdwood@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, tiwai@suse.com,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [RFC/RFT PATCH] Revert "ASoC: fsl_esai: ETDR and TX0~5
	registers are non volatile"
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This reverts commit 8973112aa41b8ad956a5b47f2fe17bc2a5cf2645.

ETDR and TX0~5 are TX data registers. There are a couple of reasons
to revert the change:
1) Though ETDR and TX0~5 are not volatile but write-only registers,
   they should not be cached either. According to the definition of
   "volatile_reg", one should be put in the volatile list if it can
   not be cached.
2) When doing regcache_sync(), the operation may accidentally write
   some "dirty" data into these registers, in case that cached data
   happen to be different from the default ones. It may also result
   in a channel shift/swap situation since the number of write-via-
   sync operations at ETDR would unlikely match the channel number.

Note: this revert is not a complete revert as it keeps those macros
of registers remaining in the default value list while the original
commit also changed other entries in the list. And this patch isn't
very necessary to Cc stable tree since there has been always a FIFO
reset operation around the regcache_sync() call, even prior to this
reverted commit.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
---
Hi Mark,
In case there's no objection against the patch, I'd still like to
wait for a Tested-by from NXP folks before submitting it. Thanks!

 sound/soc/fsl/fsl_esai.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 10d2210c91ef..8f0a86335f73 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -652,16 +652,9 @@ static const struct snd_soc_component_driver fsl_esai_component = {
 };
 
 static const struct reg_default fsl_esai_reg_defaults[] = {
-	{REG_ESAI_ETDR,	 0x00000000},
 	{REG_ESAI_ECR,	 0x00000000},
 	{REG_ESAI_TFCR,	 0x00000000},
 	{REG_ESAI_RFCR,	 0x00000000},
-	{REG_ESAI_TX0,	 0x00000000},
-	{REG_ESAI_TX1,	 0x00000000},
-	{REG_ESAI_TX2,	 0x00000000},
-	{REG_ESAI_TX3,	 0x00000000},
-	{REG_ESAI_TX4,	 0x00000000},
-	{REG_ESAI_TX5,	 0x00000000},
 	{REG_ESAI_TSR,	 0x00000000},
 	{REG_ESAI_SAICR, 0x00000000},
 	{REG_ESAI_TCR,	 0x00000000},
@@ -711,10 +704,17 @@ static bool fsl_esai_readable_reg(struct device *dev, unsigned int reg)
 static bool fsl_esai_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
+	case REG_ESAI_ETDR:
 	case REG_ESAI_ERDR:
 	case REG_ESAI_ESR:
 	case REG_ESAI_TFSR:
 	case REG_ESAI_RFSR:
+	case REG_ESAI_TX0:
+	case REG_ESAI_TX1:
+	case REG_ESAI_TX2:
+	case REG_ESAI_TX3:
+	case REG_ESAI_TX4:
+	case REG_ESAI_TX5:
 	case REG_ESAI_RX0:
 	case REG_ESAI_RX1:
 	case REG_ESAI_RX2:
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
