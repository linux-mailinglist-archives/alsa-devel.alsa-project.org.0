Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D10E4412
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 09:08:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A82A1772;
	Fri, 25 Oct 2019 09:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A82A1772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571987331;
	bh=fd13KGBOhXqJxyzfCM3ZegWFgqoyMrBOZTOgM+gY7PY=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ud40qJCgLzthvj9BGgPeLSrGLOPj8mZ705UHJxoJAAb6ZdCGXb2PLGYYT5hIvDUUt
	 yPQvBiHjTJAn3HJ3nQKUKIxXBc03Bkmh3jpxGN1kb6+btq6rEhQswym/xlbRSWsYUc
	 v1u+LQ9WbJQGnTCiV76Tla5SgYNnMeAytSCvQATo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B81B6F805FA;
	Fri, 25 Oct 2019 09:07:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0D36F803D7; Fri, 25 Oct 2019 09:06:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5C10F80368
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 09:06:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5C10F80368
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="ZRVSSbrY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LHOEnD/mKKtqXl5VtbWzJZwqKASE6w5xqLsLFPWji0ozZGLvVZFjzGnn1dB0tLTCcyA0DZuM9yNN4CQNhJolBCd1bRKrvtiTRRIy7ZD3ArUDNTn9IFwbmSZHMJOBpNh+jiRdfecgL8qSCGkhDh3p9HnR801NkGYOG269iiqST0KNheZYLKJq4KYQu/1gDvULx4RysgAfWo7g3TozrUjnou4XearShkcEOM2qcrDrfrZcvtko3yV8x6jfSD63WU1ELX7sxKjk7n/84l1InG6yaL+dS3LgxDcBJWyodALWtNwpoobAr2Y6i5FHg960VG23jjJBEhKlVBcDMjcYU3FgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBtKHtvMJuicEnmF6SA6UWD0aIFDLI/MpBFkzDohan4=;
 b=m0Ipr6swP3DtvVhfMvESiaFuAoFY5aldfa8L7ZLFsdiHAEHKsa3Ctf+q4SRIIGq2+qsTEJliOvZW8SHeNbOajolFFDLGfJkEMcaepkmUI9Z3HufJxKoAzzoVCI0rVhenZjaFy1oCnj5Kc3EaDWxy2MBYpTVUxW41piOTae9uUXfi024kLjTCFkodEsfRhVKR5OzB07TT7hsPQFai8TL2na0CjhS2A+rfZQ5GgWMsKeN8eKxBnEU/G3WbOFymsHVlpBdR7tGch/2ydI/QsAIoZRQZZpltMxqlfN2GQtDVI6uogObZJz+vHbs3YJ57ma09uM8+35mAQF+hDIgRM4uH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBtKHtvMJuicEnmF6SA6UWD0aIFDLI/MpBFkzDohan4=;
 b=ZRVSSbrYOl4CV1AvchVNSIZWw/v/FKJ8nUBjPWqWWxlttH+NLiCmemQ68RfWnaXtqFZrXybCV3fPXnKbaPwPEVeF5yJIaTFU0yVmj8/auRhFL/gxH6hS0EhrU8HJuRkiWMVN8/TaMWQmcDQnMwM0Izzzvl19EUosQXrc9oRtSgo=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB2747.namprd12.prod.outlook.com (20.176.116.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Fri, 25 Oct 2019 07:06:54 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1%4]) with mapi id 15.20.2387.021; Fri, 25 Oct 2019
 07:06:54 +0000
From: vishnu <vravulap@amd.com>
To: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
Thread-Topic: [PATCH 4/7] ASoC: amd: add ACP3x TDM mode support
Thread-Index: AQHVhZzKIQ2mYhOalE23ZXkh46pFtadq+sQA
Date: Fri, 25 Oct 2019 07:06:54 +0000
Message-ID: <ae25c498-dac1-ec27-cd47-622d94d45e5b@amd.com>
References: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1571432760-3008-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
In-Reply-To: <1571432760-3008-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BMXPR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:c::30) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.159.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 10a3a71f-0d45-40e8-fec7-08d75919ea7d
x-ms-traffictypediagnostic: DM6PR12MB2747:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB27476B79D30F429CD9CD7957E7650@DM6PR12MB2747.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(189003)(199004)(52116002)(102836004)(53546011)(71200400001)(386003)(6506007)(486006)(26005)(71190400001)(6862004)(36756003)(229853002)(8936002)(6512007)(81156014)(4326008)(6486002)(6246003)(6436002)(256004)(6636002)(478600001)(99286004)(66446008)(66556008)(76176011)(316002)(8676002)(31686004)(2906002)(64756008)(66476007)(31696002)(66946007)(7736002)(3846002)(186003)(54906003)(37006003)(11346002)(305945005)(2616005)(476003)(446003)(5660300002)(6116002)(66066001)(14454004)(81166006)(25786009)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2747;
 H:DM6PR12MB3868.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wQuOXALPdAbjn9JYHHV3sDaSIIAkPKo2qTHjoSmXyM4SEO4vIkZYak5k3I8K7STuckB93f2tCw6uv43hMQHnqidIOkgaewB0xjhsMSC77wk83raKZ3shzijITfXo+BFq7cPrSe0BCAwgdO9L3sW7P/2IftRq6kemd4GyIF2SMgbNwfbEybEbX14bpknzAHEjtO5n+LEiSkBVoKeVsh3v2IDXzpjBrBEm5SMEFX6pT6My5xlKtKt8bAubvRGDWOskxi+Lx/S3NvkA+rQomNSVLC98TXUjnF3t7/vkAFxzjmO8GILfsdafTVy2EFHkYT1vmEAj9P6DptMuMe4A9j5z/iV3iK9+WBY1pQwnJspyl9TYa159cS0H07+jm6tOdkdR8RIGTWM+tmKigNZ+jdyLu5AFd4xUCQ4S5Z/j244eWQhQsEpgVoKt/QS3or/fGVw/
Content-ID: <ECFAE3E7CBA0EB4C9B914B06A8843620@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a3a71f-0d45-40e8-fec7-08d75919ea7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 07:06:54.1323 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sVE84XyDxccTngrUal4t5oKJIYrIGmPY3uYnchsHfXX1e/ew1Zns31dVnEIdZvAwWYe+UmoRRtduQRrhmWI/Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2747
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC
 AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Srinivas Bayyavarapu <Maruthi.Bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [alsa-devel] [PATCH 4/7] ASoC: amd: add ACP3x TDM mode support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Mark,

Any updates on this patch.

Regards,
Vishnu

On 19/10/19 2:35 AM, Ravulapati Vishnu vardhan rao wrote:
> ACP3x I2S (CPU DAI) can act in normal I2S and TDM modes. Added support
> for TDM mode. Desired mode can be selected from ASoC machine driver.
> 
> Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
> ---
>   sound/soc/amd/raven/acp3x-i2s.c | 51 +++++++++++++++++++++++++++++++++--------
>   sound/soc/amd/raven/acp3x.h     |  2 ++
>   2 files changed, 43 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
> index b7f610f..7e22d22 100644
> --- a/sound/soc/amd/raven/acp3x-i2s.c
> +++ b/sound/soc/amd/raven/acp3x-i2s.c
> @@ -43,7 +43,8 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
>   		u32 rx_mask, int slots, int slot_width)
>   {
>   	u32 val = 0;
> -	u16 slot_len;
> +	u32 mode = 0;
> +	u16 slot_len, flen;
>   
>   	struct i2s_dev_data *adata = snd_soc_dai_get_drvdata(cpu_dai);
>   
> @@ -64,16 +65,46 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai, u32 tx_mask,
>   		return -EINVAL;
>   	}
>   
> -	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
> -	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_ITER);
> -	val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
> -	rv_writel((val | 0x2), adata->acp3x_base + mmACP_BTTDM_IRER);
> +	/* Enable I2S / BT channels TDM and respective
> +	 * I2S/BT`s TX/RX Formats frame lengths.
> +	 */
> +	flen = (FRM_LEN | (slots << 15) | (slot_len << 18));
>   
> -	val = (FRM_LEN | (slots << 15) | (slot_len << 18));
> -	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_TXFRMT);
> -	rv_writel(val, adata->acp3x_base + mmACP_BTTDM_RXFRMT);
> -
> -	adata->tdm_fmt = val;
> +	if (adata->substream_type == SNDRV_PCM_STREAM_PLAYBACK) {
> +		switch (adata->i2s_instance) {
> +		case I2S_BT_INSTANCE:
> +			val = rv_readl(adata->acp3x_base + mmACP_BTTDM_ITER);
> +			rv_writel((val | 0x2),
> +				adata->acp3x_base + mmACP_BTTDM_ITER);
> +			rv_writel(flen,
> +				adata->acp3x_base + mmACP_BTTDM_TXFRMT);
> +		break;
> +		case I2S_SP_INSTANCE:
> +			val = rv_readl(adata->acp3x_base + mmACP_I2STDM_ITER);
> +			rv_writel((val | 0x2),
> +				adata->acp3x_base + mmACP_I2STDM_ITER);
> +			rv_writel(flen,
> +				adata->acp3x_base + mmACP_I2STDM_TXFRMT);
> +		}
> +	} else {
> +		switch (adata->i2s_instance) {
> +		case I2S_BT_INSTANCE:
> +			val = rv_readl(adata->acp3x_base + mmACP_BTTDM_IRER);
> +			rv_writel((val | 0x2),
> +				adata->acp3x_base + mmACP_BTTDM_IRER);
> +			rv_writel(flen,
> +				adata->acp3x_base + mmACP_BTTDM_RXFRMT);
> +		break;
> +		case I2S_SP_INSTANCE:
> +		default:
> +			val = rv_readl(adata->acp3x_base + mmACP_I2STDM_IRER);
> +			rv_writel((val | 0x2),
> +				adata->acp3x_base + mmACP_I2STDM_IRER);
> +			rv_writel(flen,
> +				adata->acp3x_base + mmACP_I2STDM_RXFRMT);
> +		}
> +	}
> +	adata->tdm_fmt = flen;
>   	return 0;
>   }
>   
> diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
> index b1990c9..dba7065 100644
> --- a/sound/soc/amd/raven/acp3x.h
> +++ b/sound/soc/amd/raven/acp3x.h
> @@ -76,6 +76,8 @@ struct i2s_dev_data {
>   	bool tdm_mode;
>   	unsigned int i2s_irq;
>   	u32 tdm_fmt;
> +	u16 i2s_instance;
> +	u32 substream_type;
>   	void __iomem *acp3x_base;
>   	struct snd_pcm_substream *play_stream;
>   	struct snd_pcm_substream *capture_stream;
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
