Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2941D9DD1
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 19:22:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48402178A;
	Tue, 19 May 2020 19:21:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48402178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589908961;
	bh=DAfoYYLR+nzHU/nEiXvTXQ5UfUxDsVQLoea90zERngU=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dMw2CoK5EXZSi3l3pBidP+vxJL/Y1uPsVLVhuXMUBwAj0fkzX7NHiVJIdZXAZEAUu
	 NwiZnQ3YNSQGn/hH4yOZ7i48yuA4CqErQcKww6k7v5mi27KvYaqsCDjq5MiIQWou6O
	 phVrQXr4+yWQos7rK15L329YR+wxYT/bbRz1B7ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61784F801F8;
	Tue, 19 May 2020 19:21:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97229F801A3; Tue, 19 May 2020 19:20:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FORGED_MUA_MOZILLA,FREEMAIL_FROM,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-oln040092069094.outbound.protection.outlook.com [40.92.69.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8CD7F80110
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 19:20:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8CD7F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="nub+v5s8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVBhVJDGq8l5N0IjWbGKZIP/onUFiEGJ7tyP9xjGJZH5VyopH3lGvAuM0ocO/vrQ1CGV/PoPoA5/F2e0jtnTU7v6vYJNi8uGoum1edWtE26WF6YYGedhspu3lzPx2TZjFHyXIM1HP43WC0QNITo0GJnFzsO0H4WIp7lMJqEIpof14wYrLoDMF0MH7Sm5t9OS2FPrllogZCflrgcJV0l6Z7PnS+XQL2l+9YtoeTEIy2eL4Jn2+BIaoldPvT0ZTj9CSkZwTdaSLC/VEVsSFshclFneyRiJftRJdiksQYO6EBMza+dM0k6jz/wLm/wY8RcLfdrC3eJsMVpRariquiD9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SJi0tpRJKznESG+o2jPkzVE642nQ0QsyufjnhBv+C4=;
 b=fcZdgmhLvEf++Z86YuSpT2R4fHtPb3+Tntbw/dr6xz/hqfA3sD6wMaqB+hB8OE2HhDD65K+eUA1Amin2NlIE7ZlU3GcaKBo7znKUJv4CRFsly383MhSHPtRlaQhTVjNKAKgmcZBvowv3FuXFuPQHr9JKHCRthHPZpmk1QAiQrTk9MiBdb+fL0V1NmrC7vRRucpkSgrPOCJ3Qb/OP6U8m/OqxY2jBebp9+tScSG6h2DV6dphjCLZXPNAHuO7rj5JxOTZOiGZLpde8Sm5CIhWNrF/IfNK+6xgpirFzVLR6k0Yqx/zel1XtLszc+13Lh1qGC6GA+tG9hFtFD742GjoHNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hotmail.com; dmarc=pass action=none header.from=hotmail.com;
 dkim=pass header.d=hotmail.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SJi0tpRJKznESG+o2jPkzVE642nQ0QsyufjnhBv+C4=;
 b=nub+v5s8Sir9oL/xk6E/IAp+LhhWFyJUW+wxf0InycGnzQdm5x2QhsegOjX3dYcOAlpqLiiCx+49Ldifj5NJL84PzWO1Q0F9KbdXArVQ7MNkGnXazY6fN8vu5uSh4Kmkzg/HEWgubSncW94EgFF+aAfDGkJ+eT2sg0M+9l4DRwOdYFxFtZnlo/AaDWUmIeTIu54zaoCKRtnSU6ObTh+j5kUdY+Pv4bmjLaDnq14pcvT3g4fi+dt4qwMKI7LoRhAxobmD5KJZwsdhLsSWg7aTEYBbZDGJqkzyejU8MHuUivgjkO3sJE7P/LaUH0nNPZ3WMKkxNxhUyIwRVTkph635ng==
Received: from VE1EUR02FT051.eop-EUR02.prod.protection.outlook.com
 (2a01:111:e400:7e1e::48) by
 VE1EUR02HT181.eop-EUR02.prod.protection.outlook.com (2a01:111:e400:7e1e::447)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19; Tue, 19 May
 2020 17:20:52 +0000
Received: from HE1P191MB0153.EURP191.PROD.OUTLOOK.COM (2a01:111:e400:7e1e::44)
 by VE1EUR02FT051.mail.protection.outlook.com
 (2a01:111:e400:7e1e::261) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Tue, 19 May 2020 17:20:52 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:73CCE8B17FF241CA484E81875B735B80634445573BE46115EFB0BACE1D81D6C8;
 UpperCasedChecksum:87E9C2F2AB195D74F5705EB8FCA87B29DD5536C50DCA1C0924D80481141B0DC8;
 SizeAsReceived:8843; Count:49
Received: from HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 ([fe80::8dd1:2eb0:a33c:bf69]) by HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 ([fe80::8dd1:2eb0:a33c:bf69%6]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 17:20:52 +0000
Subject: Re: [PATCH 1/3] pcm: dmix: fix incorrect boundary handling in
 snd_pcm_dmix_sync_area
To: alsa-devel@alsa-project.org
References: <HE1P191MB0153779C50995EA59EF71882E2B90@HE1P191MB0153.EURP191.PROD.OUTLOOK.COM>
From: Maarten Baert <maarten-baert@hotmail.com>
Message-ID: <HE1P191MB0153652DC0A295CC82D3A311E2B90@HE1P191MB0153.EURP191.PROD.OUTLOOK.COM>
Date: Tue, 19 May 2020 19:20:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <HE1P191MB0153779C50995EA59EF71882E2B90@HE1P191MB0153.EURP191.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0058.eurprd04.prod.outlook.com
 (2603:10a6:208:1::35) To HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:3:c8::22)
X-Microsoft-Original-Message-ID: <f4698e55-9dbb-408d-bcbc-ccf90b24ae24@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.101] (81.246.190.254) by
 AM0PR04CA0058.eurprd04.prod.outlook.com (2603:10a6:208:1::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.25 via Frontend Transport; Tue, 19 May 2020 17:20:51 +0000
X-Microsoft-Original-Message-ID: <f4698e55-9dbb-408d-bcbc-ccf90b24ae24@hotmail.com>
X-TMN: [rMibd2OUOF7jKqRVtrt+/Q+zyF9HT/h/]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 712bd2cb-ac4b-4729-6eac-08d7fc18fafc
X-MS-TrafficTypeDiagnostic: VE1EUR02HT181:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I0V8vql3t/g5+yDXCP7qro82DXtZ46dfry8rTa1S7B3RM7HH64p0zvGpOQsubIRpEdOohEjYlBpLjN1YzBPZjgj9QYJPAkUB+lx56ZOzE46S61A777H+HXcaMwxlPQrNSKrB7Ixm71N5rn9t6dUp8qbPQecyhYIQtGsafrJZN6AgbMCvB+25NhuA5WQMn/tYmVgYcA8SaKP1l1n1r0UAJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1P191MB0153.EURP191.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: p7jisbyQM4NqBHRStW/0PRH0Qk52VJwwH4i1ur0hsQwfLdHHMwt8g3K5FZc/gNnUewXhGwEEV/1qXvIl3qUDZTw/HCeOGhNgOVmq53bh5jygnTVAUBP1KVnYa3cZ41KPv9PpV6bDV51Gu6a9Itw7kA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 712bd2cb-ac4b-4729-6eac-08d7fc18fafc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 17:20:52.0034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT181
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

Please ignore the '1/3', the next two patches are for dmix monitoring 
support and are still a work in progress.

Best regards,
Maarten Baert

On 19/05/2020 18:14, Maarten Baert wrote:
> The available size calculation did not handle wraparound correctly. Also, the
> underrun handling code confused slave_buffer_size with slave_boundary, causing
> another integer overflow that results in too many samples being skipped.
>
> Signed-off-by: Maarten Baert <maarten-baert@hotmail.com>
> ---
>   src/pcm/pcm_dmix.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/src/pcm/pcm_dmix.c b/src/pcm/pcm_dmix.c
> index 843fa316..b5fdb240 100644
> --- a/src/pcm/pcm_dmix.c
> +++ b/src/pcm/pcm_dmix.c
> @@ -315,11 +315,12 @@ static void snd_pcm_dmix_sync_area(snd_pcm_t *pcm)
>   	/* check the available size in the local buffer
>   	 * last_appl_ptr keeps the last updated position
>   	 */
> -	size = dmix->appl_ptr - dmix->last_appl_ptr;
> +	if (dmix->appl_ptr >= dmix->last_appl_ptr)
> +		size = dmix->appl_ptr - dmix->last_appl_ptr;
> +	else
> +		size = dmix->appl_ptr + (pcm->boundary - dmix->last_appl_ptr);
>   	if (! size)
>   		return;
> -	if (size >= pcm->boundary / 2)
> -		size = pcm->boundary - size;
>   
>   	/* the slave_app_ptr can be far behind the slave_hw_ptr */
>   	/* reduce mixing and errors here - just skip not catched writes */
> @@ -328,18 +329,19 @@ static void snd_pcm_dmix_sync_area(snd_pcm_t *pcm)
>   	else
>   		slave_size = dmix->slave_appl_ptr + (dmix->slave_boundary - dmix->slave_hw_ptr);
>   	if (slave_size > dmix->slave_buffer_size) {
> -		transfer = dmix->slave_buffer_size - slave_size;
> +		transfer = dmix->slave_boundary - slave_size;
>   		if (transfer > size)
>   			transfer = size;
>   		dmix->last_appl_ptr += transfer;
>   		dmix->last_appl_ptr %= pcm->boundary;
>   		dmix->slave_appl_ptr += transfer;
>   		dmix->slave_appl_ptr %= dmix->slave_boundary;
> -		size = dmix->appl_ptr - dmix->last_appl_ptr;
> +		if (dmix->appl_ptr >= dmix->last_appl_ptr)
> +			size = dmix->appl_ptr - dmix->last_appl_ptr;
> +		else
> +			size = dmix->appl_ptr + (pcm->boundary - dmix->last_appl_ptr);
>   		if (! size)
>   			return;
> -		if (size >= pcm->boundary / 2)
> -			size = pcm->boundary - size;
>   	}
>   
>   	/* check the available size in the slave PCM buffer */
