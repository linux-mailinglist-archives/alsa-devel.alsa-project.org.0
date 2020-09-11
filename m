Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D566265DC2
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Sep 2020 12:25:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 148CE1676;
	Fri, 11 Sep 2020 12:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 148CE1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599819904;
	bh=4yMpyFFK3wXXjyOeEceerl4a1QpbQ0JgWEt8qomesDI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=srZbHiqguK32yJIS83iPOWT4SewTYKN2JeiI987yRAHCzfUqagJ7XtckrvTBqEztf
	 5J4iYS+jVlbU2hmdkeIAFxGZw8vPGPRdnoZ23UtAmC9W8RzT1XGtt/gCV3TpdOlp1p
	 IVMOW36aZ/3UGPzlQlYuwO6ZnYEYEg1IcusI3jqo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44F68F80240;
	Fri, 11 Sep 2020 12:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65EDFF80227; Fri, 11 Sep 2020 12:23:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37C47F80100
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 12:23:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37C47F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="NUSrvRqm"
Received: by mail-pg1-x542.google.com with SMTP id v15so6325801pgh.6
 for <alsa-devel@alsa-project.org>; Fri, 11 Sep 2020 03:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0vYasziV4Ler0VCEn6KqQHtlj4BJcAoBCUWQkLB1w7Q=;
 b=NUSrvRqmlAloG2hxHlBBY9dwtvyS3x7PRz4DWrxcP1VxixL3oFi1tQkrc6zUtmwk3t
 Pf5tRZOqNcx1Lj6UzHx79lq3hraKZgedTohZVKjJECewlOILUAC+s7bmn+I7bp5KeIWw
 K5QNQSYGmLgaOoNg3SV36FbV/8oOg644m3kSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0vYasziV4Ler0VCEn6KqQHtlj4BJcAoBCUWQkLB1w7Q=;
 b=IqZ95W3YyU1tx0gmaia+d/6Zc9Hu6hvNa0txUKMZ4Bt1lncxwxwHb7wqyPGxNVRwRj
 NXlWu3GVzIizgEhqCyUpT1LPtUL5OMBAGH1fi+fkbgaWNHBtGC3Z5pcf5PzI0KfeufU0
 Fqu3mY4EePz3y2c9/ltsGeUjTB3r/2b3XI1MZQ8A0uoW1fPD2eTEc6PonJ6IqMswbNKC
 /XX/3lvxjEDk9AaCaVzx6iiFGsYFFjrc/3E7HPIz0uKUbT7PkmtolmKElmw8V6FAkHY9
 TahTdeSnHZ0E8YY2M7h0yGMevbJvEa4RkVfzBy2QXECm4PVBwRTRYYJlwFZgaGYASI/y
 nOtg==
X-Gm-Message-State: AOAM5301Dlt3NcWVZIyjJVvGaRPIzMPSYcp7m4I1kw7B3B3miOWNcJUL
 0zM9BCkIvy5PiiAMNWpoyxnsng==
X-Google-Smtp-Source: ABdhPJyYmaJmk1RDpFXLOPsLGNOg/bKTZV0+TMJnDMZBrL1SlRoSUzLsu3q6S6akaad+bQjg/sYm1Q==
X-Received: by 2002:a63:3710:: with SMTP id e16mr1201441pga.140.1599819788638; 
 Fri, 11 Sep 2020 03:23:08 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
 by smtp.gmail.com with ESMTPSA id u123sm1852804pfb.209.2020.09.11.03.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 03:23:07 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/3] Add documentation and machine driver for SC7180 sound
 card
Date: Fri, 11 Sep 2020 18:22:56 +0800
Message-Id: <20200911102259.3667381-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Patrick Lai <plai@codeaurora.org>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 dgreid@chromium.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
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

Note:
- The machine driver patch is made by the collaboration of
  Cheng-Yi Chiang <cychiang@chromium.org>
  Rohit kumar <rohitkr@codeaurora.org>
  Ajit Pandey <ajitp@codeaurora.org>
  But Ajit has left codeaurora.
- This patch series needs HDMI DAI name defined in sc7180-lpass.h.
  https://patchwork.kernel.org/patch/11745565/

Changes from v1 to v2:
- Ducumentation: Addressed all suggestions from Doug.
- Machine driver:
  - Fix comment style for license.
  - Sort includes.
  - Remove sc7180_snd_hw_params.
  - Remove sc7180_dai_init and use aux device instead for headset jack registration.
  - Statically define format for Primary MI2S.
  - Atomic is not a concern because there is mutex in card to make sure
    startup and shutdown happen sequentially.
  - Fix missing return -EINVAL in startup.
  - Use static sound card.
  - Use devm_kzalloc to avoid kfree.

Changes from v2 to v3:
- Ducumentation: Addressed suggestions from Srini.
- Machine driver:
  - Reuse qcom_snd_parse_of to parse properties.
  - Remove playback-only and capture-only.
  - Misc fixes to address comments.

Changes from v3 to v4:
- Ducumentation: Addressed suggestions from Rob.
 - Remove definition of dai.
 - Use 'sound-dai: true' for sound-dai schema.
 - Add reg property to pass 'make dt_binding_check' check although reg is not used in the driver.
- Machine driver:
 - Add Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

Changes from v4 to v5:
- Documentation: Addressed suggestions from Rob.
 - Add definition for "#address-cells" and "#size-cells".
 - Add additionalProperties: false
 - Add required properties.

Changes from v5 to v6:
- Documentation: Addressed suggestions from Rob.
 - Drop contains in compatible strings.
 - Only allow dai-link@[0-9]
 - Remove reg ref since it has a type definition already.

Changes from v6 to v7
- Documentation:
  - Add headset-jack and hdmi-jack to specify the codec
    responsible for jack detection.
- HDMI codec driver:
  - Use component set_jack ops instead of exporting hdmi_codec_set_jack_detect.
- Machine driver:
  - Removed aux device following Stephan's suggestion.
  - Use headset-jack and hdmi-jack to specify the codec
    responsible for jack detection.
  - Add support for HDMI(actually DP) playback.

Changes from v7 to v8
- Documentation:
  - Remove headset-jack and hdmi-jack.
- Machine driver:
  - Let machine driver decide whether there is a jack on the DAI.

Changes from v8 to v9
- hdmi-codec driver:
  - Fixed the naming.
- Machine driver:
  - Fixed unused fields.
  - Moved snd_soc_card_set_drvdata
  - Keep the naming of HDMI as dai name until v5 of lpass-hdmi patches.

Ajit Pandey (1):
  ASoC: qcom: sc7180: Add machine driver for sound card registration

Cheng-Yi Chiang (2):
  ASoC: hdmi-codec: Use set_jack ops to set jack
  ASoC: qcom: dt-bindings: Add sc7180 machine bindings

 .../bindings/sound/qcom,sc7180.yaml           | 130 +++++++++
 include/sound/hdmi-codec.h                    |   3 -
 sound/soc/codecs/hdmi-codec.c                 |  12 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     |   5 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  |   5 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |   5 +-
 sound/soc/qcom/Kconfig                        |  12 +
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/sc7180.c                       | 267 ++++++++++++++++++
 sound/soc/rockchip/rockchip_max98090.c        |   3 +-
 10 files changed, 422 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
 create mode 100644 sound/soc/qcom/sc7180.c

-- 
2.28.0.618.gf4bc123cb7-goog

