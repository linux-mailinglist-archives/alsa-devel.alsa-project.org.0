Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 450644453D0
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Nov 2021 14:27:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5223167D;
	Thu,  4 Nov 2021 14:26:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5223167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636032421;
	bh=VSHTLjgFVICo9yGA9FnOF3N7QjF6cvFOBajFCKtu2QQ=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uPgE94ECfcEKg5rqo1fR8anUY6xd7y/p1NruiGlSavUm4GnfZoz1ToVb1MOFuIdSe
	 ilIJa80kqIiAb+VpuzgITHRpan38Spo3xMieY1MlCs4oYptK8D166uH4aFodzFRtqZ
	 05PMbJNod04mZwEBOwXlYFrSl2nO8p4+cq2nqGH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00243F8025D;
	Thu,  4 Nov 2021 14:25:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19B78F8025D; Thu,  4 Nov 2021 14:25:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44D03F80148
 for <alsa-devel@alsa-project.org>; Thu,  4 Nov 2021 14:25:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44D03F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="IpEue1vh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1636032331;
 x=1667568331;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=wThmSIcRyCZUYvCFiPUNa7iogbPBMIPPntJmGrtFYWU=;
 b=IpEue1vhc2Lh1yQZ/n0hClyyqdwzl6/KV0RL5Cr4IZqKeGcvP36xdJxy
 bPwy2kcY+jT08Dg6BHtc5udwMUHivFYMC79JQ2Z8Bk1UuQnhj+46CtF4M
 EVMJ52WWMtoAQj0tqf5o2OlROYyi6taG1ZVlKETEI4tx3AoW8QSh6hy7V
 K4392Bth0NIOqXUe2pBx6ENFOaFkTapETSiUQpvC7Ilv554YPPPTDcaRZ
 I5rQhi64mZcd/Of1whpDFSBwIW68ridtOgJnKVziQR+sjewhswaDxoTwO
 gl+Zje4Hs912VAF7k87vz5EeVvIB1u+AlwySB22HIxoF3IgECoMeoUVBu Q==;
Date: Thu, 4 Nov 2021 14:25:16 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 0/2] Codec driver for TLV320ADC3001 and 3101
Message-ID: <alpine.DEB.2.21.2111041420240.31205@lnxricardw1.se.axis.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
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

Ricard Wanderlöf (2):
  dt-bindings: sound: tlv320adc3xxx: New codec driver
  ASoC: codec: tlv320adc3xxx: New codec driver

 .../bindings/sound/ti,tlv320adc3xxx.yaml      |  137 +++
 include/dt-bindings/sound/tlv320adc3xxx.h     |   28 +
 sound/soc/codecs/Kconfig                      |    7 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/tlv320adc3xxx.c              | 1071 +++++++++++++++++
 sound/soc/codecs/tlv320adc3xxx.h              |  379 ++++++
 6 files changed, 1624 insertions(+)
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
