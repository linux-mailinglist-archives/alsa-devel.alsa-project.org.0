Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C4A38FD8D
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 11:14:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1B1C16E4;
	Tue, 25 May 2021 11:13:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1B1C16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621934064;
	bh=f5kfaPBUqo9ZUhZOUza4ACM9EvBsBZEcL7No4Wtd88g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DP17Px50QkxqTQ9SMT+akbY9KUEzOmbn9ZmLeL0fX3Nh1IZ31Wm9HZvbWVFvaJnFn
	 ZqbnUdJ5j6JDGvu5ncJ9LUBbF/qQRwqDDGVexUbCCVo9VIn9O5PkyEabJd9d+W8ztS
	 n/TU8s9i7vZGol6eTlS18mdwH26kk6FFsNqHXWHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 878B0F8019D;
	Tue, 25 May 2021 11:12:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00D4FF801EB; Tue, 25 May 2021 11:12:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17A84F80137
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 11:12:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17A84F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="UuFgqt4M"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14P9CaVf019190; Tue, 25 May 2021 04:12:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=aMiPpQVi0ulkI6RQcp2aasyxudjN/6aSilk5GqOq1pU=;
 b=UuFgqt4MJspPFdfaLRXTD3shJ6XX8u8sBL9orkqK0YoLrb4V+3Ne0jtzKlTXKVUXX0GX
 zhKHQz5ddcsS74WOdRAaMSuNPsmWXzHLJHI1RDyL26Ob3cIVMWLQX6yuWIXuNzPkAeCe
 AAip5izjs6tW1tD9meY8BBdDRTKtSbefVPFwshlMI98tFT3g8ydvq2it4g6WX7D7CucO
 kqf9ZwahEWp4RnzWyl7mr8FlfWZHi0kNP4HBQPlRcz4ggwJY/E6rg7BMl9kMNWSinWAi
 JnVwyOkTKkqUSTpM8Agh2rFcUpk7tAzSY9HomkYTkzCXknjyCzVOy0Izh6SR9ET+GUvK 9g== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 38r7ck9dyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 25 May 2021 04:12:44 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 25 May
 2021 10:12:42 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 25 May 2021 10:12:42 +0100
Received: from [10.0.2.15] (AUSNPC0LSNW1.ad.cirrus.com [198.61.64.127])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 71E7611D6;
 Tue, 25 May 2021 09:12:40 +0000 (UTC)
Subject: Re: [PATCH 1/4] ASoC: cs42l42: Fix 1536000 Bit Clock instability
To: Lucas Tanure <tanureal@opensource.cirrus.com>, James Schulman
 <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20210525090822.64577-1-tanureal@opensource.cirrus.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Message-ID: <d71d321f-1467-f8d6-4d1b-529723404d3c@opensource.cirrus.com>
Date: Tue, 25 May 2021 10:12:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210525090822.64577-1-tanureal@opensource.cirrus.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BsvA_JRriN8Q2Xnc3u4lit5AoBnzcI3P
X-Proofpoint-ORIG-GUID: BsvA_JRriN8Q2Xnc3u4lit5AoBnzcI3P
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105250062
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>

On 25/05/2021 10:08, Lucas Tanure wrote:
> The 16 Bits, 2 channels, 48K sample rate use case needs
> to configure a safer pll_divout during the start of PLL
> After 800us from the start of PLL the correct pll_divout
> can be set
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> ---
>   sound/soc/codecs/cs42l42.c | 47 +++++++++++++++++++++++++-------------
>   sound/soc/codecs/cs42l42.h |  2 ++
>   2 files changed, 33 insertions(+), 16 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
> index b084acd1e86b..94788a55fa3b 100644
> --- a/sound/soc/codecs/cs42l42.c
> +++ b/sound/soc/codecs/cs42l42.c
> @@ -589,6 +589,7 @@ struct cs42l42_pll_params {
>   	u8 pll_divout;
>   	u32 mclk_int;
>   	u8 pll_cal_ratio;
> +	u8 n;
>   };
> 
>   /*
> @@ -596,21 +597,21 @@ struct cs42l42_pll_params {
>    * Table 4-5 from the Datasheet
>    */
>   static const struct cs42l42_pll_params pll_ratio_table[] = {
> -	{ 1536000, 0, 1, 0x00, 0x7D, 0x000000, 0x03, 0x10, 12000000, 125 },
> -	{ 2822400, 0, 1, 0x00, 0x40, 0x000000, 0x03, 0x10, 11289600, 128 },
> -	{ 3000000, 0, 1, 0x00, 0x40, 0x000000, 0x03, 0x10, 12000000, 128 },
> -	{ 3072000, 0, 1, 0x00, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125 },
> -	{ 4000000, 0, 1, 0x00, 0x30, 0x800000, 0x03, 0x10, 12000000, 96 },
> -	{ 4096000, 0, 1, 0x00, 0x2E, 0xE00000, 0x03, 0x10, 12000000, 94 },
> -	{ 5644800, 0, 1, 0x01, 0x40, 0x000000, 0x03, 0x10, 11289600, 128 },
> -	{ 6000000, 0, 1, 0x01, 0x40, 0x000000, 0x03, 0x10, 12000000, 128 },
> -	{ 6144000, 0, 1, 0x01, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125 },
> -	{ 11289600, 0, 0, 0, 0, 0, 0, 0, 11289600, 0 },
> -	{ 12000000, 0, 0, 0, 0, 0, 0, 0, 12000000, 0 },
> -	{ 12288000, 0, 0, 0, 0, 0, 0, 0, 12288000, 0 },
> -	{ 22579200, 1, 0, 0, 0, 0, 0, 0, 22579200, 0 },
> -	{ 24000000, 1, 0, 0, 0, 0, 0, 0, 24000000, 0 },
> -	{ 24576000, 1, 0, 0, 0, 0, 0, 0, 24576000, 0 }
> +	{ 1536000, 0, 1, 0x00, 0x7D, 0x000000, 0x03, 0x10, 12000000, 125, 2},
> +	{ 2822400, 0, 1, 0x00, 0x40, 0x000000, 0x03, 0x10, 11289600, 128, 1},
> +	{ 3000000, 0, 1, 0x00, 0x40, 0x000000, 0x03, 0x10, 12000000, 128, 1},
> +	{ 3072000, 0, 1, 0x00, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125, 1},
> +	{ 4000000, 0, 1, 0x00, 0x30, 0x800000, 0x03, 0x10, 12000000,  96, 1},
> +	{ 4096000, 0, 1, 0x00, 0x2E, 0xE00000, 0x03, 0x10, 12000000,  94, 1},
> +	{ 5644800, 0, 1, 0x01, 0x40, 0x000000, 0x03, 0x10, 11289600, 128, 1},
> +	{ 6000000, 0, 1, 0x01, 0x40, 0x000000, 0x03, 0x10, 12000000, 128, 1},
> +	{ 6144000, 0, 1, 0x01, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125, 1},
> +	{ 11289600, 0, 0, 0, 0, 0, 0, 0, 11289600, 0, 1},
> +	{ 12000000, 0, 0, 0, 0, 0, 0, 0, 12000000, 0, 1},
> +	{ 12288000, 0, 0, 0, 0, 0, 0, 0, 12288000, 0, 1},
> +	{ 22579200, 1, 0, 0, 0, 0, 0, 0, 22579200, 0, 1},
> +	{ 24000000, 1, 0, 0, 0, 0, 0, 0, 24000000, 0, 1},
> +	{ 24576000, 1, 0, 0, 0, 0, 0, 0, 24576000, 0, 1}
>   };
>   
>   static int cs42l42_pll_config(struct snd_soc_component *component)
> @@ -746,8 +747,12 @@ static int cs42l42_pll_config(struct snd_soc_component *component)
>   				snd_soc_component_update_bits(component,
>   					CS42L42_PLL_CTL3,
>   					CS42L42_PLL_DIVOUT_MASK,
> -					pll_ratio_table[i].pll_divout
> +					(pll_ratio_table[i].pll_divout * pll_ratio_table[i].n)
>   					<< CS42L42_PLL_DIVOUT_SHIFT);
> +				if (pll_ratio_table[i].n != 1)
> +					cs42l42->pll_divout = pll_ratio_table[i].pll_divout;
> +				else
> +					cs42l42->pll_divout = 0;
>   				snd_soc_component_update_bits(component,
>   					CS42L42_PLL_CAL_RATIO,
>   					CS42L42_PLL_CAL_RATIO_MASK,
> @@ -902,6 +907,16 @@ static int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
>   			if ((cs42l42->bclk < 11289600) && (cs42l42->sclk < 11289600)) {
>   				snd_soc_component_update_bits(component, CS42L42_PLL_CTL1,
>   							      CS42L42_PLL_START_MASK, 1);
> +
> +				if (cs42l42->pll_divout) {
> +					usleep_range(CS42L42_PLL_DIVOUT_TIME_US,
> +						     CS42L42_PLL_DIVOUT_TIME_US * 2);
> +					snd_soc_component_update_bits(component, CS42L42_PLL_CTL3,
> +								      CS42L42_PLL_DIVOUT_MASK,
> +								      cs42l42->pll_divout <<
> +								      CS42L42_PLL_DIVOUT_SHIFT);
> +				}
> +
>   				ret = regmap_read_poll_timeout(cs42l42->regmap,
>   							       CS42L42_PLL_LOCK_STATUS,
>   							       regval,
> diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
> index 24f7be228d5f..7bf05ff05f74 100644
> --- a/sound/soc/codecs/cs42l42.h
> +++ b/sound/soc/codecs/cs42l42.h
> @@ -755,6 +755,7 @@
>   
>   #define CS42L42_NUM_SUPPLIES	5
>   #define CS42L42_BOOT_TIME_US	3000
> +#define CS42L42_PLL_DIVOUT_TIME_US	800
>   #define CS42L42_CLOCK_SWITCH_DELAY_US 150
>   #define CS42L42_PLL_LOCK_POLL_US	250
>   #define CS42L42_PLL_LOCK_TIMEOUT_US	1250
> @@ -777,6 +778,7 @@ struct  cs42l42_private {
>   	int bclk;
>   	u32 sclk;
>   	u32 srate;
> +	u8 pll_divout;
>   	u8 plug_state;
>   	u8 hs_type;
>   	u8 ts_inv;
> 
