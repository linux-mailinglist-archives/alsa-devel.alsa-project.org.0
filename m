Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3FB0719CF1
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 15:07:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 673FC208;
	Thu,  1 Jun 2023 15:06:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 673FC208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685624851;
	bh=XJxseORK7ZnAl3eP8lVEVc6boBA1ecjsed6zPEinIPI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NH67q1NR3JdSAczMiX4BIOu94J30c0h6zh2Sj7jqgSjzLKuDVKfD76Gt3czqtKQfz
	 PP9+ErAAaEo9NLVkpoeQDFjGnCCss/K55JaAcoX87K5WBaXlE6s2peeGjLlfWQxJ/U
	 szLJwKZkjTF/xFf4MsMNBfbiydSyEO2oOc2kdl0U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE204F80132; Thu,  1 Jun 2023 15:06:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A104F80132;
	Thu,  1 Jun 2023 15:06:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E42C2F8016B; Thu,  1 Jun 2023 15:06:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5175AF800C1
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 15:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5175AF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=cRNwyrR6
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-256712d65ceso288486a91.1
        for <alsa-devel@alsa-project.org>;
 Thu, 01 Jun 2023 06:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685624778; x=1688216778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tm7KDaSSjYvTYPu798lAyVQ8TuXxD3ciaiRSHMe2MWI=;
        b=cRNwyrR6RhCtm54eNkfyDGqAwseqfMo+xydQcUdKy/QlVcZqFRAlkI3bQCOaN1cDu7
         9d6pDMsFJC703p+mSJAHYKXwKJfhiv+Fv6yeoln1PUPfZvi4RBw1AedgK+hc9fazXGqN
         YI4kXpD4+O6j3R5pvJzSFx9Eo50ooTzwSOI+oqFQPglxckMxS/CGqotCZCb2AQWvrlv2
         DD3BASB+s/Rnsb/Fwi5Jr2rJiCPDeA7cKgjinyR/+9l6NFzj1l5eRpN2tvDDdCMoiN99
         oqBYLUgewJAAb4/T43J0AF+fLzTPbkkB75g0c/+HahjIt0tlrAkeJVkOOfKKZfLKM7Qg
         Djzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685624778; x=1688216778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tm7KDaSSjYvTYPu798lAyVQ8TuXxD3ciaiRSHMe2MWI=;
        b=bhUuZZoV5FIE5iIspqHqlxz3PHvhysIYnDEEcnX+GUrKyrDrIoDgJ6FvwpjNECLfsc
         IczBCan4wo6kW/uSJlgXY5lMdDVOB38uvud2vMBneYoqDoauCBlUwoSOyYlD8LLDUFMK
         lP1P7mUrypc0n6X2nWwY8MHPvqlR5HFgs4u0aOKfJfQtWTlh+Xkcn3jxajbuVySKx91p
         v1BbD7W2YHGXZVuSYR1CtGCjeUcDRZoXbroafDBTbzDKe2omHBZqzgdlqDvae0Snh8e/
         9JNad4Aqa0KD8xisEvz/A++k/xXW522AeD7WZbF64J6ueK44NC0z3O9232IQYWcFf3uT
         2vmQ==
X-Gm-Message-State: AC+VfDxPAtKpJ2u1KDBE9dbdZKEWpCif64u9fUIx0U1i6QsA6YrYlwXa
	PRx5kPbE9dG50DtwBW93FHI=
X-Google-Smtp-Source: 
 ACHHUZ417r58s1N53t2yURhkDqH5J9VetxhvfpIj4hjoAzs3iSk/8iUou1gI/nCvjvcxUdqMBSoWtg==
X-Received: by 2002:a17:90a:a40e:b0:256:8cb7:2b2b with SMTP id
 y14-20020a17090aa40e00b002568cb72b2bmr6413171pjp.14.1685624777949;
        Thu, 01 Jun 2023 06:06:17 -0700 (PDT)
Received: from ryan-ThinkPad-T470.. (c-24-6-63-212.hsd1.ca.comcast.net.
 [24.6.63.212])
        by smtp.gmail.com with ESMTPSA id
 s34-20020a17090a2f2500b0024df6bbf5d8sm1430096pjd.30.2023.06.01.06.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 06:06:17 -0700 (PDT)
From: =?UTF-8?q?=E2=80=9CRyan?= <ryan.lee.analog@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ryans.lee@analog.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: jairaj.arava@intel.com
Subject: [PATCH 1/2] ASoC: max98363: Removed 32bit support
Date: Thu,  1 Jun 2023 06:05:59 -0700
Message-Id: <20230601130600.25344-1-ryan.lee.analog@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RVIATWML6RFN3MNNFUNF5O3YQU2Q5D5P
X-Message-ID-Hash: RVIATWML6RFN3MNNFUNF5O3YQU2Q5D5P
X-MailFrom: ryan.lee.analog@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVIATWML6RFN3MNNFUNF5O3YQU2Q5D5P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ryan Lee <ryans.lee@analog.com>

MAX98363 does not support 32bit depth audio.
Removed 32bit from the supported format list.
Instead, added 16bit and 24bit to the list.

Signed-off-by: Ryan Lee <ryans.lee@analog.com>
---
 sound/soc/codecs/max98363.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
index 4585ebb1e82c..8aa9d9c67aa2 100644
--- a/sound/soc/codecs/max98363.c
+++ b/sound/soc/codecs/max98363.c
@@ -211,7 +211,7 @@ static int max98363_io_init(struct sdw_slave *slave)
 }
 
 #define MAX98363_RATES SNDRV_PCM_RATE_8000_192000
-#define MAX98363_FORMATS (SNDRV_PCM_FMTBIT_S32_LE)
+#define MAX98363_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
 static int max98363_sdw_dai_hw_params(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params,
-- 
2.34.1

