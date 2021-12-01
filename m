Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D72464E29
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 13:45:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12860259D;
	Wed,  1 Dec 2021 13:44:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12860259D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638362731;
	bh=XkOiXhCiM74R7Y0HarAELF+FPi6cWd6VSEDxSVm4ICI=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qsqn20xwQBsjz/D6Xv5kdNDRdFoAKmZteOTzr8OZAe1CmL2PCiFimHj3Fc/yKHLrD
	 mIVgyyzVW6BJPkU8s7DpFUVSSUUs7Ph6j34tDKCgo9ZJrUX06F9+5s5F04G+ziWxu2
	 oyXB6HafjCBRvrsGrl3nvkbTspW1mDQmip5icpCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CBC6F80249;
	Wed,  1 Dec 2021 13:44:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1C98F80246; Wed,  1 Dec 2021 13:44:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7BC9F80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 13:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7BC9F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="L+x83UZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1638362646;
 x=1669898646;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ccIZDR9xau4mMeXpbb/HPs/pDjSh8xlVX2GRtIR58Co=;
 b=L+x83UZQ2tZjvPvGpaspeRx3vnIwecyoFWuddL31KNW1oX3bSo5Z90eo
 kzMDI456skgRgmhpHjI1IvsAk3g8CaH+RGCUmgSiU2PknlJflWQJfflRO
 CGUXiymGOMpNVVf/vgz4sky7ZJzgHnGh8J+0zX+oavZUtLC07OcZvLbz8
 CnC0zRVdW1jig3zmwGoTsgxow4PNwPrqKjrOHpRmzssM/koMskdy8frv4
 ILXv+5xp6Fn4osU+WG0y17r7qlnQdRDiL5zs2csv/G3JhYVym/n5uxI5s
 7A+miA48DgfCLhW9CPthCkUBIKljh0AQw0mNJe/4mYLhxDPpvx9eJcaqi A==;
Date: Wed, 1 Dec 2021 13:43:54 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v6 0/2] Codec driver for TLV320ADC3001 and 3101
Message-ID: <alpine.DEB.2.21.2112011338260.1159@lnxricardw1.se.axis.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail07w.axis.com
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


I've submitted this a couple of times, but the kernel test robot has come 
back with various remarks, so I've reworked it a bit more hopefully with 
positive results this time.

This is a codec driver for the TLV320ADC3001 and TLV320ADC3101 2 channel
audio ADC chips from Texas Instruments.

Based on an old driver for these chips that I was referred to by Texas
Instruments, but which apparently was never upstreamed, I've taken
patches from various incarnations, ported them and augmented them with
various new features in order to make a working driver.

There is currently no support for the on-chip "miniDSP".

Although the TLV320ADC3001 and TLV320ADC3101 have similarities with other
TI codec chips for which there are existing drivers, upon closer
inspection I decided the differences were too great to warrant attempting
to modify an existing driver, especially without access to all supported
chips and resources for testing them all.

There are certainly things that could be improved, among others in the
area of PLL register value calculations, but it has been tested on the
Axis ARTPEC-8 platform and has been found to work satisfactorily at least
with a TLV320ADC3101 operating as an I2S slave at 48 kHz with 32 bit bit
depth, 1 or 2 channels, both with the on-chip PLL enabled and disabled.

I have not tested this on a TLV320ADC3001 chip; in the original driver
the only differences were related to the now-removed initialization
code, so I've just retained the compatible strings for both chips.

Limitations:
  - GPIO pins on chip can only be set up as outputs.
  - Using BCLK as an input to clock chain is supported by the hw
    but not by driver.

Changes v5->v6:

- Added missing "depends on I2C" in the Kconfig
  (reported by lkp@intel.com).
- Fold include file into source as it is not needed elsewhere.
- Fix SPDX-License-Identifier which was using a deprecated license.
- Clean up authorship information in file header, removing history.
- Remove useless GPIOLIB ifdefs.
- Use devm_gpiod_get for reset gpio rather than devm_gpio_request etc.
- Handle EPROBE_DEFER properly for reset gpio request.
- Use dev_err_probe rather than explicit EPROBE_DEFER checking.
- Properly check value from DT parsing for mic bias and codec gpio pins.

No changes to the devicetree bindings.

Changes v4->v5:

Yet another fix based on kernel test robot (lkp@intel.com), this time a
legitimate issue: the return value from of_get_named_gpio_flags() was
crammed into an unsigned int so any potential negative error codes were
lost.

No changes to the devicetree bindings.

Changes v3->v4:

More fixes reported by kernel test robot (lkp@intel.com). Don't know why
these weren't reported the first time.

Changes v2->v3:

Fix a couple of issues reported by the kernel test robot (lkp@intel.com).

Changes v1->v2:

Large portions of the driver have been reworked from v1 based on remarks
from Mark. More specifically:

  - Remove an unneeded #ifdef and EXPORT_SYMBOL_GPL.
  - Add ADC3XXX_ prefix to all macro names to avoid namespace contention.
  - Clean up certain macro names with mixed lower case - upper case names.
  - Do away with the D0..D7 macros representing bit values.
  - Fix general formatting: spaces before and after {, },
    replace multi spaces with tabs, maximum 2 blank lines anywhere,
    and other minor issues.
  - Page register does not need to be volatile.
  - Rather than use 0 / -6dB enum for input attenuator, use standard TLV.
  - The dither offset control contains reserved values so use
    VALUE_ENUM instead of straight ENUM.
  - Replace vector of SOC_ENUMs with individual variables.
  - Fix ALSA control names:
    - Use Volume at the end of all gain controls, and remove
      "Gain" where applicable.
    - Use "Switch" at the end of all switch controls, either adding
      it or changing "switch" into "Switch" as applicable.
    - Switches and Volumes related to capture should be set up
      as such, so add "Capture" to widget names where appropriate.
      This is mostly important for the PGA Capture and Switch widgets,
      not just for consistency, but also because amixer simple Switch
      controls expect different names (cap/nocap instead of on/off)
      for control values for capture.
  - Make widget names have capital first letters for all consitutent
    words.
  - When resuming, the registers will not have changed, so no need to
    call snd_soc_component_cache_sync().
  - Move reset gpio init to I2C probe
  - Remove needless _priv at end of private struct name.
  - Make hex constants lower case
  - _CBM_CFM/_CBS_CFS -> _CBP_CFP/_CBC_CFC
  - Instead of using device specific ALSA controls to control
    the two GPIO pins, use GPIOLIB. GPIO pin functions still
    can be set up in the devicetree as the pins can be used for
    other functions which are not GPIO related.
    - Limitation: The GPIO pins can only be used as outputs, even though
      the hardware alternatively supports using them as inputs.
  - Handle GPIO configs in a vector rather than separately.
  - Use more appropriate module_i2c_driver
    instead of generic module_init/module_exit.
  - Remove useless initialization data.
  - As the ADC mute function had no control, add it.
  - Clean up GPIO initialization which was done both in the
    I2C probe and in the component probe.
  - Remove probe, remove, suspend and resume callbacks, which
    either do not do anything at all anymore, or uselessly
    just do set_bias_level.
  - The PLL should not be configured in the devicetree, so
    move the corresponding definitions to tlv320adc3xxx.h
    where they can be picked up by a machine driver if needed.
    - Default to PLL AUTO mode.
  - Use "reset-gpios" instead of too-generic "gpios" for dt
    property for configuring codec reset pin.
  - Use function for printing PLL mode rather than macro.
  - dev_info is too verbose for most of the printouts, change them
    to dev_dbg.
  - Add support for configuring micbias voltage in DT.
  - Remove ALSA control for mic bias.
  - Move PLL and NADC, MADC divisor enable to DAPM, including 10 ms
    post PLL start up delay via POST_PMU event.
  - ADC is powered on using DAPM, so needless to do it in
    set_bias_level, thus remove it.
  - Let DAPM handle BCLK divisor enable. With this, we can
    remove set_bias_level as it doesn't do anything anymore.
  - Fix incorrect argument order to a snd_soc_component_update_bits call.
  - Although the chip itself can operate using BCLK as the clock
    source, either directly to the divider chain or via the PLL,
    this is not yet supported in the driver, so require the
    clocks property for the MCLK for now.
  - Move PLL rate structure out of .h file where it does not belong.

/Ricard

Ricard Wanderlof (2):
  dt-bindings: sound: tlv320adc3xxx: New codec driver
  ASoC: codec: tlv320adc3xxx: New codec driver

 .../bindings/sound/ti,tlv320adc3xxx.yaml      |  137 ++
 include/dt-bindings/sound/tlv320adc3xxx.h     |   28 +
 sound/soc/codecs/Kconfig                      |    8 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tlv320adc3xxx.c              | 1311 +++++++++++++++++
 5 files changed, 1486 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
 create mode 100644 include/dt-bindings/sound/tlv320adc3xxx.h
 create mode 100644 sound/soc/codecs/tlv320adc3xxx.c

-- 
2.20.1

-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
