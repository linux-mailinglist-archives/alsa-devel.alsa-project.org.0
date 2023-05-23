Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C6070E01A
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 17:14:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B44CA820;
	Tue, 23 May 2023 17:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B44CA820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684854865;
	bh=fTYqDpnPeDecn81aQqoaXRxxGGYnBNI/2bFaRrPz8f4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SHgh31Y0xBh3L0xekJdba9aCMwC2F1z8zGfUyfjn3aM15a/rtfWPbZsf1yFZuPJtF
	 k7y4xvGFsK7cF9tL1/y4BfULtab3kkFfqdJzxL3aic3hQjHzLOkLevuuktBEaofVOh
	 DvyCFtXVsxf1sbP2hzXbtmHhjjA/OsAEIhrHOwNY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78D53F800DF; Tue, 23 May 2023 17:12:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25ECCF80552;
	Tue, 23 May 2023 17:12:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C70E5F8024E; Tue, 23 May 2023 17:12:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD28DF800DF
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 17:12:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD28DF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=TSmhYRr+
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 6D690C000C;
	Tue, 23 May 2023 15:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684854749;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=44LW4D+dEQ4642r5zsLapFoXq9b1JcRYCd7i3HkCKYM=;
	b=TSmhYRr+lsHjhiKF/pnRF7qFR3c7YLwMNGErcOAdJzgvH65cnroU6fGyh0hzPo2ZdfE7GJ
	a9Vxf9vSpCPRBXGZ3tVcWomX++WuAl3nWH2mlbzQkWwpAFDucsO6MdvD6mmTHSVIH6d6G+
	+af87BadCTLNfjxOVFgIOuAZgZaW1o/58W3oAFaTrXIf44iHdcF+KfoD8pEpeUfP3fqDTs
	9O5aoRFqE5I3MsxGhM4LF7k/aKCWyLuDWjXr61zR546f5Lww8WaHpWrL0TRfhjmXBWyGG3
	4zLenMx4cSwu7xhw3zyD4KErAPRtf7NSjpwtb04vjHBhO6mOA7H4skh+JpDWfw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 0/9] Add support for IIO devices in ASoC
Date: Tue, 23 May 2023 17:12:14 +0200
Message-Id: <20230523151223.109551-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 33Z3OBEZOJ5EN3E7PI5Q73XEVRA7U63A
X-Message-ID-Hash: 33Z3OBEZOJ5EN3E7PI5Q73XEVRA7U63A
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/33Z3OBEZOJ5EN3E7PI5Q73XEVRA7U63A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Several weeks ago, I sent a series [1] for adding a potentiometer as an
auxiliary device in ASoC. The feedback was that the potentiometer should
be directly handled in IIO (as other potentiometers) and something more
generic should be present in ASoC in order to have a binding to import
some IIO devices into sound cards.

The series related to the IIO potentiometer device is already under
review [2].

This series introduces audio-iio-aux. Its goal is to offer the binding
between IIO and ASoC.
It exposes attached IIO devices as ASoC auxiliary devices and allows to
control them through mixer controls.

On my system, the IIO device is a potentiometer and it is present in an
amplifier design present in the audio path.

Compare to the previous iteration
  https://lore.kernel.org/linux-kernel/20230421124122.324820-1-herve.codina@bootlin.com/
This v2 series mainly:
 - updates the binding using a simple-card subnode and handles this new
   subnode in the simple-card driver.
 - Improves existing IIO code and documentation.
 - Renames simple-iio-aux to audio-iio-aux and fixes the driver itself.

Best regards,
Hervé

[1] https://lore.kernel.org/linux-kernel/20230203111422.142479-1-herve.codina@bootlin.com/
[2] https://lore.kernel.org/linux-kernel/20230421085245.302169-1-herve.codina@bootlin.com/

Changes v1 -> v2
  - Patch 1
    Rename simple-iio-aux to audio-iio-aux
    Rename invert to snd-control-invert-range
    Remove the /schemas/iio/iio-consumer.yaml reference
    Remove the unneeded '|' after description

  - Patch 2 (new in v2)
    Introduce the simple-audio-card additional-devs subnode

  - Patch 3 (new in v2)
    Check err before switch() in iio_channel_read_max()

  - Patch 4 (new in v2)
    Fix raw reads and raw writes documentation

  - Patch 5 (patch 2 in v1)
    Check err before switch() in iio_channel_read_min()
    Fix documentation

  - Patch 6 (path 3 in v1)
    No changes

  - Patch 7 (patch 4 in v1)
    Rename simple-iio-aux to audio-iio-aux
    Rename invert to snd-control-invert-range
    Remove the mask usage from audio_iio_aux_{get,put}_volsw helpers
    Use directly PTR_ERR() in dev_err_probe() parameter
    Remove the '!!' construction
    Remove of_match_ptr()

  - Patch 8 (new in v2)
    Add a missing of_node_put() in the simple-card driver

  - Patch 9 (new in v2)
    Handle additional-devs in the simple-card driver

Herve Codina (9):
  ASoC: dt-bindings: Add audio-iio-aux
  ASoC: dt-bindings: simple-card: Add additional-devs subnode
  iio: inkern: Check error explicitly in iio_channel_read_max()
  iio: consumer.h: Fix raw values documentation notes
  iio: inkern: Add a helper to query an available minimum raw value
  ASoC: soc-dapm.h: Add a helper to build a DAPM widget dynamically
  ASoC: codecs: Add support for the generic IIO auxiliary devices
  ASoC: simple-card: Add missing of_node_put() in case of error
  ASoC: simple-card: Handle additional devices

 .../bindings/sound/audio-iio-aux.yaml         |  64 ++++
 .../bindings/sound/simple-card.yaml           |  53 +++
 drivers/iio/inkern.c                          |  75 ++++-
 include/linux/iio/consumer.h                  |  37 ++-
 include/sound/soc-dapm.h                      |  12 +-
 sound/soc/codecs/Kconfig                      |  12 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/audio-iio-aux.c              | 302 ++++++++++++++++++
 sound/soc/generic/simple-card.c               |  53 ++-
 9 files changed, 596 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/audio-iio-aux.yaml
 create mode 100644 sound/soc/codecs/audio-iio-aux.c

-- 
2.40.1

