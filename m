Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E827121AE90
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 07:28:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C0FA1612;
	Fri, 10 Jul 2020 07:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C0FA1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594358883;
	bh=2UqRbmC/xGW5fDKLDLFVu+Z5aurK6jXm2JakoKJIyEM=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q3zFvS5kAn9MBmCPDr2PUnjRt918ELFncVdtRc0yMgvLfmRvV4wbgwsF33V4InVuV
	 +YSdQKL6F+f7zb+H4T29idauxvQB2HOj3C2tDY946QW4m6Ony9Fc2er8lXGUCCvFh4
	 mMmNimbyHwlzCawefJlZkN23x3f+kKE9vEWnTLy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4683EF80268;
	Fri, 10 Jul 2020 07:25:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D49BBF8015C; Fri, 10 Jul 2020 07:25:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B37E3F80112
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 07:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B37E3F80112
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="BKscopTz"
Received: by mail-yb1-xb49.google.com with SMTP id w35so5781327ybi.16
 for <alsa-devel@alsa-project.org>; Thu, 09 Jul 2020 22:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=waFmwNjvn8zrzF+MflfsEtX07GKV6zTcqXH2BQIDo6I=;
 b=BKscopTznRI/6PlxNEk0SE0fxVRhoo+fn7dYCuemGdOZIADZEwhPo+ULx0QJjgfT+7
 +PpgH+n/5j3YZS63+Z1hnzoLJIPmPncek9CugDTRvHQ23oS3U5GCn6/elW1K2CnAzUtE
 Ud4kLm8bieJUsuWXMAKjtzaRMe2DKNe6dkj/hIPYueVn74t5rH+wd0V5VmrhoO4SCVQ7
 TveVFJ9J1ykqLXcMNWycZAYCDgE07/HDR0qsBhiwTJPekKdVw+aiiIfFimfAzgA4TUwp
 cNS3YrzX1BVIz4dqspdVMhiPFxB5jkBoDBDQ3BBS01WiPB/1O5eds/f/ZGZMOar1Tz+4
 W6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=waFmwNjvn8zrzF+MflfsEtX07GKV6zTcqXH2BQIDo6I=;
 b=JGsxDPuwxSE3HGWoW/amltp3wMfk5PAOYeb7/5enHufujlRR3hLBTFn5le5Hs+1T42
 HKZcna58rzCDDcg0ZGpZzpfMFy78Gey9KNUKl5OdFOsjtQZm+Td4awB15/kN8/N0YLgJ
 DGNr8NSHcD2Av49Zdtm5ohCp0C5JMY61ic/c3kIXob+pESZ+ngTkWamh+y6zk8/KbjF5
 MSaZBWGv9z/Wgz9w9xZuTgccl1qkRGAE0p7kTsIPafs1Yk260xs7nZaCRRouXurEQwfe
 uCyddO4EXI13+AoElWVR4urB/0L73qGrHsr5+gT56yh6M64rBDP42Dax/UsVaS2f90rC
 SMyA==
X-Gm-Message-State: AOAM531tPeuPOl9BnKeFclxgp9yzqiflA+XTITqkFsCOBStep39sfpXu
 qelF7315A5QEIdegm+PCm99hnZKuQuoj
X-Google-Smtp-Source: ABdhPJwP7e8k+tjpxgJCNtpdCpHvOKoiQ2NdP3VBQyiLvLA0NAeFA8ZUuQe5WMXbfnvgbYoF7V2Yrys14mtZ
X-Received: by 2002:a25:abd0:: with SMTP id v74mr23431860ybi.222.1594358721171; 
 Thu, 09 Jul 2020 22:25:21 -0700 (PDT)
Date: Fri, 10 Jul 2020 13:25:01 +0800
In-Reply-To: <20200710052505.3664118-1-tzungbi@google.com>
Message-Id: <20200710052505.3664118-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20200710052505.3664118-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 2/6] ASoC: mediatek: mt8183: use hdmi-codec
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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

Adds DAI link to use hdmi-codec.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 964f2f821782..c375e9f91a34 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -258,7 +258,7 @@ SND_SOC_DAILINK_DEFS(i2s5,
 
 SND_SOC_DAILINK_DEFS(tdm,
 	DAILINK_COMP_ARRAY(COMP_CPU("TDM")),
-	DAILINK_COMP_ARRAY(COMP_DUMMY()),
+	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "i2s-hifi")),
 	DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 static int mt8183_mt6358_tdm_startup(struct snd_pcm_substream *substream)
@@ -562,7 +562,7 @@ static int
 mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
-	struct device_node *platform_node, *ec_codec;
+	struct device_node *platform_node, *ec_codec, *hdmi_codec;
 	struct snd_soc_dai_link *dai_link;
 	struct mt8183_mt6358_ts3a227_max98357_priv *priv;
 	const struct of_device_id *match;
@@ -583,6 +583,8 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 	card->dev = &pdev->dev;
 
 	ec_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,ec-codec", 0);
+	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
+				      "mediatek,hdmi-codec", 0);
 
 	for_each_card_prelinks(card, i, dai_link) {
 		if (ec_codec && strcmp(dai_link->name, "Wake on Voice") == 0) {
@@ -626,6 +628,9 @@ mt8183_mt6358_ts3a227_max98357_dev_probe(struct platform_device *pdev)
 			}
 		}
 
+		if (hdmi_codec && strcmp(dai_link->name, "TDM") == 0)
+			dai_link->codecs->of_node = hdmi_codec;
+
 		if (!dai_link->platforms->name)
 			dai_link->platforms->of_node = platform_node;
 	}
-- 
2.27.0.383.g050319c2ae-goog

