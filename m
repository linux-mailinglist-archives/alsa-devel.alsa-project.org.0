Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AED29A343
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 04:24:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86A2716AB;
	Tue, 27 Oct 2020 04:23:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86A2716AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603769067;
	bh=bB1lXIw6cLoJ97oQb0E5kZ1AQWHOo7j6l+iBMSPjxcc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SnszRbbb/XxlXTRoY+uDUcghFP/MfDKuT4kcuuqAVgs2RnNzDOWpk0/7mRIgIBpc2
	 xgwXbm/iY2fI28sXo4h+YducKiivWBI6M7pfD+98tijkXWA7f0FHlPOoQ4IlUUB/7D
	 XHIQorWQM1gT9Zmbhc+h7pOuNPYl5Es0VWPCD9I0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCD69F80217;
	Tue, 27 Oct 2020 04:22:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61148F8020D; Tue, 27 Oct 2020 04:22:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D727F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 04:22:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D727F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="THv4SgwU"
Received: by mail-pl1-x641.google.com with SMTP id x23so30343plr.6
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 20:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mzwmsuVM9xAQyK7nWxmsn3GokXE1FRx/WdryCE+KZmo=;
 b=THv4SgwUuhJFRyThc/WRtCLzzk7pvaG53zJeOnN6noAobD3Bdk+nqTPWA6hK3KpM84
 gXuRXli8VERWYhobeaOFqnXX7A6KSn5LZnopPPxl+/EylKbwaE7IWLwGcvbxrLjtzLbp
 Xlzr6L6ggxuHBu8GrRNBWDRM7v3SB4/eVQVc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mzwmsuVM9xAQyK7nWxmsn3GokXE1FRx/WdryCE+KZmo=;
 b=TSD+iz4EONL9rb7MTnQyN3lJgTsZ6y0j3SP6gI31BM1UY+524SP2D5rO9UB27cTblU
 zrhNeLQ1JI0uZESZjmCVEgCJjKNye01r7bNZiTDHgTTn+fjsVNZPZjPVqr7jwwNGyUuv
 5pFCRPsJG8Kyn5lpx/KSFE/EYowo9CIGVNyONRQA5D13No+jZaPqLa0D5zbwdf3aM/4Y
 ya+nriBq5K1hS8mBv7LyqIk7s5fcq3HyYwqYSJp8nNG0m2RZU+IPw98zGmJG9MAu8xTj
 WGp7W25Ae0HhZhX83kkaQuo+XsjVqzAhjD2lJv3Qis6em7DrYD2eKg9bsAXpHwTparza
 IzSA==
X-Gm-Message-State: AOAM532xV8Tz3x89QTECpsffYVvLlFIbQvgOnk9PCehO9LjErRbdQa0o
 O15GTS7Z1Rlt+7aLkT90qlt1+Q==
X-Google-Smtp-Source: ABdhPJw60lunYrbSac9zYPpjYuj0d1PNHTWP/m5LnyFqoAaSyUqfiZAK2Yke/rBQgfJgSUlKi0EihQ==
X-Received: by 2002:a17:90a:4684:: with SMTP id z4mr98449pjf.97.1603768962510; 
 Mon, 26 Oct 2020 20:22:42 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
 by smtp.gmail.com with ESMTPSA id n16sm202246pfo.150.2020.10.26.20.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Oct 2020 20:22:41 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v12 0/2] Add documentation and machine driver for SC7180 sound
 card
Date: Tue, 27 Oct 2020 11:22:32 +0800
Message-Id: <20201027032234.1705835-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.29.0.rc2.309.g374f81d7ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Patrick Lai <plai@codeaurora.org>,
 Andy Gross <agross@kernel.org>, dgreid@chromium.org,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Takashi Iwai <tiwai@suse.com>, xuyuqing@huaqin.corp-partner.google.com,
 Mark Brown <broonie@kernel.org>,
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

Changes from v9 to v10
- Documentation:
  - Let compatible string be more specific for board configuration to allow
    for future changes.
- Machine driver:
  - Fixed unused include and macro.
  - Add temporary macro SC7180_LPASS_DP for future change in sc7180-lpass.h.
  - Let sound card be dynamically allocated.
  - Change compatible string accordingly.

Changes from v10 to v11
- Machine driver:
  - Use temporary macro LPASS_DP_RX for future change in sc7180-lpass.h.

Changes from v11 to v12
- Documentation:
 - Change the file and title name for new compatible string google,sc7180-trogdor.
 - Change the example of model name.
- Machine driver:
 - Use the definitaion of index LPASS_DP_RX in sc7180-lpass.h.
 - Fix for compatible string.
 - Replace a comma with semicolon.

Ajit Pandey (1):
  ASoC: qcom: sc7180: Add machine driver for sound card registration

Cheng-Yi Chiang (1):
  ASoC: google: dt-bindings: Add sc7180-trogdor machine bindings

 .../bindings/sound/google,sc7180-trogdor.yaml | 130 +++++++++
 sound/soc/qcom/Kconfig                        |  12 +
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/sc7180.c                       | 266 ++++++++++++++++++
 4 files changed, 410 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
 create mode 100644 sound/soc/qcom/sc7180.c

-- 
2.29.0.rc2.309.g374f81d7ae-goog

