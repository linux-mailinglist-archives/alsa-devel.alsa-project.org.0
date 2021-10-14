Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1E642D997
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 14:56:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BEDF166B;
	Thu, 14 Oct 2021 14:55:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BEDF166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634216186;
	bh=KLVihXuN/4HNU7Q5ajxepxbn0ijXvXXQST4Yb01anTg=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uYGj8h/BR0j3FDrEGviqOUivxfhUEgo0i3uunX7zlrgjsoYH6Mmj0IOGHhYUK7b8z
	 oL5yz8Bf1DY0n+sU/oQs67LetXhbVtK8cwy7zcLFYpyYu1Soy+ANnLBSFlHikI/vit
	 E3isAlBqRvrDVqQP1Qy8SR32aqqlZGCG0/Uki6qY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB6B2F80088;
	Thu, 14 Oct 2021 14:55:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC563F80212; Thu, 14 Oct 2021 14:55:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9BE2FF801D5
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 14:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BE2FF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="BKm3suzQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19EBh858000996; 
 Thu, 14 Oct 2021 07:54:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : from : to : subject : references : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=vP7bJm9B4s8fGFvrpvqBjyYpuL2p/BylfFDz6Bg7GEc=;
 b=BKm3suzQOHiOW69WBWu6DqHDDVxHzP2Dm6nz3T+7+wTQCqPeG+UvPTewLI0hpFhnXBs0
 vCERF5EMpDu3oFqpxdwRpD4oAm69jlEHhdAENZKyVk+xiPEzNnZBv9hlRp5xY5HCMl8l
 +uQm+i63s7V4wNaTc2kIYhA+y3LpxcrXGx+//SOeHsIzjywsGPC/eGXKHIn2kPdZfZQY
 s9uMNb+rEKJXBdX7+FsFSiCD+78xcr7zKd6ypZT/WaDtCUtfQ8SftrMaTuU2ZHXe0b1P
 I5if6b3xadgcNpclQb52YRlMNWynoRvRe3TMWoMfKYnO6tYljum18B1+DVRI5mvOY51K vA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3bpagt0ucx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 14 Oct 2021 07:54:56 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Thu, 14 Oct
 2021 13:54:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Thu, 14 Oct 2021 13:54:54 +0100
Received: from [198.61.65.163] (LONNB3K7533.ad.cirrus.com [198.61.65.163])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3738711CD;
 Thu, 14 Oct 2021 12:54:54 +0000 (UTC)
Message-ID: <3a0d3151-366a-8c3e-2598-f885d6b5fc7d@opensource.cirrus.com>
Date: Thu, 14 Oct 2021 13:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
From: <tanureal@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>, "Takashi
 Iwai" <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Len Brown
 <lenb@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, Liam Girdwood
 <lgirdwood@gmail.com>,
 Rafael J.Wysocki <rafael@kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-acpi@vger.kernel.org>, <patches@opensource.cirrus.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] sound: cs35l41: Add support for Legion 7 16ACHg6 laptop
References: <20211008111902.103473-1-tanureal@opensource.cirrus.com>
 <s5h4k9m0z9s.wl-tiwai@suse.de> <s5h5yu0yk8a.wl-tiwai@suse.de>
In-Reply-To: <s5h5yu0yk8a.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U_JYPV27qnYPayYVKlNK27KXsMv4oosW
X-Proofpoint-ORIG-GUID: U_JYPV27qnYPayYVKlNK27KXsMv4oosW
X-Proofpoint-Spam-Reason: safe
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

On 10/13/21 5:15 PM, Takashi Iwai <tiwai@suse.de> wrote:
> On Tue, 12 Oct 2021 22:22:07 +0200,
> Takashi Iwai wrote:
> >
> > On Fri, 08 Oct 2021 13:19:02 +0200,
> > Lucas Tanure wrote:
> >>
> >> Hi,
> >>
> >> I would like to get some guidance about this solution to
> >> support the 16ACHg6 laptop.
> >>
> >> Hardware:
> >>   - The 16ACHg6 laptop has two CS35L41 amplifiers, connected
> >> to Realtek ALC287 by an I2S bus and by and direct I2C to the CPU.
> >>   - The ALC287 codec is connected to the CPU by an HDA bus.
> >>   - The CS35L41 has a DSP which will require firmware to be loaded.
> >>
> >> Architecture:
> >>   - To load the firmware for CS35L41, this solution will require
> >> the wm_adsp library, which requires regmap, header definitions and
> >> register tables.
> >>   - To minimize the duplication of the code, the HDA functions will
> >> be placed inside the ASoC CS35L41 driver.
> >>   - Finally, HDA patch_realtek will access exposed functions from
> >> ASoC CS35L41 driver to initialize the amplifiers, start and stop
> >> streams and load firmware.
> >
> > Through a very quick glance, a potential problem is that this design
> > would make the HD-audio codec driver dependent on those other ASoC
> > ones.  As the Realtek HD-audio codec driver is used by quite many
> > other people, we'd like to reduce such dependency mess.
> >
> > Maybe a dynamic binding with component framework can be used?
> >
> > Alternatively, we may build up a stuff on top of ASoC like what SOF
> > driver did.  It'll be another lot of work, though.
> 
> Or, yet another (and easier) alternative would be to create a new
> codec driver that is specific to vendor+subsystem pair.  We'll need to
> extend the hda_device_id and its matching mechanism, and the realtek
> codec driver needs to exclude the matching with the given SSID
> explicitly.
> 
> A patch below is an example.
> 
> 
> Takashi
> 
> ---
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index ae2e75d15b21..5558f2ba2fcf 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -248,6 +248,7 @@ struct serio_device_id {
>   
>   struct hda_device_id {
>   	__u32 vendor_id;
> +	__u32 subsystem_id;
>   	__u32 rev_id;
>   	__u8 api_version;
>   	const char *name;
> diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
> index 0e45963bb767..3e316a798361 100644
> --- a/include/sound/hda_codec.h
> +++ b/include/sound/hda_codec.h
> @@ -79,10 +79,12 @@ typedef int (*hda_codec_patch_t)(struct hda_codec *);
>   #define HDA_CODEC_ID_GENERIC_HDMI	0x00000101
>   #define HDA_CODEC_ID_GENERIC		0x00000201
>   
> -#define HDA_CODEC_REV_ENTRY(_vid, _rev, _name, _patch) \
> -	{ .vendor_id = (_vid), .rev_id = (_rev), .name = (_name), \
> -	  .api_version = HDA_DEV_LEGACY, \
> +#define HDA_CODEC_FULL_ENTRY(_vid, _subsystem, _rev, _name, _patch) \
> +	{ .vendor_id = (_vid), .subsystem_id = (_subsystem), .rev_id = (_rev), \
> +	  .name = (_name), .api_version = HDA_DEV_LEGACY, \
>   	  .driver_data = (unsigned long)(_patch) }
> +#define HDA_CODEC_REV_ENTRY(_vid, _rev, _name, _patch) \
> +	HDA_CODEC_FULL_ENTRY(_vid, 0, _rev, _name, _patch)
>   #define HDA_CODEC_ENTRY(_vid, _name, _patch) \
>   	HDA_CODEC_REV_ENTRY(_vid, 0, _name, _patch)
>   
> diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
> index cc3625617a0e..641b4f9bb2be 100644
> --- a/scripts/mod/devicetable-offsets.c
> +++ b/scripts/mod/devicetable-offsets.c
> @@ -211,6 +211,7 @@ int main(void)
>   
>   	DEVID(hda_device_id);
>   	DEVID_FIELD(hda_device_id, vendor_id);
> +	DEVID_FIELD(hda_device_id, subsystem_id);
>   	DEVID_FIELD(hda_device_id, rev_id);
>   	DEVID_FIELD(hda_device_id, api_version);
>   
> diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> index 49aba862073e..d8faf0065c95 100644
> --- a/scripts/mod/file2alias.c
> +++ b/scripts/mod/file2alias.c
> @@ -1255,15 +1255,17 @@ static int do_ulpi_entry(const char *filename, void *symval,
>   	return 1;
>   }
>   
> -/* Looks like: hdaudio:vNrNaN */
> +/* Looks like: hdaudio:vNsNrNaN */
>   static int do_hda_entry(const char *filename, void *symval, char *alias)
>   {
>   	DEF_FIELD(symval, hda_device_id, vendor_id);
> +	DEF_FIELD(symval, hda_device_id, subsystem_id);
>   	DEF_FIELD(symval, hda_device_id, rev_id);
>   	DEF_FIELD(symval, hda_device_id, api_version);
>   
>   	strcpy(alias, "hdaudio:");
>   	ADD(alias, "v", vendor_id != 0, vendor_id);
> +	ADD(alias, "s", subsystem_id != 0, subsystem_id);
>   	ADD(alias, "r", rev_id != 0, rev_id);
>   	ADD(alias, "a", api_version != 0, api_version);
>   
> diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
> index 3e9e9ac804f6..662abd40ca6a 100644
> --- a/sound/hda/hdac_device.c
> +++ b/sound/hda/hdac_device.c
> @@ -206,8 +206,9 @@ EXPORT_SYMBOL_GPL(snd_hdac_device_set_chip_name);
>    */
>   int snd_hdac_codec_modalias(struct hdac_device *codec, char *buf, size_t size)
>   {
> -	return scnprintf(buf, size, "hdaudio:v%08Xr%08Xa%02X\n",
> -			codec->vendor_id, codec->revision_id, codec->type);
> +	return scnprintf(buf, size, "hdaudio:v%08Xs%08Xr%08Xa%02X\n",
> +			 codec->vendor_id, codec->subsystem_id,
> +			 codec->revision_id, codec->type);
>   }
>   EXPORT_SYMBOL_GPL(snd_hdac_codec_modalias);
>   
> diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
> index b8fa682ce66a..9f559773bf99 100644
> --- a/sound/pci/hda/Makefile
> +++ b/sound/pci/hda/Makefile
> @@ -15,6 +15,7 @@ CFLAGS_hda_intel.o := -I$(src)
>   
>   snd-hda-codec-generic-objs :=	hda_generic.o
>   snd-hda-codec-realtek-objs :=	patch_realtek.o
> +snd-hda-codec-test-objs :=	patch_test.o
>   snd-hda-codec-cmedia-objs :=	patch_cmedia.o
>   snd-hda-codec-analog-objs :=	patch_analog.o
>   snd-hda-codec-idt-objs :=	patch_sigmatel.o
> @@ -32,7 +33,7 @@ obj-$(CONFIG_SND_HDA) := snd-hda-codec.o
>   
>   # codec drivers
>   obj-$(CONFIG_SND_HDA_GENERIC) += snd-hda-codec-generic.o
> -obj-$(CONFIG_SND_HDA_CODEC_REALTEK) += snd-hda-codec-realtek.o
> +obj-$(CONFIG_SND_HDA_CODEC_REALTEK) += snd-hda-codec-realtek.o snd-hda-codec-test.o
>   obj-$(CONFIG_SND_HDA_CODEC_CMEDIA) += snd-hda-codec-cmedia.o
>   obj-$(CONFIG_SND_HDA_CODEC_ANALOG) += snd-hda-codec-analog.o
>   obj-$(CONFIG_SND_HDA_CODEC_SIGMATEL) += snd-hda-codec-idt.o
> diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
> index 1c8bffc3eec6..367f220ec91e 100644
> --- a/sound/pci/hda/hda_bind.c
> +++ b/sound/pci/hda/hda_bind.c
> @@ -200,7 +200,7 @@ static inline bool codec_probed(struct hda_codec *codec)
>   static void request_codec_module(struct hda_codec *codec)
>   {
>   #ifdef MODULE
> -	char modalias[32];
> +	char modalias[64];
>   	const char *mod = NULL;
>   
>   	switch (codec->probe_id) {
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 22d27b12c4e7..993b49554457 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -16,6 +16,7 @@
>   #include <linux/pci.h>
>   #include <linux/dmi.h>
>   #include <linux/module.h>
> +#include <linux/export.h>
>   #include <linux/input.h>
>   #include <linux/leds.h>
>   #include <sound/core.h>
> @@ -9510,7 +9511,7 @@ static void alc269_fill_coef(struct hda_codec *codec)
>   
>   /*
>    */
> -static int patch_alc269(struct hda_codec *codec)
> +int snd_hda_codec_realtek_alc269_probe(struct hda_codec *codec)
>   {
>   	struct alc_spec *spec;
>   	int err;
> @@ -9667,6 +9668,9 @@ static int patch_alc269(struct hda_codec *codec)
>   
>   	alc_pre_init(codec);
>   
> +	if (codec->fixup_id != HDA_FIXUP_ID_NOT_SET)
> +		goto skip_pick_fixup;
> +
>   	snd_hda_pick_fixup(codec, alc269_fixup_models,
>   		       alc269_fixup_tbl, alc269_fixups);
>   	/* FIXME: both TX300 and ROG Strix G17 have the same SSID, and
> @@ -9683,6 +9687,8 @@ static int patch_alc269(struct hda_codec *codec)
>   	snd_hda_pick_pin_fixup(codec, alc269_fallback_pin_fixup_tbl, alc269_fixups, false);
>   	snd_hda_pick_fixup(codec, NULL,	alc269_fixup_vendor_tbl,
>   			   alc269_fixups);
> +
> + skip_pick_fixup:
>   	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
>   
>   	alc_auto_parse_customize_define(codec);
> @@ -9709,6 +9715,18 @@ static int patch_alc269(struct hda_codec *codec)
>   	alc_free(codec);
>   	return err;
>   }
> +EXPORT_SYMBOL(snd_hda_codec_realtek_alc269_probe);
> +
> +static int patch_alc269(struct hda_codec *codec)
> +{
> +	if (codec->core.vendor_id == 0x10ec0298 &&
> +	    codec->core.subsystem_id == 0x102806e5) {
> +		pr_info("XXX realtek codec driver: skipping\n");
> +		return -ENODEV;
> +	}
> +
> +	return snd_hda_codec_realtek_alc269_probe(codec);
> +}
>   
>   /*
>    * ALC861
> diff --git a/sound/pci/hda/patch_test.c b/sound/pci/hda/patch_test.c
> new file mode 100644
> index 000000000000..9070cc075af0
> --- /dev/null
> +++ b/sound/pci/hda/patch_test.c
> @@ -0,0 +1,31 @@
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <sound/core.h>
> +#include <sound/hda_codec.h>
> +
> +int snd_hda_codec_realtek_alc269_probe(struct hda_codec *codec);
> +
> +// static const struct hda_fixup test_fixup = { ... };
> +
> +static int test_probe(struct hda_codec *codec)
> +{
> +	pr_info("XXX forked driver\n");
> +	// codec->fixup_id = 0;
> +	// codec->fixup_list = &test_fixup;
> +	return snd_hda_codec_realtek_alc269_probe(codec);
> +}
> +
> +static const struct hda_device_id snd_hda_id_test[] = {
> +	HDA_CODEC_FULL_ENTRY(0x10ec0298, 0x102806e5, 0, test_probe),
> +	{} /* terminator */
> +};
> +MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_test);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Test HD-audio codec");
> +
> +static struct hda_codec_driver test_driver = {
> +	.id = snd_hda_id_test,
> +};
> +
> +module_hda_codec_driver(test_driver);
> 
> 
We need the Realtek for the I2S of cs35l41, the audio goes from CPU to Realtek then cs35l41. So we don't want to skip realtek initializations and functions.
I am finishing a second version that I will send soon.

Thanks
Lucas
