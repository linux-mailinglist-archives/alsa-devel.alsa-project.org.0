Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 445AC90AEAD
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 15:06:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05CF2B65;
	Mon, 17 Jun 2024 15:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05CF2B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718629570;
	bh=YWvpQ0ab4Dp6gKq8jwDSX4NydsgeD85hsgBWMfw0Wak=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bMM63haau7qwV0vTyV4v/1rirZ/eSRvDsunWK3JdReeubBMg9YVa43TVk867tIY4h
	 9uATIoDCvjO2rFHN6VgMgYIK8kvMwgYmsPyct1mOPRQlaeKnmNdHzuuRLg/bbdmvLy
	 CDfbCFcSKAPl9B+JzrnZIzS8rsNN5QbRBLeyGAR4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FCFFF80691; Mon, 17 Jun 2024 15:04:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37862F80655;
	Mon, 17 Jun 2024 15:04:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E306BF8058C; Mon, 17 Jun 2024 15:04:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 778D6F8023A
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 15:03:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 778D6F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yDUXFLt2
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-57c831b6085so2369620a12.1
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Jun 2024 06:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718629414; x=1719234214;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K0h98bfk6InRRrhm6wwIHnjZdloO4BC8T6hc9Gmbf7c=;
        b=yDUXFLt2FXfNKjbIZeIp1GbQqP4eElHdcqDfE7IVKVP5rd/n0At8awD1vp20CiK+V6
         hVGtgeVUoE1Zpt9D2ZW7E8VdgEc+NxROHYfsv2F+gJIZhQiSib6E8sRw9YqyxrP+whWl
         yebYh9c198ja4tsO4ZThs5f6BCujenI9yNtff4pk5b8rkA2AyUiMkSWxlm1z+JLH2T+t
         uVeZkBrV7NMKKIpPtL2XQYr/TOZdQoVeUyXwZ2k0PResDIz0EUk1zJQwI5GeXapBxgei
         wk1PrK61xCypTV2X+3X5v/u4AgUq4hyerqBozHnM1r59gVfbIQjv1cz/euhZ7+85a2hB
         s2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718629414; x=1719234214;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K0h98bfk6InRRrhm6wwIHnjZdloO4BC8T6hc9Gmbf7c=;
        b=swGI81yONv7hmSlfb1If8a4LhUwEW3kp1NLAmrWzvWpWKY/2O+1hexqa+7I4um+NiM
         MTHSs9pT9q7D2eqzB5+w5sH/1Et7mziyeLxC0PIE2IdQBDZWu/vYAs6VKVA0HU+5BAmi
         bfSVasZKhu8aIRSvB5RrHJE3dpbWpFqmTvzFUuhtZYuAPsmdiHfRbeZqVD2CqQe+S9PW
         pX7Lg+yEKYLvGHEQEmdKvVPYB8rQ0DMcb+SC/JA6AVZTv+M4INaISdni8yCuwhDrTpur
         y5aYD4Zyj2Q90/uJzd3Ktx+JRNKMOMWObxzPfuv2DydCQUbwkDHo2TMYAE1s4caAgGHR
         AOtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWk58ovQcZAMXa6GnqEpFpFS35WgLLXEaZBH+4owcQQnrGfNJcGLtjYJ5F4TlAXkZDlbXvJTpZJLG74Pcl6VCXeL8ttHYOxqZ6mdCw=
X-Gm-Message-State: AOJu0YwnworvMMtCf3wmZYY9Vk4PniFOq1a3uV7JRWHIKNS+aTsiLpta
	MG12Pd3xub8fg/NIXY5Jom+qHHFWwueVXHq8iVGTFyn6tcbSk5pFx/3xWpbuEtg=
X-Google-Smtp-Source: 
 AGHT+IExtTHGNouiNFqgjEiT+LPP433XAeDYx1y6ZS3ofgzCUaUo3A3zQURDTqIS8cL0nLldaqPNSQ==
X-Received: by 2002:a50:c056:0:b0:57c:6338:328a with SMTP id
 4fb4d7f45d1cf-57cbd6c7589mr9110762a12.30.1718629413597;
        Mon, 17 Jun 2024 06:03:33 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72daa67sm6404349a12.38.2024.06.17.06.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:03:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] ASoC: Few constifications (mostly arguments)
Date: Mon, 17 Jun 2024 15:03:18 +0200
Message-Id: 
 <20240617-n-asoc-const-auto-selectable-formats-v1-0-8004f346ee38@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABc0cGYC/x2N0QrCMAwAf2Xk2UA7q4K/Ij7EmGpgNtJ0Qxj7d
 8vu7V7uVnCpKg7XYYUqi7pa6RIPA/CbyktQn91hDGMK53jBguTGyFa8Ic3N0GUSbvSYBLPVDzX
 HeMzMp9BJCXrqWyXrb9/c7tv2BxQCUup2AAAA
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2065;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YWvpQ0ab4Dp6gKq8jwDSX4NydsgeD85hsgBWMfw0Wak=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmcDQZw8CQ6TtEuwrDOfeyUso35j7jNCqTLG3G5
 N7+xDUTMyiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnA0GQAKCRDBN2bmhouD
 1zYrD/wM2IO5gZH/cQKpnk2qBqusJLmMij0sMKKL+5bcwpi23FojEa+GuWh2EMwPnjTj4utyPdh
 7JyboAxvTe3MZGlgXPUZr//nic+0BYW3WSW2dSWyS3VNGxTMjA8C3VMl7miscFV5+tjWrIKG/a+
 NDQzoAU9ilfXFt3ZWvOxUetiq5VTtYUFRMhLtYdOUzI2HyVSTAMvOAOzplMXLw0Kn1NM4zjOyY8
 33Tr3e8c11tHUS8Awv97pIb8lfTuQTgT8C9oR4zvRRQUXvP34ADYrAbV7Ydf8+J5nebLRFoJD43
 SNXtRXhICMRfQTXFZPoKoVE0tGA+8uNNhGVmwL9cfpMI4MIo6lE1MS5Q7v+33zdAdEo8jzCfRD9
 mpcj8evTj7sZkVbmZ6HMHj7wZgwAdto+7I9K4W5Be0yisk2WSDiUrpo88c/gEEqNr+zJ7WgRakk
 zfD7QmCqNEGROVVso0LlINeb+qEiIWUAKol8e0JDrt75EycYs59LTFfFmdI4Ax2s1zl4m1yx/8m
 Cfk2cLZ+24AvyedFrIbf6y+NFPbCXrV14Pjc044trBQlKBO64vdetO0eFcHTD7sTiDFgjHlRqvv
 9XzFHZRmmhR/46sCgsTx9t0k7DsM7QpepXg1Y/w/+eQELXsW6XWyG3D386IXRB5d5ber3QVrd9C
 NNtbwNuw38cNWKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: M6ABSGTDFZENITJTUHOURW76Y5UFUOHE
X-Message-ID-Hash: M6ABSGTDFZENITJTUHOURW76Y5UFUOHE
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M6ABSGTDFZENITJTUHOURW76Y5UFUOHE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Make few pointers in ASoC functions as pointers to const, so the code is
clearer to read, a bit safer and allows further constifications (e.g.
placing some data as rodata).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      ASoC: Constify of_phandle_args in snd_soc_dai_driver
      ASoC: Constify of_phandle_args in snd_soc_dai_link_component
      ASoC: Constify passed data to core function
      ASoC: Constify DAI passed to get_channel_map
      ASoC: Constify return of snd_soc_dai_get_pcm_stream()
      ALSA: Cleanup trailing white-spaces

 include/sound/soc-dai.h            | 26 +++++++------
 include/sound/soc.h                | 19 +++++-----
 sound/core/control_compat.c        |  2 +-
 sound/core/device.c                |  4 +-
 sound/core/hwdep.c                 | 10 ++---
 sound/core/init.c                  |  3 +-
 sound/core/memalloc.c              |  2 +-
 sound/core/memory.c                |  2 +-
 sound/core/pcm.c                   | 22 +++++------
 sound/core/pcm_compat.c            |  2 +-
 sound/core/pcm_lib.c               | 41 ++++++++++----------
 sound/core/pcm_misc.c              |  2 +-
 sound/core/pcm_native.c            | 76 +++++++++++++++++++-------------------
 sound/core/seq_device.c            |  2 +-
 sound/soc/codecs/lpass-rx-macro.c  |  2 +-
 sound/soc/codecs/lpass-tx-macro.c  |  2 +-
 sound/soc/codecs/lpass-va-macro.c  |  2 +-
 sound/soc/codecs/lpass-wsa-macro.c |  2 +-
 sound/soc/codecs/wcd9335.c         |  2 +-
 sound/soc/codecs/wcd934x.c         |  2 +-
 sound/soc/intel/avs/pcm.c          |  4 +-
 sound/soc/soc-core.c               |  4 +-
 sound/soc/soc-dai.c                | 14 +++----
 sound/soc/soc-pcm.c                | 26 ++++++-------
 sound/soc/soc-utils.c              |  8 ++--
 25 files changed, 141 insertions(+), 140 deletions(-)
---
base-commit: cf32e2eb8404572eaacd219dde4e703fad349299
change-id: 20240617-n-asoc-const-auto-selectable-formats-13fcc5000044

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

