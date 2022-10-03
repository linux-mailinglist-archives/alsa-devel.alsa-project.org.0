Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BA05F27D7
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Oct 2022 05:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D37A2873;
	Mon,  3 Oct 2022 05:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D37A2873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664767592;
	bh=tVxwA556fGR31jlNvKAe2MLXn3vguq/WKc/VouZuLcw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pthw3smiUQngI+OndCAZJ2b7qj/unaVR19t8JUT0wRr/POBaHC6zaVJ0UH5Fihn64
	 suMO7h9XkuVovWQoa49djmY/EiF30gr3MJTJUqfdBSoCtPfT/MR0hS85CO218K2gDl
	 t9WbAYsq7VhEy+zIkY3wrXJcLakVLUGKHJFkQd24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A34BF80549;
	Mon,  3 Oct 2022 05:24:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2FBBF80549; Mon,  3 Oct 2022 05:24:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 905D4F800B5
 for <alsa-devel@alsa-project.org>; Mon,  3 Oct 2022 05:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 905D4F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=schmorgal.com header.i=@schmorgal.com
 header.b="S0YyQndT"
Received: by mail-pg1-x52d.google.com with SMTP id q9so8657654pgq.8
 for <alsa-devel@alsa-project.org>; Sun, 02 Oct 2022 20:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DQquaZAcXIy4M+b8mdS34VA7TR7HzahIgM8NzE1IWeY=;
 b=S0YyQndTN+fah/mp3zVqA/pfagjsIfATDQ3UQziRxt9h8+mrZxLvlmQyE8EtyRL+U1
 8A3ZwvPrgvcegiSczlVPSQaQD0C+POgsCUm+oKbvsi8xOL8fpLGJg6nQNn3VkYADIZnW
 blO6kGP+xVXZo8d6Q7heb+TT+GDI2COYLl2Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DQquaZAcXIy4M+b8mdS34VA7TR7HzahIgM8NzE1IWeY=;
 b=S1IrstD0OHHn5Xokg84OjkWBHBnSZjS/fxMErQpXD0jw05fnaw4FwYiE4ttwMgrZuw
 OV1a5yHPusNhkjhu6nYWGPy+09xEjxyhuyuZ8CavjB93zUtK3clYT3dIl2u8zhvUssQZ
 sSOsS8+lmdZVP1IJ5sCPw0EUM57S5l+9e54ZyIzGvOT5fNJKMtigq4g2mq9ThNRwQu18
 d9PWnrlia75+xyEtfApJ0NZDy3QVN/sEb6Q0FCABhh/oUAgpZI1DyS0AoOP+zfEchs+4
 b4NE4FmRgNxo92aGlR9JLMu5/L8DAy6NoCbL36Tk+b6raWVXYCpRGJJbbJm6Id9nmkyq
 SFGg==
X-Gm-Message-State: ACrzQf0qebnv6RP7rq1xDuAZf+jMc8D5sKlg7m1a3lYcxtDwAgvIZWQ1
 HTeXpTGIF9qubLpKBxvAQZEczw==
X-Google-Smtp-Source: AMsMyM65B5CKIKoAtOoSsD0JpIFTe51j6BtOH9csjXvYeIEUaRkmVf8q4zPaQd9DaX2ABMPbeB+JHw==
X-Received: by 2002:aa7:9710:0:b0:561:7692:fa11 with SMTP id
 a16-20020aa79710000000b005617692fa11mr2402055pfg.39.1664767483319; 
 Sun, 02 Oct 2022 20:24:43 -0700 (PDT)
Received: from doug-ryzen-5700G.. ([50.45.132.124])
 by smtp.gmail.com with ESMTPSA id
 y25-20020aa78f39000000b0053e7d3b8d6dsm6157977pfr.1.2022.10.02.20.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Oct 2022 20:24:43 -0700 (PDT)
From: Doug Brown <doug@schmorgal.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 3/3] ASoC: codecs: allow WM8961 to be selected by the user
Date: Sun,  2 Oct 2022 20:24:14 -0700
Message-Id: <20221003032414.248326-4-doug@schmorgal.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221003032414.248326-1-doug@schmorgal.com>
References: <20221003032414.248326-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Doug Brown <doug@schmorgal.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

Allow the WM8961 driver to be enabled independently now that it is
usable with devicetree.

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index e3b90c425faf..2b5787ee8d31 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1929,7 +1929,7 @@ config SND_SOC_WM8960
 	depends on I2C
 
 config SND_SOC_WM8961
-	tristate
+	tristate "Wolfson Microelectronics WM8961 CODEC"
 	depends on I2C
 
 config SND_SOC_WM8962
-- 
2.34.1

