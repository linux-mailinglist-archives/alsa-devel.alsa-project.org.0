Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3A487DCA7
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Mar 2024 09:56:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9690238D;
	Sun, 17 Mar 2024 09:56:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9690238D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710665782;
	bh=cMBm2ZUDvv/FeHjU9MT1L6ylkEfHxwGT+Fdb6DMTg3U=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SS2ZkAbXKx2DcHYDnEZz7ni+7Da50bQU/l3MPtetmih6G9vl5BHwZ7ClwJaFAWTOH
	 DoA8IGGT5IOG/VFN3a+tsXy4pRhVSfB3zB4UPi6aw4M4hq5yAY00EQaUpNAuHhQPlx
	 EJH6pJu9kRy/FUWFmGj1cJwCFhBA0DC0AC6yjKuE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2FDFF8057B; Sun, 17 Mar 2024 09:55:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AC882F8058C;
	Sun, 17 Mar 2024 09:55:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7350EF8057D; Fri, 15 Mar 2024 12:28:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C644F8025F
	for <alsa-devel@alsa-project.org>; Fri, 15 Mar 2024 12:27:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C644F8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hbu9H1td
Received: by mail.gandi.net (Postfix) with ESMTPA id 218EDE0004;
	Fri, 15 Mar 2024 11:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710502074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yKwrXtvxj8TEZrcKF8i8hnVKSrTEOPd44rgLaggpYn8=;
	b=Hbu9H1tdUnGCCxaS50Hbpsn1zVwsI8XeVjXTg81w6ZplrhN1WxMKpPRos8LILwVed0L63B
	PiW4Zy8L6nEbXD0+3psh3ELfndG3HbMMd/c2hzFfAcbSTDg0BpjNddu7dBxFqP8Hv6gxCL
	7x4t8xFtmvjwsYrZxLiuBwtxC1fg7lFCv/CF6/7kuoynStldNWHo9EYaZibQSZiGbDpcuJ
	y5CaZDVJqaVhSqV4Tdj2L6iIYrir+5froFdjZQ56Ue3zxIylI0vla324frDvmOjFNo8AEH
	QVJTO/rxL7cFSxlqOoNcyfx1GOu+ZNJWDWbk+pSsLQaAVHysLIr5BrNT1KuKNA==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
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
Subject: [PATCH 00/13] ASoC: ti: davinci-i2s: Add features to McBSP driver
Date: Fri, 15 Mar 2024 12:27:32 +0100
Message-ID: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: UDVUVJSJNXL7YCCLZREOPOQOPE2S3JGV
X-Message-ID-Hash: UDVUVJSJNXL7YCCLZREOPOQOPE2S3JGV
X-Mailman-Approved-At: Sun, 17 Mar 2024 08:55:45 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UDVUVJSJNXL7YCCLZREOPOQOPE2S3JGV/>
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
Add optional properties in DT:
 - ti,enable-sync-err  : Enable the detection of unexpected frame pulses
 - ti,disable-free-run : Disable the free-running mode where McBSP drives
                         serial clocks during emulation halt
 - ti,drive-dx 	       : Outputs a chosen pattern on DX pin during
                         capture streams.

This has been tested on a platform designed off of the DAVINCI/OMAP-L138
connected to 3 daisy-chained AD7767. An external clock drives the
sample rate generator through the CLKS pin.
The hardware I have only allowed me to test acquisition side of McBSP.
It is connected to a 6 channels TDM and acts as Bit clock provider and
Frame clock consumer.

Bastien Curutchet (13):
  ASoC: dt-bindings: davinci-mcbsp: convert McBSP bindings to yaml
    schema
  ASoC: dt-bindings: davinci-mcbsp: Add new properties
  ASoC: ti: davinci-i2s: Remove the unused clk_input_pin attribute
  ASoC: ti: davinci-i2s: Replace dev_err with dev_err_probe
  ASoC: ti: davinci-i2s: Use external clock to drive sample rate
    generator
  ASoC: ti: davinci-i2s: Delete unnecessary assignment
  ASoC: ti: davinci-i2s: Add TDM support
  ASoC: ti: davinci-i2s: Add handling of BP_FC format
  ASoC: ti: davinci-i2s: Enable unexpected frame pulses detection
  ASoC: ti: davinci-i2s: Make free-running mode optional
  ASoC: ti: davinci-i2s: Add S24_LE to supported formats
  ASoC: dt-bindings: davinic-mcbsp: Add the 'ti,drive-dx' property
  ASoC: ti: davinci-i2s: Opitonally drive DX pin during capture streams

 .../bindings/sound/davinci-mcbsp.txt          |  50 ---
 .../bindings/sound/davinci-mcbsp.yaml         | 119 +++++++
 include/linux/platform_data/davinci_asp.h     |  15 -
 sound/soc/ti/davinci-i2s.c                    | 333 ++++++++++++++----
 4 files changed, 376 insertions(+), 141 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcbsp.txt
 create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml

-- 
2.43.2

