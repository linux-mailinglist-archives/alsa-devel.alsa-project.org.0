Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B83C6E4415
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 09:09:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C9CA177E;
	Fri, 25 Oct 2019 09:08:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C9CA177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571987352;
	bh=l9b+U0Picy0uqofYlm3UXZ9D4kUEGsejeB1EKYougSk=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=doFCyRYZsjYaRkEul6bXqYQb6WiYBN7LiHI1dikGVt3A5fEmF5fJsJVgFH+CXwgCH
	 joT4WU9rK5dQ1Cbsvc6DTKxbqnfdwv8vPru1Dt+hTHD8dUedvkvnwlOhl8/J6Rf/lc
	 Q9QieKr3zEeaJ6gTFW72FaJWqAjCFufnWpjaCIlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 434A8F80368;
	Fri, 25 Oct 2019 09:08:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFDCBF803D7; Fri, 25 Oct 2019 09:08:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::613])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03389F80274
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 09:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03389F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="t4cnUSQS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHFKkHZaIN3Cq5pgrdZIrE0BnmARgU/PerpgUELaatufv/CO8jn/7KaocsVw29b1V1+LEH6qV0SMqNvlln4yPNwiIzaRSF5RU6VDDy+ruf4wApR+TIgqPsUheSFIYByQVbrsSL9yRuTHDtwnTZO6v0vgpLwC5tAX9G46XjgXrQu31Sr4PhAu4Ghp6dFNt6wl00uvvrptDAmRAEZXZU3Ix5uJbZQuX6IuKvtkblrOzNW3E/CsQNTjASCo2JCQiHMBjafdGY5MZQOYzC20bhqzAZlkfH9m3Zmbw2MrqPII5ajyZySja6X2gxbkDh003K08ppVaxXuf/rSIu8wM4yVAUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2oErCeHqGTaVCkywNnp+XsZ3rAVU9iNPBR1kZQynvY=;
 b=k873WVLZga5HoMD8nl/y6HVJMF/1k/ha6JdsS8GB9xTJl0j+6s8RDQQ7eOMrKSss+pg4bSV7AR2Lrira1GmTl6BnJT7ZAhjJh61DbkAYCJUlWe7JEneFZC1ib+q91y2/sGahRAC42ioQ7eHiR21J7K/OQwjYWGhvryzAYGloJKn2skC5uGXidsr4bzrSpYwn94uqru+zdzOP/UxpUqHT3301xH4hCU0yAQFhUFHc+nlYABlrKSyChDNWqF/qMsur2q9EpnYXxs9ftG8Hg28EnJkOIfi0jG3jUkSaXKH1puz9nPdsOzKcRIqysadSkvmNlHVAED96DjqsqcwZ6aV1GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2oErCeHqGTaVCkywNnp+XsZ3rAVU9iNPBR1kZQynvY=;
 b=t4cnUSQSOrEip0hPG3BMX9rCKW+KXB6I240O44pz5hwP+qqstgQ9B1SR+9lb2GZWf+VvbT+YVFIGtvRKsaElPq3FcGK1LapM8nYb5T3JqnHVzFFbJMMSLDij08CvfDl2cOEzv24tQ8sIm+OAejS4ZZccD+krbkZY2uNDGlSQlio=
Received: from DM6PR12MB3868.namprd12.prod.outlook.com (10.255.173.213) by
 DM6PR12MB2747.namprd12.prod.outlook.com (20.176.116.25) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Fri, 25 Oct 2019 07:07:58 +0000
Received: from DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1]) by DM6PR12MB3868.namprd12.prod.outlook.com
 ([fe80::64dd:646d:6fa1:15a1%4]) with mapi id 15.20.2387.021; Fri, 25 Oct 2019
 07:07:58 +0000
From: vishnu <vravulap@amd.com>
To: "RAVULAPATI, VISHNU VARDHAN RAO" <Vishnuvardhanrao.Ravulapati@amd.com>
Thread-Topic: [PATCH 5/7] ASoC: amd: handle ACP3x i2s-sp watermark interrupt.
Thread-Index: AQHVhZzM/IT5SCb7bEWc0HutxlD0F6dq+w+A
Date: Fri, 25 Oct 2019 07:07:57 +0000
Message-ID: <a4be9768-165d-0a4d-411c-45e80b431cb6@amd.com>
References: <1571432760-3008-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
 <1571432760-3008-5-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
In-Reply-To: <1571432760-3008-5-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BM1PR0101CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::19) To DM6PR12MB3868.namprd12.prod.outlook.com
 (2603:10b6:5:1c8::21)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Vishnuvardhanrao.Ravulapati@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.159.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3446d718-6b37-42e0-71e5-08d7591a1071
x-ms-traffictypediagnostic: DM6PR12MB2747:|DM6PR12MB2747:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB274763DF162EBBE7A0003E43E7650@DM6PR12MB2747.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:232;
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
x-microsoft-antispam-message-info: QNKjMWzXdlyNCSQKrjfWlU66LzScCitOndUk+g/wv1STtjioomajfo+++x3HRHQ6bcz8ZOP5D/W5XxRndBRPMbrnt0YgKrKqgrfwVzVGz5KC4NXWI95dwDg+wQNxusbPtHLLoV2Pflhk78s3Eqq55t/pNoDtv4DjvAuYZhXhdh+SolqQtBBbjWd7hF/wszbwo4cJS8Meo1gGNhvTRFDi3ae4B4RE6FHu34XAaQhPiveNzHJ121437+xrX1KFiLb0Au4zDDk4M//XAUimKd12NR+ZIuTKBFe52W69+kJKI+27IBJ6Z0WWE8BPQteuvdvnMMczeF6NeIPU+XiTD3ulPRg/G6v+2EJbUvdK4k94VnR8EggdBC83xTOVVPVyYAqNXtik1TOkj+sMO1RrPKk0FEnC9oC/6VbwO4sJRywEguF3hvaUKpTeLRXrXL2RyMYk
Content-ID: <9ABA409645FFD6418EE19220B9B57313@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3446d718-6b37-42e0-71e5-08d7591a1071
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 07:07:57.8295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KROeg8gAZQDevbJo68hHXYfvSZS/X+PJpKW/hAXEaXcjFONMPt189Cteou8fNktqZwWo3aECKSDGqrCtBnMTBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2747
Cc: "moderated list:SOUND - SOC LAYER /
 DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 open list <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, "Mukunda,
 Vijendar" <Vijendar.Mukunda@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>
Subject: Re: [alsa-devel] [PATCH 5/7] ASoC: amd: handle ACP3x i2s-sp
	watermark interrupt.
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
> whenever audio data equal to I2S-SP fifo watermark level is
> produced/consumed, interrupt is generated.
> 
> Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
> ---
>   sound/soc/amd/raven/acp3x-pcm-dma.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
> index 4fcef3f..a000ac4 100644
> --- a/sound/soc/amd/raven/acp3x-pcm-dma.c
> +++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
> @@ -176,6 +176,13 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
>   		snd_pcm_period_elapsed(rv_i2s_data->play_stream);
>   		play_flag = 1;
>   	}
> +	if ((val & BIT(I2S_TX_THRESHOLD)) &&
> +				rv_i2s_data->i2ssp_play_stream) {
> +		rv_writel(BIT(I2S_TX_THRESHOLD),
> +			rv_i2s_data->acp3x_base	+ mmACP_EXTERNAL_INTR_STAT);
> +		snd_pcm_period_elapsed(rv_i2s_data->i2ssp_play_stream);
> +		play_flag = 1;
> +	}
>   
>   	if ((val & BIT(BT_RX_THRESHOLD)) && rv_i2s_data->capture_stream) {
>   		rv_writel(BIT(BT_RX_THRESHOLD), rv_i2s_data->acp3x_base +
> @@ -183,6 +190,13 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
>   		snd_pcm_period_elapsed(rv_i2s_data->capture_stream);
>   		cap_flag = 1;
>   	}
> +	if ((val & BIT(I2S_RX_THRESHOLD)) &&
> +				rv_i2s_data->i2ssp_capture_stream) {
> +		rv_writel(BIT(I2S_RX_THRESHOLD),
> +			 rv_i2s_data->acp3x_base + mmACP_EXTERNAL_INTR_STAT);
> +		snd_pcm_period_elapsed(rv_i2s_data->i2ssp_capture_stream);
> +		cap_flag = 1;
> +	}
>   
>   	if (play_flag | cap_flag)
>   		return IRQ_HANDLED;
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
