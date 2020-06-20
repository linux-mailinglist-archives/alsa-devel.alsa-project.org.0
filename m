Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8FD20263A
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Jun 2020 21:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3958B169B;
	Sat, 20 Jun 2020 21:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3958B169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592682006;
	bh=uyhY/I/zdC1dTKqPUnuKjANVqh+16/M/+Cp94ng4MZQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OfT3F5h9p0DmVejsHMkU/wH+Q3xA6lV7DzAylTs4OSVcQlXFpM9WH/UzmTrVgnJlM
	 GiZGgGchwQdNb+cDIITANFjWrS1x2ChxW46+3sqT64UiVBDAaLt69tWj2gayWmm6RJ
	 4faTE5WDQ4zW2bCwukEyeLNiCHV7AKI22qXP7d4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62930F80162;
	Sat, 20 Jun 2020 21:38:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 594D3F80171; Sat, 20 Jun 2020 21:38:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FORGED_MUA_MOZILLA,FREEMAIL_FROM,
 RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from EUR06-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur06olkn2026.outbound.protection.outlook.com [40.92.16.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45950F800B5
 for <alsa-devel@alsa-project.org>; Sat, 20 Jun 2020 21:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45950F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="nvUbCttS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n17F47qsY750IQ2wOymDU1hafLPoNRccwYn8X6Dj3B7DCRHKB3IJDB8OrKNZMyXd2Yd2KmVpjpkzjDrmdhJMx28+rNGuzOQGXUdWmu2UzGH5W6Tk0NiVkV0JgKEvhCGaOS9yZoCrrHgtW4k7u/qPsOvFC53OadHcPheLrHcCqIzKLjVCQU27f+RYDnFQcFcFr2OkqKnioDlmwWnjT6bQqOe4Vwtr+lk9DyZXDfrdFNOQkXHLhcrrypYfUCQysBdcQdAccuI7WYqYL3+m9zwIU2D+MdGzUy3pA2fbbfrsxXa1/4doQqfyNmS/OGFdlqNOluVM4Zf6V3kztOTWU3WUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oCsmuuCM7odQBn9eBo3tzsQlwXotUTVaBQQm1xAPOk=;
 b=AEBX57Yxtt+niTn5gCGq9kLryVbM58nvlIw9vJATHEIBGYC/JEZgquHYLzxdL7phi+yhc519KEJisDOXjnoQpSvE5vv1dFeF4NdFiVz63U5cSRzwEkT1E/s+dFE7BjGyz8w5ayErAniDy8CTM7Ot4DQQ1+pXr0pGFQNxbKl46Wg7ZcYflDnVe66SBC0okGzp+kXZMeRCcvuuihKJMreD+S1I2511K+sgA5iHbA6zDGRYix6jc1U2j4fYNWxV0iwtlyQ0LBWEKb2Xt0VtbJTfgb04kATbe5KHs4FK9xIAuYoo56OXc2zbTAq0etjRDYnZ10JSClyZoyrFNmMnimnung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+oCsmuuCM7odQBn9eBo3tzsQlwXotUTVaBQQm1xAPOk=;
 b=nvUbCttSAGRsnPslLWp6zXcXYWd72xhHlOlnnvYZig0RbaoIBx8yhmjJvFJtObkn48oFot0S61NMn1MX/PwvDMCpkX6GIoJdf9BELEMpk9+zt4AhtAaRdxVtM5CSLGrZDraQnjDHWnlIdh4HutMUDE36/sGDBDZCVMxEP2GIguZAmCchLnVlTgNL9wkX3+jNr+LQ3fxn7Xbl7fyOB7nbtoxuhZxuCmBO9yU5c293U1XjMHqimx8Tt1QeUEVpL7HATsGgL5ULYO9be8ujI79CJCuWD3XgbT0wgW10qH0wGjBvy2Djl8MRcvqtlgLLy1v6DxSlac+1czpDDaNWPbOAhw==
Received: from VI1EUR06FT024.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc37::4c) by
 VI1EUR06HT227.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc37::441)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Sat, 20 Jun
 2020 19:38:16 +0000
Received: from VI1P191MB0350.EURP191.PROD.OUTLOOK.COM (2a01:111:e400:fc37::4b)
 by VI1EUR06FT024.mail.protection.outlook.com
 (2a01:111:e400:fc37::491) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Sat, 20 Jun 2020 19:38:16 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:DA264E7D4B4EE60D7FBB1A72E0C89526D1330EA7E15D3C41A425E5A87E3A6336;
 UpperCasedChecksum:A8D282B22B20A34286A260BEDE2A2EC17F266D1EDF79DD418477DA424B34D7B8;
 SizeAsReceived:8867; Count:49
Received: from VI1P191MB0350.EURP191.PROD.OUTLOOK.COM
 ([fe80::2185:39e1:3163:d0ab]) by VI1P191MB0350.EURP191.PROD.OUTLOOK.COM
 ([fe80::2185:39e1:3163:d0ab%7]) with mapi id 15.20.3109.021; Sat, 20 Jun 2020
 19:38:15 +0000
Subject: Re: Lock-free dmix considered harmful
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
References: <HE1P191MB015371D61AF81262BD242966E2BD0@HE1P191MB0153.EURP191.PROD.OUTLOOK.COM>
 <s5hzha4dom3.wl-tiwai@suse.de>
 <e69389e9-2b03-7ef1-8ea6-144f8285b80a@perex.cz>
 <s5heeqbt1ii.wl-tiwai@suse.de>
From: Maarten Baert <maarten-baert@hotmail.com>
Message-ID: <VI1P191MB0350A38B0E963A7E152B2ED7E2990@VI1P191MB0350.EURP191.PROD.OUTLOOK.COM>
Date: Sat, 20 Jun 2020 21:38:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <s5heeqbt1ii.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM3PR04CA0150.eurprd04.prod.outlook.com (2603:10a6:207::34)
 To VI1P191MB0350.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:803:2d::29)
X-Microsoft-Original-Message-ID: <17618094-c767-b987-da02-a58cc9a60c29@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.101] (109.134.224.98) by
 AM3PR04CA0150.eurprd04.prod.outlook.com (2603:10a6:207::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.21 via Frontend Transport; Sat, 20 Jun 2020 19:38:14 +0000
X-Microsoft-Original-Message-ID: <17618094-c767-b987-da02-a58cc9a60c29@hotmail.com>
X-TMN: [ivt1UF9NLRDd3wfT58QGQgNqVxgFSs/r]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: ec0f41f7-4d5f-4893-41bd-08d81551797a
X-MS-TrafficTypeDiagnostic: VI1EUR06HT227:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YXdgTmRfMHbqOuAfhbtRqEIflG1cYxOoxw97N2RynWaay4F/aSmDbu2mcMu+pv3uYZwpyBfGWDN/S/x0CHQ1ddg+PkrIjfMmnzhcfUBApKIZk9M7jj9Bb0WMZxrE2P1COkju6kwUAKJxbPbyxVkIKUjizzfkM3+qohu+bQ1XTuowSRxJ/Qxwr9EUVlmGbNOzIlVHnjFs5GI851UtNgypjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P191MB0350.EURP191.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: AJrCY2YhGUITg3QlNl9cELFcwn1AuCHSJSEuNYnjiomYkpageHSvV58wjHA3Fp5xfMWchz1JT32SSbRWggbW2nQPdFKDMuLvCXlkGQeNG65J5qnhjpqaQbKfjxUzkHgC/gCkgZccq89gM1lLM8DV8Q==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0f41f7-4d5f-4893-41bd-08d81551797a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2020 19:38:15.7898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR06HT227
Cc: alsa-devel@alsa-project.org
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

On 19/06/2020 19:21, Takashi Iwai wrote:
> OK, I implemented a couple of patches for this.
>
> The default behavior is a bigger question and I chose disabling the
> lockless for less CPU usage.  But it's selectable via configure option
> or the runtime asoundrc setup (there is already an option
> dmix.direct_memory_access).
>
>
> Takashi

Thank you, this solution should provide the best of both worlds. I will 
rebase my dmix monitoring patches on this improved version, I think I 
know a way to implement monitoring that does not depend too much on 
whether playback uses the locked or lock-free implementation.

Best regards,
Maarten Baert

