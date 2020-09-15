Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C163B26AC92
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 20:52:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2673D1676;
	Tue, 15 Sep 2020 20:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2673D1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600195962;
	bh=3SWFQ2Bwokt0YeBctbJs0TttAv9AjMN1WigAzu0/uJ0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lb9nZEzlhJSWlKPOJSoB11++MVWgF74jIyy6d87vEodvxXQd3pVw//N9JqF3NKrAb
	 qQX/6NtpCQxy/SbdHN0qWG6Na27pWrowhrS6bolIZkPAsIuaue8pnOZQbSSibh8uBk
	 vs7u8nBqMeo3D6JFJgCr8n7L/18PZ5CxxCmUcH34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C0B7F80159;
	Tue, 15 Sep 2020 20:51:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BB4CF80212; Tue, 15 Sep 2020 20:50:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13231F800F1
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 20:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13231F800F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UR/kWVPw"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08FIoi17054725;
 Tue, 15 Sep 2020 13:50:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600195844;
 bh=U7y1gyIYfA8SLhBBcfOATA30DSJsB0eQ4gaq8DUsJQ0=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=UR/kWVPwQz2OakR+tiqx2L2ede9cGCXqmltv0iaX7ChhHpYvW7y3Vr1ff0MBLdtuw
 FsSmSbuDIiVN0Ztiinl2Q/L1plR5YCsupKTuP1tyjgElChW5oJblGGK/BnLiFOThUm
 ebxgdAppxp0Q01G95jF7Iid4iI9ronHV8XmMfd9g=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08FIoid7038918
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Sep 2020 13:50:44 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Sep 2020 13:50:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Sep 2020 13:50:43 -0500
Received: from [10.250.38.37] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08FIohDY111585;
 Tue, 15 Sep 2020 13:50:43 -0500
Subject: Re: [PATCH v2 3/3] ASoC: tlv320adcx140: Add proper support for master
 mode
To: Camel Guo <camel.guo@axis.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <tiwai@suse.com>
References: <20200911080753.30342-1-camel.guo@axis.com>
 <20200911080753.30342-3-camel.guo@axis.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <c2fb617e-fa61-e9d1-449f-7d8806168b9a@ti.com>
Date: Tue, 15 Sep 2020 13:50:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911080753.30342-3-camel.guo@axis.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org, kernel@axis.com, linux-kernel@vger.kernel.org,
 Camel Guo <camelg@axis.com>
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

Camel

On 9/11/20 3:07 AM, Camel Guo wrote:
> From: Camel Guo <camelg@axis.com>
>
> Add setup of bclk-to-ws ratio and sample rate when in master mode,
> as well as MCLK input pin setup.
>
> Signed-off-by: Camel Guo <camelg@axis.com>
> ---
>   v2:
>    - Move GPIO setting into devicetree
>    - Move master config register setting into a new function
>
>   sound/soc/codecs/tlv320adcx140.c | 139 ++++++++++++++++++++++++++++++-
>   sound/soc/codecs/tlv320adcx140.h |  27 ++++++
>   2 files changed, 162 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
> index 97f16fbba441..685f5fd8b537 100644
> --- a/sound/soc/codecs/tlv320adcx140.c
> +++ b/sound/soc/codecs/tlv320adcx140.c
> @@ -35,6 +35,7 @@ struct adcx140_priv {
>   	unsigned int dai_fmt;
>   	unsigned int tdm_delay;
>   	unsigned int slot_width;
> +	bool master;
>   };
>   
>   static const char * const gpo_config_names[] = {
> @@ -651,11 +652,136 @@ static int adcx140_reset(struct adcx140_priv *adcx140)
>   	return ret;
>   }
>   
> +static int adcx140_fs_bclk_ratio(unsigned int bclk_ratio)
> +{
> +	switch (bclk_ratio) {
> +	case 16:
> +		return ADCX140_RATIO_16;
> +	case 24:
> +		return ADCX140_RATIO_24;
> +	case 32:
> +		return ADCX140_RATIO_32;
> +	case 48:
> +		return ADCX140_RATIO_48;
> +	case 64:
> +		return ADCX140_RATIO_64;
> +	case 96:
> +		return ADCX140_RATIO_96;
> +	case 128:
> +		return ADCX140_RATIO_128;
> +	case 192:
> +		return ADCX140_RATIO_192;
> +	case 256:
> +		return ADCX140_RATIO_256;
> +	case 384:
> +		return ADCX140_RATIO_384;
> +	case 512:
> +		return ADCX140_RATIO_512;
> +	case 1024:
> +		return ADCX140_RATIO_1024;
> +	case 2048:
> +		return ADCX140_RATIO_2048;
> +	default:
> +		break;
> +	}
> +	return -EINVAL;
> +}
> +
> +static int adcx140_fs_rate(unsigned int rate)
> +{
> +	switch (rate) {
> +	case 7350:
> +	case 8000:
> +		return ADCX140_8_OR_7_35KHZ;
> +	case 14700:
> +	case 16000:
> +		return ADCX140_16_OR_14_7KHZ;
> +	case 22050:
> +	case 24000:
> +		return ADCX140_24_OR_22_05KHZ;
> +	case 29400:
> +	case 32000:
> +		return ADCX140_32_OR_29_4KHZ;
> +	case 44100:
> +	case 48000:
> +		return ADCX140_48_OR_44_1KHZ;
> +	case 88200:
> +	case 96000:
> +		return ADCX140_96_OR_88_2KHZ;
> +	case 176400:
> +	case 192000:
> +		return ADCX140_192_OR_176_4KHZ;
> +	case 352800:
> +	case 384000:
> +		return ADCX140_384_OR_352_8KHZ;
> +	case 705600:
> +	case 768000:
> +		return ADCX140_768_OR_705_6KHZ;
> +	default:
> +		break;
> +	}
> +	return -EINVAL;
> +}
> +
> +static int adcx140_setup_master_config(struct snd_soc_component *component,
> +				       struct snd_pcm_hw_params *params)
> +{
> +	int ret = 0;
> +	struct adcx140_priv *adcx140 = snd_soc_component_get_drvdata(component);
> +
> +	if (adcx140->master) {

Move this out to hw_params.  No reason to jump here just to jump back.

Check for master and if master then configure

This will eliminate the mixed code and variable declaration below which 
is what I wanted to avoid in v1.

This will also allow you to remove some of the variable initialization.

> +		u8 mst_cfg1 = 0;
> +		u8 mst_cfg0 = 0;
This can be init to mst_cfg0 = ADCX140_BCLK_FSYNC_MASTER no reason to 
set it here and then change it immediately.
> +		unsigned int bclk_ratio;
> +
> +		mst_cfg0 = ADCX140_BCLK_FSYNC_MASTER;
> +		if (params_rate(params) % 1000)
> +			mst_cfg0 |= ADCX140_FSYNCINV_BIT; /* 44.1 kHz et al */
> +
> +		ret = adcx140_fs_rate(params_rate(params));
> +		if (ret < 0) {
> +			dev_err(adcx140->dev, "%s: Unsupported rate %d\n",
> +					__func__, params_rate(params));
> +			return ret;
> +		}
> +		mst_cfg1 |= ret;
Why the | here?  This is initialized to 0 so mst_cfg1 = ret. And why 
even use ret just return into mst_cfg1 and check that variable
> +
> +		/* In slave mode when using automatic clock configuration,
> +		 * the codec figures out the BCLK to FSYNC ratio itself. But
> +		 * here in master mode, we need to tell it.
> +		 */
> +
> +		bclk_ratio = snd_soc_params_to_frame_size(params);
> +		ret = adcx140_fs_bclk_ratio(bclk_ratio);
> +		if (ret < 0) {
> +			dev_err(adcx140->dev, "%s: Unsupported bclk_ratio %d\n",
> +					__func__, bclk_ratio);
> +			return ret;
> +		}
> +		mst_cfg1 |= ret;
> +
> +		snd_soc_component_update_bits(component, ADCX140_MST_CFG1,
> +				ADCX140_FS_RATE_MSK |
> +				ADCX140_RATIO_MSK,
> +				mst_cfg1);

I don't understand the update_bits since you have calcualted both the 
Ratio and rate you can just write the register with the 
snd_soc_component_write.

> +
> +		snd_soc_component_update_bits(component, ADCX140_MST_CFG0,
> +				ADCX140_FSYNCINV_BIT |
> +				ADCX140_BCLK_FSYNC_MASTER,
> +				mst_cfg0);
> +

But this is ok.  I actually have other changes I am posting which move 
this to the set_dai_format.  So I am not sure if this will be needed 
after that patch is applied.

I will CC you on those patches.

Dan
