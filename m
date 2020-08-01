Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6B6235093
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Aug 2020 07:13:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65C1316C2;
	Sat,  1 Aug 2020 07:12:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65C1316C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596258829;
	bh=liPBkfS706smDTuFF5ki8Me1RGedJ9PvPRquDzQtstY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s5rGX9hvyM76lp37sZuBDz17X5J+SLyYY5wYLR12OKnyJm0hAEe8b4bghHk5QENSq
	 uW0IshXtveYpteEup+RIOncfaDNs1wfnlqKJoimDAIuxM6u95nWppgpc9cpYbVhXdQ
	 XCbYxg7XlBIvjfBleKtC2wgzBvlB8XltZAcsIH08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B5D1F8015C;
	Sat,  1 Aug 2020 07:12:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F0B7F8021E; Sat,  1 Aug 2020 07:12:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37D23F8015C
 for <alsa-devel@alsa-project.org>; Sat,  1 Aug 2020 07:11:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37D23F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="iVQ79rPA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i79OsSeEh6PVGEQmZ4DsN45a9h4gW8I0hQxtcdOm0cYE9W95Uiz0oH38gKlsCJNnTHQGlyuVOnuhFb5mx6ThEAUte+sRcvhTyyMe1BTSUadr/csBAq0teKXIl0ta+ZOjrpQglU/dn4GreEg7wZ5PZEseN5oSvWHNgILacke0EIs6enxsZHBqjh4fx+oaUx6xhafBHlF6xpMvIdPT0Dr4PqXFNk1dXLhR30TxVxeX7IcEAO5X6LiTX1ga6l6g2acFSD/Ec7tPggrD1dGf+fhZHCMOm7a0yUEB6GCFHzU7szgGPztN1mV8dGaXsKodGn7T3tsgAATPuUwK6JmmiU3Uxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8nPj0eix6DAxr4o8qpAdN4nfMR7ubcANTKedF+CG0E=;
 b=jHNhjIwEdUT01Bp7fOkZ760aAA3vP7IudkQ0Ybzi/mtsTPJ5Zm5QZ0HqKusU7apSgmf0YRz/0hU4Tncyedmncc0mxP7tkqSm43S6vsgMn2ajyTNgJwEe/CPICXXhQc1WNXEcN9Cfqab7rgQr+PN6hk1vVZcaG+K+QeO9SCWYm0L+4UALyr1i+uz9gb+XPvseCZYzjVkTwlNh9tLRuQHmHsRe1VCygA1+tz+WYpbcuxWMPFRfFDFzktCqVR9sCaFAZkD7rD2u6ITnAtbuDgpnE/bWA4VCTQd2boM24DMo8Kjksce32OCCq/O0N315VTlX3F+ALcSG7/fl56qV3PjX2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8nPj0eix6DAxr4o8qpAdN4nfMR7ubcANTKedF+CG0E=;
 b=iVQ79rPAVYgMi3THYb5cpYKvcZRCRCWVoHeqNPQy5a4A33aPcqIxk5xfIf1UVUnUiUOmdnUHuo2ReS49Y6DWAATxElN+JBlIa8QWbwEEo0CxaNdlLPT1h87iUbEGTLK7CPpfv28TW4kq859d9AQ0nSOy81jmAVUMDGrOC0Jdj8M=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1663.namprd12.prod.outlook.com (2603:10b6:301:e::9) by
 MWHPR12MB1437.namprd12.prod.outlook.com (2603:10b6:300:7::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20; Sat, 1 Aug 2020 05:11:50 +0000
Received: from MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::45:3012:7b13:778c]) by MWHPR12MB1663.namprd12.prod.outlook.com
 ([fe80::45:3012:7b13:778c%8]) with mapi id 15.20.3239.020; Sat, 1 Aug 2020
 05:11:50 +0000
Subject: Re: [PATCH v2] ASoC: amd: renoir: restore two more registers during
 resume
To: Hui Wang <hui.wang@canonical.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <20200730123138.5659-1-hui.wang@canonical.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Message-ID: <44945fdf-8aca-8ecd-74d1-7cceb267968a@amd.com>
Date: Sat, 1 Aug 2020 10:56:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200730123138.5659-1-hui.wang@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::29) To MWHPR12MB1663.namprd12.prod.outlook.com
 (2603:10b6:301:e::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.129.8.176] (165.204.159.251) by
 BMXPR01CA0065.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:2c::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.16 via Frontend Transport; Sat, 1 Aug 2020 05:11:48 +0000
X-Originating-IP: [165.204.159.251]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 798d4af0-bd72-4b2a-5379-08d835d96553
X-MS-TrafficTypeDiagnostic: MWHPR12MB1437:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1437704524412BC07203C318974F0@MWHPR12MB1437.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xOqTH6FDZpHMpZ8zVfaAEM7gWRZjECq3S6PvsF4xMjrWArdpFrgZl7uo+VLpynLmEDoyAm8YhZtTXqPrqcBZzJP50sJKxE8R6DPLW6z3iWIBcohMB7yhkveGuuHJMJuvCixtzgjg5eH92KtRItsy++ZmPxj5VNrsaRTJz/GIsaWs/2iBxvaGL+Hnu3cZ8sosEiDYf9M7RVSCw8sJMuSWuv0pMLSgFbbOeJ0s3OrECBiQg/h6hR3nlwEH2oPmVoQFSXGkYkP7xaztxLU6Pt+hymuzvdnnVbS0YHpRJS+xfcebMXow+UgF0JcUygIQDf2FohvLwEBCTB677uE2Qs09VbiZReItJWDNpIzABe866RepyTxUFF45bnYExnRM4y7S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(478600001)(16526019)(956004)(2616005)(31686004)(8936002)(186003)(316002)(53546011)(16576012)(8676002)(36756003)(26005)(4326008)(6486002)(52116002)(5660300002)(83380400001)(6666004)(86362001)(66556008)(31696002)(2906002)(66946007)(66476007)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: qSAfDHi9z7+ukqYxr5R9UyHR9APvWq9RXyp6eNj2wqtw9CgMhxZafVYCTTfd6jV6E2/KsfPbomYHc04WaGyxfQ8mFBkZEBUSzMl2LrhhvjYoKL/8pT9aNQzMhWUaxOjdnQ2Y9wIDcmfanZanWmpzqsT7rP66dRnvZmoeDREqegrVGrSs/Bxu6ur3oOTrx+gZTbRyfyYMNrGf+Qrd12DmULBlHSlSNDBBgKCKsj+GfV7eiRuPoos5GutXo+fLSQpsW4HCXZZZshTjS3xmw8H3BhAbnJFbylGB2d68EhvZJ8dhyMihSdirJiO/8vcaFzue2N9N1YzcyDS0SAMCEQO5fIiX3oN8TlOTFyEkDaQ4kRfYmeeRgF9UBJ5BCXP26nJ/1R1IiSqh9AB/+XTbDYJf3tudtEiqQBZq12wbaP1G/aF5A9Q6PuEDBdOZIzimCik6XdTKpWC8Ow2Wt08civIPkDRigrzMIBh7Me8EzliUT05LJlwk6YSzGmA8amQyW0BXAWvoUAPg+Eb5JVk8gDhlqbyTfK3FzAZZ1eFzNS3KVvqXw4CA7Qb8/xxhf6IeGUyvtyQepexHEhGDdRY/oVVJ6vksS3nzidiS1czAc5FBHQ2sJY4Qw4TzqiN6AXaK8bFg7ssoLY3jraDsjYZWvBbnOw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 798d4af0-bd72-4b2a-5379-08d835d96553
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2020 05:11:49.9219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kR8vwmxX0eeoovi911TGCDV9g5IIG8ulq+lyoiU9FOI9ZUIHom7BAP8tLgio5RcBUVHRAANGo5AT8+6cTDDsRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1437
Cc: stable@vger.kernel.org
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



On 30/07/20 6:01 pm, Hui Wang wrote:
> Recently we found an issue about the suspend and resume. If dmic is
> recording the sound, and we run suspend and resume, after the resume,
> the dmic can't work well anymore. we need to close the app and reopen
> the app, then the dmic could record the sound again.
> 
> For example, we run "arecord -D hw:CARD=acp,DEV=0 -f S32_LE -c 2
> -r 48000 test.wav", then suspend and resume, after the system resume
> back, we speak to the dmic. then stop the arecord, use aplay to play
> the test.wav, we could hear the sound recorded after resume is weird,
> it is not what we speak to the dmic.
> 
> I found two registers are set in the dai_hw_params(), if the two
> registers are set during the resume, this issue could be fixed.
> Move the code of the dai_hw_params() into the pdm_dai_trigger(), then
> these two registers will be set during resume since pdm_dai_trigger()
> will be called during resume. And delete the empty function
> dai_hw_params().
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
Reviewed-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> ---
>   sound/soc/amd/renoir/acp3x-pdm-dma.c | 29 +++++++++-------------------
>   1 file changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
> index 623dfd3ea705..7b14d9a81b97 100644
> --- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
> +++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
> @@ -314,40 +314,30 @@ static int acp_pdm_dma_close(struct snd_soc_component *component,
>   	return 0;
>   }
>   
> -static int acp_pdm_dai_hw_params(struct snd_pcm_substream *substream,
> -				 struct snd_pcm_hw_params *params,
> -				 struct snd_soc_dai *dai)
> +static int acp_pdm_dai_trigger(struct snd_pcm_substream *substream,
> +			       int cmd, struct snd_soc_dai *dai)
>   {
>   	struct pdm_stream_instance *rtd;
> +	int ret;
> +	bool pdm_status;
>   	unsigned int ch_mask;
>   
>   	rtd = substream->runtime->private_data;
> -	switch (params_channels(params)) {
> +	ret = 0;
> +	switch (substream->runtime->channels) {
>   	case TWO_CH:
>   		ch_mask = 0x00;
>   		break;
>   	default:
>   		return -EINVAL;
>   	}
> -	rn_writel(ch_mask, rtd->acp_base + ACP_WOV_PDM_NO_OF_CHANNELS);
> -	rn_writel(PDM_DECIMATION_FACTOR, rtd->acp_base +
> -		  ACP_WOV_PDM_DECIMATION_FACTOR);
> -	return 0;
> -}
> -
> -static int acp_pdm_dai_trigger(struct snd_pcm_substream *substream,
> -			       int cmd, struct snd_soc_dai *dai)
> -{
> -	struct pdm_stream_instance *rtd;
> -	int ret;
> -	bool pdm_status;
> -
> -	rtd = substream->runtime->private_data;
> -	ret = 0;
>   	switch (cmd) {
>   	case SNDRV_PCM_TRIGGER_START:
>   	case SNDRV_PCM_TRIGGER_RESUME:
>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		rn_writel(ch_mask, rtd->acp_base + ACP_WOV_PDM_NO_OF_CHANNELS);
> +		rn_writel(PDM_DECIMATION_FACTOR, rtd->acp_base +
> +			  ACP_WOV_PDM_DECIMATION_FACTOR);
>   		rtd->bytescount = acp_pdm_get_byte_count(rtd,
>   							 substream->stream);
>   		pdm_status = check_pdm_dma_status(rtd->acp_base);
> @@ -369,7 +359,6 @@ static int acp_pdm_dai_trigger(struct snd_pcm_substream *substream,
>   }
>   
>   static struct snd_soc_dai_ops acp_pdm_dai_ops = {
> -	.hw_params = acp_pdm_dai_hw_params,
>   	.trigger   = acp_pdm_dai_trigger,
>   };
>   
> 
