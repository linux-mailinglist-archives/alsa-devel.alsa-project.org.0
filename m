Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A284092BEC2
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 17:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50E06E68;
	Tue,  9 Jul 2024 17:49:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50E06E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720540209;
	bh=2yfo3OvP/tnsTIp4VFs4rNirB845fNkFXJ45jxb/Y+c=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=TN2tDJ9vQPyFQQC51cYQXc8/SpAOqCP2XYnl+uMkMJccQ6axkMxu3sG4vhhWS86KY
	 5LkFAwXboA7WqYh6+OoBQct9nKYvmI2DwzTfN6eAlRqeAPTAV8nQ0msMAt8E3SrTQR
	 lXjYXvEQqwUA99LVBZRwS8jM7qGtNMeaJZ7uDW4Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33AFEF806BB; Tue,  9 Jul 2024 17:48:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E975F806B8;
	Tue,  9 Jul 2024 17:48:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0041F8025E; Wed,  3 Jul 2024 18:21:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EB041F800FE
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 18:21:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB041F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MyfTlYXF
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-52cdf2c7454so12174946e87.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 09:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720023672; x=1720628472;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jsALFFHLFuxY5RQqYr6ygaK5HtrgJplgfhE1MyVzeTA=;
        b=MyfTlYXFgYGj4E0brwmDDUU3Sex4lsyUryP/GBWh61DHKukUKS4vazR+uT/zLiIord
         TKegKPPHQ8YwcUZNzTIHAhMVYsw3SD7KBO0tZTTOY/RlHNbFzOzpHKWeFzGPgZzw99K4
         myszzS6wbW6xWbE5wqVCTaAvb8Qzzye8BpkkY1SmuM/sMKcSOKJogdhuk9zvteYaJI8X
         kRDgOuZOmUhJnLy7aDSSmXzfQe6E0NzQ/2mEwIGmhuhCgAJPIh6lo1dF1iAGDbq8yVGu
         tvx0d79yx3zQ+KcT5ST7dQBV2qwibhlO/qFr0peTtZtx3qcRu73IQT4O2rq7AqEydQQK
         /PxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720023672; x=1720628472;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jsALFFHLFuxY5RQqYr6ygaK5HtrgJplgfhE1MyVzeTA=;
        b=MSayoS4C9Ld6dFT0+jrzf5I1vmKCwaUi6Kp4l1pvQKPgXiYii6Iql+adOseXoqoy/J
         wfQVvATdspncL7Q2aqv3eS6ol+gMN/pReClIRJ+f76c15h797Xn5yLX2yE3oePHIHSQS
         c9iX9RH36Rmv9qiqdVNgwf+yBARyuCSNHZ4RpkQND63mHbc+O5vdZQUzVPl4obVPRv2O
         ydJhuFDVRqFt2cONtuOxO89H4PtepNZCaYZRJmdCFnIs6eXhLhARjW7lcruT+VGZUsZb
         xWF7wXvLz5Q5XoYgOHz2Z/GP5tv9v7VRX3MuPzss6XJlFHSEINb24BEzXkVxUv7avfQZ
         RFOA==
X-Gm-Message-State: AOJu0Yy0RqxmtZGSFI86DiR4Wva/MveUMvHX9uN2OnxO2jCAIUFhGKsg
	voU/a4HKRfFejUdTNZYjMvzrk+dhdNW+8ZlwMXLcfgFxYXBSNOSL
X-Google-Smtp-Source: 
 AGHT+IEFbJZPNdKnbaS0tCECdKRbpFEUC6/kEynhmQGEQOtH15bPicM3fIy/tKjmK0CSUZrTfa6cCA==
X-Received: by 2002:a05:6512:124a:b0:529:b718:8d00 with SMTP id
 2adb3069b0e04-52e8264b5dfmr11354631e87.8.1720023670436;
        Wed, 03 Jul 2024 09:21:10 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72b5abddaesm473075166b.140.2024.07.03.09.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 09:21:10 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 0/9] ASoC: Constify struct regmap_config
Date: Wed, 03 Jul 2024 18:20:56 +0200
Message-Id: <20240703-sound-const-regmap_config-v1-0-2e379b0446a7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGh6hWYC/x3MSwqEMBBF0a1IjS2Ivxbcikij5hlrYCIpbQRx7
 4YensG9NymiQKnLbor4iUrwCUWe0byO3oHFJlNpytq0pmINp7c8B68HR7ht3L8JizgubG2bz9S
 iASj1e8Qi1//dD8/zAtML9wtrAAAA
To: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720023669; l=1329;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=2yfo3OvP/tnsTIp4VFs4rNirB845fNkFXJ45jxb/Y+c=;
 b=2XXm7af+smGwzm0vmJjdGPs0OO7QoTlsUJ3ujwzB3P8Nu0wlrV/eudsRaas7fpkTWpXW772bV
 IB2/agz33aMBtUVwjbgPWXgOTcE34sW54Hcm2J2XEj5ds6/20gz0XNB
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-MailFrom: javier.carrasco.cruz@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CSUC3WPFD5TAHH7BZQWJWNROENTVKSPY
X-Message-ID-Hash: CSUC3WPFD5TAHH7BZQWJWNROENTVKSPY
X-Mailman-Approved-At: Tue, 09 Jul 2024 15:47:04 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CSUC3WPFD5TAHH7BZQWJWNROENTVKSPY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series adds the const modifier to the remaining regmap_config
structs under sound/soc that are effectively used as const (i.e., only
read after their declaration), but kept as writtable data.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (9):
      ASoC: cs35l34: Constify struct regmap_config
      ASoC: cs35l35: Constify struct regmap_config
      ASoC: cs35l36: Constify struct regmap_config
      ASoC: cs53l30: Constify struct regmap_config
      ASoC: jz4760: Constify struct regmap_config
      ASoC: jz4770: Constify struct regmap_config
      ASoC: wsa881x: Constify struct regmap_config
      ASoC: wsa883x: Constify struct regmap_config
      ASoC: wsa884x: Constify struct regmap_config

 sound/soc/codecs/cs35l34.c | 2 +-
 sound/soc/codecs/cs35l35.c | 2 +-
 sound/soc/codecs/cs35l36.c | 2 +-
 sound/soc/codecs/cs53l30.c | 2 +-
 sound/soc/codecs/jz4760.c  | 2 +-
 sound/soc/codecs/jz4770.c  | 2 +-
 sound/soc/codecs/wsa881x.c | 2 +-
 sound/soc/codecs/wsa883x.c | 2 +-
 sound/soc/codecs/wsa884x.c | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240703-sound-const-regmap_config-1d4d56b7e5ee

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>

