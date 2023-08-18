Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F7178106C
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 18:32:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A626DE92;
	Fri, 18 Aug 2023 18:32:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A626DE92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692376373;
	bh=SmKn4Iw5cq/477HRxNHLvymk733vwuosXcwGbLN9Q7I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uB23zX6+13cPQ8Z3/1g7kxbIY33uWY7ObK8ZHMvpROy0eQ9M6zkLmaLfkcZSWoOcn
	 gON0lozDYMdO3ffOroIzOlNoR6EPKc8uZ41J4FrjIj7sOuL2YLNtnfM7jf4oUOgIcO
	 1vvTS8gH1qbeYAoekYJj/Pgy+20dM/aMiN/KUBfg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B13EFF80558; Fri, 18 Aug 2023 18:31:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 299F7F80536;
	Fri, 18 Aug 2023 18:31:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F6D5F80549; Fri, 18 Aug 2023 18:31:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B6D5F80510
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 18:31:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B6D5F80510
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hfK/goM7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692376275; x=1723912275;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SmKn4Iw5cq/477HRxNHLvymk733vwuosXcwGbLN9Q7I=;
  b=hfK/goM7lO4E4/EyKkjcFaFu55WWCmYWopkkAbDYXK9hLUz6sFMUxhO3
   wNj7f+LAtDSWB/OYeh5rwLBdoeaVl1p/WrJVDVxXXL9lz3q59TN5rznaR
   JVGup8yoEHTFwkvh+jA58WxihMFD3oM8d0jIpRAtB7JeaCyjT8/88TrQ+
   MlqEgQQdSElUieP3JP6b3fwjKTbs1cCHVSU8Dvj9f+CRyZ/I/OZgZfs+Y
   Prl2L7ItDBC6C+JUNG/Jr8K3XIiK++gvpkUJM06/KSyoxHwXrVjPw2SB8
   7RLuhmItHM5Gg+Em4o1rINVn2B2Srwcaye6Hew1yutCQgKLvPxtEUl+ZI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="370598191"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="370598191"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 09:31:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728648300"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="728648300"
Received: from enewberr-mobl.amr.corp.intel.com (HELO [10.212.37.100])
 ([10.212.37.100])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 09:31:09 -0700
Message-ID: <4c1b44b5-995a-fac7-a72b-89b8bf816dd2@linux.intel.com>
Date: Fri, 18 Aug 2023 11:00:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/2] ALSA: hda/tas2781: Add tas2781 HDA driver
Content-Language: en-US
To: Shenghao Ding <shenghao-ding@ti.com>, tiwai@suse.de
Cc: robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz, kevin-lu@ti.com,
 13916275206@139.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
 mengdong.lin@intel.com, baojun.xu@ti.com, thomas.gfeller@q-drop.com,
 peeyush@ti.com, navada@ti.com, broonie@kernel.org, gentuser@gmail.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230818085558.1431-1-shenghao-ding@ti.com>
 <20230818085558.1431-2-shenghao-ding@ti.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230818085558.1431-2-shenghao-ding@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Q4UWKRLRUAAA65UJNKV4RKQLISSOV54J
X-Message-ID-Hash: Q4UWKRLRUAAA65UJNKV4RKQLISSOV54J
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4UWKRLRUAAA65UJNKV4RKQLISSOV54J/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The first patch in this series has the same commit title as the second
one, can this be updated with a more meaningful description of the two
patches?


> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 44fccfb93cff..ba1b02ed184a 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -6721,7 +6721,7 @@ static void comp_generic_playback_hook(struct hda_pcm_stream *hinfo, struct hda_
>  	}
>  }
>  
> -struct cs35l41_dev_name {
> +struct scodec_dev_name {

you are changing things in patch_realtek.c that are completely unrelated
to the tas2781, usually the recommendation is that the changes have to
be part of a different patch so that the real addition of tas2781 parts
are easier to review.

>  	const char *bus;
>  	const char *hid;
>  	int index;
> @@ -6730,7 +6730,7 @@ struct cs35l41_dev_name {
>  /* match the device name in a slightly relaxed manner */
>  static int comp_match_cs35l41_dev_name(struct device *dev, void *data)
>  {
> -	struct cs35l41_dev_name *p = data;
> +	struct scodec_dev_name *p = data;
>  	const char *d = dev_name(dev);
>  	int n = strlen(p->bus);
>  	char tmp[32];
> @@ -6746,12 +6746,32 @@ static int comp_match_cs35l41_dev_name(struct device *dev, void *data)
>  	return !strcmp(d + n, tmp);
>  }
>  
> +static int comp_match_tas2781_dev_name(struct device *dev,
> +	void *data)
> +{
> +	struct scodec_dev_name *p = data;
> +	const char *d = dev_name(dev);
> +	int n = strlen(p->bus);
> +	char tmp[32];
> +
> +	/* check the bus name */
> +	if (strncmp(d, p->bus, n))
> +		return 0;
> +	/* skip the bus number */
> +	if (isdigit(d[n]))
> +		n++;
> +	/* the rest must be exact matching */
> +	snprintf(tmp, sizeof(tmp), "-%s:00", p->hid);

ACPI can sometimes add :01 suffixes, this looks like the re-invention of
an ACPI helper?

Adding Andy for the ACPI review.

> +
> +	return !strcmp(d + n, tmp);
> +}
> +
>  static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char *bus,
>  				  const char *hid, int count)
>  {
>  	struct device *dev = hda_codec_dev(cdc);
>  	struct alc_spec *spec = cdc->spec;
> -	struct cs35l41_dev_name *rec;
> +	struct scodec_dev_name *rec;
>  	int ret, i;
>  
>  	switch (action) {
> @@ -6779,6 +6799,41 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
>  	}
>  }
>  
> +static void tas2781_generic_fixup(struct hda_codec *cdc, int action,
> +	const char *bus, const char *hid)
> +{
> +	struct device *dev = hda_codec_dev(cdc);
> +	struct alc_spec *spec = cdc->spec;
> +	struct scodec_dev_name *rec;
> +	int ret;
> +
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		rec = devm_kmalloc(dev, sizeof(*rec), GFP_KERNEL);
> +		if (!rec)
> +			return;
> +		rec->bus = bus;
> +		rec->hid = hid;
> +		rec->index = 0;
> +		spec->comps[0].codec = cdc;
> +		component_match_add(dev, &spec->match,
> +			comp_match_tas2781_dev_name, rec);
> +		ret = component_master_add_with_match(dev, &comp_master_ops,
> +			spec->match);
> +		if (ret)
> +			codec_err(cdc,
> +				"Fail to register component aggregator %d\n",
> +				ret);
> +		else
> +			spec->gen.pcm_playback_hook =
> +				comp_generic_playback_hook;
> +		break;
> +	case HDA_FIXUP_ACT_FREE:

This is the first use of FIXUP_ACT_FREE in this function, is this
required/intentional?

> +		component_master_del(dev, &comp_master_ops);

Also is there a need to test that the PRE_PROBE actually worked?

> +		break;
> +	}
> +}
> +
>  static void cs35l41_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
>  {
>  	cs35l41_generic_fixup(cdc, action, "i2c", "CSC3551", 2);
> @@ -6806,6 +6861,12 @@ static void alc287_fixup_legion_16ithg6_speakers(struct hda_codec *cdc, const st
>  	cs35l41_generic_fixup(cdc, action, "i2c", "CLSA0101", 2);
>  }
>  
> +static void tas2781_fixup_i2c(struct hda_codec *cdc,
> +	const struct hda_fixup *fix, int action)
> +{
> +	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");

TI ACPI ID is TXNW

https://uefi.org/ACPI_ID_List?search=TEXAS

There's also a PNP ID PXN

https://uefi.org/PNP_ID_List?search=TEXAS

"TIAS" looks like an invented identifier. It's not uncommon but should
be recorded with a comment if I am not mistaken.


> +}
> +
>  /* for alc295_fixup_hp_top_speakers */
>  #include "hp_x360_helper.c"
>  
> @@ -7231,6 +7292,7 @@ enum {
>  	ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS,
>  	ALC236_FIXUP_DELL_DUAL_CODECS,
>  	ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
> +	ALC287_FIXUP_TAS2781_I2C,
>  };
>  
>  /* A special fixup for Lenovo C940 and Yoga Duet 7;
> @@ -9309,6 +9371,12 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.chained = true,
>  		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,
>  	},
> +	[ALC287_FIXUP_TAS2781_I2C] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = tas2781_fixup_i2c,
> +		.chained = true,
> +		.chain_id = ALC269_FIXUP_THINKPAD_ACPI,

If this is part of the THINKPAD chain, should this fixup name also refer
to THINKPAD, as e.g. ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI
