Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 138FC10FC1F
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 12:01:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89BF51662;
	Tue,  3 Dec 2019 12:00:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89BF51662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575370906;
	bh=d5+s7tyUu+eCaHxUrlUybBufgApKybps6XFGycuTSLU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=swKOv0JluQk2m3zfGGlCol847S+OYhNalaKp1ZvaSd8dlmImh2KBx0K+x6k/Sj4p6
	 fXFuZF/j0ozsWjD3iuPjN5ONuSyhGpQTq7w38pCsYiF0HE4uDiLDRzOrx9IfUo2GOG
	 TLGtnMLNniwgs3QXhoxX+1yFrbLTinFH0toU4V04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B90FF80228;
	Tue,  3 Dec 2019 12:00:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66FBEF80227; Tue,  3 Dec 2019 12:00:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680057.outbound.protection.outlook.com [40.107.68.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85B54F800B4
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 12:00:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85B54F800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="q2e98UQI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eOOtRXChgjwfof/tYci6dD4RNAR1yMu+fW/glSp2L2xRLGJVNL/8HIRQGKL1qMXO6Vm+zCIJzUoK7THzGw6qSsATImVDGWzSEpFWgYJ90nUSonNP5vGCxVAz8eLxxuLk+iI4MgsXYn9hU9dHH2yLIrjkzNILb0BzgSV/xd6nl524ZLlZbeDPJPQ4JNzm154/TdjpdHKWNKE1pNRhbnFJwHEs1ZnJqDHr6VPnSDuiGVDwhFJZ76brl32Jnbw+risL8h1/fHR9Pwi5QwGciMlaJztpC29dzSChvfTc5p2im6EkLDhwpo3MUTLxYzxDCGBT8DLAVEHdHqXsT5aC76zBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CktBF9i+l5CTdmRz5I/DqM6VFzqBY37g/koDyAoHguQ=;
 b=K7jlqSuwvUWdNVHfmNo1ytIo3FeECAmPl2PmH0090LiB1kJU0e4WK7IkfJ9OB35xPU4eWQlc594nyJPqu8HJUk87JgxbCo1efhubqmACWAhvGwh/jjLe7KeupQCq+bWq6BaVu6t4Q6DyKiz4fmduCTshc5V9YZrbF7omuvy/ZdNpS+f42mjbSIPLuVbQDoCE697Tbe/csZhaa8Cph8MJtgOa2X96am8ilBiLH+tEHfHa0D4Q8SrLit/Zj3fW95nrKAGBoVz9J9XhybxlcHV6qZ+5xAj/5pIMOLEAOxcRE3EEg5WCnPp+MAXfsKD2Hu4eOoTn+82Dsn0JH0iP/8s02A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CktBF9i+l5CTdmRz5I/DqM6VFzqBY37g/koDyAoHguQ=;
 b=q2e98UQIk4RZ7KCrOOGEl96AZO0qg0UtiAq6zT51igrNLqSegflYiXzpjywAL2ybJhv9B8oDPyCz7B35bQvoWm4En59M3ETpqZMVV6O06D3eSJYySRS4wB93dz2kkXptRreGvE/TRnwOJ1AmJfxQ0ek7b2k0JCiDJt47B+lZ+zQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Akshu.Agrawal@amd.com; 
Received: from MN2PR12MB2878.namprd12.prod.outlook.com (20.179.80.143) by
 MN2PR12MB3533.namprd12.prod.outlook.com (20.179.83.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Tue, 3 Dec 2019 11:00:08 +0000
Received: from MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::305d:cfb0:baaf:7008]) by MN2PR12MB2878.namprd12.prod.outlook.com
 ([fe80::305d:cfb0:baaf:7008%4]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 11:00:08 +0000
To: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
References: <1574415866-29715-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1574415866-29715-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
From: "Agrawal, Akshu" <aagrawal2@amd.com>
Message-ID: <3526a3d9-a282-c3de-c417-6ec498520d18@amd.com>
Date: Tue, 3 Dec 2019 16:29:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
In-Reply-To: <1574415866-29715-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Content-Language: en-US
X-ClientProxiedBy: MA1PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::34) To MN2PR12MB2878.namprd12.prod.outlook.com
 (2603:10b6:208:aa::15)
MIME-Version: 1.0
X-Originating-IP: [165.204.157.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 373abcfa-4dd8-40c3-a3c3-08d777dff575
X-MS-TrafficTypeDiagnostic: MN2PR12MB3533:|MN2PR12MB3533:|MN2PR12MB3533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3533F18B68A47798850CA61BF8420@MN2PR12MB3533.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 02408926C4
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(199004)(189003)(5660300002)(6436002)(50466002)(230700001)(8936002)(81166006)(6486002)(81156014)(26005)(2906002)(498600001)(186003)(36756003)(37006003)(58126008)(54906003)(66476007)(25786009)(14454004)(66556008)(6116002)(3846002)(6636002)(99286004)(66946007)(7416002)(6666004)(305945005)(229853002)(6246003)(2486003)(14444005)(31686004)(6512007)(11346002)(446003)(8676002)(4326008)(31696002)(23676004)(52116002)(6862004)(65956001)(53546011)(2616005)(6506007)(30864003)(386003)(76176011)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3533;
 H:MN2PR12MB2878.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iIEhrN34f6jvfW5fm7W48lAuRdPJtRPzh3CPsIhSP1yj1B1vdYw8eB/cXbyDlPdQR4XFQd8U/VzJvat7oYCyUt/9lBpMSQjVbOGt4uoJ0RLtuU3O+r1b6n890zSse8IZXykdI5Z45rzLslnwfWrcWVRv/Rxbw0hOThyq0vuCFmcOwxht6gOQ6Xt/N3QyQqICEWpMwVavFhPXVkpzhTJY4T3OBv85Ra/4JTk7Rm6lOOwocL1eTVHsY270H8PVBYV+W4VcD7RejUBNByNQxm8mVK95p2lN/q4WzsTqy1YHH2YtBQp5MgtEpUeiNXTdEIJmcr6PszU8o7JbJsVxl7u2HDltbShTL6OOsIXtzTPnrt9J9orF60dl2cmVUMmPYlIDw49WET0yPlWPVwOM6HWBzyet2oBxh8EHZdoyofYKG/OFDs80U3Ry+YOdeTXJ4aYe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373abcfa-4dd8-40c3-a3c3-08d777dff575
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2019 11:00:07.9811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k4I5uP5TkPSKVbmBZJXHQbogMNnKNX3Hqjgo4o41GrLpizTI1hUPiGPhPt9XEPTEUiNZGvLLy9rEhgTuUKrLwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3533
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 pierre-louis.bossart@linux.intel.com, Mark Brown <broonie@kernel.org>,
 djkurtz@google.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Colin Ian King <colin.king@canonical.com>,
 Akshu.Agrawal@amd.com, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [alsa-devel] [PATCH v12 3/6] ASoC: amd: Enabling I2S instance
	in DMA and DAI
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


On 11/22/2019 3:14 PM, Ravulapati Vishnu vardhan rao wrote:
> This patch adds I2S SP support in ACP PCM DMA and DAI.
> Added I2S support in DMA and DAI probe,its hw_params handling
> its open and close functionalities.
> This enables to open and close on the SP instance for
> playback and capture.
>
> Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
> ---
>   sound/soc/amd/raven/acp3x-i2s.c     | 123 +++++++++++++++++----
>   sound/soc/amd/raven/acp3x-pcm-dma.c | 214 ++++++++++++++++++++++++------------
>   sound/soc/amd/raven/acp3x.h         |  77 ++++++++++---
>   3 files changed, 309 insertions(+), 105 deletions(-)
>
> diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
> index cdc1c61..7f05782 100644
> --- a/sound/soc/amd/raven/acp3x-i2s.c
> +++ b/sound/soc/amd/raven/acp3x-i2s.c
> @@ -28,10 +28,10 @@ static int acp3x_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
>   	mode = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
>   	switch (mode) {
>   	case SND_SOC_DAIFMT_I2S:
> -		adata->tdm_mode = false;
> +		adata->tdm_mode = TDM_DISABLE;
>   		break;
>   	case SND_SOC_DAIFMT_DSP_A:
> -		adata->tdm_mode = true;
> +		adata->tdm_mode = TDM_ENABLE;
>   		break;
>   	default:
>   		return -EINVAL;
> @@ -87,10 +87,22 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
>   	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
>   {
>   	struct i2s_stream_instance *rtd;
> +	struct snd_soc_pcm_runtime *prtd;
> +	struct snd_soc_card *card;
> +	struct acp3x_platform_info *pinfo;
>   	u32 val;
>   	u32 reg_val;
>   
> +	prtd = substream->private_data;
>   	rtd = substream->runtime->private_data;
> +	card = prtd->card;
> +	pinfo = snd_soc_card_get_drvdata(card);
> +	if (pinfo) {
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +			rtd->i2s_instance = pinfo->play_i2s_instance;
> +		else
> +			rtd->i2s_instance = pinfo->cap_i2s_instance;
> +	}
>   
>   	/* These values are as per Hardware Spec */
>   	switch (params_format(params)) {
> @@ -110,11 +122,25 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
>   	default:
>   		return -EINVAL;
>   	}
> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> -		reg_val = mmACP_BTTDM_ITER;
> -	else
> -		reg_val = mmACP_BTTDM_IRER;
> -
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		switch (rtd->i2s_instance) {
> +		case I2S_BT_INSTANCE:
> +			reg_val = mmACP_BTTDM_ITER;
> +			break;
> +		case I2S_SP_INSTANCE:
> +		default:
> +			reg_val = mmACP_I2STDM_ITER;
> +		}
> +	} else {
> +		switch (rtd->i2s_instance) {
> +		case I2S_BT_INSTANCE:
> +			reg_val = mmACP_BTTDM_IRER;
> +			break;
> +		case I2S_SP_INSTANCE:
> +		default:
> +			reg_val = mmACP_I2STDM_IRER;
> +		}
> +	}
>   	val = rv_readl(rtd->acp3x_base + reg_val);
>   	val = val | (rtd->xfer_resolution  << 3);
>   	rv_writel(val, rtd->acp3x_base + reg_val);
> @@ -125,10 +151,21 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
>   				int cmd, struct snd_soc_dai *dai)
>   {
>   	struct i2s_stream_instance *rtd;
> -	u32 val, period_bytes;
> -	int ret, reg_val;
> +	struct snd_soc_pcm_runtime *prtd;
> +	struct snd_soc_card *card;
> +	struct acp3x_platform_info *pinfo;
> +	u32 ret, val, period_bytes, reg_val, ier_val, water_val;
>   
> +	prtd = substream->private_data;
>   	rtd = substream->runtime->private_data;
> +	card = prtd->card;
> +	pinfo = snd_soc_card_get_drvdata(card);
> +	if (pinfo) {
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +			rtd->i2s_instance = pinfo->play_i2s_instance;
> +		else
> +			rtd->i2s_instance = pinfo->cap_i2s_instance;
> +	}
>   	period_bytes = frames_to_bytes(substream->runtime,
>   			substream->runtime->period_size);
>   	switch (cmd) {
> @@ -138,31 +175,75 @@ static int acp3x_i2s_trigger(struct snd_pcm_substream *substream,
>   		rtd->bytescount = acp_get_byte_count(rtd,
>   						substream->stream);
>   		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -			reg_val = mmACP_BTTDM_ITER;
> -			rv_writel(period_bytes, rtd->acp3x_base +
> -					mmACP_BT_TX_INTR_WATERMARK_SIZE);
> +			switch (rtd->i2s_instance) {
> +			case I2S_BT_INSTANCE:
> +				water_val =
> +					mmACP_BT_TX_INTR_WATERMARK_SIZE;
> +				reg_val = mmACP_BTTDM_ITER;
> +				ier_val = mmACP_BTTDM_IER;
> +				break;
> +			case I2S_SP_INSTANCE:
> +			default:
> +				water_val =
> +					mmACP_I2S_TX_INTR_WATERMARK_SIZE;
> +				reg_val = mmACP_I2STDM_ITER;
> +				ier_val = mmACP_I2STDM_IER;
> +			}
>   		} else {
> -			reg_val = mmACP_BTTDM_IRER;
> -			rv_writel(period_bytes, rtd->acp3x_base +
> -					mmACP_BT_RX_INTR_WATERMARK_SIZE);
> +			switch (rtd->i2s_instance) {
> +			case I2S_BT_INSTANCE:
> +				water_val =
> +					mmACP_BT_RX_INTR_WATERMARK_SIZE;
> +				reg_val = mmACP_BTTDM_IRER;
> +				ier_val = mmACP_BTTDM_IER;
> +				break;
> +			case I2S_SP_INSTANCE:
> +			default:
> +				water_val =
> +					mmACP_I2S_RX_INTR_WATERMARK_SIZE;
> +				reg_val = mmACP_I2STDM_IRER;
> +				ier_val = mmACP_I2STDM_IER;
> +			}
>   		}
> +		rv_writel(period_bytes, rtd->acp3x_base + water_val);
>   		val = rv_readl(rtd->acp3x_base + reg_val);
>   		val = val | BIT(0);
>   		rv_writel(val, rtd->acp3x_base + reg_val);
> -		rv_writel(1, rtd->acp3x_base + mmACP_BTTDM_IER);
> +		rv_writel(1, rtd->acp3x_base + ier_val);
> +		ret = 0;
>   		break;
>   	case SNDRV_PCM_TRIGGER_STOP:
>   	case SNDRV_PCM_TRIGGER_SUSPEND:
>   	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> -			reg_val = mmACP_BTTDM_ITER;
> -		else
> -			reg_val = mmACP_BTTDM_IRER;
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +			switch (rtd->i2s_instance) {
> +			case I2S_BT_INSTANCE:
> +				reg_val = mmACP_BTTDM_ITER;
> +				ier_val = mmACP_BTTDM_IER;
> +				break;
> +			case I2S_SP_INSTANCE:
> +			default:
> +				reg_val = mmACP_I2STDM_ITER;
> +				ier_val = mmACP_I2STDM_IER;
> +			}
>   
> +		} else {
> +			switch (rtd->i2s_instance) {
> +			case I2S_BT_INSTANCE:
> +				reg_val = mmACP_BTTDM_IRER;
> +				ier_val = mmACP_BTTDM_IER;
> +				break;
> +			case I2S_SP_INSTANCE:
> +			default:
> +				reg_val = mmACP_I2STDM_IRER;
> +				ier_val = mmACP_I2STDM_IER;
> +			}
> +		}
>   		val = rv_readl(rtd->acp3x_base + reg_val);
>   		val = val & ~BIT(0);
>   		rv_writel(val, rtd->acp3x_base + reg_val);
> -		rv_writel(0, rtd->acp3x_base + mmACP_BTTDM_IER);
> +		rv_writel(0, rtd->acp3x_base + ier_val);
> +		ret = 0;
>   		break;
>   	default:
>   		ret = -EINVAL;
> diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
> index f8ad7ce..77f2ed5 100644
> --- a/sound/soc/amd/raven/acp3x-pcm-dma.c
> +++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
> @@ -194,15 +194,31 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
>   static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
>   {
>   	u16 page_idx;
> -	u32 low, high, val, acp_fifo_addr;
> -	dma_addr_t addr = rtd->dma_addr;
> +	u32 low, high, val, acp_fifo_addr, reg_fifo_addr;
> +	u32 reg_ringbuf_size, reg_dma_size, reg_fifo_size;
> +	dma_addr_t addr;
>   
> -	/* 8 scratch registers used to map one 64 bit address */
> -	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
> -		val = 0;
> -	else
> -		val = rtd->num_pages * 8;
> +	addr = rtd->dma_addr;
>   
> +	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
> +		switch (rtd->i2s_instance) {
> +		case I2S_BT_INSTANCE:
> +			val = ACP_SRAM_BT_PB_PTE_OFFSET;
> +			break;
> +		case I2S_SP_INSTANCE:
> +		default:
> +			val = ACP_SRAM_SP_PB_PTE_OFFSET;
> +		}
> +	} else {
> +		switch (rtd->i2s_instance) {
> +		case I2S_BT_INSTANCE:
> +			val = ACP_SRAM_BT_CP_PTE_OFFSET;
> +			break;
> +		case I2S_SP_INSTANCE:
> +		default:
> +			val = ACP_SRAM_SP_CP_PTE_OFFSET;
> +		}
> +	}
>   	/* Group Enable */
>   	rv_writel(ACP_SRAM_PTE_OFFSET | BIT(31), rtd->acp3x_base +
>   		  mmACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
> @@ -224,38 +240,61 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
>   	}
>   
>   	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
> -		/* Config ringbuffer */
> -		rv_writel(MEM_WINDOW_START, rtd->acp3x_base +
> -			  mmACP_BT_TX_RINGBUFADDR);
> -		rv_writel(MAX_BUFFER, rtd->acp3x_base +
> -			  mmACP_BT_TX_RINGBUFSIZE);
> -		rv_writel(DMA_SIZE, rtd->acp3x_base + mmACP_BT_TX_DMA_SIZE);
> -
> -		/* Config audio fifo */
> -		acp_fifo_addr = ACP_SRAM_PTE_OFFSET + (rtd->num_pages * 8)
> -				+ PLAYBACK_FIFO_ADDR_OFFSET;
> -		rv_writel(acp_fifo_addr, rtd->acp3x_base +
> -			  mmACP_BT_TX_FIFOADDR);
> -		rv_writel(FIFO_SIZE, rtd->acp3x_base + mmACP_BT_TX_FIFOSIZE);
> +		switch (rtd->i2s_instance) {
> +		case I2S_BT_INSTANCE:
> +			reg_ringbuf_size = mmACP_BT_TX_RINGBUFSIZE;
> +			reg_dma_size = mmACP_BT_TX_DMA_SIZE;
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +						BT_PB_FIFO_ADDR_OFFSET;
> +			reg_fifo_addr = mmACP_BT_TX_FIFOADDR;
> +			reg_fifo_size = mmACP_BT_TX_FIFOSIZE;
> +			rv_writel(I2S_BT_TX_MEM_WINDOW_START,
> +				rtd->acp3x_base + mmACP_BT_TX_RINGBUFADDR);
> +			break;
> +
> +		case I2S_SP_INSTANCE:
> +		default:
> +			reg_ringbuf_size = mmACP_I2S_TX_RINGBUFSIZE;
> +			reg_dma_size = mmACP_I2S_TX_DMA_SIZE;
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +						SP_PB_FIFO_ADDR_OFFSET;
> +			reg_fifo_addr =	mmACP_I2S_TX_FIFOADDR;
> +			reg_fifo_size = mmACP_I2S_TX_FIFOSIZE;
> +			rv_writel(I2S_SP_TX_MEM_WINDOW_START,
> +				rtd->acp3x_base + mmACP_I2S_TX_RINGBUFADDR);
> +		}
>   	} else {
> -		/* Config ringbuffer */
> -		rv_writel(MEM_WINDOW_START + MAX_BUFFER, rtd->acp3x_base +
> -			  mmACP_BT_RX_RINGBUFADDR);
> -		rv_writel(MAX_BUFFER, rtd->acp3x_base +
> -			  mmACP_BT_RX_RINGBUFSIZE);
> -		rv_writel(DMA_SIZE, rtd->acp3x_base + mmACP_BT_RX_DMA_SIZE);
> -
> -		/* Config audio fifo */
> -		acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> -				(rtd->num_pages * 8) + CAPTURE_FIFO_ADDR_OFFSET;
> -		rv_writel(acp_fifo_addr, rtd->acp3x_base +
> -			  mmACP_BT_RX_FIFOADDR);
> -		rv_writel(FIFO_SIZE, rtd->acp3x_base + mmACP_BT_RX_FIFOSIZE);
> -	}
> +		switch (rtd->i2s_instance) {
> +		case I2S_BT_INSTANCE:
> +			reg_ringbuf_size = mmACP_BT_RX_RINGBUFSIZE;
> +			reg_dma_size = mmACP_BT_RX_DMA_SIZE;
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +						BT_CAPT_FIFO_ADDR_OFFSET;
> +			reg_fifo_addr = mmACP_BT_RX_FIFOADDR;
> +			reg_fifo_size = mmACP_BT_RX_FIFOSIZE;
> +			rv_writel(I2S_BT_RX_MEM_WINDOW_START,
> +				rtd->acp3x_base + mmACP_BT_RX_RINGBUFADDR);
> +			break;
>   
> -	/* Enable  watermark/period interrupt to host */
> -	rv_writel(BIT(BT_TX_THRESHOLD) | BIT(BT_RX_THRESHOLD),
> -		  rtd->acp3x_base + mmACP_EXTERNAL_INTR_CNTL);
> +		case I2S_SP_INSTANCE:
> +		default:
> +			reg_ringbuf_size = mmACP_I2S_RX_RINGBUFSIZE;
> +			reg_dma_size = mmACP_I2S_RX_DMA_SIZE;
> +			acp_fifo_addr = ACP_SRAM_PTE_OFFSET +
> +						SP_CAPT_FIFO_ADDR_OFFSET;
> +			reg_fifo_addr = mmACP_I2S_RX_FIFOADDR;
> +			reg_fifo_size = mmACP_I2S_RX_FIFOSIZE;
> +			rv_writel(I2S_SP_RX_MEM_WINDOW_START,
> +				rtd->acp3x_base + mmACP_I2S_RX_RINGBUFADDR);
> +		}
> +	}
> +	rv_writel(MAX_BUFFER, rtd->acp3x_base + reg_ringbuf_size);
> +	rv_writel(DMA_SIZE, rtd->acp3x_base + reg_dma_size);
> +	rv_writel(acp_fifo_addr, rtd->acp3x_base + reg_fifo_addr);
> +	rv_writel(FIFO_SIZE, rtd->acp3x_base + reg_fifo_size);
> +	rv_writel(BIT(I2S_RX_THRESHOLD) | BIT(BT_RX_THRESHOLD)
> +		| BIT(I2S_TX_THRESHOLD) | BIT(BT_TX_THRESHOLD),
> +		rtd->acp3x_base + mmACP_EXTERNAL_INTR_CNTL);
>   }
>   
>   static int acp3x_dma_open(struct snd_soc_component *component,
> @@ -288,17 +327,21 @@ static int acp3x_dma_open(struct snd_soc_component *component,
>   		return ret;
>   	}
>   
> -	if (!adata->play_stream && !adata->capture_stream)
> +	if (!adata->play_stream && !adata->capture_stream &&
> +		adata->i2ssp_play_stream && !adata->i2ssp_capture_stream)
>   		rv_writel(1, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
>   
> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>   		adata->play_stream = substream;
> -	else
> +		adata->i2ssp_play_stream = substream;
> +	} else {
>   		adata->capture_stream = substream;
> +		adata->i2ssp_capture_stream = substream;
> +	}
>   
>   	i2s_data->acp3x_base = adata->acp3x_base;
>   	runtime->private_data = i2s_data;
> -	return 0;
> +	return ret;
>   }
>   
>   
> @@ -306,16 +349,28 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
>   			       struct snd_pcm_substream *substream,
>   			       struct snd_pcm_hw_params *params)
>   {
> -	struct snd_pcm_runtime *runtime;
>   	struct i2s_stream_instance *rtd;
> +	struct snd_soc_pcm_runtime *prtd;
> +	struct snd_soc_card *card;
> +	struct acp3x_platform_info *pinfo;
>   	int status;
>   	u64 size;
>   
> -	runtime = substream->runtime;
> -	rtd = substream->private_data;
> +	prtd = substream->private_data;
> +	card = prtd->card;
> +	pinfo = snd_soc_card_get_drvdata(card);
> +	rtd = substream->runtime->private_data;
>   	if (!rtd)
>   		return -EINVAL;
>   
> +	if (pinfo)
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +			rtd->i2s_instance = pinfo->play_i2s_instance;
> +		else
> +			rtd->i2s_instance = pinfo->cap_i2s_instance;
> +	else
> +		pr_err("pinfo failed\n");
> +
>   	size = params_buffer_bytes(params);
>   	status = snd_pcm_lib_malloc_pages(substream, size);
>   	if (status < 0)
> @@ -336,12 +391,25 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
>   static snd_pcm_uframes_t acp3x_dma_pointer(struct snd_soc_component *component,
>   					   struct snd_pcm_substream *substream)
>   {
> +	struct snd_soc_pcm_runtime *prtd;
> +	struct snd_soc_card *card;
> +	struct acp3x_platform_info *pinfo;
>   	struct i2s_stream_instance *rtd;
>   	u32 pos;
>   	u32 buffersize;
>   	u64 bytescount;
>   
> +	prtd = substream->private_data;
> +	card = prtd->card;
>   	rtd = substream->runtime->private_data;
> +	pinfo = snd_soc_card_get_drvdata(card);
> +	if (pinfo) {
> +		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +			rtd->i2s_instance = pinfo->play_i2s_instance;
> +		else
> +			rtd->i2s_instance = pinfo->cap_i2s_instance;
> +	}
> +
>   	buffersize = frames_to_bytes(substream->runtime,
>   				     substream->runtime->buffer_size);
>   	bytescount = acp_get_byte_count(rtd, substream->stream);
> @@ -386,15 +454,19 @@ static int acp3x_dma_close(struct snd_soc_component *component,
>   	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
>   	adata = dev_get_drvdata(component->dev);
>   
> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>   		adata->play_stream = NULL;
> -	else
> +		adata->i2ssp_play_stream = NULL;
> +	} else {
>   		adata->capture_stream = NULL;
> +		adata->i2ssp_capture_stream = NULL;
> +	}
>   
>   	/* Disable ACP irq, when the current stream is being closed and
>   	 * another stream is also not active.
>   	 */
> -	if (!adata->play_stream && !adata->capture_stream)
> +	if (!adata->play_stream && !adata->capture_stream &&
> +		!adata->i2ssp_play_stream && !adata->i2ssp_capture_stream)
>   		rv_writel(0, adata->acp3x_base + mmACP_EXTERNAL_INTR_ENB);
>   	return 0;
>   }
> @@ -503,7 +575,7 @@ static int acp3x_resume(struct device *dev)
>   {
>   	struct i2s_dev_data *adata;
>   	int status;
> -	u32 val;
> +	u32 val, reg_val, frmt_val;
>   
>   	adata = dev_get_drvdata(dev);
>   	status = acp3x_init(adata->acp3x_base);
> @@ -514,32 +586,38 @@ static int acp3x_resume(struct device *dev)
>   		struct i2s_stream_instance *rtd =
>   			adata->play_stream->runtime->private_data;
>   		config_acp3x_dma(rtd, SNDRV_PCM_STREAM_PLAYBACK);
> -		rv_writel((rtd->xfer_resolution  << 3),
> -			  rtd->acp3x_base + mmACP_BTTDM_ITER);
> -		if (adata->tdm_mode == true) {
> -			rv_writel(adata->tdm_fmt, adata->acp3x_base +
> -				  mmACP_BTTDM_TXFRMT);
> -			val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
> -			rv_writel((val | 0x2), adata->acp3x_base +
> -				  mmACP_BTTDM_ITER);
> +		switch (rtd->i2s_instance) {
> +		case I2S_BT_INSTANCE:
> +			reg_val = mmACP_BTTDM_ITER;
> +			frmt_val = mmACP_BTTDM_TXFRMT;
> +			break;
> +		case I2S_SP_INSTANCE:
> +		default:
> +			reg_val = mmACP_I2STDM_ITER;
> +			frmt_val = mmACP_I2STDM_TXFRMT;
>   		}
>   	}
> -
>   	if (adata->capture_stream && adata->capture_stream->runtime) {
>   		struct i2s_stream_instance *rtd =
>   			adata->capture_stream->runtime->private_data;
>   		config_acp3x_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
> -		rv_writel((rtd->xfer_resolution  << 3),
> -			  rtd->acp3x_base + mmACP_BTTDM_IRER);
> -		if (adata->tdm_mode == true) {
> -			rv_writel(adata->tdm_fmt, adata->acp3x_base +
> -				  mmACP_BTTDM_RXFRMT);
> -			val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
> -			rv_writel((val | 0x2), adata->acp3x_base +
> -				  mmACP_BTTDM_IRER);
> +		switch (rtd->i2s_instance) {
> +		case I2S_BT_INSTANCE:
> +			reg_val = mmACP_BTTDM_IRER;
> +			frmt_val = mmACP_BTTDM_RXFRMT;
> +			break;
> +		case I2S_SP_INSTANCE:
> +		default:
> +			reg_val = mmACP_I2STDM_IRER;
> +			frmt_val = mmACP_I2STDM_RXFRMT;
>   		}
>   	}
> -
> +	rv_writel((rtd->xfer_resolution  << 3), rtd->acp3x_base + reg_val);

Build error, rtd is declared in scope of 'if' condition. Move the 
deceleration to function.


Thanks,

Akshu

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
