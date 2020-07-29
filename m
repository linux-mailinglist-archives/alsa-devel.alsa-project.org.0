Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 867BE231E96
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jul 2020 14:33:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D32416F6;
	Wed, 29 Jul 2020 14:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D32416F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596025984;
	bh=FM02TxFUlCMbrQ+NNDzLS09B2vFebFCRRn7vtMYpvBw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p6391Cq+u1/9i5OmoKcTnF4At619z3CpUa92ey33KmbjWx/kfdHVaiifOw0+X6Q9E
	 Q+L7ZDnBlgzd39B38jtaZRXJg+iMucjMG9HKneGkEQQvTQNqecBfsZvfOFQjmfZdX9
	 TcCrH8f6fUfonisB7JnO+V2+cUQD0o9et2QZohgY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14818F801D9;
	Wed, 29 Jul 2020 14:31:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C67AF801A3; Wed, 29 Jul 2020 14:31:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6AA6F800DE
 for <alsa-devel@alsa-project.org>; Wed, 29 Jul 2020 14:31:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6AA6F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PO/YexVw"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06TCV6x8076862;
 Wed, 29 Jul 2020 07:31:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1596025866;
 bh=n4hOGvls4mZeWxBwmllrQqwkhcOBDYW0eRdWn9BfHU8=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=PO/YexVwHv/8YM4oFknUZb+piPjmJwIZi4h2xlY/q53DUqllW8hF0UcRVT7c86HxR
 /0iOczS0UTaB5mjETCKCPoxiPEquO5j/gq8itM0NNm9Rv7L2zznoLR2vy+Nk0dJ0Uv
 Oec1KTayd3yacpdqIlZ214PjTC+KScwrfp6yD+6M=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06TCV6MJ014141
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 29 Jul 2020 07:31:06 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Jul 2020 07:31:05 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Jul 2020 07:31:05 -0500
Received: from [10.250.35.195] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06TCV5XV010018;
 Wed, 29 Jul 2020 07:31:05 -0500
Subject: Re: [PATCH 3/3] ASoC: codec: tlv3204: Moving GPIO reset and add ADC
 reset
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 <alsa-devel@alsa-project.org>
References: <20200729073256.24028-1-michael.wei.hong.sit@intel.com>
 <20200729073256.24028-4-michael.wei.hong.sit@intel.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <e97b37d1-548e-6ede-4015-563d4f67f5e6@ti.com>
Date: Wed, 29 Jul 2020 07:31:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729073256.24028-4-michael.wei.hong.sit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: cezary.rojewski@intel.com, a-estrada@ti.com, andriy.shevchenko@intel.com,
 tiwai@suse.com, jee.heng.sia@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org, zakkaye@ti.com
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

Hello

On 7/29/20 2:32 AM, Michael Sit Wei Hong wrote:
> Moving GPIO reset to a later stage and before clock registration to
> ensure that the host system and codec clocks are in sync. If the host
> register clock values prior to gpio reset, the last configured codec clock
> is registered to the host. The codec then gets gpio resetted setting the
> codec clocks to their default value, causing a mismatch. Host system will
> skip clock setting thinking the codec clocks are already at the requested
> rate.
>
> ADC reset is added to ensure the next audio capture does not have
> undesired artifacts. It is probably related to the original code
> where the probe function resets the ADC prior to 1st record.
>
> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> Reviewed-by: Sia Jee Heng <jee.heng.sia@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   sound/soc/codecs/tlv320aic32x4.c | 47 ++++++++++++++++++++++++--------
>   1 file changed, 35 insertions(+), 12 deletions(-)
>
> diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
> index 5af438a00f95..37e14558d7c0 100644
> --- a/sound/soc/codecs/tlv320aic32x4.c
> +++ b/sound/soc/codecs/tlv320aic32x4.c
> @@ -50,6 +50,28 @@ struct aic32x4_priv {
>   	struct device *dev;
>   };
>   
> +static int aic32x4_reset_adc(struct snd_soc_dapm_widget *w,
> +			     struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
> +	u32 adc_reg;
> +
> +	/*
> +	 * Workaround: the datasheet does not mention a required programming
> +	 * sequence but experiments show the ADC needs to be reset after each
> +	 * capture to avoid audible artifacts.
> +	 */
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMD:
> +		adc_reg = snd_soc_component_read32(component, AIC32X4_ADCSETUP);

This gives me a build error

sound/soc/codecs/tlv320aic32x4.c: In function ‘aic32x4_reset_adc’:
sound/soc/codecs/tlv320aic32x4.c:66:13: error: implicit declaration of 
function ‘snd_soc_component_read32’; did you mean 
‘snd_soc_component_read’? [-Werror=implicit-function-declaration]
    66 |   adc_reg = snd_soc_component_read32(component, AIC32X4_ADCSETUP);
       |             ^~~~~~~~~~~~~~~~~~~~~~~~
       |             snd_soc_component_read

Also you should check the return to make sure it is valid.

Dan


