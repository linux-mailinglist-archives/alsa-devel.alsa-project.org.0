Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D9E864B0
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 16:47:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 343C6166F;
	Thu,  8 Aug 2019 16:46:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 343C6166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565275668;
	bh=+2uWyaSbLfVn8NPaq0DykGDYRJ6/2J9QoAdHQiv6lXY=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FyBx9U/+DHvXIvPAJ3zD4l7MkKzTL/wR1K7wYo8ivGIv4spBIwMci9V97viiqQAfz
	 Nyt16AC4FLNXtLYnJGQyKd3hXCNgCZVPaUhXZ+8uUXZWHnRT0dncL1QDzfQ5dbz7cn
	 c6b5foDiHp3cC3EepPMrY8YDQPHeCH5Td190m/Tk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88105F805A8;
	Thu,  8 Aug 2019 16:45:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D1CBF8053A; Thu,  8 Aug 2019 16:45:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05224F8053A
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 16:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05224F8053A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xS/2nlZp"
Received: by mail-wr1-x444.google.com with SMTP id p13so20623055wru.10
 for <alsa-devel@alsa-project.org>; Thu, 08 Aug 2019 07:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nLpi2SDrc2znQNHPwAZliuGZd7W6XSprQ25LlaiC9Uk=;
 b=xS/2nlZprXdtEBLiGBUpjV5rlh11ZEu2Nuwixb9ksnlj+Rw441FmPXat9qBfqLoE/h
 3jdXGYqvLxETaqpHmQnFFGWwdC5q4a8vnu4SYuswuGPfqQL/cftMQPO5VzF4+xS0Er45
 aAeKkZvLT+LCd4L6N2MjfnRQdr0Axt/YapOfLE5vmgKeTtDGKIy/kxeIFXR/wnU5bK+P
 I2h7bQnYRnLbBVVpseEBf4//8cwaTrPnaa23hYNYNZeU3RmhO6KPp9jOGCDBcF9T6OAr
 +QBUn6g5Q3x/gmSVbtJ0OmOpD6NDd55MDcUd8c9V9cDEomKCXAWG3T30jwKKdheI7o9u
 l3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nLpi2SDrc2znQNHPwAZliuGZd7W6XSprQ25LlaiC9Uk=;
 b=ENOdPxszuuWZmx/Iyuo0JBF0YWeJzsAfWHJ9IzxmycxiMa8J/gR+zE04VFcGn5kxGh
 CRecy72sh6PHiNT7Nvkg4Nxf9TiFayqtM95EHfakuNhJoWc6D8wOsuuMLbMVtPGbhaui
 KZYsXeEdBAoZWMirV9SCRDo00AtF2Fwmixlu7jl8zT9upq7jILsRv+UQf5rEeP6zzXUF
 ge0vVWcRNxUTmUj4ykZAjBEBhXwVWge/at+sw97LANbGuiQHWLOPh2H+FDpOBLT9ETnu
 iYQVOJ7ErASIKecsAiFOtj5pJF+lj1EF5k4rBw1h6WuvycDsfnrFsv5/JeRiqN0kB5Tn
 kxQw==
X-Gm-Message-State: APjAAAVOiRPI3lAAVjPAWofBp5XNU/zaFqdrzk5KYBonQ4iHCOwhXGvy
 xZqnKAkooOwSG0mDGXegn9fkTA==
X-Google-Smtp-Source: APXvYqxGi/2lzaPlzG3WSRB3FQSrUSGckOdWNhEK1yAlz6qCO91d2lpbJo0TQvJ26p/tCNbAwWf2sw==
X-Received: by 2002:adf:de8e:: with SMTP id w14mr17439418wrl.79.1565275524077; 
 Thu, 08 Aug 2019 07:45:24 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id g15sm2009060wrp.29.2019.08.08.07.45.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 07:45:23 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	broonie@kernel.org
Date: Thu,  8 Aug 2019 15:45:00 +0100
Message-Id: <20190808144504.24823-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v2 0/4] ASoC: codecs: Add WSA881x Smart Speaker
	amplifier support
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

This patchset also depends on the soundwire Kconfig patch
https://lkml.org/lkml/2019/7/18/834 from Pierre

Thanks,
srini

Changes since v1 RFC:
- bindings document renamed to slave.txt
- fix error code from dt slave parsing

Srinivas Kandagatla (4):
  dt-bindings: soundwire: add slave bindings
  soundwire: core: add device tree support for slave devices
  dt-bindings: ASoC: Add WSA881x bindings
  ASoC: codecs: add wsa881x amplifier support

 .../bindings/sound/qcom,wsa881x.txt           |   27 +
 .../devicetree/bindings/soundwire/slave.txt   |   46 +
 drivers/soundwire/bus.c                       |    2 +
 drivers/soundwire/bus.h                       |    1 +
 drivers/soundwire/slave.c                     |   47 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa881x.c                    | 1160 +++++++++++++++++
 8 files changed, 1295 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.txt
 create mode 100644 Documentation/devicetree/bindings/soundwire/slave.txt
 create mode 100644 sound/soc/codecs/wsa881x.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
