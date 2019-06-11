Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D133C92D
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jun 2019 12:42:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FCE316F7;
	Tue, 11 Jun 2019 12:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FCE316F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560249770;
	bh=xsaE6JruiT3WCwpJUcQm4zImmdcNDFV2zQAvSH5+A+Y=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tUMPTUmwTmn0qM8lCL4ElvH3gteaPLH+O5AKnPfPmXoo9t0VFeJ37RG4CwyupbJTO
	 g/UAaCxBrfxbaiSpd8Y6YYG3c+4IEGPtBQUJDtZQOmEq+0zoK5EOBdnqwPgwRCfVxx
	 jkIukP8aOByadN1FcB9BXLNYtpgLOmnCQy2jb0B4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9BF8F89714;
	Tue, 11 Jun 2019 12:41:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 883F8F89711; Tue, 11 Jun 2019 12:41:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4F94F80791
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 12:40:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4F94F80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="O6TxbJgN"
Received: by mail-wr1-x443.google.com with SMTP id p11so12436028wre.7
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 03:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Us0ePqajLzv9F8VyyEgnx7luzsoyG4vzsDlEA+qZoA=;
 b=O6TxbJgNNzTRHvhsHcPcpFSEUN11tv3n1CNF50tCukacGTLqdUAK+DDEWaCElbVabt
 QU5pBOco5tJX+h0zDpfzd3H/8MttD0lp+YNl+n1tW3scb6cYp1Y52CS4GL173QcZvDe9
 vlXriA5EQNVgXnNONNVP5E/xr35kQmk9KzJU6KRcU8DfJcYIgitGm3jQI9fH0t2iMJSh
 oIYQAJzZJyH8UnnP/kwMuy97Jdv5Qjy94LWHpg/5MzSLC1Dsy3NpfFGuLIddsyGNONrx
 RhYU2n+dd0ezUTpaYFnf8DqqZxYnSlvR8apoS0Kj35ayKcKtbbFM6uXVsee9Yeu95JUc
 kOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7Us0ePqajLzv9F8VyyEgnx7luzsoyG4vzsDlEA+qZoA=;
 b=UzyhZT67ae0kK5PXdc90Sf0fgj2KHsFaNwtD13dBi7kzostZADRlv+QcqQEunGocvm
 KPVJ0OZijpFM6mxm4BJgIp8Rbzpw40YkUCRYclsiCsj7YIXrdOxkrxECbrmVsI5wHZ2X
 LiP6mStn+6CNxfiidy/z+blGSZVn10tnrmswqQ5RUPX6i3oPufij5u1wd0RwHdeowCZt
 KOgzahWyFPy40R0IGhkx4KdigWcdogJP2L9qPo3J8nIavqKoSQ2ASVhBVOnvbdatbrAI
 GFmFMmZFm1BMHMQXKdgFoWBylxmRrlDsUbKP1IQzS0oU+J0+uuG1uCk1LNYgo/17BrZN
 9DMw==
X-Gm-Message-State: APjAAAUOiIn3kdH71bW7hzoyuvLX95iAX/oWD6sXrcr0vmXqNVsYvo4B
 ei9cMRz43J0JA8Y8IupaKePO1A==
X-Google-Smtp-Source: APXvYqwKnDzyF9xodu2F8D8uakDUS7/kq2b5T0SBVt6AAGazCrBBaf6zY+sVXP/lUzeZyCqpx23H9A==
X-Received: by 2002:a5d:6207:: with SMTP id y7mr29651668wru.265.1560249658630; 
 Tue, 11 Jun 2019 03:40:58 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id c65sm2359614wma.44.2019.06.11.03.40.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 03:40:58 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Date: Tue, 11 Jun 2019 11:40:38 +0100
Message-Id: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com
Subject: [alsa-devel] [RFC PATCH 0/5] ASoC: codecs: Add WSA881x Smart
	Speaker amplifier support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patchset adds support to WSA8810/WSA8815 Class-D Smart Speaker
Amplifier which is SoundWire interfaced.
This also adds support to some missing bits in SoundWire bus layer like
Device Tree support and module_sdw_driver macro.

This patchset along with DB845c machine driver and WCD934x codec driver
has been tested on SDM845 SoC based DragonBoard DB845c with two
WSA8810 speakers.

Most of the code in this driver is rework of Qualcomm downstream drivers
used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

TODO:
	Add thermal sensor support in WSA881x.

Thanks,
srini

Srinivas Kandagatla (5):
  dt-bindings: soundwire: add slave bindings
  soundwire: core: add device tree support for slave devices
  soundwire: add module_sdw_driver helper macro
  dt-bindings: ASoC: Add WSA881x bindings
  ASoC: codecs: add wsa881x amplifier support

 .../bindings/sound/qcom,wsa881x.txt           |   27 +
 .../devicetree/bindings/soundwire/bus.txt     |   48 +
 drivers/soundwire/bus.c                       |    2 +-
 drivers/soundwire/bus.h                       |    1 +
 drivers/soundwire/slave.c                     |   54 +-
 include/linux/soundwire/sdw_type.h            |   11 +
 sound/soc/codecs/Kconfig                      |    9 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa881x.c                    | 1160 +++++++++++++++++
 9 files changed, 1312 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.txt
 create mode 100644 Documentation/devicetree/bindings/soundwire/bus.txt
 create mode 100644 sound/soc/codecs/wsa881x.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
