Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EB510AAB5
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 07:41:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3C42167B;
	Wed, 27 Nov 2019 07:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3C42167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574836903;
	bh=vpSXwN/ObWOyXPT6wmIC3NwDjHZaBYdKu1jQGX72tsM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H6Ic+ujRCZiHssV4KImB6ppOGH1Rohvaq58Fm2QishnBuHbbCIniPKwo/sHlcqBZi
	 h+HWU6q9SzShIWlhiBj5ysQAibfsyeKMCuit40CDP6WOtB74wOWi6epMWO8Jf4TFwn
	 qxQCSobMez7xLJEX9U04QkN08MTCKbNB37FTYsdE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5A76F8019B;
	Wed, 27 Nov 2019 07:39:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70FB2F80159; Tue, 26 Nov 2019 11:12:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730043.outbound.protection.outlook.com [40.107.73.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E1ACF800DD
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 11:12:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E1ACF800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="ZpAp/00d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSfVk57cnybvKojSDGc2BSfnOowFZO+rd/mzkh9D/ibC5BDC9xLmKerJ1F/ufnAFmATAm6LCac1vjb1rI+6PFRPo6cOOY91cvdy6g9op3fPmbFUjeKUSo1NnE6tLWrv6AXNetjpm4jTtCK46OViFFnBUVUQRIdBqcJ7p3VzA+Zj1fdu7kNYsiGZ5x8PPmYEhlmUT/Ndw69aSS2DV5MduNnSkcXPqPF3V2X5ORA09SsBq5vivGQ6B4Ok17c3Au93TtHTHqfb7qZGd70GVEsZRoampuCZHaWxsrgHsXEfrlMF3uVYpX5G0c8afH0Bifyf1X0BL5qn37pmktOQ3aXTf8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xptElvw3JiOrZV1RFP4qUNvM9d5yEfQ76CtkrYroE0c=;
 b=RjT933uwEk0/cyRZXgvCxoKNfZrndGbNvkeP52slDy+6PzVeVZRyf0YMRGK5uf2UAR7O7MAR1hvElb5Mulqtj28P8L3BjOTSlHY09ftIahhyHfO8yPF978GCsNeN5Kh1tCwW0ZVUmsBBOYK5Twq62reexEt4X6wTGGkQBrInzaNgjxd0ILsGxvk9tQT9V0GkKn2Y0At1uY7vPmEJHepnFZb5uniMyRz/zBD/Nvw/9ZkhsDcPkNHwd3d4r8LA+vKJOaCeQpkVjzSpRlHlBHhBoA3G4id2+oSaanrYSGwShrMv6M6v0220XW5Nww8+taTHFBL6CsV8fNgys6aGp3zxNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xptElvw3JiOrZV1RFP4qUNvM9d5yEfQ76CtkrYroE0c=;
 b=ZpAp/00dbpwy/i/IJdBydKi5Jw+FiDs+Kk2xbAbyrqNk+Tib1L6HPaN0QgZW8PWHf2s/kZgKbBky6t1Xp5QwOs9AEdnnqbXUWf4gHpD+OfgE/euM+zTl2bWdvDglXRJww4B5Tp9/GBwSqcOGmBO9JU/AMhMYc036lMal8FB29W4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Akshu.Agrawal@amd.com; 
Received: from MN2PR12MB2878.namprd12.prod.outlook.com (20.179.80.143) by
 MN2PR12MB2944.namprd12.prod.outlook.com (20.179.81.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.21; Tue, 26 Nov 2019 10:12:05 +0000
Received: from MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::305d:cfb0:baaf:7008]) by MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::305d:cfb0:baaf:7008%4]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 10:12:04 +0000
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>, linux-kernel@vger.kernel.org
References: <20191126075424.80668-1-yuhsuan@chromium.org>
From: "Agrawal, Akshu" <aagrawal2@amd.com>
Message-ID: <460fa79d-76e8-d8be-8a9a-040d0e6df344@amd.com>
Date: Tue, 26 Nov 2019 15:41:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <20191126075424.80668-1-yuhsuan@chromium.org>
Content-Language: en-US
X-ClientProxiedBy: MA1PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::25) To MN2PR12MB2878.namprd12.prod.outlook.com
 (2603:10b6:208:aa::15)
MIME-Version: 1.0
X-Originating-IP: [165.204.157.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8e5a95d5-d3e0-4d1f-e80a-08d772591625
X-MS-TrafficTypeDiagnostic: MN2PR12MB2944:|MN2PR12MB2944:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB294434CF246F42A93E35162CF8450@MN2PR12MB2944.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 0233768B38
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(199004)(189003)(66066001)(316002)(2616005)(5660300002)(52116002)(6666004)(6486002)(8936002)(3846002)(14454004)(23676004)(14444005)(7736002)(229853002)(36756003)(8676002)(76176011)(2486003)(66556008)(6116002)(31696002)(66476007)(66946007)(81166006)(230700001)(446003)(53546011)(26005)(478600001)(99286004)(47776003)(6506007)(305945005)(386003)(65806001)(4326008)(58126008)(54906003)(6512007)(186003)(65956001)(7416002)(6436002)(2906002)(25786009)(50466002)(81156014)(6246003)(31686004)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2944;
 H:MN2PR12MB2878.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GyN2Dbji3SFPRVLQNUIvKipXO4IK/aZhNfrNeETUC7Qi6mTgq1iVdMlx6Mihz1GKqJC0oZrRTM8Gs2OaDDnP2oNUcEG8izSgUfoH14thpHoPiWWnDDvx1pc0qf9uIvgO9hDRbyzmLjf27qM1Lo0EAYgPLkjLRXlIjTUa5u7IqjFKYTOMpHRmKb7AlZ00QOezthuCpE+Pxiez8vT8GjbqK9ILo9tIhl4YufezSlFaf4ER/01SAH99vUupAA6tXwBb8XLPo8qW900KsPBOuzBrtEsEZ62MO4OFSUySp+a5/5Z5SQsoGrIRfckx4IXE2uUTHozVj8AqhXOmg1kYscpX+Th/iqJR0WOMRHtgQJ2emQPyLu1oRyEoDuqUFqgU3EiTZdffcoD118ap0GTvoKlGYAaehChilRsCQsvFH8+7BEWrr8XNYcNp4TV5BrLw/2q4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e5a95d5-d3e0-4d1f-e80a-08d772591625
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 10:12:04.9111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: km0OqLXTS61lYOL9NP5kElgrXL7iZF4jlQGM4l+zl2uxIQ8Ayf14l4+iWXkwxOcQ3FFED1NomLjT0OnVrGUeRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2944
X-Mailman-Approved-At: Wed, 27 Nov 2019 07:39:09 +0100
Cc: alsa-devel@alsa-project.org, Andi Kleen <ak@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Agrawal Akshu <Akshu.Agrawal@amd.com>, Tzung-Bi Shih <tzungbi@google.com>,
 Mark Brown <broonie@kernel.org>,
 Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: AMD: Enable clk in startup intead of
	hw_params
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On 11/26/2019 1:24 PM, Yu-Hsuan Hsu wrote:
> Some usages only call startup and shutdown without setting hw_params
> (e.g. arecord --dump-hw-params). If we don't enable clk in startup, it
> will cause ref count error because the clk will be disabled in shutdown.
> For this reason, we should move enabling clk from hw_params to startup.
>
> In addition, the hw_params is fixed in this driver(48000 rate, 2
> channels, S16_LE format) so we don't need to change the clk rate after
> the hw_params is set.
>
> Signed-off-by: Yu-Hsuan Hsu <yuhsuan@chromium.org>
> ---
>   sound/soc/amd/acp-da7219-max98357a.c | 46 +++++++++-------------------
>   1 file changed, 14 insertions(+), 32 deletions(-)
>
> diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
> index f4ee6798154af5..7a5621e5e2330d 100644
> --- a/sound/soc/amd/acp-da7219-max98357a.c
> +++ b/sound/soc/amd/acp-da7219-max98357a.c
> @@ -96,14 +96,19 @@ static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
>   	return 0;
>   }
>   
> -static int da7219_clk_enable(struct snd_pcm_substream *substream,
> -			     int wclk_rate, int bclk_rate)
> +static int da7219_clk_enable(struct snd_pcm_substream *substream)
>   {
>   	int ret = 0;
>   	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>   
> -	clk_set_rate(da7219_dai_wclk, wclk_rate);
> -	clk_set_rate(da7219_dai_bclk, bclk_rate);
> +	/*
> +	 * Set wclk to 48000 because the rate constraint of this driver is
> +	 * 48000. ADAU7002 spec: "The ADAU7002 requires a BCLK rate that is
> +	 * minimum of 64x the LRCLK sample rate." DA7219 is the only clk
> +	 * source so for all codecs we have to limit bclk to 64X lrclk.
> +	 */
> +	clk_set_rate(da7219_dai_wclk, 48000);
> +	clk_set_rate(da7219_dai_bclk, 48000 * 64);
>   	ret = clk_prepare_enable(da7219_dai_bclk);
>   	if (ret < 0) {
>   		dev_err(rtd->dev, "can't enable master clock %d\n", ret);
> @@ -156,7 +161,7 @@ static int cz_da7219_play_startup(struct snd_pcm_substream *substream)
>   				   &constraints_rates);
>   
>   	machine->play_i2s_instance = I2S_SP_INSTANCE;
> -	return 0;
> +	return da7219_clk_enable(substream);
>   }
>   
>   static int cz_da7219_cap_startup(struct snd_pcm_substream *substream)
> @@ -178,7 +183,7 @@ static int cz_da7219_cap_startup(struct snd_pcm_substream *substream)
>   
>   	machine->cap_i2s_instance = I2S_SP_INSTANCE;
>   	machine->capture_channel = CAP_CHANNEL1;
> -	return 0;
> +	return da7219_clk_enable(substream);
>   }
>   
>   static int cz_max_startup(struct snd_pcm_substream *substream)
> @@ -199,7 +204,7 @@ static int cz_max_startup(struct snd_pcm_substream *substream)
>   				   &constraints_rates);
>   
>   	machine->play_i2s_instance = I2S_BT_INSTANCE;
> -	return 0;
> +	return da7219_clk_enable(substream);
>   }
>   
>   static int cz_dmic0_startup(struct snd_pcm_substream *substream)
> @@ -220,7 +225,7 @@ static int cz_dmic0_startup(struct snd_pcm_substream *substream)
>   				   &constraints_rates);
>   
>   	machine->cap_i2s_instance = I2S_BT_INSTANCE;
> -	return 0;
> +	return da7219_clk_enable(substream);
>   }
>   
>   static int cz_dmic1_startup(struct snd_pcm_substream *substream)
> @@ -242,25 +247,7 @@ static int cz_dmic1_startup(struct snd_pcm_substream *substream)
>   
>   	machine->cap_i2s_instance = I2S_SP_INSTANCE;
>   	machine->capture_channel = CAP_CHANNEL0;
> -	return 0;
> -}
> -
> -static int cz_da7219_params(struct snd_pcm_substream *substream,
> -				      struct snd_pcm_hw_params *params)
> -{
> -	int wclk, bclk;
> -
> -	wclk = params_rate(params);
> -	bclk = wclk * params_channels(params) *
> -		snd_pcm_format_width(params_format(params));
> -	/* ADAU7002 spec: "The ADAU7002 requires a BCLK rate
> -	 * that is minimum of 64x the LRCLK sample rate."
> -	 * DA7219 is the only clk source so for all codecs
> -	 * we have to limit bclk to 64X lrclk.
> -	 */
> -	if (bclk < (wclk * 64))
> -		bclk = wclk * 64;
> -	return da7219_clk_enable(substream, wclk, bclk);
> +	return da7219_clk_enable(substream);
>   }
>   
>   static void cz_da7219_shutdown(struct snd_pcm_substream *substream)
> @@ -271,31 +258,26 @@ static void cz_da7219_shutdown(struct snd_pcm_substream *substream)
>   static const struct snd_soc_ops cz_da7219_play_ops = {
>   	.startup = cz_da7219_play_startup,
>   	.shutdown = cz_da7219_shutdown,
> -	.hw_params = cz_da7219_params,
>   };
>   
>   static const struct snd_soc_ops cz_da7219_cap_ops = {
>   	.startup = cz_da7219_cap_startup,
>   	.shutdown = cz_da7219_shutdown,
> -	.hw_params = cz_da7219_params,
>   };
>   
>   static const struct snd_soc_ops cz_max_play_ops = {
>   	.startup = cz_max_startup,
>   	.shutdown = cz_da7219_shutdown,
> -	.hw_params = cz_da7219_params,
>   };
>   
>   static const struct snd_soc_ops cz_dmic0_cap_ops = {
>   	.startup = cz_dmic0_startup,
>   	.shutdown = cz_da7219_shutdown,
> -	.hw_params = cz_da7219_params,
>   };
>   
>   static const struct snd_soc_ops cz_dmic1_cap_ops = {
>   	.startup = cz_dmic1_startup,
>   	.shutdown = cz_da7219_shutdown,
> -	.hw_params = cz_da7219_params,
>   };
>   
>   SND_SOC_DAILINK_DEF(designware1,

Acked-by: Akshu Agrawal <akshu.agarawal@amd.com>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
