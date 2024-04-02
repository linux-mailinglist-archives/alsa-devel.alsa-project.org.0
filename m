Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 572AD89AF05
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:14:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FA7122AA;
	Sun,  7 Apr 2024 09:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FA7122AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474074;
	bh=gnN1OFzfMxXZfteMTSEnGZcF0OZvn9mUEoCB/FFpj2E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=WxE5ouw7uNWvrJl59oVk3NnEUEwr20dloV4H1BGbmlCcRyn69wOyk+7bHoV1lYq2B
	 SHzOOi8JR91uuQTknEC4pJVIkDqqgF7QYjj3fAdwryoJMLr5QbmmODL4Xn0uNgnrj/
	 /CleinpPq5uZkMkystTDzwbpj5MQAJcsCRC0dudo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA80DF8057E; Sun,  7 Apr 2024 09:14:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3F4AF8059F;
	Sun,  7 Apr 2024 09:14:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D647EF80588; Tue,  2 Apr 2024 09:12:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 647D3F80114
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 09:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 647D3F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=au69z9Y6
Received: by mail.gandi.net (Postfix) with ESMTPA id 7D5B5FF80E;
	Tue,  2 Apr 2024 07:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712041936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kARtlCjFgsJx0pk6MzW4A6BY9yAEH50g5G4smmC1pek=;
	b=au69z9Y66SligpnfmD2db2hx0MbLDw5fB/g9PaFjj8OC6rnW5KltB61OVv5J+eEhyGZ0gv
	XLPDnZjGNRnYyNwNA5EqJRWKjYIRUrOh+bNqSOQHtxSkAI1bTlHXmkYe1wPtmB73QrxRxw
	J63Naei3IRdxm9vwYFWXSsiNuGhWa1dB3H00KU88xRiySZOmaaGDnd0HkkmFndOazFAnnc
	aXv6sO+daTgFbHyJD5Ybz1Mo+vQdnxNVEOc3JuysuIzD/t+HMY7dDD5CvXPCpHGbLqjdLy
	5Tv/5EX0cVcIriuxt3FowrOdMvvfalknKwlkvl3Rcvd/5qcARv3MCz4BdZLHQQ==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca
Subject: [PATCH v2 00/13] ASoC: ti: davinci-i2s: Add features to McBSP driver
Date: Tue,  2 Apr 2024 09:12:00 +0200
Message-ID: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: N5QESUCZQV5PJ4LJPXYIZEMDEOC7Q27I
X-Message-ID-Hash: N5QESUCZQV5PJ4LJPXYIZEMDEOC7Q27I
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:13:58 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N5QESUCZQV5PJ4LJPXYIZEMDEOC7Q27I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series aims to add some features to McBSP driver.

Convert bindings from .txt to .yaml.
Add possibility to use an external clock as sample rate generator's
input.
Add handling of new formats (TDM, S24_LE, BP_FC).
Enable the detection of unexpected frame pulses.
Set the clock free-running mode according to SND_SOC_DAIFMT_[GATED/CONT]
configuration in DAI format.
Add ti,T1-framing[tx/rx] properties in DT. They allow to set the data
delay to two bit-clock periods.

This has been tested on a platform designed off of the DAVINCI/OMAP-L138
connected to 3 daisy-chained AD7767. An external clock drives the
sample rate generator through the CLKS pin.
The hardware I have only allowed me to test acquisition side of McBSP.
It is connected to a 6 channels TDM and acts as Bit clock provider and
Frame clock consumer.

Change log v1 -> v2:
  PATCH 1 (bindings):
     * Drop power-domains property's description
     * Drop the unused label 'mcbsp0' in example
     * Add <> around each entry of the 'dmas' property
     * Add 'Reviewed-by: Rob Herring <robh@kernel.org>'
  PATCH 2 (bindings):
     * Drop the 'ti,enable-sync-err' flag
     * Drop the 'ti,disable-free-run' flag
     * Add 'Reviewed-by: Rob Herring <robh@kernel.org>'
  PATCH 4:
     * In probe() use dev_err for fixed error
  PATCH 7 (TDM):
     * set playback.max_channels to 128
     * Add a check on tx_mask as the one done for rx_mask
     * Allow TDM with BP_FP format
  PATCH 9:
     * Detection of unexpected frame pulses is enabled by default
  PATCH 10:
     * Free-running mode is selected by the DAI format through
       SND_SOC_DAIFMT_[CONT/GATED]
  PATCH 12:
     * drop the 'ti,drive-dx' property
     * add 'ti,T1-framing-[rx/tx]' properties
  PATCH 13:
     * Drop the drive_dx part
     * Add support for 'T1 framing' with data delay set to 2 bit-clock
       periods
Bastien Curutchet (13):
  ASoC: dt-bindings: davinci-mcbsp: convert McBSP bindings to yaml
    schema
  ASoC: dt-bindings: davinci-mcbsp: Add optional clock
  ASoC: ti: davinci-i2s: Remove the unused clk_input_pin attribute
  ASoC: ti: davinci-i2s: Replace dev_err with dev_err_probe
  ASoC: ti: davinci-i2s: Use external clock to drive sample rate
    generator
  ASoC: ti: davinci-i2s: Delete unnecessary assignment
  ASoC: ti: davinci-i2s: Add TDM support
  ASoC: ti: davinci-i2s: Add handling of BP_FC format
  ASoC: ti: davinci-i2s: Enable unexpected frame pulses detection
  ASoC: ti: davinci-i2s: Link free-run mode to
    SND_SOC_DAIFMT_[GATED/CONT]
  ASoC: ti: davinci-i2s: Add S24_LE to supported formats
  ASoC: dt-bindings: davinci-mcbsp: Add the 'ti,T1-framing-{rx/tx}'
    flags
  ASoC: ti: davinci-i2s: Add T1 framing support

 .../bindings/sound/davinci-mcbsp.txt          |  50 ----
 .../bindings/sound/davinci-mcbsp.yaml         | 113 +++++++
 include/linux/platform_data/davinci_asp.h     |  15 -
 sound/soc/ti/davinci-i2s.c                    | 278 ++++++++++++++----
 4 files changed, 333 insertions(+), 123 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcbsp.txt
 create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml

-- 
2.44.0

