Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B038420817
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 11:16:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B804E1690;
	Mon,  4 Oct 2021 11:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B804E1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633338993;
	bh=9zj03d7L4yAUa3B6PZKpkHCQHsykAGVa9Tm5cSsXpxE=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KtHW+zj5tB8cDx48YNptMOz+2Ub45qvV3O1NsHIB5vs8KZ8woqE9hkMDWSZRSbOEz
	 Fakaequ9ji+G6jAaTVR+QiHN+JbPHmum21+sCwYgyyzUB/TjoBSzgKSse3uGwb8nLe
	 Se1i97GQ3mLeVA4AK3EoV+wpL5bQJ5EyxndDjWjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2789AF80249;
	Mon,  4 Oct 2021 11:15:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDE90F80240; Mon,  4 Oct 2021 11:15:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F8B8F8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 11:15:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F8B8F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="Z9Dq0yHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1633338909;
 x=1664874909;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=2EPCh2rpXCko61u0ahKWvUME4wqCIbqBl9yF6BzKUig=;
 b=Z9Dq0yHVgRU20gtDU87crSAOXAz4qEcfk5GPYCWYblowDb6I4YlJR7vL
 idBDZmp+JFIf6Mtzmy0uHLohpn/dKTRGiFEPkOUpJrJuZ2hMUy58tG49a
 HXiw6TsfpcpS5AeAgLG3HWNZe2BycCTBO3C1gsz/NNm07C3n70iXl9OWs
 ucoztXg5u8kyVuGgPYbPP4ZhwdA+hucKLtPEGGeswibsD+z6OroYyy56t
 G5O6S4VO0U9lTVpR8pcLWxpXOhKe9Fz8ReAmo+6/6mD68WN+ys7YVSwa7
 JKdw5RBNI1qh+LbynXYfKQJqFKwCCr18xE7vUSf62NFWi1vWrks9njdfF Q==;
Date: Mon, 4 Oct 2021 11:14:59 +0200
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] Codec driver for TLV320ADC3001 and 3101
Message-ID: <alpine.DEB.2.21.2110041112490.14472@lnxricardw1.se.axis.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail04w.axis.com (10.20.40.10) To se-mail07w.axis.com
 (10.20.40.13)
Cc: alsa-devel <alsa-devel@alsa-project.org>
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


This is a codec driver for the TLV320ADC3001 and TLV320ADC3101 2 channel audio
ADC chips from Texas Instruments.

Based on an old driver for these chips that I was referred to by Texas
Instruments, but which apparently was never upstreamed, I've taken patches from
various incarnations, ported them and augmented them with various new features
in order to make a working driver.

There is currently no support for the on-chip "miniDSP".

Although the TLV320ADC3001 and TLV320ADC3101 have similarities with other TI
codec chips for which there are existing drivers, upon closer inspection I
decided the differences were too great to warrant attempting to modify an
existing driver, especially without access to all supported chips and resources
for testing them all.

There are certainly things that could be improved, among others in the area of
PLL register value calculations, but it has been tested on the Axis ARTPEC-8
platform and has been found to work satisfactorily at least with a
TLV320ADC3101 operating as an I2S slave at 48 kHz with 32 bit bit depth, 1 or 2
channels, both with the on-chip PLL enabled and disabled.

I have not tested this on a TLV320ADC3001 chip, but I've retained the apparent
differences from the '3101 (which seem quite small) from the original
driver.

/Ricard

Ricard Wanderlof (2):
  dt-bindings: sound: tlv320adc3xxx: New codec driver
  ASoC: codec: tlv320adc3xxx: New codec driver

 .../bindings/sound/ti,tlv320adc3xxx.yaml      |  126 ++
 include/dt-bindings/sound/tlv320adc3xxx.h     |   33 +
 sound/soc/codecs/Kconfig                      |    7 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tlv320adc3xxx.c              | 1239 +++++++++++++++++
 sound/soc/codecs/tlv320adc3xxx.h              |  381 +++++
 6 files changed, 1788 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
 create mode 100644 include/dt-bindings/sound/tlv320adc3xxx.h
 create mode 100644 sound/soc/codecs/tlv320adc3xxx.c
 create mode 100644 sound/soc/codecs/tlv320adc3xxx.h

-- 
2.20.1

-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
