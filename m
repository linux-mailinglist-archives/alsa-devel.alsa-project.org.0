Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A489D740EAF
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 12:28:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0714822;
	Wed, 28 Jun 2023 12:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0714822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687948087;
	bh=TA24QYjHstd/WwrC7y7tZQcLx+bi2yPx/HLj2hZumu0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XGLbbUExgZpHn2X9MuzTGWvc/SKo601dJyU9UdX0OZEaWeJWiabbqgqRaFc/TI/S4
	 buYo9yONEX4eDsQmMs6vbNtYr0bEh8zijH986xPwKr/byS1lRxlcvWiFKx0WqG4E8d
	 zSp86aVbYeuxmgsM4JVwQf5UZhrff0M4SAdxC8KQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E6E6F80212; Wed, 28 Jun 2023 12:26:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68E3AF80212;
	Wed, 28 Jun 2023 12:26:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6D92F80169; Wed, 28 Jun 2023 12:26:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 460BCF80169
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 12:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 460BCF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ewY1PWWZ
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fba66f3b14so18828395e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 03:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687947997; x=1690539997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dKNfjF3wW/Nm/nNPQwIEGWNf3zo0Uzcpr6AjJzCAwQs=;
        b=ewY1PWWZFTqt3d2EoUX7BYeBLURb1ND+wfkfANY8NH8ewiDiDYKhlwdmgQGxnQHkI8
         ujbIh67rsT39B+IL/3a8hsS/BEj2wi3cUm+tFOp4wJS0FnaJkXGH2PifG6QUVyjxANxh
         vIkdZ0LrYWYjLSMtpTnjDRNMO/yuWxKK6T7KEZrYZIxsDgX55CJ+BtTx2tlvUvxd5AJx
         ebygNj3edwU9/m9vW6Aof0Z7kz8PgpIbtNi5dvx0nvfx6BvZ0Tlsf9yTOmmqtUjAR1IT
         uw9np5GnyIYAIKzB8AcSIotnpy4LoKUgR4oER6EgFCgrN9/mxdvL7FAeiJhmWdp9C/aM
         06ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687947997; x=1690539997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dKNfjF3wW/Nm/nNPQwIEGWNf3zo0Uzcpr6AjJzCAwQs=;
        b=dWrhdLh9mQ/meI7ASiUBPr+tZXnPmabExEsHfkz5LCo7AUswpZTtwJnPmi19XusjL6
         czIhSWh1OgeU7gHJ99T+gvXUbdz1bGKA0eKsiEaHh8BmbuIHbP1NWTvqF63fssIBEK/7
         +efWLNwDDQuu1bcm+c3znkmNaCHT3prTD0PL/AiwPm9r/GVaqeMpUklyJy4vfT0rrTiJ
         wV2I66UJ54F3NYIMBsFg1I4Gys4VuTaTkqtPXnc0BR11zxhGATBCgjIaVBFTiLkz14NQ
         QbBW7Ckl+7S5dutMS17vZIccuBxnmTh1HuujNj9rHBZBfkuXJiM0kF4kXK5FHILx0a+a
         gqkQ==
X-Gm-Message-State: AC+VfDx4Fd2Ui2Q7Oq1v8OMEraYg1WKJvopKOI8aOalPBg+rYmbE+wyE
	HQCSKVg1YQLHOK7YN9VTxpJILg==
X-Google-Smtp-Source: 
 ACHHUZ6k6c/Qr75tGaXs6nIJMRkFErVcop4miNK7mJz2p1ioVu4szwQeFKE/lyY1CYAz4y9CySApsA==
X-Received: by 2002:a7b:cd98:0:b0:3f9:b4d8:8e84 with SMTP id
 y24-20020a7bcd98000000b003f9b4d88e84mr22176859wmj.21.1687947997137;
        Wed, 28 Jun 2023 03:26:37 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 a10-20020a5d53ca000000b003140555c0ddsm2467780wrw.56.2023.06.28.03.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 03:26:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: krzysztof.kozlowski+dt@linaro.org,
	andersson@kernel.org,
	broonie@kernel.org
Cc: robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	kuninori.morimoto.gx@renesas.com,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/3] ASoC: qcom: get tplg firmware-name from device tree
Date: Wed, 28 Jun 2023 11:26:18 +0100
Message-Id: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5B6GR3QXGHZ4JXRFJKV47OUCJQZEDZWJ
X-Message-ID-Hash: 5B6GR3QXGHZ4JXRFJKV47OUCJQZEDZWJ
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5B6GR3QXGHZ4JXRFJKV47OUCJQZEDZWJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

With the existing setup the firmware file is looked up in a fixed location
based on soundcard name, however this is not really scalable and not inline
with where linux-firmware stores board specific firmwares.

This patchset adds a new binding to q6apm to allow board specific Device Tree
to pass firmware-name, this also makes it inline with how other firmwares are
specified in qcom boards.


Srinivas Kandagatla (3):
  ASoC: dt-bindings: q6apm: add firmware-name bindings
  ASoC: qcom: q6apm: add support for reading firmware name from DT
  arm64: dts: qcom: sc8280xp-x13s: Add audio topology firmware path

 .../devicetree/bindings/sound/qcom,q6apm.yaml      |  5 +++++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  5 +++++
 sound/soc/qcom/qdsp6/topology.c                    | 14 ++++++--------
 3 files changed, 16 insertions(+), 8 deletions(-)

-- 
2.21.0

