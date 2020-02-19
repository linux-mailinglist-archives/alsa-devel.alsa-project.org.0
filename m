Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B9A1645CC
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 14:38:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32E971696;
	Wed, 19 Feb 2020 14:37:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32E971696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582119523;
	bh=ENCBRczBmqh0VKd9yn7J8fn5n7P/8HT6qPlxyXfp2PA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BH3o66c3lLA5enahn53j79+lwMfcS9iFJjGQ8m85GOtKY47nnNLNoE1yJbf4Us4X3
	 P4TZE1kv1aF3BHXgAseoh+PaKC2xst7+XoKG6qGTcPWbUmGE/84m/i+L2Z2+0IKrQS
	 iPdKF/TS4qOnOBl5CgSAcvO+kUglygvDDL1DB3Hg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 459D1F80114;
	Wed, 19 Feb 2020 14:37:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5ACAF80276; Wed, 19 Feb 2020 14:36:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B510EF801F5
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 14:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B510EF801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="Irva5dhD"
Received: by mail-wr1-x443.google.com with SMTP id r11so536203wrq.10
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 05:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HwepP4vylkvrAMsKrJGWiwfWFEMFo390d/0hPnMfDnQ=;
 b=Irva5dhDO7EeC/Gq61LwcdDA8SlWmI5WtROw0M6kcYEwuY1jDLSJ+y73xIUtZPyrj+
 p3mFAKgb/uvVhkn9uCHbuA0guPmbGlioDgYymJFVf3MHc/q3A/0vEC/t9140r7ZLnUQl
 Fr0fN2VVS2grIBPMAMi0teBetl/uTUELthI98JilwqkP4Iwma6YTDSNBhDkz9hyRaPGI
 gtXMisst6zIZbntFjDhIUmkOLCM9D1xAw4ggRKOxh/IaYhkSci+8xVY+aklr6GNXDCDL
 fwNgiBHAgXgzy6SIWPRyayR9I5fmAt11PAbnTcvhohV5oGjumm6ZQN+kkM/Uas3sNgHx
 wxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HwepP4vylkvrAMsKrJGWiwfWFEMFo390d/0hPnMfDnQ=;
 b=gK1FaoKGUwlUgv6ffTO3lWmP8HieUil9c1q88+bMYp2jeT2o0BIllq3PoWHlJUdYkW
 j6zXESGaS8EReacmBU1Yp9CYKWNZAuNILoxrcGLESNPGlG+kF6l4TSfCMQDxOp4oTRsQ
 nRu8XqqQFnbF2T0jiKLFqlyY8IEmbqvyCsXPiYBhV3DTj0WjvnhOSV+mqTKQn9CaEwmq
 Zc0kjw0/vi+iXdnzOlGYKu530uGHdm+SlHxtbH8RAjbUVhVwaUzhMxH1xP7F5k0mb7Kh
 rvLIawnNr7Pmf6okogcy56LZffzco5ahN1mq+gmM0vBv1hOJr4DG9q5Tw6UWHUHzVIAc
 eIdQ==
X-Gm-Message-State: APjAAAXPpG/TubTSIHWxxJHDl0bbaGK2X1QssqtUtESrUt16K/FyP9Hr
 7CAO43i/1NUnXxw/8P8Dfewhrw==
X-Google-Smtp-Source: APXvYqzFBdf+KvQ/AaFbssZg7VHUlYCElqE3Jj98G953ZIChVvbutlzYOglzkBF0ek20O6lSxHLvQA==
X-Received: by 2002:a5d:4f0f:: with SMTP id c15mr37854818wru.251.1582119415457; 
 Wed, 19 Feb 2020 05:36:55 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id q124sm8856480wme.2.2020.02.19.05.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 05:36:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/2] ASoC: meson: add internal DAC support
Date: Wed, 19 Feb 2020 14:36:44 +0100
Message-Id: <20200219133646.1035506-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
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

This patchset adds support for the internal audio DAC provided on the
Amlogic gxl, g12a and sm1 SoC families. On each of these SoC families,
there is glue between this codec on the audio provider. The architecture
is similar to the one used for the synopsys hdmi codec on these SoCs

Jerome Brunet (2):
  ASoC: meson: add t9015 internal codec binding documentation
  ASoC: meson: add t9015 internal DAC driver

 .../bindings/sound/amlogic,t9015.yaml         |  58 ++++
 sound/soc/meson/Kconfig                       |   8 +
 sound/soc/meson/Makefile                      |   2 +
 sound/soc/meson/t9015.c                       | 320 ++++++++++++++++++
 4 files changed, 388 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
 create mode 100644 sound/soc/meson/t9015.c

-- 
2.24.1

