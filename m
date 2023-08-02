Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC4876D644
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 19:59:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F41E41DD;
	Wed,  2 Aug 2023 19:58:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F41E41DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690999165;
	bh=kFY4y+cQHckRTFfskzAWH47WpdI1Y3T5jfqyu2lOqXA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JjFx8Ca6jCN2ckQ3khQtb7Cytu8TrWmdtl+55jGtsTcV+mYNESbTzbZUMYMUReUkR
	 vszA0E1ER536zNhN9qLlU89i7Ss38Ia/B59FXi/7mdvWkIYlF8bmlOx+O4CixVX7aJ
	 GT520qeGO5S3p4GqJXnLpPlfnh2XzGQRJYm9k1nY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FFDAF80425; Wed,  2 Aug 2023 19:58:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D68EF80425;
	Wed,  2 Aug 2023 19:58:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15191F80535; Wed,  2 Aug 2023 19:58:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 245FEF80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 19:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 245FEF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=hcxYEVw+
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fb4146e8deso1545675e9.0
        for <alsa-devel@alsa-project.org>;
 Wed, 02 Aug 2023 10:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999075; x=1691603875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lrenO/Rv8N0/Q0nllUzfhdXGxBe65eDs4o1FGRPAnIU=;
        b=hcxYEVw+yLcYl10QCJcLAisMACPmdChl4jRWpg9LQjKAU625nANZIbu4kSOfXbsP+d
         bE1+3aEi1AogizMldPo6deh+hVaPKsKBLfMcZF8lCF/F4TPZhvwF58mpYBLr5SD9v3tG
         D2y22KVOG2U7q5cqlhscZ0IQWWXCl8an+PhpJLJScI/h4wrbyjgywzD2y2CfxV8dw93l
         VvsNaiwxKQM1MAmc0J0Cxl5nqJfFfLQplDmE6PNadMH3YMZduT1txhXBZx0a4Tcsi8wP
         u0/aZhaNILCJw/MlkEjTdZ50sWrhc+NEBulGsRXmsSHZZzDa2p1ORSk9QOxiyy6Reoyp
         x12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999075; x=1691603875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrenO/Rv8N0/Q0nllUzfhdXGxBe65eDs4o1FGRPAnIU=;
        b=F6Q33dX+yeNRuH+x0D99aLmBXK5N4MKkfLTFgbnHmCL4lLAneP8FrnmSJlmKnB10gV
         ellCiiQC+EeBm/Uyli4TutfRvymn7C9PHYlmIHpvR1mabB6e44z09/j8cSemTNz57O8t
         JVSH9ooKcPrPGJK+EJjwpH7DsUVqk9u55W/bwCk60zqMUhgr+Nwe9DmTpMw0lLQKmLKd
         w7O3wfWUgUjyKMP7j/Xa9XRKPtYvCmTjHiCk/5aRdL8DbLuhSK+NPph/U5XUmxle7OBA
         7VaCQtQ4LxKxxgcJ7IC2aUYcHU9OSfg5J3WtflD5tsGo7ntmrbfjrkm/I/rCWIwoZTo2
         JxyQ==
X-Gm-Message-State: ABy/qLYVUYQtgJVCeD4QqRN8MG0dzln+Spn//EqB1vr1GqmySX7RaBd9
	A+Whww0Gklf44lzCTTTXwO/aMVHbx+Q=
X-Google-Smtp-Source: 
 APBJJlFc5EUN1pL9Mjg+Lf4j7h/CfYQwstL0G5pWbeDNJ/x8Hi0RiEfav5Agjp7turRzJdzBGraR5g==
X-Received: by 2002:a05:600c:3644:b0:3f9:b244:c294 with SMTP id
 y4-20020a05600c364400b003f9b244c294mr5851182wmq.35.1690999074478;
        Wed, 02 Aug 2023 10:57:54 -0700 (PDT)
Received: from ALPER-PC.. ([178.233.24.1])
        by smtp.gmail.com with ESMTPSA id
 l23-20020a7bc457000000b003fe20db88ebsm2192439wmi.31.2023.08.02.10.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 10:57:53 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: alsa-devel@alsa-project.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	Akihiko Odaki <akihiko.odaki@gmail.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>
Subject: [PATCH 00/27] ASoC: Map missing jack kcontrols
Date: Wed,  2 Aug 2023 20:57:10 +0300
Message-Id: <20230802175737.263412-1-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LU3XJYCE44OCGLPLPD26BVEZXNJL4RZU
X-Message-ID-Hash: LU3XJYCE44OCGLPLPD26BVEZXNJL4RZU
X-MailFrom: alpernebiyasak@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LU3XJYCE44OCGLPLPD26BVEZXNJL4RZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patchset adds missing jack kcontrols for each independently
detectable audio peripheral and maps jack pins to those kcontrols
accordingly, with the primary intent to enable/improve jack detection
handling in PulseAudio and PipeWire through JackControl UCM values.

Usually it's just splitting a joint anything-is-connected "Headset Jack"
kcontrol (from [1]) into those like "Headphone Jack" and "Headset Mic"
(similar to a previous series for Intel Chromebooks [2]). This split is
important to avoid automatically switching to a nonexistent external
microphone when a headphone-only device is connected.

When the underlying hardware seems to support it, this also adds a "Line
Out" kcontrol. This is important in case the hardware can actually
support a line-level connection via a different configuration (bypassing
output amplifiers?), or simply for userspace to display "Line Out"
instead of "Headphones" to the user for connected line-out devices.

Beyond the mappings, I had to add PIN_SWITCH card kcontrols and DAPM
widgets to avoid "unknown pin" errors on my devices, so tried to do them
for all. For Intel devices I saw a pattern of routing things to
"Platform Clock" and added to that as well. Looking at patch 5/7 of a
Mediatek-related series [3], I can only guess that routes could be
further improved, but don't know exactly how for each device. And one
more concern is I don't know if the names conflict with any controls
from codecs, although I tried to keep to names of existing widgets.

As far as I can tell, the root cause for most of why these are missing
originates to things being developed for ChromeOS, whose userspace reads
the jack input device and doesn't care for these kcontrols. There's
non-ChromeOS cases as well, maybe things got copy-pasted around and
people didn't need or couldn't figure out how to get more specific than
a single jack kcontrol. The secondary intent in this patchset is to fix
this *everywhere*, so future copy-pastes result in the right behaviour.

For more context also see:

[1] ASoC: soc-card: Create jack kcontrol without pins
https://lore.kernel.org/alsa-devel/20220408041114.6024-1-akihiko.odaki@gmail.com/

[2] ASoC: Intel: Chromebooks: remap jack pins
https://lore.kernel.org/alsa-devel/20220616214055.134943-1-pierre-louis.bossart@linux.intel.com/

[3] ASoC: mediatek: Allow separate handling of headphone and headset mic jack
https://lore.kernel.org/alsa-devel/20220922235951.252532-1-nfraprado@collabora.com/

[4] ASoC: rk3399_gru_sound: Add DAPM pins, kcontrols for jack detection
https://lore.kernel.org/alsa-devel/20200721182709.6895-1-alpernebiyasak@gmail.com/

This applies onto next-20230802. Unfortunately most of it is untested
except for a few Chromebooks I have (Kevin, Lick, Hana, Cozmo), because
I'm intentionally generalizing to everything.


Alper Nebi Yasak (27):
  ASoC: amd: acp-da7219-max98357a: Map missing jack kcontrols
  ASoC: amd: acp-rt5645: Map missing jack kcontrols
  ASoC: amd: acp: Map missing jack kcontrols
  ASoC: amd: acp3x-rt5682-max9836: Map missing jack kcontrols
  ASoC: Intel: avs: da7219: Map missing jack kcontrols
  ASoC: Intel: bxt_da7219_max98357a: Map missing Line Out jack kcontrol
  ASoC: Intel: bytcr_wm5102: Map missing Line Out jack kcontrol
  ASoC: Intel: kbl_da7219_max98357a: Map missing Line Out jack kcontrol
  ASoC: Intel: kbl_da7219_max98927: Map missing Line Out jack kcontrol
  ASoC: Intel: sof_da7219_max98373: Map missing Line Out jack kcontrol
  ASoC: imx-es8328: Map missing jack kcontrols
  ASoC: mediatek: mt8173-max98090: Configure jack as a Headset jack
  ASoC: mediatek: mt8173-rt5650-rt5514: Map missing jack kcontrols
  ASoC: mediatek: mt8173-rt5650-rt5676: Map missing jack kcontrols
  ASoC: mediatek: mt8173-rt5650: Map missing jack kcontrols
  ASoC: mediatek: mt8183-da7219-max98357: Map missing jack kcontrols
  ASoC: mediatek: mt8183-mt6358-ts3a227-max98357: Map missing jack
    kcontrols
  ASoC: mediatek: mt8186-mt6366-da7219-max98357: Map missing jack
    kcontrols
  ASoC: qcom: apq8016_sbc: Map missing jack kcontrols
  ASoC: qcom: sc7180: Map missing jack kcontrols
  ASoC: qcom: sc7280: Map missing jack kcontrols
  ASoC: qcom: sdm845: Map missing jack kcontrols
  ASoC: rk3399-gru-sound: Map missing Line Out jack kcontrol
  ASoC: rockchip: rockchip_rt5645: Map missing jack kcontrols
  ASoC: samsung: littlemill: Map missing jack kcontrols
  ASoC: samsung: lowland: Split Line Out jack kcontrol from Headphone
  ASoC: samsung: midas_wm1811: Map missing jack kcontrols

 sound/soc/amd/acp-da7219-max98357a.c          |  41 +++-
 sound/soc/amd/acp-rt5645.c                    |  22 +-
 sound/soc/amd/acp/acp-mach-common.c           | 226 ++++++++++++++----
 sound/soc/amd/acp3x-rt5682-max9836.c          |  23 +-
 sound/soc/fsl/imx-es8328.c                    |  25 +-
 sound/soc/intel/avs/boards/da7219.c           |  34 ++-
 sound/soc/intel/boards/bxt_da7219_max98357a.c |   7 +
 sound/soc/intel/boards/bytcr_wm5102.c         |   7 +
 sound/soc/intel/boards/kbl_da7219_max98357a.c |   7 +
 sound/soc/intel/boards/kbl_da7219_max98927.c  |   7 +
 sound/soc/intel/boards/sof_da7219_max98373.c  |  10 +
 sound/soc/mediatek/mt8173/mt8173-max98090.c   |   2 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5514.c    |  23 +-
 .../mediatek/mt8173/mt8173-rt5650-rt5676.c    |  23 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c     |  23 +-
 .../mediatek/mt8183/mt8183-da7219-max98357.c  |  43 +++-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c   |  53 +++-
 .../mt8186/mt8186-mt6366-da7219-max98357.c    |   6 +
 sound/soc/qcom/apq8016_sbc.c                  |  37 ++-
 sound/soc/qcom/sc7180.c                       |  40 +++-
 sound/soc/qcom/sc7280.c                       |  34 ++-
 sound/soc/qcom/sdm845.c                       |  32 ++-
 sound/soc/rockchip/rk3399_gru_sound.c         |   7 +-
 sound/soc/rockchip/rockchip_rt5645.c          |  22 +-
 sound/soc/samsung/littlemill.c                |  27 ++-
 sound/soc/samsung/lowland.c                   |   8 +-
 sound/soc/samsung/midas_wm1811.c              |  25 +-
 27 files changed, 668 insertions(+), 146 deletions(-)


base-commit: 626c67169f9972fffcdf3bc3864de421f162ebf5
-- 
2.40.1

