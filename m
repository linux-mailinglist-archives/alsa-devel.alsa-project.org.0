Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1776C70FBD1
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 18:40:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0BC2204;
	Wed, 24 May 2023 18:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0BC2204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684946434;
	bh=bWCXE/OOk5RKGqCRmEcVQwJ33xzqnhuTnvej+AoXsas=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e+5iVa5FvFMHfNoYt/UiPV17IRFL/1n9MfrUOmLUIL//8f1AfTNTQxdqTZduEZ2wz
	 EvMWZBSzO23D/ABwH5Qzi29cbys745biBpnaRicawAqo77XCKvohJsdZxvn9821D19
	 5KsIjuXUpdRKKmsCXMhn1atMBE5+QD3Kzz7WKAFE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B851CF80548; Wed, 24 May 2023 16:10:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 545EAF80249;
	Wed, 24 May 2023 16:10:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB742F8024E; Wed, 24 May 2023 16:10:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C3D3F80053
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 16:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C3D3F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=i7PT2Nr1
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34OCLYBD028139;
	Wed, 24 May 2023 09:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=4CRN6cX3nFejeH9of7HvnG8/+qVlZ/0uL+vakv3omEM=;
 b=i7PT2Nr1WPHPUUsNGfdf/tPz5aayfT4/TvV/4MU3rQzRbsTgzZRqCoBMiXxxzzbFsbIi
 ml6UqPD87fwQ0YXBKe9P9bchpbCWxh7Fpo0G4J5I9hvV7oilhY01VhU8+YX9gvjNLsgx
 BrM9xmjlva29K6I70OQ07oPsKXAXS0PpqC9xfvr9nCpBdaA+xRb/DT6z2u3AA+TMelw7
 7MeK4rJL4O8HCZRk0K4DK65hhffwgW7B2UW6LOFVh9dAQWUqhDCaK/JpWH7Qb/u5oWix
 FoB8iQ+WY+HIRsaQmXoOVh+Gu8+N8ZRN1grbx5iHBxQikuqLo6yPuvP7MdU65lq85l2r hQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3qsde8gerk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 May 2023 09:10:08 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Wed, 24 May
 2023 09:10:06 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 24 May 2023 09:10:06 -0500
Received: from [198.90.251.127] (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D708411D4;
	Wed, 24 May 2023 14:10:05 +0000 (UTC)
Message-ID: <19426e6c-d719-b85b-8ef2-f0f3fd3fa12e@opensource.cirrus.com>
Date: Wed, 24 May 2023 15:10:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: cs42l42: Add PLL ratio table values
Content-Language: en-US
To: Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
        Mark Brown
	<broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>
References: <20230524125236.57149-1-vitalyr@opensource.cirrus.com>
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20230524125236.57149-1-vitalyr@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hKuRP4Ug16q1rqZKtMu8kii27k9k3AFW
X-Proofpoint-GUID: hKuRP4Ug16q1rqZKtMu8kii27k9k3AFW
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: CKKD7R5UAUTZ3XNZHG2X46Q64666VSVY
X-Message-ID-Hash: CKKD7R5UAUTZ3XNZHG2X46Q64666VSVY
X-MailFrom: prvs=050894cdcc=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CKKD7R5UAUTZ3XNZHG2X46Q64666VSVY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/05/2023 13:52, Vitaly Rodionov wrote:
> Add 4.8Mhz 9.6Mhz and 19.2MHz SCLK values
> for MCLK 12MHz and 12.288MHz requested by Intel.
> 
> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
> ---
>   sound/soc/codecs/cs42l42.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
> index e3edaa1a2761..8aa6af21e52c 100644
> --- a/sound/soc/codecs/cs42l42.c
> +++ b/sound/soc/codecs/cs42l42.c
> @@ -646,12 +646,19 @@ static const struct cs42l42_pll_params pll_ratio_table[] = {
>   	{ 3072000,  1, 0x00, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125, 1},
>   	{ 4000000,  1, 0x00, 0x30, 0x800000, 0x03, 0x10, 12000000,  96, 1},
>   	{ 4096000,  1, 0x00, 0x2E, 0xE00000, 0x03, 0x10, 12000000,  94, 1},
> +	{ 4800000,  1, 0x01, 0x50, 0x000000, 0x03, 0x10, 12000000,  80, 2},
> +	{ 4800000,  1, 0x01, 0x50, 0x000000, 0x01, 0x10, 12288000,  82, 2},
>   	{ 5644800,  1, 0x01, 0x40, 0x000000, 0x03, 0x10, 11289600, 128, 1},
>   	{ 6000000,  1, 0x01, 0x40, 0x000000, 0x03, 0x10, 12000000, 128, 1},
>   	{ 6144000,  1, 0x01, 0x3E, 0x800000, 0x03, 0x10, 12000000, 125, 1},
> +	{ 6144000,  1, 0x01, 0x40, 0x000000, 0x03, 0x10, 12288000, 128, 1},
> +	{ 9600000,  1, 0x02, 0x50, 0x000000, 0x03, 0x10, 12000000,  80, 2},
> +	{ 9600000,  1, 0x02, 0x50, 0x000000, 0x01, 0x10, 12288000,  82, 2},
>   	{ 11289600, 0, 0, 0, 0, 0, 0, 11289600, 0, 1},
>   	{ 12000000, 0, 0, 0, 0, 0, 0, 12000000, 0, 1},
>   	{ 12288000, 0, 0, 0, 0, 0, 0, 12288000, 0, 1},
> +	{ 19200000, 1, 0x03, 0x50, 0x000000, 0x03, 0x10, 12000000,  80, 2},
> +	{ 19200000, 1, 0x03, 0x50, 0x000000, 0x01, 0x10, 12288000,  82, 2},
>   	{ 22579200, 1, 0x03, 0x40, 0x000000, 0x03, 0x10, 11289600, 128, 1},
>   	{ 24000000, 1, 0x03, 0x40, 0x000000, 0x03, 0x10, 12000000, 128, 1},
>   	{ 24576000, 1, 0x03, 0x40, 0x000000, 0x03, 0x10, 12288000, 128, 1}

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
