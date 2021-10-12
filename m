Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1E2429D1D
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Oct 2021 07:27:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2114215E5;
	Tue, 12 Oct 2021 07:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2114215E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634016474;
	bh=ZL95kyWAwwIoonSsSpwDhlpoVlBG7W5v2VMA5YZcwVg=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B9POUDnvyWRA7a2R+3Axk7arUAYq2bgPnmsciT1mNN6WbhgTdv1orz6M9jyoN35e1
	 ukZzX8iZXOvKflETju7Ax7Qgfl+G8xStWeVJMNWjc9DJu0LoGzlfEnaypj2uhpUNyT
	 lmi6fLNdeXjiDhhfBoFDJPdnqJs+JTYaODvaZhxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71F6EF80245;
	Tue, 12 Oct 2021 07:26:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F211F80212; Tue, 12 Oct 2021 07:26:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E527BF80083
 for <alsa-devel@alsa-project.org>; Tue, 12 Oct 2021 07:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E527BF80083
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="250439581"
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; d="scan'208";a="250439581"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 22:26:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,366,1624345200"; d="scan'208";a="625805245"
Received: from anicol1x-mobl.ger.corp.intel.com (HELO [10.249.40.213])
 ([10.249.40.213])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 22:26:18 -0700
Message-ID: <e18ce962-736c-ea17-5ac2-1330026cdc90@linux.intel.com>
Date: Tue, 12 Oct 2021 08:26:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3] ASoC: rt1011: Fix 'I2S Reference' enum control caused
 error
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org, jack.yu@realtek.com,
 oder_chiou@realtek.com
References: <20211011144518.2518-1-peter.ujfalusi@linux.intel.com>
In-Reply-To: <20211011144518.2518-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 seppo.ingalsuo@linux.intel.com
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

On 11/10/2021 17:45, Peter Ujfalusi wrote:
> Access to 'I2S Reference' enum causes alsamixer to fail to load:
> $ alsamixer
> cannot load mixer controls: Invalid argument
> 
> cml_rt1011_rt5682 cml_rt1011_rt5682: control 2:0:0:TL I2S Reference:0: access overflow
> 
> The reason is that the original patch adding the code was using
> ucontrol->value.integer.value[0]
> instead the correct
> ucontrol->value.enumerated.item[0]
> 
> for an ENUM control.
> 
> Fixes: 87f40af26c262 ("ASoC: rt1011: add i2s reference control for rt1011")
> Reported-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
> Hi,
> 
> Changes since v2:
> - Fix typo in commit message s/Is@/I2S
> 
> Changes since v1:
> - Correct the ENUM declaration as well

After a third look, 87f40af26c262 appears mostly a broken patch, it will
take a bit more patching to get it right.

I will send a new version with different subject to fix it, or it can be
reverted (yes, it is that broken).


> Regards,
> Peter
>  sound/soc/codecs/rt1011.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
> index 508597866dff..bdfcbb81fa19 100644
> --- a/sound/soc/codecs/rt1011.c
> +++ b/sound/soc/codecs/rt1011.c
> @@ -1311,12 +1311,11 @@ static int rt1011_r0_load_info(struct snd_kcontrol *kcontrol,
>  	.put = rt1011_r0_load_mode_put \
>  }
>  
> -static const char * const rt1011_i2s_ref[] = {
> +static const char * const rt1011_i2s_ref_texts[] = {
>  	"None", "Left Channel", "Right Channel"
>  };
>  
> -static SOC_ENUM_SINGLE_DECL(rt1011_i2s_ref_enum, 0, 0,
> -	rt1011_i2s_ref);
> +static SOC_ENUM_SINGLE_EXT_DECL(rt1011_i2s_ref_enum, rt1011_i2s_ref_texts);
>  
>  static int rt1011_i2s_ref_put(struct snd_kcontrol *kcontrol,
>  		struct snd_ctl_elem_value *ucontrol)
> @@ -1325,7 +1324,7 @@ static int rt1011_i2s_ref_put(struct snd_kcontrol *kcontrol,
>  		snd_soc_kcontrol_component(kcontrol);
>  	struct rt1011_priv *rt1011 =
>  		snd_soc_component_get_drvdata(component);
> -	int i2s_ref_ch = ucontrol->value.integer.value[0];
> +	int i2s_ref_ch = ucontrol->value.enumerated.item[0];
>  
>  	switch (i2s_ref_ch) {
>  	case RT1011_I2S_REF_LEFT_CH:
> @@ -1344,7 +1343,7 @@ static int rt1011_i2s_ref_put(struct snd_kcontrol *kcontrol,
>  		dev_info(component->dev, "I2S Reference: Do nothing\n");
>  	}
>  
> -	rt1011->i2s_ref = ucontrol->value.integer.value[0];
> +	rt1011->i2s_ref = ucontrol->value.enumerated.item[0];
>  
>  	return 0;
>  }
> @@ -1357,7 +1356,7 @@ static int rt1011_i2s_ref_get(struct snd_kcontrol *kcontrol,
>  	struct rt1011_priv *rt1011 =
>  		snd_soc_component_get_drvdata(component);
>  
> -	ucontrol->value.integer.value[0] = rt1011->i2s_ref;
> +	ucontrol->value.enumerated.item[0] = rt1011->i2s_ref;
>  
>  	return 0;
>  }
> 

-- 
Péter
