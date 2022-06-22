Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75974555110
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 18:14:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E809B1B24;
	Wed, 22 Jun 2022 18:14:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E809B1B24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655914494;
	bh=z3ZsC4lF8v59iUkBIj8ZCbqJHdvE7u+KpyXvEw3GTLg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n9nZVABbUPcFsApxH8yYZFPF93oJllqrrNmVQH2VwbB1F9vs/x9J7i3ukI1EEo3vz
	 rNvit21iVPbqZBAMXqRjxvIFpCbR9JAVkDIFAL+/quOonuZhUxpkg3haXfYJ4/1Esi
	 rAUdIcBLbeEr6z9lPLPQiojy3nXe20Y4euAZpfeQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44718F800CB;
	Wed, 22 Jun 2022 18:13:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04C62F802D2; Wed, 22 Jun 2022 18:13:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90392F800CB
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 18:13:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90392F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nUQ08BYK"
Received: by mail-ed1-x532.google.com with SMTP id cf14so14841229edb.8
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 09:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cE/2OYYz5mN+xKGqyzZkM7i8jyDkRjpQ6WY0c9nnpkI=;
 b=nUQ08BYK5oFMjhuwIdhfb68k27dg61OmpVwaXYMS2hbVZ9fdyf4oALt66tdaAUL1B3
 rWBbo4MtyGKruasxn6e7dLhgHxT7LvmG0Pv//40q50rgMdT2GxH75jMdCs2hmJWfoBAA
 b0rday1T6F/TkSeyE2Q/HBQBDt5gmvhgDjldLPtLkUD1T2+gjpW9bvme1SJnwqbMN4Pg
 m2ToIWwJfj8bYsPP2DD4hddV+T6+336irst/x0Qkk+OmjsdYvg5Cn72N7wSYlVDKsKAv
 t/xheAfXiJoPoZL/hy7MrwiCT23C/OylmEHjICTSiQq0MSMLxXIvM87lGKoLoy7Ag+0e
 aYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cE/2OYYz5mN+xKGqyzZkM7i8jyDkRjpQ6WY0c9nnpkI=;
 b=5OIs2202NnVpSQ4YsfZVNR+FhfyL6UVHZctVPiy+DPQGfge9cDVXB9Q8+2nNPKDU8w
 guQMWq+qaPEQf28q9Is1QEBRyCyOGlMuCZ4YM1krs8Watlp40CXM9fggp7UA4KNHVZcR
 JTh65vZ4QeLk0MZpYWeh39AE2d1J6svbjJOObUSAT+FL4+JzgaYgq5G+/S3UvJOViODN
 PndxzH5/EYBijSz/fwD4lD3PM3xsvXm4cFJehNE92Se21Yod3oIEZV9y4CsSClZcgmLw
 gO+OO4RMP4AWJRM1C/mPc0PD5s9RBUH//4jLQeVWs/EaHo/j3YO7aSBS//XGYuStFsow
 FLFw==
X-Gm-Message-State: AJIora/VUV5CI60e+ZB8wRLKbUWC9ppagI8EjbyjWU2/mGd7S7VP0PIT
 c6eiPpY1PHs/VMujmITUI68=
X-Google-Smtp-Source: AGRyM1tWD6g6LO0qhLnaY9KN6b/00f7QxioRtjLEKur7v1cPD63I0UcdtnaoF4NQCs9CgxoC6rjd9w==
X-Received: by 2002:a05:6402:348e:b0:435:a912:355f with SMTP id
 v14-20020a056402348e00b00435a912355fmr4947487edc.326.1655914429451; 
 Wed, 22 Jun 2022 09:13:49 -0700 (PDT)
Received: from localhost.localdomain ([185.107.95.225])
 by smtp.gmail.com with ESMTPSA id
 sd14-20020a1709076e0e00b007072dc80e06sm9576036ejc.190.2022.06.22.09.13.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 09:13:48 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 0/3] ASoC: dt-bindings: Add bindings for WCD9335 DAIs
Date: Wed, 22 Jun 2022 20:13:19 +0400
Message-Id: <20220622161322.168017-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Yassine Oudjana <y.oudjana@protonmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <yassine.oudjana@gmail.com>,
 phone-devel@vger.kernel.org
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

Add DT bindings for WCD9335 DAIs and use them in the driver as well
as all device trees currently using WCD9335.

Changes since v1:
 - Make header guard match path
 - Maintain the alphabetical order in msm8996-xiaomi-gemini includes

Yassine Oudjana (3):
  ASoC: dt-bindings: Add bindings for WCD9335 DAIs
  ASoC: wcd9335: Use DT bindings instead of local DAI definitions
  arm64: dts: qcom: Use WCD9335 DT bindings

 MAINTAINERS                                       |  1 +
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts       |  5 +++--
 .../arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |  5 +++--
 .../boot/dts/qcom/msm8996-xiaomi-scorpio.dts      |  5 +++--
 include/dt-bindings/sound/qcom,wcd9335.h          | 15 +++++++++++++++
 sound/soc/codecs/wcd9335.c                        | 13 ++-----------
 6 files changed, 27 insertions(+), 17 deletions(-)
 create mode 100644 include/dt-bindings/sound/qcom,wcd9335.h

-- 
2.36.1

