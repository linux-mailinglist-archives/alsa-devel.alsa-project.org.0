Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E986C73B317
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jun 2023 10:59:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F341839;
	Fri, 23 Jun 2023 10:59:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F341839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687510795;
	bh=MrKcUW6pZQ2cTc/8Wl+S8wRYcmEp7nJ+JiS8Oxb8NEc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QGrvkAN7qy0Dh0OYSrvQF9BxyFwGjqTau04NBoeHBhy/dYFEpGUj9r/MQQHufUEZG
	 4qQNRFhmRdFaKlBddCB+6mhp7RxnROSq45RTiDJhRzJDOWM2VGzbG3rZRvh5oowtaC
	 DTLTIr1JNaf2itHHhp2hF5mPH9A+dLVZX0M5tgdk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FD53F801F5; Fri, 23 Jun 2023 10:58:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F3F9F80169;
	Fri, 23 Jun 2023 10:58:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CD55F80130; Fri, 23 Jun 2023 10:58:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4FE8F80130
	for <alsa-devel@alsa-project.org>; Fri, 23 Jun 2023 10:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4FE8F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JRfB9T7v
X-GND-Sasl: herve.codina@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687510718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dRhnfUP864nFvXMjKJxcUvdp/GyOCJ/wA4XwLZHl0r8=;
	b=JRfB9T7vYqO9nn2taqAfOnyGS1sJL+v81xZ5gQsQfSRtQy9jqwAz9C20nn6oyHuLqoKiaX
	ZJ6zm0Kyg6FfUkdNH557CdcZjjCIGg0JN4r/T09tIIE/erfn2rK4tBKoNICxbV513fBtOz
	GBnJ+8JiiTJQ2vMMoqZGgbnAnmWZvTXNijHNQtpE7zrB6Ecxhwf5cRf3643pPgq6fO+XOc
	7mFHkmBCAiu4iFHPx91XTR/+GIWEK+UsvPWAFCuIQ1pypQtyrKjVF/RmRNCyLEH1AxgwPq
	yvRzcNEZ28Si1f66cBWCCi1vc7DV0SIJKM4kwHjQyD8vhqv33soKCtpzjqiq2A==
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
X-GND-Sasl: herve.codina@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPA id 2BCC5E0004;
	Fri, 23 Jun 2023 08:58:36 +0000 (UTC)
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
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Wojciech Ziemba <wojciech.ziemba@intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v6 00/13] Add support for IIO devices in ASoC
Date: Fri, 23 Jun 2023 10:58:17 +0200
Message-Id: <20230623085830.749991-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: E6POIZ77CCIUUCVJYYRREK6HGNQMII3U
X-Message-ID-Hash: E6POIZ77CCIUUCVJYYRREK6HGNQMII3U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E6POIZ77CCIUUCVJYYRREK6HGNQMII3U/>
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

The series related to the IIO potentiometer device is already applied.

This series introduces audio-iio-aux. Its goal is to offer the binding
between IIO and ASoC.
It exposes attached IIO devices as ASoC auxiliary devices and allows to
control them through mixer controls.

On my system, the IIO device is a potentiometer and it is present in an
amplifier design present in the audio path.

Compare to the previous iteration
  https://lore.kernel.org/linux-kernel/20230615152631.224529-1-herve.codina@bootlin.com/
This v6 series mainly:
 - Fixes comments
 - Does some minor code modification

Best regards,
Hervé

[1] https://lore.kernel.org/linux-kernel/20230203111422.142479-1-herve.codina@bootlin.com/
[2] https://lore.kernel.org/linux-kernel/20230421085245.302169-1-herve.codina@bootlin.com/

Changes v5 -> v6
  - Patches 3, 4, 11, 13
    No changes

  - Patch 1
    Add 'Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>'
    Add 'Reviewed-by: Rob Herring <robh@kernel.org>'

  - Patch 2
    Add 'Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>'

  - Patches 5, 6
    Add 'Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>'

  - Patch 7
    Fix comments:
      'buf' -> 'buff',
       '__unconst_typeof' -> '__unconst_integer_typeof'

  - Patch 8, 9, 10
    Add 'Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>'

  - Patch 12
    Set struct snd_kcontrol_new fields for the constrol variable at
    variable initalization.
    Add a missing blank line
    Add a comment related to min/max swapping
    Add 'Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>'

Changes v4 -> v5
  - Patches 1, 2, 3, 4, 5, 9, 10, 11, 12, 13
    No changes.

  - Patch 6
    Fix commit log.
    Add 'Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>'

  - Patch 7
    Fix the macros to be able to use them with:
     - an array defined as int *buff;
     - an array defined as int buff[N];
     - Rework the way to "unconstify" the temporary variable to avoid
       issues due to integer promotion.
    Add 'Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>'

  - Patch 8
    Add 'Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>'

Changes v3 -> v4
  - Patches 1, 2
    No changes.

  - Patches 3, 4, 5
    Add 'Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>'.

  - Patch 6 (new in v4)
    Fix headers inclusion order.

  - Patch 7 (patch 6 in v3)
    Add a comment related to __must_be_array()
    Use __array[0] of *__array

  - Patch 8 (patch 7 in v3)
    Fix minmax.h inclusion order.
    Add 'Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>'.

  - Patch 9 (patch 8 in v3)
    Add 'Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>'.
    Add 'Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>'.

  - Patch 10 (patch 9 in v3)
    Add 'Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>'.

  - Patch 11 (patch 10 in v3)
    Fix a typo.
    Add	'Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>'.
    Add	'Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>'.

  - Patch 12 (patch 11 in v3)
    Fix typos in the commit log.
    Fix headers inclusion order.
    Removed unneeded variable initialization.
    Replace {0} by {}.
    Use struct device *dev in probe().
    Check an error on the snd-control-invert-range property read.

  - Patch 13 (patch12 in v3)
    No changes.

Changes v2 -> v3
  - Patches 1, 2
    No changes.

  - Patch 3, 4
    Add 'Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>'.

  - Patch 5 (new in v3)
    Removed the 'unused' variable and check the null pointer when used.

  - Patch 6 (new in v3)
    Introduce {min,max}_array().

  - Patch 7 (new in v3)
    Use max_array() in iio_channel_read_max().

  - Patch 8 (new in v3)
    Replace a FIXME comment by a TODO one.

  - Patch 9 (patch 5 in v2)
    Removed the 'unused' variable and check the null pointer when used.
    Use min_array().
    Remplace a FIXME comment by a TODO one.

  - Patch 10 (patch 6 in v2)
    Convert existing macros to return a compound litteral instead of
    adding a new helper.

  - Patch 11 (patch 7 in v2)
    Remove the file name from the C file header.
    Use directly converted DAPM macros.
    Replace <linux/module.h> by <linux/mod_devicetable.h>.
    Add <linux/platform_device.h>.
    Be sure that min <= max. Swap values if it is not the case.
    Move the bool structure member after the int ones.
    Remove unneeded assignements.
    Use dev_err_probe() when relevant.
    Use str_on_off().
    Use static_assert() instead of BUILD_BUG_ON().
    Remove unneeded comma and blank line.
    Use device_property_*() instead of the OF API.

  - patch 8 available in v2 removed as already applied

  - Patch 12 (patch 9 in v2)
    Use devm_add_action_or_reset().
    Call simple_populate_aux() from simple_parse_of().

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

Herve Codina (13):
  ASoC: dt-bindings: Add audio-iio-aux
  ASoC: dt-bindings: simple-card: Add additional-devs subnode
  iio: inkern: Check error explicitly in iio_channel_read_max()
  iio: consumer.h: Fix raw values documentation notes
  iio: inkern: Remove the 'unused' variable usage in
    iio_channel_read_max()
  iio: inkern: Fix headers inclusion order
  minmax: Introduce {min,max}_array()
  iio: inkern: Use max_array() to get the maximum value from an array
  iio: inkern: Replace a FIXME comment by a TODO one
  iio: inkern: Add a helper to query an available minimum raw value
  ASoC: soc-dapm.h: Convert macros to return a compound literal
  ASoC: codecs: Add support for the generic IIO auxiliary devices
  ASoC: simple-card: Handle additional devices

 .../bindings/sound/audio-iio-aux.yaml         |  64 ++++
 .../bindings/sound/simple-card.yaml           |  53 +++
 drivers/iio/inkern.c                          |  86 ++++-
 include/linux/iio/consumer.h                  |  37 +-
 include/linux/minmax.h                        |  64 ++++
 include/sound/soc-dapm.h                      | 138 ++++---
 sound/soc/codecs/Kconfig                      |  12 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/audio-iio-aux.c              | 344 ++++++++++++++++++
 sound/soc/generic/simple-card.c               |  46 ++-
 10 files changed, 775 insertions(+), 71 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/audio-iio-aux.yaml
 create mode 100644 sound/soc/codecs/audio-iio-aux.c

-- 
2.40.1

