Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E385E271DB1
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 10:16:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83803167B;
	Mon, 21 Sep 2020 10:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83803167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600676172;
	bh=C80Dy7apqk6dg+gWzX7fICrl89osqssnzRXg7TSaDA4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ePGI6/mivQXSxJ8rzG2xRX6RP3Wlms7Wz5Z/ZOdBBNRuJjF2P/izU05ZB9h7F6QwV
	 8vbWeigh7HJR6VCQiD15zBp1GZvAgRQNc47HwL+SJZPB8fPoBGPeHO0FcC+i+IEsuM
	 h8Jifw0OV1XUByVqZpJCukdMSwEej0g8etwFPJgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85C14F8031A;
	Mon, 21 Sep 2020 10:10:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9CFBF80329; Thu, 17 Sep 2020 16:19:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42B03F8032A
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 16:19:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42B03F8032A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="D9Cnb7fg"
Received: by mail-ej1-x642.google.com with SMTP id lo4so3517860ejb.8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 07:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4QdmLHNgHWV7EyDtK4mu8SWh5osx/6ArPk9SW2Wk9JU=;
 b=D9Cnb7fgSHrvuQt0e1Tnf0E5ipLGZaJKw+XvFXRqkdYGdK7C8Nn3GXQ/YWDZdYk1M8
 uIICO/VqVzPETutVmfHYjeJKQgxxtchOj/8REl0Mz1L9KfqIPsHSF/Ce9ie35frZKAd0
 qRGHJTXLvfDgvtzArrDFUp3NT04cRD7BkjXVp5JltB/HTNjMrq0flignNFWCcdaOWpLb
 XSfb16AscCIv7WzkxG/2cPTHSIQIiYh4yJpv6YBfAgLk9baCGNDKO7dPkPmovGdX9SDy
 dxXdn1Y2g6xqR8WNdJmlXWr2fYT5JQMlQjU51a9hVOoArjj6UGQV6MgsHvxPE0UAPbyQ
 +v2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4QdmLHNgHWV7EyDtK4mu8SWh5osx/6ArPk9SW2Wk9JU=;
 b=IgXuAJRzfD8GMRCLuYHmUDmZD+FnjqRbjxeAmheAEG1iU5zK86EgydTKAZaxwwK4M4
 6m6JY39tINMR5DBRh1Xtr9ANc5+PtCf06z8+OIh4VBIIZVAfVZHb3GUv1lkTCIQXeWRx
 OzHC87LphByE/sIpc45gF7nniXDU2/sXoFwfOAYXT0OZ4FdxiPg0wAoYt9caVWsHfnUC
 IgEbbdM+G1YaORfGSJ6EC+BSbtQm3ByYHGaN4VTTxdK45zw62L47SkbCWtovlqb3jzxl
 pd1WBGbgJJr1FNYxI0aHoa7QtGjhFAy/YxkuKTmyo4Aa86PaaeMbIArKNi9OIc/JO2IR
 RJ4w==
X-Gm-Message-State: AOAM530x0jYDZq4ZZeJQgXCam23EAJQGJio12w/oc6XewPZ8OXkBQKqc
 csrKDl/LmoU8mFFY4Ox0Tkg=
X-Google-Smtp-Source: ABdhPJyLUxBjXuAJW1BD8Nd5aF9NxUTWesVyqfUAkVN5f650FWip28Le9/P6ASLfBJ8o03MyXSzPvQ==
X-Received: by 2002:a17:906:250a:: with SMTP id
 i10mr30382001ejb.202.1600352356709; 
 Thu, 17 Sep 2020 07:19:16 -0700 (PDT)
Received: from localhost.localdomain ([85.153.229.188])
 by smtp.gmail.com with ESMTPSA id j14sm16675661edr.91.2020.09.17.07.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 07:19:15 -0700 (PDT)
From: Necip Fazil Yildiran <fazilyildiran@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: cros_ec_codec: fix kconfig dependency warning for
 SND_SOC_CROS_EC_CODEC
Date: Thu, 17 Sep 2020 17:18:04 +0300
Message-Id: <20200917141803.92889-1-fazilyildiran@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Sep 2020 10:10:23 +0200
Cc: alsa-devel@alsa-project.org, paul@pgazz.com,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>, linux-kernel@vger.kernel.org,
 jeho@cs.utexas.edu, ardb@kernel.org
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

When SND_SOC_CROS_EC_CODEC is enabled and CRYPTO is disabled, it results
in the following Kbuild warning:

WARNING: unmet direct dependencies detected for CRYPTO_LIB_SHA256
  Depends on [n]: CRYPTO [=n]
  Selected by [y]:
  - SND_SOC_CROS_EC_CODEC [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && CROS_EC [=y]

The reason is that SND_SOC_CROS_EC_CODEC selects CRYPTO_LIB_SHA256 without
depending on or selecting CRYPTO while CRYPTO_LIB_SHA256 is subordinate to
CRYPTO.

Honor the kconfig menu hierarchy to remove kconfig dependency warnings.

Fixes: 93fa0af4790a ("ASoC: cros_ec_codec: switch to library API for SHA-256")
Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 946a70210f49..601ea45d3ea6 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -540,6 +540,7 @@ config SND_SOC_CQ0093VC
 config SND_SOC_CROS_EC_CODEC
 	tristate "codec driver for ChromeOS EC"
 	depends on CROS_EC
+	select CRYPTO
 	select CRYPTO_LIB_SHA256
 	help
 	  If you say yes here you will get support for the
-- 
2.25.1

