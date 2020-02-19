Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C5E1649D2
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 17:18:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 010E21689;
	Wed, 19 Feb 2020 17:17:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 010E21689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582129100;
	bh=P1XBKVapYsh52T0tQUeAKX7aWHWF5RctDXR1GV+HGz8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HGhdY8oqdoUO4jCv88gcEUrW4tgqMu1YN6v0iIrts4g4tEAR/lWZnaJ5faRBZMtV/
	 fzcW8H79MOzJleFDkj/ll4pjDUUucIiwAAsb0lSKK57PxSMj2OkXYMnX51WG+Uk1Ar
	 nIUYfdKspmk4HxvpczANsUIA35p2QKGF24cDvJo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D077F80114;
	Wed, 19 Feb 2020 17:16:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4922DF80276; Wed, 19 Feb 2020 17:16:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A20AF801F5
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 17:16:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A20AF801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="W6PLPkjf"
Received: by mail-wm1-x342.google.com with SMTP id n3so1288212wmk.4
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 08:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+/8NBRunUt2cYIUgm6UzoQu0mbqXIeIWTzSaZcaWsQ=;
 b=W6PLPkjfa6jJmDWuoYCZsHA88TvgIL51Cbyjc5ca1imFA3/NSj8tkicmlN4w7wPiO9
 0zv/6/MKaQ9+QoEY9FZmtF9bNeSHyHyJL/19gBuZZbzBHUUnl6zi1V+wRxYIS/z5AEkj
 4M6biZ8o7JuQgM8/P1pKVGyHWT+8dEltcO+drS/uprfVbzTFA1oCxj+65xc7fXqZlA5c
 JD6Y3ZI0wFuYF1WKVLMDvt+kNhGmr221aFK8W1sTa9A4TPMg5FIp88sBz7H6zJ7MZajn
 Vd36Ron3bH0Z+7wfRrjFmpfaGBczzKfBtg6x8eHiV14JpjMjrpBBoWpSXRjqrhZ7mHfs
 EDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+/8NBRunUt2cYIUgm6UzoQu0mbqXIeIWTzSaZcaWsQ=;
 b=YvCYOA2+MoxT3LQ2gdGFrp6CHspKwA3SuHAxNAPaMyVfj1WiclH9BEt6EoUdAHqbF6
 NLOh1aTgFbosf87xFFVfNcAPlZ3elUimasFRJhMIdB2CQ8Vt1E0sQGzNaaJ4nMt8J6ow
 j8doq6E/RXxF6/u21cg4UvMz7FFm4R+Fdp4QyZ3FLpY95qd00PmFRWfykZTb6XIBG31R
 CzWbFRP7mXJYeQ5VAuK9HCyCkYVjJBEz0jhgnYkAkqYF1nx1C2/OBlFIGSWsP226pryY
 zilBtvhZEfiJv6LoQHr7dcZoxWIAjKoQFa0J7xCHHOvh8r7bsrgCtz+Qc/VO6AvtUHu2
 Qe7Q==
X-Gm-Message-State: APjAAAXc6D27ZUROLpLhgpwwgcufCvGXvYBt0W6cSpZUr1nN9Kdtv6ah
 jiFkm1tyJ6KAoEu55imvfuXafg==
X-Google-Smtp-Source: APXvYqwsSbAJTu0d+yE+5cwhYVK1iTFlFVggTFQ/jxCdmXpEFk00rIB42Y4vjMiPT7At4RjkPx66Sg==
X-Received: by 2002:a05:600c:228f:: with SMTP id
 15mr11436237wmf.56.1582128992130; 
 Wed, 19 Feb 2020 08:16:32 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id a22sm437140wmd.20.2020.02.19.08.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 08:16:31 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 0/2] ASoC: meson: add internal DAC support
Date: Wed, 19 Feb 2020 17:16:23 +0100
Message-Id: <20200219161625.1078051-1-jbrunet@baylibre.com>
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

Changes since v1 [0]:
* Change some kcontrol names
* Move DAC sources to DAPM

[0]: https://lore.kernel.org/r/20200219133646.1035506-1-jbrunet@baylibre.com/

Jerome Brunet (2):
  ASoC: meson: add t9015 internal codec binding documentation
  ASoC: meson: add t9015 internal DAC driver

 .../bindings/sound/amlogic,t9015.yaml         |  58 +++
 sound/soc/meson/Kconfig                       |   8 +
 sound/soc/meson/Makefile                      |   2 +
 sound/soc/meson/t9015.c                       | 333 ++++++++++++++++++
 4 files changed, 401 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
 create mode 100644 sound/soc/meson/t9015.c

-- 
2.24.1

