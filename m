Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 640854243E3
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 19:19:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ED52844;
	Wed,  6 Oct 2021 19:19:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ED52844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633540796;
	bh=KSvivipNuJhmN1W9fnQgKUV+97RH3cZgYngSCKlaTGw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tOyWSf5HrlI86GqC1FYYEJ9zdZ6lbK4z6JUslHsWNrHDeYhZ6ZD8PRplbDKU0t/Jj
	 cmKzHP8gDkC8hGG79c2hKn4oBXGqopCztn+8FqNUiCEVc6jAVJ8TGp/50qtVvn3KnQ
	 tmxTDg9l3SQ6x5BjRlpnJ3C9hFB2BbPiQ3HlZG+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 776B2F8010B;
	Wed,  6 Oct 2021 19:18:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEEE4F80240; Wed,  6 Oct 2021 19:18:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 070C7F8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 19:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 070C7F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="hEkYFlaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633540707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2PpmHn3PcyjjyynAoAMsgJjLIl1Zdj/mUP7+mmshxP8=;
 b=hEkYFlaz8TUINTPJUAPJ8lyRx4EfMWbxutwX4NcQ6HE3IvNhGM/LUgLCaiAbymtSuWmb7k
 zHteec/KFWIaQyRZZ8E8feTUJn0nATEq80LefWWEft3RqL/OHY8zW5KsslMuRU3uy6xJh0
 J/CaY2RLM+aaygyqkwngup/0DoWNzwM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-ysc5_goPOVCMGFLqCuLFcw-1; Wed, 06 Oct 2021 13:18:26 -0400
X-MC-Unique: ysc5_goPOVCMGFLqCuLFcw-1
Received: by mail-ed1-f71.google.com with SMTP id
 r11-20020aa7cfcb000000b003d4fbd652b9so1250480edy.14
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 10:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2PpmHn3PcyjjyynAoAMsgJjLIl1Zdj/mUP7+mmshxP8=;
 b=lKO6qEKEeFtxlEip6Dd37vAOa3P6oWNjDeHAzVltjh//cR/7iq/p26Zi+Yun3Scjde
 aIuECIpHZPaUm6swYeT96mcAZfTpQ9nRA4gb0C/2APYVBtu4Zk05a4oTKylgG9fqkvH4
 3BieBWwyMDki3duVEfUMqzv8+wF07wyIUA6tpffXEVgygtfcMoCbbFqR38D/qfs3dfzd
 /p8ZDd97lhj98y85gdF5O8vwc5+RhHsw6R4OcaEQoslY58f4Hf6c3fnKER1crSnoyIjV
 w5itVLvk7FPnSFlUZ7T0zUV/3+5HHa8/xQ9WHVTSrOdJ6Iyg4Z3Cjsqmus5e8H27qLZF
 cTBg==
X-Gm-Message-State: AOAM5302o2L4tO7flegEl/WpY0pFd4JPw7JwPNjNVE3qA6pybn6o0Saw
 VQ30GxfszSzHXdIBwb3IFXNbXnu5Sw7DVrKOkP/46UvLgL3OgiFq3pUkow1S9jBjIrXHpQ4PhVp
 akrRqrRaNEbTLVRoc9F1fMWg=
X-Received: by 2002:a17:907:a425:: with SMTP id
 sg37mr34568037ejc.131.1633540702840; 
 Wed, 06 Oct 2021 10:18:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1BvjDAZEMviJ4dEjLZD8gYS4yNLjwOSOq0r35Uy86+K/bHkQqHFeSH0onmswULd503o8E/w==
X-Received: by 2002:a17:907:a425:: with SMTP id
 sg37mr34567964ejc.131.1633540702365; 
 Wed, 06 Oct 2021 10:18:22 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id r19sm10293205edt.54.2021.10.06.10.18.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 10:18:18 -0700 (PDT)
Subject: Re: [PATCH 3/3] ASoC: Intel: sof_rt5682: use id_alt to enumerate
 rt5682s
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org,
 Bard liao <yung-chuan.liao@linux.intel.com>
References: <20211006161805.938950-1-brent.lu@intel.com>
 <20211006161805.938950-4-brent.lu@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <fdcdf447-352f-3dbc-f55d-b3bb3588dca3@redhat.com>
Date: Wed, 6 Oct 2021 19:18:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211006161805.938950-4-brent.lu@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Libin Yang <libin.yang@intel.com>,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Malik_Hsu <malik_hsu@wistron.corp-partner.google.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rander Wang <rander.wang@intel.com>,
 linux-kernel@vger.kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bard.liao@intel.com>, Paul Olaru <paul.olaru@oss.nxp.com>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Gongjun Song <gongjun.song@intel.com>,
 Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

Hi,

On 10/6/21 6:18 PM, Brent Lu wrote:
> Use the id_alt field to enumerate rt5682s headphone codec and remove
> redundant entries in tables.
> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>  sound/soc/intel/boards/sof_rt5682.c           | 30 -----------------
>  .../intel/common/soc-acpi-intel-adl-match.c   |  8 +++++
>  .../intel/common/soc-acpi-intel-byt-match.c   |  6 ++++
>  .../intel/common/soc-acpi-intel-cht-match.c   |  6 ++++
>  .../intel/common/soc-acpi-intel-cml-match.c   |  8 +++++
>  .../intel/common/soc-acpi-intel-icl-match.c   |  6 ++++
>  .../intel/common/soc-acpi-intel-jsl-match.c   | 32 +++++--------------
>  .../intel/common/soc-acpi-intel-tgl-match.c   |  8 +++++
>  8 files changed, 50 insertions(+), 54 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index 9f1e5ef11b13..9819345cd84c 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -1050,36 +1050,6 @@ static const struct platform_device_id board_ids[] = {
>  					SOF_RT5682_SSP_AMP(2) |
>  					SOF_RT5682_NUM_HDMIDEV(4)),
>  	},
> -	{
> -		.name = "jsl_rt5682s_rt1015",
> -		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
> -					SOF_RT5682_MCLK_24MHZ |
> -					SOF_RT5682_SSP_CODEC(0) |
> -					SOF_RT5682S_HEADPHONE_CODEC_PRESENT |
> -					SOF_SPEAKER_AMP_PRESENT |
> -					SOF_RT1015_SPEAKER_AMP_PRESENT |
> -					SOF_RT5682_SSP_AMP(1)),
> -	},
> -	{
> -		.name = "jsl_rt5682s_rt1015p",
> -		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
> -					SOF_RT5682_MCLK_24MHZ |
> -					SOF_RT5682_SSP_CODEC(0) |
> -					SOF_RT5682S_HEADPHONE_CODEC_PRESENT |
> -					SOF_SPEAKER_AMP_PRESENT |
> -					SOF_RT1015P_SPEAKER_AMP_PRESENT |
> -					SOF_RT5682_SSP_AMP(1)),
> -	},
> -	{
> -		.name = "jsl_rt5682s_mx98360",
> -		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
> -					SOF_RT5682_MCLK_24MHZ |
> -					SOF_RT5682_SSP_CODEC(0) |
> -					SOF_RT5682S_HEADPHONE_CODEC_PRESENT |
> -					SOF_SPEAKER_AMP_PRESENT |
> -					SOF_MAX98360A_SPEAKER_AMP_PRESENT |
> -					SOF_RT5682_SSP_AMP(1)),
> -	},
>  	{
>  		.name = "adl_mx98360_rt5682",
>  		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
> diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> index f5b21a95d222..9478e35bed38 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
> @@ -285,9 +285,15 @@ static const struct snd_soc_acpi_codecs adl_max98360a_amp = {
>  	.codecs = {"MX98360A"}
>  };
>  
> +static struct snd_soc_acpi_codecs adl_rt5682s_hp = {
> +	.num_codecs = 1,
> +	.codecs = {"RTL5682"}
> +};
> +
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &adl_rt5682s_hp,
>  		.drv_name = "adl_mx98373_rt5682",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &adl_max98373_amp,
> @@ -296,6 +302,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  	},
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &adl_rt5682s_hp,
>  		.drv_name = "adl_mx98357_rt5682",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &adl_max98357a_amp,
> @@ -304,6 +311,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
>  	},
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &adl_rt5682s_hp,
>  		.drv_name = "adl_mx98360_rt5682",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &adl_max98360a_amp,
> diff --git a/sound/soc/intel/common/soc-acpi-intel-byt-match.c b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
> index 510a5f38b7f1..8c66223d7401 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-byt-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-byt-match.c
> @@ -120,6 +120,11 @@ static struct snd_soc_acpi_mach *byt_quirk(void *arg)
>  	}
>  }
>  
> +static struct snd_soc_acpi_codecs rt5682s_hp = {
> +	.num_codecs = 1,
> +	.codecs = {"RTL5682"}
> +};
> +
>  struct snd_soc_acpi_mach  snd_soc_acpi_intel_baytrail_machines[] = {
>  	{
>  		.id = "10EC5640",
> @@ -196,6 +201,7 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_baytrail_machines[] = {
>  	},
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &rt5682s_hp,
>  		.drv_name = "sof_rt5682",
>  		.sof_fw_filename = "sof-byt.ri",
>  		.sof_tplg_filename = "sof-byt-rt5682.tplg",

So this is only useful if there actually are any BYT devices using the "RTL5682"
ACPI HID, the 100+ BYT/CHT DSDTs which I've gather over time say there aren't any.

Actually there also aren't any using the non alt "10EC5682" ACPI HID either...

Bard Liao, you added this in commit f70abd75b7c6 ("ASoC: Intel: add sof-rt5682 machine driver")
but I wonder how useful this is. I guess it may be available as (and tested on?) some dev-kit.

But I don't think there us any hardware out there in the wild using this ?





> diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> index 227424236fd5..6e52110897e9 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> @@ -51,6 +51,11 @@ static struct snd_soc_acpi_mach *cht_quirk(void *arg)
>  		return mach;
>  }
>  
> +static struct snd_soc_acpi_codecs rt5682s_hp = {
> +	.num_codecs = 1,
> +	.codecs = {"RTL5682"}
> +};
> +
>  /* Cherryview-based platforms: CherryTrail and Braswell */
>  struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
>  	{
> @@ -153,6 +158,7 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
>  	},
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &rt5682s_hp,
>  		.drv_name = "sof_rt5682",
>  		.sof_fw_filename = "sof-cht.ri",
>  		.sof_tplg_filename = "sof-cht-rt5682.tplg",

Same remark as for the BYT changes.

Regards,

Hans



> diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
> index b591c6fd13fd..ac93d77f47ff 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
> @@ -29,6 +29,11 @@ static struct snd_soc_acpi_codecs max98390_spk_codecs = {
>  	.codecs = {"MX98390"}
>  };
>  
> +static struct snd_soc_acpi_codecs rt5682s_hp = {
> +	.num_codecs = 1,
> +	.codecs = {"RTL5682"}
> +};
> +
>  /*
>   * The order of the three entries with .id = "10EC5682" matters
>   * here, because DSDT tables expose an ACPI HID for the MAX98357A
> @@ -45,6 +50,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
>  	},
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &rt5682s_hp,
>  		.drv_name = "cml_rt1015_rt5682",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &rt1015_spk_codecs,
> @@ -53,6 +59,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
>  	},
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &rt5682s_hp,
>  		.drv_name = "sof_rt5682",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &max98357a_spk_codecs,
> @@ -61,6 +68,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
>  	},
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &rt5682s_hp,
>  		.drv_name = "sof_rt5682",
>  		.sof_fw_filename = "sof-cml.ri",
>  		.sof_tplg_filename = "sof-cml-rt5682.tplg",
> diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
> index 768ed538c4ea..14430b969e6c 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
> @@ -14,6 +14,11 @@ static struct skl_machine_pdata icl_pdata = {
>  	.use_tplg_pcm = true,
>  };
>  
> +static struct snd_soc_acpi_codecs rt5682s_hp = {
> +	.num_codecs = 1,
> +	.codecs = {"RTL5682"}
> +};
> +
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[] = {
>  	{
>  		.id = "INT34C2",
> @@ -25,6 +30,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[] = {
>  	},
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &rt5682s_hp,
>  		.drv_name = "sof_rt5682",
>  		.sof_fw_filename = "sof-icl.ri",
>  		.sof_tplg_filename = "sof-icl-rt5682.tplg",
> diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
> index 20fd9dcc74af..4ffd91fd6862 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
> @@ -29,6 +29,11 @@ static struct snd_soc_acpi_codecs mx98360a_spk = {
>  	.codecs = {"MX98360A"}
>  };
>  
> +static struct snd_soc_acpi_codecs rt5682s_hp = {
> +	.num_codecs = 1,
> +	.codecs = {"RTL5682"}
> +};
> +
>  /*
>   * When adding new entry to the snd_soc_acpi_intel_jsl_machines array,
>   * use .quirk_data member to distinguish different machine driver,
> @@ -51,6 +56,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
>  	},
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &rt5682s_hp,
>  		.drv_name = "jsl_rt5682_rt1015",
>  		.sof_fw_filename = "sof-jsl.ri",
>  		.machine_quirk = snd_soc_acpi_codec_list,
> @@ -59,6 +65,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
>  	},
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &rt5682s_hp,
>  		.drv_name = "jsl_rt5682_rt1015p",
>  		.sof_fw_filename = "sof-jsl.ri",
>  		.machine_quirk = snd_soc_acpi_codec_list,
> @@ -67,6 +74,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
>  	},
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &rt5682s_hp,
>  		.drv_name = "jsl_rt5682_mx98360",
>  		.sof_fw_filename = "sof-jsl.ri",
>  		.machine_quirk = snd_soc_acpi_codec_list,
> @@ -81,30 +89,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
>  		.quirk_data = &mx98360a_spk,
>  		.sof_tplg_filename = "sof-jsl-cs42l42-mx98360a.tplg",
>  	},
> -	{
> -		.id = "RTL5682",
> -		.drv_name = "jsl_rt5682s_rt1015",
> -		.sof_fw_filename = "sof-jsl.ri",
> -		.machine_quirk = snd_soc_acpi_codec_list,
> -		.quirk_data = &rt1015_spk,
> -		.sof_tplg_filename = "sof-jsl-rt5682-rt1015.tplg",
> -	},
> -	{
> -		.id = "RTL5682",
> -		.drv_name = "jsl_rt5682s_rt1015p",
> -		.sof_fw_filename = "sof-jsl.ri",
> -		.machine_quirk = snd_soc_acpi_codec_list,
> -		.quirk_data = &rt1015p_spk,
> -		.sof_tplg_filename = "sof-jsl-rt5682-rt1015.tplg",
> -	},
> -	{
> -		.id = "RTL5682",
> -		.drv_name = "jsl_rt5682s_mx98360",
> -		.sof_fw_filename = "sof-jsl.ri",
> -		.machine_quirk = snd_soc_acpi_codec_list,
> -		.quirk_data = &mx98360a_spk,
> -		.sof_tplg_filename = "sof-jsl-rt5682-mx98360a.tplg",
> -	},
>  	{},
>  };
>  EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_jsl_machines);
> diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
> index 9d89f01d6b84..e65bd6db2850 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
> @@ -358,9 +358,15 @@ static const struct snd_soc_acpi_codecs tgl_rt1011_amp = {
>  	.codecs = {"10EC1011"}
>  };
>  
> +static struct snd_soc_acpi_codecs tgl_rt5682s_hp = {
> +	.num_codecs = 1,
> +	.codecs = {"RTL5682"}
> +};
> +
>  struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &tgl_rt5682s_hp,
>  		.drv_name = "tgl_mx98357_rt5682",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &tgl_codecs,
> @@ -369,6 +375,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
>  	},
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &tgl_rt5682s_hp,
>  		.drv_name = "tgl_mx98373_rt5682",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &tgl_max98373_amp,
> @@ -377,6 +384,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
>  	},
>  	{
>  		.id = "10EC5682",
> +		.id_alt = &tgl_rt5682s_hp,
>  		.drv_name = "tgl_rt1011_rt5682",
>  		.machine_quirk = snd_soc_acpi_codec_list,
>  		.quirk_data = &tgl_rt1011_amp,
> 

