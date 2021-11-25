Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B223B45D7B7
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 10:54:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D0BE1865;
	Thu, 25 Nov 2021 10:53:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D0BE1865
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637834048;
	bh=hN9HiGbsXLQ1C0bTfGeXKyEX4q5EpQNFCa/MLLKj5f0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nbx5NYaRNV5es6wBzqGJTVVBEkMOODw/oHOg6Fau+YEbF7QG70fBPnrr/qvnO0pPb
	 RLmNOoPqgCwF81Wirp+cQXYCF3Vk6rkVtfWyGMZ0mLydUN3tm1o3xlXOnN06qec74r
	 XzlQC3eHc9NCS789a2s5m1TlqjFFMgFtXLrl1XoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B55BF804BC;
	Thu, 25 Nov 2021 10:52:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE36AF804BC; Thu, 25 Nov 2021 10:52:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1E51F8049E
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 10:52:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1E51F8049E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NN50d0DQ"
Received: by mail-wm1-x329.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso7814010wms.3
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 01:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xy2z4qlxanl4Hw2PX18g8lYJVE5ndrvEF3pAOx4MLrY=;
 b=NN50d0DQt9wmmVdxQYef9+Y7/G2a4VAenOiUMA9QQe5EE3Sq1Kkl4Ix5HnvsOPJ/D5
 bvKVEMaRVzY2W2zromU5gWBk0W8bT+o+tXgHAPo627o2hPpjJarSMUfGYHwbqDpYARtN
 84f3PbeOtHqsOyAXrmZWv0ZWcCTg+JuFiK/OFTAlmRDSQiI2pa9+HWYzNWTu+EFxDpU/
 G+ma9Mcm4MXOskLGHf08pbTa49wFkQxD1NGWyb55R5z7QiaCRK4uJaBr5n3ona9E10aO
 7FxpKTotpNtATCiPwFRT2JYgQMkZPx0O6sAbb9Ebl+WIZnt6xp89P2cofLbrvDihffCZ
 cnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xy2z4qlxanl4Hw2PX18g8lYJVE5ndrvEF3pAOx4MLrY=;
 b=wtH1XfNU27r170OsUkgw+ORkrUMoKz+gpC0eaWzN7vWcNwB/PQPXTbEQuPGJzEkDmW
 bIOlDCYfcXZbgWVnqjg4RnwFr4ZYPeVzFd/PsGbMrctVJR4OD0WVBpSn7r4bSYIo85ZE
 42uSUIMCLzT9NuQn7Xh3XzJRD5cQDCMS4NpknEQfn9t5RlwIvva8wlgXTuTiQ7IFWnqb
 ht3uQ7rAj9xJ3zOeNgsuyvj457fr2JRPp7M2Hdd+VDJyZIlCOk3r5zvGhI6PLEiSVKaH
 cXmPyl4PBfM9gP9j7ghzBIOTH6WFQnH3HMmEvDwJHYhMNyt0tc5kpkH5pFe46gTDTlb+
 L0eQ==
X-Gm-Message-State: AOAM5317ak3v+E6bB2niSkeQZHg9fM6vZ4nd4b5L1V9HTJkJufMh0i04
 dbsCsKF3New0lgm/n40+b/4=
X-Google-Smtp-Source: ABdhPJyIFG1pqgyPP+GLxBDWtvShEO+05+7/3fMA5MdoRv7XDsSxvdvFu9CR6pgNbFVnLIg47Bn3lg==
X-Received: by 2002:a1c:f30d:: with SMTP id q13mr5361861wmq.55.1637833940778; 
 Thu, 25 Nov 2021 01:52:20 -0800 (PST)
Received: from localhost.elektrobit.com (eth1-fw1-nbg6.eb.noris.de.
 [213.95.148.172])
 by smtp.gmail.com with ESMTPSA id c1sm2310853wrt.14.2021.11.25.01.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 01:52:20 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ASoC: uniphier: drop selecting non-existing
 SND_SOC_UNIPHIER_AIO_DMA
Date: Thu, 25 Nov 2021 10:51:57 +0100
Message-Id: <20211125095158.8394-2-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211125095158.8394-1-lukas.bulwahn@gmail.com>
References: <20211125095158.8394-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Commit f37fe2f9987b ("ASoC: uniphier: add support for UniPhier AIO common
driver") adds configs SND_SOC_UNIPHIER_{LD11,PXS2}, which select the
non-existing config SND_SOC_UNIPHIER_AIO_DMA.

Hence, ./scripts/checkkconfigsymbols.py warns:

  SND_SOC_UNIPHIER_AIO_DMA
  Referencing files: sound/soc/uniphier/Kconfig

Probably, there is actually no further config intended to be selected
here. So, just drop selecting the non-existing config.

Fixes: f37fe2f9987b ("ASoC: uniphier: add support for UniPhier AIO common driver")
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 sound/soc/uniphier/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/uniphier/Kconfig b/sound/soc/uniphier/Kconfig
index aa3592ee1358..ddfa6424c656 100644
--- a/sound/soc/uniphier/Kconfig
+++ b/sound/soc/uniphier/Kconfig
@@ -23,7 +23,6 @@ config SND_SOC_UNIPHIER_LD11
 	tristate "UniPhier LD11/LD20 Device Driver"
 	depends on SND_SOC_UNIPHIER
 	select SND_SOC_UNIPHIER_AIO
-	select SND_SOC_UNIPHIER_AIO_DMA
 	help
 	  This adds ASoC driver for Socionext UniPhier LD11/LD20
 	  input and output that can be used with other codecs.
@@ -34,7 +33,6 @@ config SND_SOC_UNIPHIER_PXS2
 	tristate "UniPhier PXs2 Device Driver"
 	depends on SND_SOC_UNIPHIER
 	select SND_SOC_UNIPHIER_AIO
-	select SND_SOC_UNIPHIER_AIO_DMA
 	help
 	  This adds ASoC driver for Socionext UniPhier PXs2
 	  input and output that can be used with other codecs.
-- 
2.26.2

