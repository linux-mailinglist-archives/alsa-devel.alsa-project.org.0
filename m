Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA0017B0E2
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 22:50:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00A131661;
	Thu,  5 Mar 2020 22:49:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00A131661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583445036;
	bh=xLuYIUdXUT1IkW6l4BIYqawfRmGsl5aIPmLgeyIxyYM=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e0a5Qci1fnLm1KBBTO1iE/3DJERGE5wg8HM4DvQg5fuuWAE2ntt2Vv+nZZaNfBXWr
	 EyQaTrstxhNUBo5IZ7kr7hqpOktRPLQQazxEtzH7zWFUThbGsWFI2a1unabcfZwPcB
	 NsqeZiAK/Sfof/jHdJvP3OM+AWY/PEX4r9OFqYLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D94AAF80266;
	Thu,  5 Mar 2020 22:48:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A66FCF8025F; Thu,  5 Mar 2020 22:48:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6568BF8012D
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 22:48:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6568BF8012D
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Mar 2020 13:48:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,518,1574150400"; 
 d="scan'208,223";a="320336909"
Received: from jrbond-mobl.amr.corp.intel.com (HELO [10.254.11.58])
 ([10.254.11.58])
 by orsmga001.jf.intel.com with ESMTP; 05 Mar 2020 13:48:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 2/3] ASoC: Intel: bdw-rt5677: fix module load/unload
 issues
To: Mark Brown <broonie@kernel.org>
References: <20200305130616.28658-1-pierre-louis.bossart@linux.intel.com>
 <20200305130616.28658-3-pierre-louis.bossart@linux.intel.com>
 <20200305133638.GE4046@sirena.org.uk>
 <13857c7b-f7d2-9be2-c1e1-a577a774773e@linux.intel.com>
 <20200305135908.GF4046@sirena.org.uk>
 <c1419cb1-c1d6-897d-05a4-48e57a3e15db@linux.intel.com>
 <20200305174324.GH4046@sirena.org.uk>
 <7c52ff6f-76ef-7c55-65e6-9c0437bb983a@linux.intel.com>
 <20200305183335.GK4046@sirena.org.uk> <20200305191059.GL4046@sirena.org.uk>
Message-ID: <865dfd0f-38e1-2f27-5fd1-d6bcbd6d30a8@linux.intel.com>
Date: Thu, 5 Mar 2020 15:48:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200305191059.GL4046@sirena.org.uk>
Content-Type: multipart/mixed; boundary="------------B0C02CEEC349B224C28735E6"
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

This is a multi-part message in MIME format.
--------------B0C02CEEC349B224C28735E6
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


>> The main thing I'm missing with this is a coherent explanation of the
>> problem and how the changes proposed fix it.
> 
> Just to emphasize: the main concern here is that the issue is understood
> and that it's not just going to pop up again as soon as something
> changes.

Here are more details Mark.

<1. finish machine driver probe >
[  115.253970] bdw-rt5677 bdw-rt5677: rt5677-dspbuffer <-> 
spi-RT5677AA:00 mapping ok

<2. execute BE dailink .init() and request a gpiod from the codec 
component device>

[  115.254387] rt5677 i2c-RT5677CE:00: plb devm_gpiod_get
[  115.254390] rt5677 i2c-RT5677CE:00: GPIO lookup for consumer 
headphone-enable
[  115.254391] rt5677 i2c-RT5677CE:00: using ACPI for GPIO lookup
[  115.254395] acpi RT5677CE:00: GPIO: looking up headphone-enable-gpios
[  115.254399] acpi RT5677CE:00: GPIO: _DSD returned RT5677CE:00 4 0 0
[  115.254724] rt5677 i2c-RT5677CE:00: GPIO lookup for consumer plug-det
[  115.254725] rt5677 i2c-RT5677CE:00: using ACPI for GPIO lookup
[  115.254727] acpi RT5677CE:00: GPIO: looking up plug-det-gpios
[  115.254729] acpi RT5677CE:00: GPIO: _DSD returned RT5677CE:00 0 0 0
[  115.255451] rt5677 i2c-RT5677CE:00: GPIO lookup for consumer mic-present
[  115.255453] rt5677 i2c-RT5677CE:00: using ACPI for GPIO lookup
[  115.255455] acpi RT5677CE:00: GPIO: looking up mic-present-gpios
[  115.255458] acpi RT5677CE:00: GPIO: _DSD returned RT5677CE:00 1 0 0

<3. gpiod handling complete>

[  115.256293] bdw-rt5677 bdw-rt5677: rt5677-aif1 <-> ssp0-port mapping ok

<4. jack handling complete>
[  115.262040] input: sof-bdw-rt5677 Headphone Jack as 
/devices/pci0000:00/INT3438:00/bdw-rt5677/sound/card1/input11
[  115.262240] input: sof-bdw-rt5677 Mic Jack as 
/devices/pci0000:00/INT3438:00/bdw-rt5677/sound/card1/input12

<5. card fully functional>

<6. rmmod snd_sof-acpi>

<7. rmmod machine driver>

<8. rmmod codec driver>
rmmod: ERROR: Module snd_soc_rt5677 is in use

<9. rmmod -f codec driver>
[  194.118221] gpio gpiochip0: REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED
[  194.118440] rt5677 i2c-RT5677CE:00: plb devm_gpiod_release

So this is a self-inflicted deadlock - broken by design.

When the machine driver is removed, the gpiod is not freed.
Only removing the codec driver can free the gpiod, but the gpio/module 
refcount prevents the codec driver from being removed.

I don't know how to move all the gpio handling in the codec driver, 
since there are platform-dependent ACPI mappings.

The only proposal I can make is to avoid using devm_ but we need a hook 
to call gpiod_put().

using the add_dai_link()/remove_dai_link as I suggested earlier is not 
possible since the runtime is created after this callback is involved.

The proposal suggested by Andy was to have a dual callback to the 
init(), or as in my initial version to call gpiod_put() in the machine 
driver .remove() function, which isn't very elegant but does work.

I also tested a different solution (attached) based on your input where 
the gpiod handing is performed in the machine driver probe, after the 
card registration, and the gpiod_put() called from remove. This is 
simple enough but there might be some issues left with the jack/input 
handling - not sure why the logs for jacks are missing.

Does this clarify the issue and options?

Thanks
-Pierre



--------------B0C02CEEC349B224C28735E6
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-ASoC-Intel-bdw-rt5677-enable-module-removal.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-ASoC-Intel-bdw-rt5677-enable-module-removal.patch"

From a4cafa8950b624f894db2a6a88c837728c286f1b Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Thu, 5 Mar 2020 14:45:27 -0600
Subject: [PATCH] ASoC: Intel: bdw-rt5677: enable module removal

The mainline code currently prevents modules from being removed.

The BE dailink .init() function calls devm_gpiod_get() using the codec
component device as argument. When the machine driver is removed, the
references to the gpiod are not released, and it's not possible to
remove the codec driver module - which is the only entity which could
free the gpiod.

This conceptual deadlock can be avoided by invoking gpiod_get() after
the card registration , and calling gpiod_put() in the platform device
.remove() function.

This solution seems to work fine, with jack detection ok w/
PulseAudio, however the following log is no longer showing in dmesg.

[   13.790412] input: sof-bdw-rt5677 Headphone Jack as /devices/pci0000:00/INT3438:00/bdw-rt5677/sound/card1/input11
[   13.790865] input: sof-bdw-rt5677 Mic Jack as /devices/pci0000:00/INT3438:00/bdw-rt5677/sound/card1/input12

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/bdw-rt5677.c | 33 +++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index a94f498388e1..0be1dc60863e 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -247,8 +247,8 @@ static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
 			RT5677_CLK_SEL_SYS2);
 
 	/* Request rt5677 GPIO for headphone amp control */
-	bdw_rt5677->gpio_hp_en = devm_gpiod_get(component->dev, "headphone-enable",
-						GPIOD_OUT_LOW);
+	bdw_rt5677->gpio_hp_en = gpiod_get(component->dev, "headphone-enable",
+					   GPIOD_OUT_LOW);
 	if (IS_ERR(bdw_rt5677->gpio_hp_en)) {
 		dev_err(component->dev, "Can't find HP_AMP_SHDN_L gpio\n");
 		return PTR_ERR(bdw_rt5677->gpio_hp_en);
@@ -349,7 +349,6 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 		.ops = &bdw_rt5677_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
-		.init = bdw_rt5677_init,
 		SND_SOC_DAILINK_REG(ssp0_port, be, platform),
 	},
 };
@@ -399,6 +398,7 @@ static int bdw_rt5677_probe(struct platform_device *pdev)
 {
 	struct bdw_rt5677_priv *bdw_rt5677;
 	struct snd_soc_acpi_mach *mach;
+	struct snd_soc_pcm_runtime *rtd;
 	int ret;
 
 	bdw_rt5677_card.dev = &pdev->dev;
@@ -420,11 +420,36 @@ static int bdw_rt5677_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(&bdw_rt5677_card, bdw_rt5677);
 
-	return devm_snd_soc_register_card(&pdev->dev, &bdw_rt5677_card);
+	ret = devm_snd_soc_register_card(&pdev->dev, &bdw_rt5677_card);
+	if (ret)
+		return ret;
+
+	for_each_card_rtds(&bdw_rt5677_card, rtd) {
+		if (!strcmp(rtd->dai_link->name, "Codec") &&
+		    rtd->dai_link->no_pcm) {
+			ret = bdw_rt5677_init(rtd);
+			break;
+		}
+	}
+
+	return ret;
+}
+
+static int bdw_rt5677_remove(struct platform_device *pdev)
+{
+	struct bdw_rt5677_priv *bdw_rt5677;
+
+	bdw_rt5677 = snd_soc_card_get_drvdata(&bdw_rt5677_card);
+
+	if (bdw_rt5677->component)
+		gpiod_put(bdw_rt5677->gpio_hp_en);
+
+	return 0;
 }
 
 static struct platform_driver bdw_rt5677_audio = {
 	.probe = bdw_rt5677_probe,
+	.remove = bdw_rt5677_remove,
 	.driver = {
 		.name = "bdw-rt5677",
 	},
-- 
2.20.1


--------------B0C02CEEC349B224C28735E6--
