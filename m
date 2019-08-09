Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B4E87B4C
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 15:36:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42BBF1616;
	Fri,  9 Aug 2019 15:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42BBF1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565357771;
	bh=LP86u0pO7bYqY3FauIzl8tUnJoGDhC/V3tuUApMmtso=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ttJCZHs16gFUSLzGC/n0idqE57xZVekkpScPYUMFzwtW6rExCDwi+isogZq8KvxBM
	 Ndkw/eqf7ZVcNY1QCIcBe1yUAutWEgFclQ42xaCqQwtiXtZrfRZUqxr6J0/h66xxPE
	 FhxcGhMPFmfi5kBqpFpwofGXIERba+2qJxM4dD+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75F52F80391;
	Fri,  9 Aug 2019 15:34:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF47AF803F3; Fri,  9 Aug 2019 15:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2C80F800E4
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 15:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2C80F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Yu0o583l"
Received: by mail-wr1-x443.google.com with SMTP id g17so98266273wrr.5
 for <alsa-devel@alsa-project.org>; Fri, 09 Aug 2019 06:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qSHE3Aj4iM6gYhcmQoszjlvxEipz13Xj0eMmdWnUjX4=;
 b=Yu0o583lxOO+XUf2AITZ1N5l0tYfk1WvYSXvAR3SFKvigp3L3PzzRmfYRfdQZqsQ9O
 E5CvPLOQGwPhPHlGVGzSVJI15zrAVCAwNG/a7tQWfE0fAGNI02zATJQcNs3mOL1b5Cmt
 E98z36FIDVVoKrvjZhf9t1RdI52O8xp5Peapj6eKbtkSHjHJrldSLtp6P3SsPrA7JiPo
 YQQO9HnnzIx3S8E4AGcLFLCh/MYqAPXNPI6oIY/4ksmEjR+Tlun7oLoQMu8yFyISoqWp
 GI1IVYQuLfTM6ivInkNP8FJFhXQnD7I/ddTsPCXvTdAL1tLjzebQ5YMMhHqR1mNGAqRB
 02wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qSHE3Aj4iM6gYhcmQoszjlvxEipz13Xj0eMmdWnUjX4=;
 b=RToVvlz+MulyfF+EAAHWuSKFEoZh0N1GIteBEAhMbYrOx7BWe9ef8T678UUyNm9LH9
 pfAJQZ+nbott6vMJHPH2hzpHeS7p0iy908dyvb4NZMovy5dUXDdLGUw0nW2COaa4bxrp
 t10EqMEjT8qO0/8r0B/ohOc8r2zLKHOynYuYXRF+oUodz1vQRMhCCRkMaPiv16vcx6pW
 5Sc1XWkYWNHPj+vM3GNPOjPD6HVicg5K7wxv4O7uHO5HpGR0jLMgRB/vwHnsN4BdNuNQ
 2IHTG7PGNdW281ZdiUVjPm09uXBOy10679WYg391ZW+sBVHp/AomzFtJhIB5RgiJp/ng
 hOUw==
X-Gm-Message-State: APjAAAW54VCiljcWjbhCEjEdPK66bI647PORqjQ4eeobo+G6vhLNT6LU
 OKEiYNAPlA6hIbOYkS9Y+29l4g==
X-Google-Smtp-Source: APXvYqwNQlOjhdPJDabvXd+VV6Zz3w7TyVWQM5OdLcX6FI7/n+FZYKjSAvVJLzJ9hcSUKvagWbXgrQ==
X-Received: by 2002:a5d:52c5:: with SMTP id r5mr23636282wrv.146.1565357660850; 
 Fri, 09 Aug 2019 06:34:20 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id y18sm5674641wmi.23.2019.08.09.06.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Aug 2019 06:34:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org,
	broonie@kernel.org
Date: Fri,  9 Aug 2019 14:34:03 +0100
Message-Id: <20190809133407.25918-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v3 0/4] ASoC: codecs: Add WSA881x Smart Speaker
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

Thanks for reviewing v2 patchset, here is v3 with addressing the comments in v2.

This patchset adds support to WSA8810/WSA8815 Class-D Smart Speaker
Amplifier which is SoundWire interfaced.
This also adds support to some missing bits in SoundWire bus layer like
Device Tree support.

This patchset along with DB845c machine driver and WCD934x codec driver
has been tested on SDM845 SoC based DragonBoard DB845c with two
WSA8810 speakers.

Most of the code in this driver is rework of Qualcomm downstream drivers
used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

TODO:
	Add thermal sensor support in WSA881x.

Thanks,
srini

Changes since v2:
- Updated compatible string to include LinkID.
- udpdated wsa driver to not register/unregister component in SoundWire
 status callbacks.
- Updated few minor coding style review comments.

Changes since v1 RFC:
- bindings document renamed to slave.txt
- fix error code from dt slave parsing

Srinivas Kandagatla (4):
  dt-bindings: soundwire: add slave bindings
  soundwire: core: add device tree support for slave devices
  dt-bindings: ASoC: Add WSA881x bindings
  ASoC: codecs: add wsa881x amplifier support

 .../bindings/sound/qcom,wsa881x.txt           |   24 +
 .../devicetree/bindings/soundwire/slave.txt   |   51 +
 drivers/soundwire/bus.c                       |    2 +
 drivers/soundwire/bus.h                       |    1 +
 drivers/soundwire/slave.c                     |   44 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa881x.c                    | 1134 +++++++++++++++++
 8 files changed, 1268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.txt
 create mode 100644 Documentation/devicetree/bindings/soundwire/slave.txt
 create mode 100644 sound/soc/codecs/wsa881x.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
