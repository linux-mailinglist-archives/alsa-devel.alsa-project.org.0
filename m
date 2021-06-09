Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4768C3A0F62
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jun 2021 11:11:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F48716D3;
	Wed,  9 Jun 2021 11:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F48716D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623229893;
	bh=eHOJz0iVhaTymxz/mP1OlmhHJmihOgXBF3f6deRqO0w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dcnKuAoWCxOW/X8mjGOtEK3OETc9zPxb9TVLwI/2TSjjRnXRU2vDplmOB3xxrVnsu
	 4Hdfw5bj2lxaZTakCCH76q5HgDbTp+J2QPYHSYZs7YeVnA8c9Y7sZxAodiVszjsr4A
	 GnCyZ25JrQaEdcglA3Buff9p/wWnBhPOltE2Vad4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C703F80276;
	Wed,  9 Jun 2021 11:10:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74037F80276; Wed,  9 Jun 2021 11:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 071CBF800F4
 for <alsa-devel@alsa-project.org>; Wed,  9 Jun 2021 11:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 071CBF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RPMbGrQT"
Received: by mail-wm1-x32b.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso2816057wmc.1
 for <alsa-devel@alsa-project.org>; Wed, 09 Jun 2021 02:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0qa4D2spX1g8yj7RaDUoK2ZQ8yrlEpkE/9jNnX7bJv8=;
 b=RPMbGrQTNf9/hpcQ8pAfoLnXzdUeu9Cvzr5SYmrRvOXTMg2nxNR0w9SY0Mtjih1MYR
 521dJKRT3tmj3U4POI1m6TKDX6KxpmwhJ3U0EbQbqNffKriWuuS4BoQUqxp9saLqnifi
 3OhSrkx0bpKB/GG/fylfKzRR//vyZdPHkXBcGMbditW8UYywUdPwgy7Bx95u4dt7Qs58
 ihSpisFvuRQowRNQvDB158Bezlm8C44vqnFsR6IDi/x87+gXTu25bk8Bgr0jfkkeDTvQ
 gpSkY84jsFFooxjs1Bd626gcIDaFLbJXeoaaNTrL8mjcKWP23iAccN1DI/tYGpiuG1D4
 a1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0qa4D2spX1g8yj7RaDUoK2ZQ8yrlEpkE/9jNnX7bJv8=;
 b=HYcYCUVTOEimIrGie+WBGrF61C0gug6SVjoCj+2TCHeSWEzgRi2S4ZrA7OxtdtKinU
 IYM0aad30poP8aNBR5LAMwJn2xurylqm5zV4jNdKkACt/7yEoEw4G5q+qhGvvj4QmDVR
 W/FdLUTXjiweYAW+fE4K/bvC7D4OQISbWz/B+aqDRL1hrn7MK0W07VlYpA2igjLj/a1p
 gEyW5D6FxbQ11HQBKrE1VtcbBIClr4zK1gwCLL+pG3po1wxH+21drj0POHAGT+/pePKh
 UvOM2TnLcZKmPzILdcyz0R3AxK1fhep/7hYO6Xz11wCKvhxUV+3zCgLmVX/omrEVB8za
 2PMw==
X-Gm-Message-State: AOAM530fKK0N6KW5AtQagyYeFnieu1p7j1EiGLVO0VUUDrk97yz3W22V
 j9NpVH5/TtoQnrTPxL1ONSreVQ==
X-Google-Smtp-Source: ABdhPJxnMhTgiSNU0jqqgT3HWW8u0CAb9KIqI1fqxlM27NQcORb/mbfA939gSZqzPyfVeRIcc6L1vg==
X-Received: by 2002:a05:600c:4e89:: with SMTP id
 f9mr6571431wmq.140.1623229799177; 
 Wed, 09 Jun 2021 02:09:59 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id v18sm25165385wrb.10.2021.06.09.02.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 02:09:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v9 0/9] ASoC: codecs: add wcd938x support
Date: Wed,  9 Jun 2021 10:09:34 +0100
Message-Id: <20210609090943.7896-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

This patchset adds support for Qualcomm WCD938X codec.

Qualcomm WCD9380/WCD9385 Codec is a standalone Hi-Fi audio codec IC
connected over SoundWire. This device has two SoundWire devices, RX and
TX respectively supporting 4 x ADCs, ClassH, Ear, Aux PA, 2xHPH,
7 x TX diff inputs, 8 DMICs and MBHC.

Eventhough this device has two SoundWire devices, only tx device has
access to main codec Control/Status Registers!

For codec driver to be functional it would need both tx and rx Soundwire devices
to be up and this is taken care by using device component framework and device-links
are used to ensure proper pm dependencies. Ex tx does not enter suspend
before rx or codec is suspended.

This patchset along with other SoundWire patches on the list
have been tested on SM8250 MTP device.

Thanks,
srini

Changes since v8:
 - moved Kconfig and Makefile changes to last patch as suggested by Mark
 - removed array of enums and used static entries instead. Suggested by Mark
 - return true if put succeeds, Suggested by Mark
 - removed some unneeded semi-colons in switch

Srinivas Kandagatla (9):
  ASoC: dt-bindings: wcd938x: add bindings for wcd938x
  ASoC: codecs: wcd-clsh: add new version support
  ASoC: codecs: wcd938x: add basic driver
  ASoC: dt-bindings: wcd938x-sdw: add bindings for wcd938x-sdw
  ASoC: codecs: wcd938x-sdw: add SoundWire driver
  ASoC: codecs: wcd938x: add basic controls
  ASoC: codecs: wcd938x: add playback dapm widgets
  ASoC: codecs: wcd938x: add capture dapm widgets
  ASoC: codecs: wcd938x: add audio routing and Kconfig

 .../bindings/sound/qcom,wcd938x-sdw.yaml      |   70 +
 .../bindings/sound/qcom,wcd938x.yaml          |  146 +
 sound/soc/codecs/Kconfig                      |   14 +
 sound/soc/codecs/Makefile                     |    4 +
 sound/soc/codecs/wcd-clsh-v2.c                |  348 +-
 sound/soc/codecs/wcd-clsh-v2.h                |   16 +
 sound/soc/codecs/wcd938x-sdw.c                |  315 ++
 sound/soc/codecs/wcd938x.c                    | 3753 +++++++++++++++++
 sound/soc/codecs/wcd938x.h                    |  720 ++++
 9 files changed, 5376 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x-sdw.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd938x.yaml
 create mode 100644 sound/soc/codecs/wcd938x-sdw.c
 create mode 100644 sound/soc/codecs/wcd938x.c
 create mode 100644 sound/soc/codecs/wcd938x.h

-- 
2.21.0

