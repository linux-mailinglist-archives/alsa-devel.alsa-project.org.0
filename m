Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABFB1D9D16
	for <lists+alsa-devel@lfdr.de>; Tue, 19 May 2020 18:43:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 262141785;
	Tue, 19 May 2020 18:43:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 262141785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589906633;
	bh=1Vz6rrt+U5dmdBwPloukp216nZkQLuMCTijKT5H0DVk=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VqZv38aeMRR98dkdbE5ocafUtePllrPZn0gkA92EmG4wYEyReC+byCYjBpbrTLvPL
	 dV4R54TJ7RT1+hqjI8Q8Uwc5jt20r6zf0ljPKt+E+Ykp1uYMT6uSd9T/hYuMLwHEK+
	 5xx8RHik3RD2SDlq6wuvLL+ez+9lJz78wJOsvMAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A205F801A3;
	Tue, 19 May 2020 18:42:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C252EF801A3; Tue, 19 May 2020 18:42:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FORGED_HOTMAIL_RCVD2,FORGED_MUA_MOZILLA,FREEMAIL_FROM,
 HTML_MESSAGE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05olkn2092.outbound.protection.outlook.com [40.92.91.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9868FF800C9
 for <alsa-devel@alsa-project.org>; Tue, 19 May 2020 18:42:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9868FF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com
 header.b="MnYKvK8M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ed4HKqcrPZ6kc3t724yDJ6HZ5wUzXMuw7DKd9Gp31emEgYpiScu0Kp35ftVkESA36zXRpoW2BeGou8ohV+5l9hQUqbhurJjs/rhtGj3KxZ+s36CWmrlVKGaga+8j51DfMX18j1kFiM4CcSkwFad/vHu/NHeOQDrZIFjHsanrUVJQpLrFgQ30FbK/zKraX8CBFF6msOUN5b+HGP/qfFxgytfN0kUeKKvUYXqcEc+bLXSFR67tqn0cHvLH4PKFe1f5JeDFJ6c4KzOaYjI92ZduzL+wxdEU/B2xEXuY8cXytwtUqj6BcAtM4IRzlr5lT2jEUSxHiFK9Q9KK1MOakvrXqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZ+BTiA0tabBN0bomRs76VQuS3SEMcONeeY/50xQ0J0=;
 b=VQ5bQhn/LbAvGcCpo3jfNe70Ss3fEkiwxjM/xkBuz5RUTgUXSky9dsamZdcC929xzhhFGmsGbZJmE9CFyhagOjW5+p/AIEOzZiVaMRwh+Bc1sLLQeixrG/epqPdDLuBWNSH5IK9glBRxklNWw5FvuC7pgsj5bdlf2y9wMKsiOJN26ISyw+T0ODGjPwh04eMJiiTAwDH6MicagvsHQhn6Tb8xEEX6UZm0m2jrzDK+1x2KjDUztVQ5Evvc3ksLtYvj/lgZQPsLsQBVULK9latE1K+VheoPR9EA3RRDF7IvIm7aUY4T1EMc/4tiMsErNNNfu52nkJ3MxMr5ymftK86oPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hotmail.com; dmarc=pass action=none header.from=hotmail.com;
 dkim=pass header.d=hotmail.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZ+BTiA0tabBN0bomRs76VQuS3SEMcONeeY/50xQ0J0=;
 b=MnYKvK8MArFSwQg2ADQpDhYhi89Yi2lrYpy6ggjDKmFga2dovfbq6YE+6CdyuXFBywqVlpeLpQtTUEnTvxO72JwBKTcvAruEYrKlcD3/vXjil8VkV/zwCJD7LAEGnrRBmZi+4jXE+dD3XpGkT85TbPo4gYD9eWKE9hW52Mxz10/fzS1sTk5Ck1Nu+fZK8VR6LxQBHz2mvxEg1Lldb3Aq4Ya392aRTm07FcbarpiQZ/phXQFoA0ve2o4FRD4hqVhj1XytYWccDzrZlFMnMIqxCcDeKG7sG7u/hA6t8YAVFSJgpRnYAb+KK+CsSVVRV7duQtLzcrlc3oa+gHeIPwubfw==
Received: from VI1EUR05FT041.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::50) by
 VI1EUR05HT113.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::462)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19; Tue, 19 May
 2020 16:42:02 +0000
Received: from HE1P191MB0153.EURP191.PROD.OUTLOOK.COM (2a01:111:e400:fc12::4d)
 by VI1EUR05FT041.mail.protection.outlook.com
 (2a01:111:e400:fc12::350) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19 via Frontend
 Transport; Tue, 19 May 2020 16:42:02 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:972611A090C949433AF72CCC49D45F319D27FD35B3A083B867AAB44E2C2A4D68;
 UpperCasedChecksum:816D19D19C6CEB76201DC2CE4F2BDE294B6CB01484199D57D70112C80D0C9FE8;
 SizeAsReceived:8782; Count:48
Received: from HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 ([fe80::8dd1:2eb0:a33c:bf69]) by HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 ([fe80::8dd1:2eb0:a33c:bf69%6]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 16:42:02 +0000
Subject: Re: Lock-free dmix considered harmful
To: alsa-devel@alsa-project.org
References: <HE1P191MB015371D61AF81262BD242966E2BD0@HE1P191MB0153.EURP191.PROD.OUTLOOK.COM>
 <s5hzha4dom3.wl-tiwai@suse.de>
From: Maarten Baert <maarten-baert@hotmail.com>
Message-ID: <HE1P191MB0153BDA6837FC98A9D7DE10CE2B90@HE1P191MB0153.EURP191.PROD.OUTLOOK.COM>
Date: Tue, 19 May 2020 18:41:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <s5hzha4dom3.wl-tiwai@suse.de>
Content-Language: en-US
X-ClientProxiedBy: AM0PR06CA0134.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::39) To HE1P191MB0153.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:3:c8::22)
X-Microsoft-Original-Message-ID: <b4d941b3-928c-6d48-99bd-0eac6d704c6f@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.101] (81.246.190.254) by
 AM0PR06CA0134.eurprd06.prod.outlook.com (2603:10a6:208:ab::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.24 via Frontend Transport; Tue, 19 May 2020 16:42:01 +0000
X-Microsoft-Original-Message-ID: <b4d941b3-928c-6d48-99bd-0eac6d704c6f@hotmail.com>
X-TMN: [0gAvwYTX+MdCCrUXxGMqgEp7qeD/r0s+]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 423c5811-7dda-4a39-d661-08d7fc138e42
X-MS-TrafficTypeDiagnostic: VI1EUR05HT113:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qsfSc427SdBAjmrjkooQrx0ibMctgWayrCRlNghx3z3TI6/SLq39aRWxmKlYmsBYub24m7KLJ+0lZRFuY6jujfJtR/pxYXY9yfny5T9zpt1O3oWp9ePsKCbNJMg87Qq3TENYIpay+iV9JpEZ/hFjfbZPPSPkCg8VyYi9GBPcWDhkXdSPd8b9aNDPh1jVP9I0VPUKyp/KSE2sm0y+mrYF7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:0; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1P191MB0153.EURP191.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:; SFS:; DIR:OUT; SFP:1901; 
X-MS-Exchange-AntiSpam-MessageData: tz1WxoT9XbInjvdnA8XaqNXt/fRd3iyiasaiPHdNbefVH36YMCQws1euqdOqj/+X09E37fHC96Ad/R6C/kXArAzuhdvfF7j/A2XDcwtjqF194qnoUF/xBHtvvwBD53vb4IIANkAIgMDvby3KwcjPYA==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 423c5811-7dda-4a39-d661-08d7fc138e42
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 16:42:02.1415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT113
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

On 19/05/2020 15:46, Takashi Iwai wrote:
> Hm, I'm not sure whether whether this really leads to the deadlock,
> but I can't exclude such a possibility in some corner cases.

It is not a deadlock, rather there exist scenarios where the buffer is 
cleared more than once, and since clearing is done by subtracting the 
old value, this results in incorrect audio.

Consider the scenario where before mixing starts, *dst = 0 and *sum = 
100. Now consider that application A plays back 10 and application B 
plays back 0. The expected result is 10. However this can happen:

A: sample = *src;                                 (A:sample == 10)
A: old_sample = *sum;                             (A:old_sample == 100)

<< here A gets interrupted by B>

B: sample = *src;                                 (B:sample == 0)
B: old_sample = *sum;                             (B:old_sample == 100)
B: if (ARCH_CMPXCHG(dst, 0, 1) == 0)              (*dst == 1)
B:     sample -= old_sample;                      (B:sample == -100)
B: ARCH_ADD(sum, sample);                         (*sum == 0)
B: [copy sum to dst]                              (*dst == 0)

<< here A resumes >>

A: if (ARCH_CMPXCHG(dst, 0, 1) == 0)              (*dst == 1)
A:     sample -= old_sample;                      (A:sample == -90)
A: ARCH_ADD(sum, sample);                         (*sum == -90)
A: [copy sum to dst]                              (*dst == -90)

In the end, *sum and *dst are -90 instead of 10.
> The advantage of lockless dmix implementation isn't about its CPU usage
> but the nature where a stream isn't prevented by other streams, which
> assures the very low latency, too.  That is, with the generic dmix, a
> stream can be still halted when another stream stalls in the middle,
> and there is no way to recover from it.

I agree, however considering that the lock has (unintentionally) been 
enabled for 13 years, and no one noticed until now, it doesn't seem to 
be a problem. I think there is a higher risk that removing the lock will 
expose new bugs due to flaws in the lock-free algorithm that were 
previously hidden by the lock.

> So, IMO, we can start with a dynamic configuration to choose the
> behavior and add a configure option to choose the implementations.
> The default behavior should be still an open question, though.

I can do that too, but monitoring is significantly easier to implement 
in the locked case. Also, I see no way to fix the lock-free algorithm 
without making changes to the shared memory layout (which would break 
compatibility between ALSA versions, which is a problem for anyone who 
uses chroots or for some reason has multiple versions of libasound on 
their system (e.g. Steam includes its own version of libasound). And I 
would rather not implement a lock-free implementation which I know is 
not fully correct.

Best regards,
Maarten Baert

