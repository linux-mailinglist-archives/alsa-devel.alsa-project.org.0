Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4AE398BA2
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 16:07:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68C5116F2;
	Wed,  2 Jun 2021 16:06:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68C5116F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622642843;
	bh=P5AVhy+yL8FBuhGh1dLVAmgSjk47AFb8qgPpHqfJfAY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JX3ymVX8m1aJiB9gXaPcpCWnQqLUHGQtwAr0VkuNpLj+oo0Y2rE48X+fhUp7u3VLq
	 Fziujep1GYsXuMqWBdGsGNOGXQxXLOg9PZuWJp89BxK+M7Te2QSDcvI10fYJVxBvZB
	 l2auUGY9fIzx9tRelc3WrmRzd+92DMw925rWfvaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E998FF802A9;
	Wed,  2 Jun 2021 16:05:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DBDBF80424; Wed,  2 Jun 2021 16:05:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FREEMAIL_FROM,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11olkn2055.outbound.protection.outlook.com [40.92.18.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44995F80103
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 16:05:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44995F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="IXJqzaRT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QyqFnBrwrD5/IUybvXllEGCXqY0rK9EDOrDSHvj96sjVjTDZfOLeCLt94ExAU1JRgoZuvsNgHDlDS0We5ES5zjdY1S9TkJxedIHltvc2wPeHmpOWg+w6OmXpitLqO+mwMrTRKR+ceB3mlzFwkVu0+lL4CWi68QvEZ+3Vg3i2RkH1KRNOTUEzqlmgLNvGadhwyHx+SbEuALVOiD0hHsG7ZzDLjAkM34fUZM1tkofN9mfJxAUqI3+U0dqDMwvDFQFJAD+zSIgos7rN2umufNnwVvNkyXRLL29pCpkgxf4sSfIa+Xk9hWfsJMj6Ggt5cSK8tFeViMtOFM9mFPZ1JaF36w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kned7BFnD27htUTKwsbnPwm42q5/S7faMf/Xsx+bgro=;
 b=M/u8oRo/L8k/yK06ehCDniS0f85fXgjEVpx9KzPSuD7RGrLUTe8awCfthXWCZdIriAlPwTjVmI8OtHGCZLDwWKIiLHZcvN+KgR/FV1VDdJ15W37bFgOiPoUcYJXBMyX3C1qEAXsUenu3jGa3njBCSefiR4gojCaL0UJPRcAkH7Q0bfObhA2Nv0LBHhfbGM1UXDY/JfBjCj28CAAP53fskz0Mf2veaaDMIknYH+L3n1v8RfNvB6cnJd3eZ3zgndMLkLCnMtYhH3A4mFNCrv+MNMRz4Q7zVfwbb4V2tOzIhbaHCUwgsQW8sJ6hgPo6BY8Cs2EncF0b897DXeVO5Biu6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kned7BFnD27htUTKwsbnPwm42q5/S7faMf/Xsx+bgro=;
 b=IXJqzaRT1Z/Bk7kJDxPuqQNEVarWQlDbEHSzaSIYxRNVqETPD0oSO7CDRzfwoSng8xI19PmSyxnLINCwPxWH8QXtzU/1NSKAcuDjqDytfyiaPxLA3eydqhvSTioW5t46mWKWsgID1BjqG+67DVAGsp9EhuPBLDc9rdakEWYX6qNwhwBZpT35rYMSS8XKksWeIj3zIM44kYk4ZTB5qbYq7RCmxyHjkJ0s5DEOAyopuHKIOyGuvfvQMld8UmkXpOt7WbqSktPrNAOsKu04duVv6L92sNHNnTvOYHuOBiPDPDbAljCnICdt61fXWgZSe2/hxk7CgMGfDUt4uMHs2LBpgw==
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::53) by
 CO1NAM11HT204.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::106)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.30; Wed, 2 Jun
 2021 14:05:30 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:3861::47) by CO1NAM11FT052.mail.protection.outlook.com
 (2a01:111:e400:3861::225) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.30 via Frontend
 Transport; Wed, 2 Jun 2021 14:05:30 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:9BBD8785E91E010047DFCB0E0058D020FADCD9B0231200440D3A4BB25932A158;
 UpperCasedChecksum:C8D49027423A9061EC050BD9961E65B8281D265F3739B7FBA5429FE4891ACF69;
 SizeAsReceived:7671; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d%5]) with mapi id 15.20.4195.021; Wed, 2 Jun 2021
 14:05:30 +0000
Date: Wed, 2 Jun 2021 09:05:26 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] ASoC: rk817: Constify static struct snd_soc_dai_ops
Message-ID: <SN6PR06MB5342C4909B34968F0F8E0CADA53D9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210602113643.3037374-1-weiyongjun1@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210602113643.3037374-1-weiyongjun1@huawei.com>
X-TMN: [5nWbDPWb4le0diWSnPNrgYAceczGvqHu]
X-ClientProxiedBy: SN2PR01CA0001.prod.exchangelabs.com (2603:10b6:804:2::11)
 To SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210602140526.GA11588@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN2PR01CA0001.prod.exchangelabs.com (2603:10b6:804:2::11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Wed, 2 Jun 2021 14:05:29 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: d47023e0-658d-44fc-c0f3-08d925cf7ad9
X-MS-TrafficTypeDiagnostic: CO1NAM11HT204:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zrgxoGdBIVa0MGmKN8WqaKvXiIsgVwzEzQ8b0Z7pox5C8MMH8WnbD67u9CyudXYLJpGqFOMZKO+3Y+7m9uEduJwoy9oioJX/adOKTCbqS6lJh6Xbps6V6IzZ/2Gdi6FGuZmT6z2MpguurffGtVkx9VV5V9ZuqARNb7l92haUU2IjsBP2AVzBc6daQbX/qSTXq4H/InrLYNF5v7St3JmmCUxA9e+zQjKsPJbYlVtUmL9sg7lu9fKBS46CQ2z76xZoG3C9DFMZZszIWZjSBavXuvtPuIeS2Ixq7PSJz8ryzne9ZnDltrGDV2H6VKQO/zCQZnzWe1fGFOhhAKT3MLX7L3Y+kSS/4KFzQ9toxHs5HkQ1d9cXcC7nHoW9/h3JoLsZaTlFSgCgNAgyZ5S6g1ZNIQ==
X-MS-Exchange-AntiSpam-MessageData: AG2m8gUVfNEfYXZPaauEv3Exj+gJrTK0kpuUZ7ZqzG3rfLlwGpLJ2pdT4LUqqfvtWJkvT1nq5d9tvvYXk+DFg8dzL9NrvY7+7/MGd4WZGBUPbjY/wYpQPiXYG0SqUSSS7WV8q9piFsW8/afmaLNOVg==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47023e0-658d-44fc-c0f3-08d925cf7ad9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 14:05:30.5711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT204
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
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

On Wed, Jun 02, 2021 at 11:36:43AM +0000, Wei Yongjun wrote:
> The snd_soc_dai_ops structures is only stored in the ops field of a
> snd_soc_dai_driver structure, so make the snd_soc_dai_ops structure
> const to allow the compiler to put it in read-only memory.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Tested-by: Chris Morgan <macromorgan@hotmail.com>

Works for me when I apply it to my tree. Tested audio playback and
recording still work and no warnings are introduced.

> ---
>  sound/soc/codecs/rk817_codec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
> index 17e672b85ee5..9a896e4326c3 100644
> --- a/sound/soc/codecs/rk817_codec.c
> +++ b/sound/soc/codecs/rk817_codec.c
> @@ -382,7 +382,7 @@ static int rk817_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
>  			SNDRV_PCM_FMTBIT_S24_LE |\
>  			SNDRV_PCM_FMTBIT_S32_LE)
>  
> -static struct snd_soc_dai_ops rk817_dai_ops = {
> +static const struct snd_soc_dai_ops rk817_dai_ops = {
>  	.hw_params	= rk817_hw_params,
>  	.set_fmt	= rk817_set_dai_fmt,
>  	.set_sysclk	= rk817_set_dai_sysclk,
> 
