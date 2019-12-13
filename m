Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 027F511DEBF
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 08:39:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 897551764;
	Fri, 13 Dec 2019 08:38:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 897551764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576222750;
	bh=I+NYdOAAF/EgywMWjq78TAA1uymPWH6eGxL4oBmlp/A=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ah/Fgk3FDkN6L10SZWkiep3rSOLAxx2BPAfHVAs1Tv7iqkyaDmMZP6vcP4CSZjzVr
	 jkwix9SYgXfp9UP5AscMgib+/53oTx0vbsP/I/INCD/5Y9w3oFKUhwcbKfU7CndJ6E
	 hrDcIO9s19tWWkxNujQMcvJMNE3vA+SL7GtmTxbc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF2A1F8021E;
	Fri, 13 Dec 2019 08:37:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16BC1F801F4; Fri, 13 Dec 2019 08:37:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS,SURBL_BLOCKED,T_KAM_HTML_FONT_INVALID,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
 by alsa1.perex.cz (Postfix) with ESMTP id 5EB56F800AB
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 08:37:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EB56F800AB
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
 LIVER,40,3)
Received: from 192.168.8.45
 by mg.richtek.com with MailGates ESMTP Server V5.0(11228:0:AUTH_RELAY)
 (envelope-from <jeff_chang@richtek.com>); Fri, 13 Dec 2019 15:36:16 +0800 (CST)
Received: from ex1.rt.l (192.168.8.44) by ex2.rt.l (192.168.8.45) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Dec 2019 15:36:15 +0800
Received: from ex1.rt.l ([fe80::557d:30f0:a3f8:3efc]) by ex1.rt.l
 ([fe80::557d:30f0:a3f8:3efc%15]) with mapi id 15.00.1497.000; Fri, 13 Dec
 2019 15:36:15 +0800
From: =?iso-2022-jp?B?amVmZl9jaGFuZygbJEJEJUAkMkIbKEIp?=
 <jeff_chang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Jeff Chang <richtek.jeff.chang@gmail.com>
Thread-Topic: [PATCH] ASoC: Add MediaTek MT6660 Speaker Amp Driver
Thread-Index: AQHVsOVt/MvWyMS0RU6kROmZJiU4Tae2D+4AgAGWZxA=
Date: Fri, 13 Dec 2019 07:36:15 +0000
Message-ID: <b0f4c1afd1d341b49b87b7b5cda5ea4d@ex1.rt.l>
References: <1576152740-11979-1-git-send-email-richtek.jeff.chang@gmail.com>
 <20191212145330.GC4310@sirena.org.uk>
In-Reply-To: <20191212145330.GC4310@sirena.org.uk>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.95.168]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Add MediaTek MT6660 Speaker Amp
	Driver
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
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dear Mark:



        Thanks for your replying. I consider that there was only one item I should modify. So I kept resending.



        Please refer my red comment after your comment.



        Thanks a lot!



Thanks & BRs

Jeff





-----Original Message-----
From: Mark Brown [mailto:broonie@kernel.org]
Sent: Thursday, December 12, 2019 10:54 PM
To: Jeff Chang <richtek.jeff.chang@gmail.com>
Cc: lgirdwood@gmail.com; perex@perex.cz; tiwai@suse.com; matthias.bgg@gmail.com; alsa-devel@alsa-project.org; linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; jeff_chang(張世佳) <jeff_chang@richtek.com>
Subject: Re: [PATCH] ASoC: Add MediaTek MT6660 Speaker Amp Driver



On Thu, Dec 12, 2019 at 08:12:20PM +0800, Jeff Chang wrote:



> sense, which are able to be monitored via DATAO through proper

>

> ---

>

> [PATCH v2] :

>     1. remove unnecessary space from commit message

>     2. add Signed-off-by info

>

> Signed-off-by: Jeff Chang <richtek.jeff.chang@gmail.com<mailto:richtek.jeff.chang@gmail.com>>

> ---



You should place the Signed-off-by before the first --- as covered by submitting-patches.rst.  Please, slow down a bit before resending and make sure you've checked what you're doing thoroughly.  Look at what you're sending and how it compares to what others are sending.



        OK! I will do it at next patch!



> +config SND_SOC_MT6660

> +   tristate "Mediatek MT6660 Speaker Amplifier"

> +   depends on I2C

> +   select CRC32

> +   select CRYPTO_SHA256

> +   select CRYTO_RSA

> +   help



These selects of crypto stuf appear entirely unrelated to anything in the driver?



        I will remove it.



> +++ b/sound/soc/codecs/mt6660.c

> @@ -0,0 +1,1063 @@

> +// SPDX-License-Identifier: GPL-2.0

> +/*

> + * Copyright (c) 2019 MediaTek Inc.

> + */



Please make the entire comment a C++ one so things look more intentional.



        OK!



> +static int mt6660_dbg_io_write(void *drvdata, u16 reg,

> +                          const void *val, u16 size)

> +{

> +   struct mt6660_chip *chip = (struct mt6660_chip *)drvdata;

> +   int reg_size = mt6660_get_reg_size(reg);

> +   int i = 0;

> +   unsigned int regval = 0;

> +   u8 *_val = (u8 *)val;



This is duplicating standard regmap functionality.



> +static bool mt6660_volatile_reg(struct device *dev, unsigned int reg)

> +{

> +   return true;

> +}



There's no need to do this, there's no cache configured.



        OK!



> +static unsigned int mt6660_component_io_read(

> +   struct snd_soc_component *component, unsigned int reg) {

> +   struct mt6660_chip *chip = snd_soc_component_get_drvdata(component);

> +   unsigned int val;

> +   int ret;

> +

> +   ret = regmap_read(chip->regmap, reg, &val);

> +   if (ret < 0) /* ret success -> >= 0, fail -> < - */

> +           return ret;

> +   pr_err("%s val = 0x%x\n", __func__, val);

> +   return val;

> +}



This function appears to be redunddant, ASoC has wrappers for I/O on components, same for writes.



        OK!



> +static int data_debug_show(struct seq_file *s, void *data) {

> +   struct dbg_info *di = s->private;

> +   struct dbg_internal *d = &di->internal;



regmap has standard support for dumping the register map via debugfs, no need to write your own.  You should be able to just remove all the debugfs code.



> +/*

> + * MT6660 Generic Setting make this chip work normally.

> + * it is tuned by Richtek RDs.

> + */

> +static const struct codec_reg_val generic_reg_inits[] = {

> +   { MT6660_REG_WDT_CTRL, 0x80, 0x00 },

> +   { MT6660_REG_SPS_CTRL, 0x01, 0x00 },

> +   { MT6660_REG_AUDIO_IN2_SEL, 0x1c, 0x04 },



The writes to reserved registers should be fine but things like this which looks like it's configuring the input path should just be left at the chip default, we don't want to be configuring for particular boards since the same driver will be used for every board with the chip.



        The chip default cannot be modified anymore. How can I do if I really need write these setting in our drivers?



> +   { MT6660_REG_HPF1_COEF, 0xffffffff, 0x7fdb7ffe },

> +   { MT6660_REG_HPF2_COEF, 0xffffffff, 0x7fdb7ffe },



Similarly here.



> +static int mt6660_component_init_setting(struct snd_soc_component

> +*component) {

> +   int i, len, ret;

> +   const struct codec_reg_val *init_table;

> +

> +   pr_info("%s start\n", __func__);



These pr_info() calls are going to be too noisy.



        OK! I will remove it.



> +   switch (level) {

> +   case SND_SOC_BIAS_OFF:

> +           ret = regmap_read(chip->regmap, MT6660_REG_IRQ_STATUS1, &val);

> +           dev_info(component->dev,

> +                   "%s reg0x05 = 0x%x\n", __func__, val);

> +           break;



This is just making noise, it looks like there's nothing to do in this function at all and the above is only for debugging.  There's lots of these throughout the driver.



        It is prepare for more flexible using. Anyway, I will remove it.



> +static int mt6660_component_put_volsw(struct snd_kcontrol *kcontrol,

> +                             struct snd_ctl_elem_value *ucontrol) {

> +   struct snd_soc_component *component =

> +           snd_soc_kcontrol_component(kcontrol);

> +   int put_ret = 0;

> +

> +   pm_runtime_get_sync(component->dev);

> +   put_ret = snd_soc_put_volsw(kcontrol, ucontrol);

> +   if (put_ret < 0)

> +           return put_ret;

> +   pm_runtime_put(component->dev);

> +   return put_ret;

> +}



It would be *much* better to just use a register cache here rather than open code like this, and given that the device is suspended via the register map it is more than a little surprising that there's any need to do anything special here.



        Ok!

************* Email Confidentiality Notice ********************

The information contained in this e-mail message (including any attachments) may be confidential, proprietary, privileged, or otherwise exempt from disclosure under applicable laws. It is intended to be conveyed only to the designated recipient(s). Any use, dissemination, distribution, printing, retaining or copying of this e-mail (including its attachments) by unintended recipient(s) is strictly prohibited and may be unlawful. If you are not an intended recipient of this e-mail, or believe that you have received this e-mail in error, please notify the sender immediately (by replying to this e-mail), delete any and all copies of this e-mail (including any attachments) from your system, and do not disclose the content of this e-mail to any other person. Thank you!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
