Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AFCABAC1E
	for <lists+alsa-devel@lfdr.de>; Sat, 17 May 2025 21:33:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F1A601B5;
	Sat, 17 May 2025 21:33:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F1A601B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747510400;
	bh=Al2UAX0yVlDSqfhWQy4LbPCkfkyi5Y7PqmZmYE4CGro=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=fxpZos4RJw8r+dR6EA56Ix3W/Wf941BKhQ42JvkaNKMd9UTdFZQX3GCnaDbLjP5Cn
	 FI1Ttw4SfFkJLI6QEgk8iJ93tvDwsurdIObBA5xvHprY3V7t2R8WRyal/TzQZmOnj3
	 kk9a6650Qmu2Bog7wEwZuprb03vj9kMdlVLPEwnQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F23C2F80527; Sat, 17 May 2025 21:32:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E78C3F80527;
	Sat, 17 May 2025 21:32:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F7E2F8027B; Sat, 17 May 2025 21:32:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BA8BF80134
	for <alsa-devel@alsa-project.org>; Sat, 17 May 2025 21:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BA8BF80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=metafoo.de header.i=@metafoo.de header.a=rsa-sha256
 header.s=default2002 header.b=egoOuGZG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de;
	s=default2002; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vVxQXp3L/odmsar09qdXjQYbAHOmFa9J56tEu0sozK0=; b=egoOuGZG2ET+UgaJrMoAdsLYgQ
	8lVGtOvpEKYPjb50s5GLFkjVphCQATDT+cnEyDMi9008tLjNMpxzrC08lx/NkZz+M3gqnkFwIH5OE
	7qK5vc+YTvcHKgmWV4NK6Em5nBQoMzVeoAu5tpvCTlEHHmtau5r8NazQbZR4r/13NxQbk0MRAGQ1s
	EsSYZIdE0MC01JMcfie1ONT6SceURah9aDaH60ejGq8gl84vAPITQ1o148pIVfXCOJFzD/Jb5ZP3W
	t2kCFT2Bw8RVRHO4430JDfMEtC3wWzJY+1Dj4/hdaDL5jvd/2Lob2xZghC66ogXP3ixV9TvmLKSvw
	pZZ64OsA==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www381.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <lars@metafoo.de>)
	id 1uGNGx-0005GW-2P;
	Sat, 17 May 2025 21:32:39 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls
 TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lars@metafoo.de>)
	id 1uGNGx-000GbK-0n;
	Sat, 17 May 2025 21:32:39 +0200
Message-ID: <f278f7cf-dc78-4fac-b27d-2a7fbce08b62@metafoo.de>
Date: Sat, 17 May 2025 12:32:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Request for help: How to upgrade a sound driver from kernel 4.14
 to 6.6
To: Steve Broshar <steve@palmerwirelessmedtech.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: 
 <IA1PR15MB6008974A825847331B10762BB593A@IA1PR15MB6008.namprd15.prod.outlook.com>
Content-Language: en-US
From: Lars-Peter Clausen <lars@metafoo.de>
In-Reply-To: 
 <IA1PR15MB6008974A825847331B10762BB593A@IA1PR15MB6008.namprd15.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 1.0.7/27640/Sat May 17 10:34:06 2025)
Message-ID-Hash: 6LEDRJBL4J4AIQJ4DSZAIIWJQK4PO3YO
X-Message-ID-Hash: 6LEDRJBL4J4AIQJ4DSZAIIWJQK4PO3YO
X-MailFrom: lars@metafoo.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6LEDRJBL4J4AIQJ4DSZAIIWJQK4PO3YO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/16/25 12:50, Steve Broshar wrote:
> I have an audio driver/module that builds for kernel 4.14, but not for 6.6 due to changes in the kernel API.I find that API types (structs) and functions have been removed or changed, but IDK how to modify my code to use the updated API. Further, some of the changes seem less than clean. For example, in a couple places struct fields have been removed, but comments that used to precede the fields are still there such the comments are clearly no longer relevant and are therefore confusing. I have to wonder how many comments are out-of-date.
>
> My ask is for help fixing my code. I don't expect you to fix directly, but I need to know how to go about figuring out how to fix it. What changed in the API? Is there an upgrade guide/info?
>
> I am going to include more than a little info. I realize that it might be overwhelming. But, I fear that I try to reduce the info too much it will not convey the relevant context.
>
> I'll start with my analysis of my compiler errors that I get.
> 	Seems that the struct snd_soc_codec and struct snd_soc_codec_driver were removed.
> 	Seems that snd_soc_register_codec() and snd_soc_unregister_codec() were removed.
> What replaces these things? What do I need to change to accommodate the removal of these?

Hi,

snd_soc_codec was replaced with snd_soc_component, most of the API 
translate 1to1. Here try this, see if it works 
https://chatgpt.com/share/6828e403-d564-8008-b2a4-42c76475a3a4



>
> FYI, here are my compiler errors:
>
> <build-errors>
> $ make -C ../../.. M=$PWD
> make: Entering directory '/home/steve/code/compton-kernel'
>    CC [M]  /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.o
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:110:38: warning: 'struct snd_soc_codec' declared inside parameter list will not be visible outside of this definition or declaration
>    110 | static int codec_driver_probe(struct snd_soc_codec *codec)
>        |                                      ^~~~~~~~~~~~~
> In file included from ./include/linux/device.h:15,
>                   from ./include/linux/platform_device.h:13,
>                   from ./include/linux/of_device.h:5,
>                   from /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:7:
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: In function 'codec_driver_probe':
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:112:19: error: invalid use of undefined type 'struct snd_soc_codec'
>    112 |     dev_info(codec->dev, "Entered %s", __func__);
>        |                   ^~
> ./include/linux/dev_printk.h:110:25: note: in definition of macro 'dev_printk_index_wrap'
>    110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>        |                         ^~~
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:112:5: note: in expansion of macro 'dev_info'
>    112 |     dev_info(codec->dev, "Entered %s", __func__);
>        |     ^~~~~~~~
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: At top level:
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:116:21: error: variable 'codec_driver' has initializer but incomplete type
>    116 | static const struct snd_soc_codec_driver codec_driver = {
>        |                     ^~~~~~~~~~~~~~~~~~~~
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:117:6: error: 'const struct snd_soc_codec_driver' has no member named 'probe'
>    117 |     .probe = codec_driver_probe,
>        |      ^~~~~
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:117:14: warning: excess elements in struct initializer
>    117 |     .probe = codec_driver_probe,
>        |              ^~~~~~~~~~~~~~~~~~
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:117:14: note: (near initialization for 'codec_driver')
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:6: error: 'const struct snd_soc_codec_driver' has no member named 'component_driver'
>    118 |     .component_driver = {
>        |      ^~~~~~~~~~~~~~~~
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:25: error: extra brace group at end of initializer
>    118 |     .component_driver = {
>        |                         ^
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:25: note: (near initialization for 'codec_driver')
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:25: warning: excess elements in struct initializer
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:118:25: note: (near initialization for 'codec_driver')
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: In function 'platform_driver_probe_':
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:153:12: error: implicit declaration of function 'snd_soc_register_codec'; did you mean 'snd_soc_register_dai'? [-Werror=implicit-function-declaration]
>    153 |     stat = snd_soc_register_codec(&pdev->dev, &codec_driver, &dai_driver, 1);
>        |            ^~~~~~~~~~~~~~~~~~~~~~
>        |            snd_soc_register_dai
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: In function 'platform_driver_remove':
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:166:5: error: implicit declaration of function 'snd_soc_unregister_codec'; did you mean 'snd_soc_unregister_dai'? [-Werror=implicit-function-declaration]
>    166 |     snd_soc_unregister_codec(&pdev->dev);
>        |     ^~~~~~~~~~~~~~~~~~~~~~~~
>        |     snd_soc_unregister_dai
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c: At top level:
> /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.c:116:42: error: storage size of 'codec_driver' isn't known
>    116 | static const struct snd_soc_codec_driver codec_driver = {
>        |                                          ^~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[2]: *** [scripts/Makefile.build:243: /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s/dep_i2s.o] Error 1
> make[1]: *** [/home/steve/code/compton-kernel/Makefile:1921: /home/steve/code/compton-kernel/drivers/compton/dep-imx8-i2s] Error 2
> make: *** [Makefile:234: __sub-make] Error 2
> make: Leaving directory '/home/steve/code/compton-kernel'
> </build-errors>
>
> My code (for 4.14 kernel)
> ---------------------------------
> Here's my driver code. The macro INCLUDE_PROBLEMATIC_CODE is used around each chuck that fails to compile. If not defined, the code does compile, but of course is missing important parts.
>
> <my-code>
> #define INCLUDE_PROBLEMATIC_CODE
> /*
>   * Audindate Dante Embedded Platform (DEP) I2S Codec (ALSA SoC) driver; Linux module
>   * Supports sample rates, bit depths and TDM modes for Dante devices.
>   */
> #include <linux/module.h>
> #include <linux/of_device.h>
> #include <linux/clk.h>
> #include <sound/soc.h>
> #include <sound/pcm.h>
> #include <linux/printk.h>
>
> #define DEP_I2S_PCM_RATES (SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 | \
>                         SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000 | \
>                         SNDRV_PCM_RATE_176400 | SNDRV_PCM_RATE_192000)
> #define DEP_I2S_PCM_FORMATS (   SNDRV_PCM_FMTBIT_S16_LE |  \
>                                  SNDRV_PCM_FMTBIT_S24_LE | \
>                                  SNDRV_PCM_FMTBIT_S32_LE )
>
> // for future use
> struct instance_state {
>      unsigned int dummy_holder;
> };
>
> static const struct snd_soc_dapm_widget widgets[] = {
>      SND_SOC_DAPM_DAC("DAC", "Playback", SND_SOC_NOPM, 0, 0),
>      SND_SOC_DAPM_ADC("ADC", "Capture", SND_SOC_NOPM, 0, 0),
>      SND_SOC_DAPM_OUTPUT("LINEVOUT"),
>      SND_SOC_DAPM_INPUT("LINEVIN"),
> };
>
> static const struct snd_soc_dapm_route routes[] = {
> 	{ "LINEVOUT", NULL, "DAC" },
> 	{ "ADC", NULL, "LINEVIN" },
> };
>
> static int set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> {
>      switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>          case SND_SOC_DAIFMT_I2S:
>              // supported
>              break;
>          case SND_SOC_DAIFMT_LEFT_J:
>              // supported
>              break;
>          default:
>              // all other formats unsupported
>              dev_err(dai->dev, "Invalid DAI format: DEP I2S only supports left justified and I2S, got 0x%04X", fmt);
>              return -EINVAL;
>      }
>
>      switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
>          // codec as bit master and frame master (or external clock generator)
>          // note that jumpers on DEP-EVK-IMX8 must be set correctly
>          case SND_SOC_DAIFMT_CBM_CFM:
>              // supported
>              break;
>          // codec as bit slave and frame slave (ie clocks driven from SOC)
>          case SND_SOC_DAIFMT_CBS_CFS:
>              // supported
>              break;
>          default:
>              // all others unsupported
>              dev_err(dai->dev, "Invalid DAI format: DEP I2S only supports CODEC as bit and frame clock master, got 0x%04X", fmt);
>              return -EINVAL;
>      }
>
>      switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
>          default:
>              // support bit and frame inversion
>              break;
>      }
>
>      dev_info(dai->dev, "Set fmt to %u", fmt);
>      return 0;
> }
>
> static struct snd_soc_dai_ops dep_i2s_dai_ops = {
>      .set_fmt = set_fmt,
>      // add mute here
> };
>
> struct snd_soc_dai_driver dai_driver = {
>      .name = "dep-i2s",
>      .playback = {
>          .stream_name = "Playback",
>          .channels_min = 1,
>          .channels_max = 16,
>          .rate_min = 44100,
>          .rate_max = 192000,
>          .rates = DEP_I2S_PCM_RATES,
>          .formats = DEP_I2S_PCM_FORMATS,
>      },
>      .capture = {
>          .stream_name = "Capture",
>          .channels_min = 1,
>          .channels_max = 16,
>          .rate_min = 44100,
>          .rate_max = 192000,
>          .rates = DEP_I2S_PCM_RATES,
>          .formats = DEP_I2S_PCM_FORMATS,
>      },
>      .ops = &dep_i2s_dai_ops,
>      .symmetric_rate = 1,
> };
>
> #ifdef INCLUDE_PROBLEMATIC_CODE
>
> // Dummy probe
> static int codec_driver_probe(struct snd_soc_codec *codec)
> {
>      dev_info(codec->dev, "Entered %s", __func__);
> 	return 0;
> }
>
> static const struct snd_soc_codec_driver codec_driver = {
>      .probe = codec_driver_probe,
>      .component_driver = {
> 		.dapm_widgets		= widgets,
> 		.num_dapm_widgets	= ARRAY_SIZE(widgets),
> 		.dapm_routes		= routes,
> 		.num_dapm_routes	= ARRAY_SIZE(routes),
> 	},
> };
>
> #endif
>
> #if defined(CONFIG_OF)
> static const struct of_device_id match_table[] = {
>      {.compatible = "audinate,dep_i2s"},
>      {}
> };
> MODULE_DEVICE_TABLE(of, match_table);
> #endif
>
> static int platform_driver_probe_(struct platform_device *pdev)
> {
>      dev_info(&pdev->dev, "Entered %s", __func__);
>
>      int stat = 0;
>
>      struct instance_state *instance_state = devm_kzalloc(&pdev->dev, sizeof(struct instance_state), GFP_KERNEL);
>      if (instance_state == NULL) {
>          return -ENOMEM;
>      }
>
>      platform_set_drvdata(pdev, instance_state);
>      
>      dev_info(&pdev->dev, "Codec probe pt 2");
>
> #ifdef INCLUDE_PROBLEMATIC_CODE
>      // 1 == number of DAIs, might need to be 2 for dual direction, or for 2* sai?
>      stat = snd_soc_register_codec(&pdev->dev, &codec_driver, &dai_driver, 1);
>      if (stat < 0) {
>          dev_err(&pdev->dev, "Failed to register codec: %d", stat);
>      }
> #endif
>
>      return stat;
> }
>
> static int platform_driver_remove(struct platform_device *pdev)
> {
>      dev_info(&pdev->dev, "Entered %s", __func__);
> #ifdef INCLUDE_PROBLEMATIC_CODE
>      snd_soc_unregister_codec(&pdev->dev);
> #endif
>      return 0;
> }
>
> static struct platform_driver platform_driver = {
>      .probe      = platform_driver_probe_,
>      .remove     = platform_driver_remove,
>      .driver     = {
>          .name   = "dep-i2s-codec",
>          .of_match_table = of_match_ptr(match_table),
>      },
> };
>
> module_platform_driver(platform_driver);
>
> MODULE_DESCRIPTION("Audinate DEP generic I2S ASoC codec");
> MODULE_AUTHOR("James Stuart <opensource@audinate.com>");
> MODULE_ALIAS("platform:dep-i2s-codec");
> MODULE_LICENSE("GPL");
> </my-code>
>
> Steve Broshar
> Palmer Wireless Medtech
>

