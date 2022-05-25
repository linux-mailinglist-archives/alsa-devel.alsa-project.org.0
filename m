Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E85653358B
	for <lists+alsa-devel@lfdr.de>; Wed, 25 May 2022 04:55:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E329A1669;
	Wed, 25 May 2022 04:54:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E329A1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653447328;
	bh=rE7ZWj83ZlszlLgvhtgZWtv6ilTosko0g24Ao7vtE8o=;
	h=From:To:Subject:In-Reply-To:References:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ommlIXjvoc8TQsKBrLAPxZSCXMt2yks0iL7tt//YNHRTj0Dh6+kskkIiORzMfJ7Dl
	 JhE1uGLbGq95wfY5kr8UBXtloXJlt09qjwhGMGZDCcHs0dvV19YLcYYe/ALPa9434u
	 2zSVRsSuXdJ7NI+Nln5ajZfc8XZ9Y3f985LlLeWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AFE1F80116;
	Wed, 25 May 2022 04:54:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 683DCF8016D; Wed, 25 May 2022 04:54:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 746C5F80100
 for <alsa-devel@alsa-project.org>; Wed, 25 May 2022 04:54:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 746C5F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com
 header.b="c6483s5y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXnxDiTTAgnIBnisDQLLeZKnLso6PMlU3N5iRhXlByHFOMdCcwqFZX+RifCYo2WVZKhj9qIJ65q9aV+ULNxqseYV864JH40ZPRGjL82oDxBTONsDztY2efc66FOmQLLQgEMt8uvapengfZTruimLu5F8cVKcDIjnZcZkltIVVD4usAjoSc/bGuSpeOq4eMtQU8/tx3MQnqz3JbPyc5oXs4FfhZp+pak+js8AB5co1d3S+K/EWrpya9N8ez+bea6sPpHg9hBRM8Eha7sR1z4QzNEuOP4OeHgV0a8rTEreHpCZu2Vb9wYnBRLVzcrdeRE4GDFWTseuNMpCpLU6tVIgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=07QhXK6ZiGsYfXQXqI5Av8tDxc1SYwoMBz91KdbOHGs=;
 b=IeO0E9ExPPgZpbO1IvDYGowkaxvtmi60W4e1adgOUhoG4A94QtK30m+MAe9nD27ieh4yCQv4G+S2HGUdyqzjAHA4uQFh1vA+sdsZ16WthER7NiE/oZkr6PGksisu8wrW7yaN17c6oVg27F5iJ/5wMmeGpu3DEoJwHs44e2/ckeAJqrW+bLjudH7ubHjLIfvkhl5nbpUNFhXOVVgr4R3fwoZ4IQCUrwRMaRvdDnFsUSrb0NAs6MiCwytV2w2nRGAZGy9t3yy6OxpmLy5Q6JuDAAtH5APh8TQ4oYBg8LQUhyhLYURrpVU/PmpcQIqqCsKwAMyzxZxRnxM00JJGe88Oiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=07QhXK6ZiGsYfXQXqI5Av8tDxc1SYwoMBz91KdbOHGs=;
 b=c6483s5yT6PQqa/HTyMYRpwXAFt/SavpQ0bg3Zi7HXCAafx5v3k7RPMaL8lKo8yyaQgVNKi6ajQoYs6f36Tmk9bvDHdxHRRhtCC10ZaVY5A8BZIidNjD029Cz2sQY50suhXJwOgqt2ofm4tSomI1YWyWRuxPXTyDCARlERmg8JU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB3342.jpnprd01.prod.outlook.com (2603:1096:404:bf::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Wed, 25 May
 2022 02:54:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%8]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 02:54:12 +0000
Message-ID: <87a6b6cofh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: About Cleanup ASoC
In-Reply-To: <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
References: <87fskz5yrr.wl-kuninori.morimoto.gx@renesas.com>
 <db3b90d3-d356-9a2a-7411-ccf487b25416@linux.intel.com>
 <a5e3c40c-ea84-c2c4-54f9-70b4c509567e@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 May 2022 02:54:11 +0000
X-ClientProxiedBy: TY2PR0101CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::25) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b808fc5-5f08-42aa-7b34-08da3df9d8b7
X-MS-TrafficTypeDiagnostic: TYAPR01MB3342:EE_
X-Microsoft-Antispam-PRVS: <TYAPR01MB33427051780E6DEC6D80A2D9D4D69@TYAPR01MB3342.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4NfC6tkkJcfGd7RjBTUa385GTGpCNO1tN75gkT5/y7U9jYe/yL0UGYprwVS897VJMPmdvyNB9x4JNf8rMs7SeuG06+kQYSEshoo9NabVPbff+VRw7qLbU+a1lUXoeL1wt0IXCkiGqFyQ4uCNAqA84ifoWQfCCmSmqotxohTe+iX7WbDMoRLhPVcRSpyTOpsKnK/4MoeRHNqPWlxv4pFnOYN+bbX01x1bPbse2rmjgdRX1xXSWXxFliDkm1Ee1oPF4/Dx3clPOjydTpcEzglVc3sxZLroiqyJMJ84swCZ/5NFrw/Ov93ZXxYexP8X22IH8KjcrAcLbj+cDAAlE16IP5v1xae3mq4NLVmEKH6H6ipkpCApX6D22WpkfBPtZnjTs0F6bHtPPBkClc+kAYhPBaIl8/R5v8TsLrSInCmiMdSRqgLZyfZHaxJXiLCg4B/uYk6YzXFuJbnv9tm+LzSqMfagVcAaAQrJgiESFvIgZEf+cb1SFt2L/4NwJ9x9Br/29gvJU8u6FNNP1leNTZ468v8OFvuVSEk6EWfF+GKF1OslsZJuNKQXHTjL7uV6uOYutxugbiCJMEsVjNtg2uPgGLWHJF4ArZImLdr7IQK2tsMdF3tAMg4uXFfa55rO/U9i9cLIVlWxPG+69cwZx6F4Z2LWsG0e3vnhfYZpuvc3g50VlZ9lDVnQLyRuk5aYjOGj0vsuIonkpgVLdpOKu9PWuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(54906003)(38350700002)(2906002)(508600001)(38100700002)(7116003)(4326008)(6916009)(5660300002)(8676002)(8936002)(66556008)(66476007)(66946007)(86362001)(3480700007)(316002)(6512007)(6486002)(83380400001)(186003)(26005)(6506007)(52116002)(2616005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0f/ampwb9zfNSmbAOsNZxPIlkrn0swJmdLb47jwEc2+q3WwHXPAf0sAGvaX9?=
 =?us-ascii?Q?sIGAFplmYQvsUCFbwpVL5y2cO7MVMeULeLoWoXR+DvHPsd3XB6mQc+4xFRjV?=
 =?us-ascii?Q?yQArV9CR6JRk+niboOuwMsCtYC/kzoJf8ezdibUmt6vFDtmLoEHNh0vikIr+?=
 =?us-ascii?Q?B4PXJcKrZJk6mcNXwJ5duzZSMHnIJylvPmdC9IUJ4dIV1Oa4uu6u+Mewlklo?=
 =?us-ascii?Q?Dv/mgQ2vCOhMQx6eyQicr4mKgKZGTxKujiM4H6M7F3+h57JM50VU4Isv+OH+?=
 =?us-ascii?Q?IyyF32wimEqsZeFcKN7+dfIUe8+1l2rSnPZw7UHSwEiWlLYUfUC2Yw1p6VLt?=
 =?us-ascii?Q?/TzmvgvSSrz3BbhaVIcCcMPo68WL8ezsS6nV4+j7t2CtyUTj8v0Te7ECw4pJ?=
 =?us-ascii?Q?wdxRF4P+VZLKP9GM9o9yYkMBM3tBEjZNkIY9Xsb0fAo1aFIaYQWtvnu5peGj?=
 =?us-ascii?Q?qMzLNMEC+IKGu7+FUwhthBUshfn2RpEY09WbCLDR5srFRuDxBUnW99ZEuSNW?=
 =?us-ascii?Q?SOXeFQgPAgPZGYPRwbDdV+7iqqvmxI8uM0GfIQf1JJCD1vg4fJACKP78Q8Pp?=
 =?us-ascii?Q?41cuSPDflZlpzOJhEybA4vPi2t2b4ecVMyc0iSIu5sPRZAt9NlvefaGCWd0h?=
 =?us-ascii?Q?TjtBKqtx6wM7ye1B1jNOvPeDBK/iknJvk1rur1X8K/5NfQMc7ESryitlHP2H?=
 =?us-ascii?Q?EyL4r8h2TiXZqDqVdhWUJ/P6JHPLVkm4co3c0DaXAcA71WbAwcDh2kHmKD7F?=
 =?us-ascii?Q?9ShwKuDRcf0vw5WK5tc4qeZz1MozR2VYQ0EJIT/RnY4v3yl04sZxo/YL9wnv?=
 =?us-ascii?Q?5uA8twtpM5eO3/miu3FWoOa+LLr9opvNWqFLBrkvrd1rwaBFhoG0Zgbl+Jp6?=
 =?us-ascii?Q?rWQvWS+lIvI4Kbm730JRFiCPZgn+0uW7UgUwqycB7eezY58ixonE0kek8IKw?=
 =?us-ascii?Q?B/N+18bNOtyBSfG7lFDD7YTmDnke7XQ4yXnnaC0Z3iSDa3RKN2lB3WwiSVZT?=
 =?us-ascii?Q?g3NSJsdCluHFRB3cv5kMqnJymvVfeGjBaAik0B0/U2+8QYbT3x8quclnnW6O?=
 =?us-ascii?Q?M0Rbl41vgZeLEHYrWM8lLDW3GPnmf8SgruEhc3l26oeNjVi6M7AN0SUwUROR?=
 =?us-ascii?Q?SyIJVylIx38jyOcxIhJL35CWiHaHi5EnzQmOBV3gmvLKQAbyH2xbP8/DM0nu?=
 =?us-ascii?Q?ParVvVGpxOCkFehXplyHmMXuxwTjsXkRVTlewgsnH03ApEW+s1/+0MyMisnr?=
 =?us-ascii?Q?1BaKXI5OGXZUI772zSQtiAQ0hZQmokRTFdB0yhz6M6ch2U7jwlvq44aa6XMR?=
 =?us-ascii?Q?gD0BYSw8v1fOar6dZDdJJK/FMev2Cp0lAItLaLycIVMKsnZU+lqc3HagKx3b?=
 =?us-ascii?Q?MYgZWP8uv4tqjVusrKvJwRHusKahSuDSl2EWB0PjXMAoyWWge3NUzgOqC5ew?=
 =?us-ascii?Q?18H7IbkkiisEVQcTMBQLpZga3Tp4jwqG3cqTyh6KEmJLk84WY2uTXRreRUBo?=
 =?us-ascii?Q?ljQpjM+ofxXm5qSGUvkT2MtPjOi/bcPfFQbwenHMxlhmpnYx6SV62irE2zY9?=
 =?us-ascii?Q?rWg7hu6ispGtb9/p06a208ZjZ0EwO9aB87INrLYNF0VYqw886xBoawJ4UC5I?=
 =?us-ascii?Q?8xN9y1q7kTplzNhuJ2VcWOXjjvV7TA7N0iEQrtdnqTk9SUnZNsl8ibWvOlYG?=
 =?us-ascii?Q?Dyu/me7Zz3oKqo6x+akLPfpu+5/0F4qbuo/GE8eyw69dgnRGN6Q4KbfKEp66?=
 =?us-ascii?Q?FfVhGcWVZLo0X3i+02Ei3YV5McdVuvfBlxOjgOL7cXz+HIV114iX?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b808fc5-5f08-42aa-7b34-08da3df9d8b7
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 02:54:11.9963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NqcXBMnWGzLj/R3TkUcXeEQa0pYMVbeXDhjl5ZMBOAtXY3FEsoluCeMB9FEZ+FacLpruYttrp9oURV1UJc2ePz+nR42lyCv9bKOzTPiIyHEpK3j5jZB4QE31Ttr0NT8Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3342
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= <amadeuszx.slawinski@linux.intel.com>
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


Hi Amadeusz, Cezary

Thank you for your feedback.

> > I would like to understand the problem here, before I start to discuss=
=20
> > potential solutions. You seem to be saying that there is some kind of=20
> > card<->component connection limitation? Is there specific use case you=
=20
> > have in mind?
> >=20
> > Personally I don't see a reason for connecting component to multiple=20
> > cards. Even if it would be possible it soon becomes problematic when yo=
u=20
> > for example try to decide which card controls clock on component. As=20
> > I've wrote I would like to first see some use case definition, before=20
> > jumping into a rewrite.

Sorry, my head was biased.
I thought people are thinking same things as me.

In my case, my CPU Component has many channels.
We have "basic board" which has simple sound system,
it is using CPU ch0 for example.

And customer can expand it by using "expansion board",
it can use CPU ch1 or later channels.

	+-- basic board --------+
	|+--------+             |
	|| CPU ch0| <--> CodecA |
	||     ch1| <-+         |
	|+--------+   |         |
	+-------------|---------+

	+-- expansion board ----+
	|             |         |
	|             +-> CodecB|
	+-----------------------+

Both sounds are using same CPU Component, but different Codecs.

I'm not sure how to count the Card, but
"basic     board sound" is 1st card,
"expansion board sound" is 2nd card for us in intuitively.

But, because we can't use same Component (=3D CPU) to different Cards,
we need to merge both sound into one Card.
We can do that, but not intuitively, and needs overwrite settings.

About Power, our CPU don't have DAPM, and Power itself is controlled
via PM-runtime, so we don't have worry about multi card case.
About Clock, our CPU clock is controlled by DAI base (=3D not Component bas=
e),
and no loopbacks.
So at least our case, having multi Card connection for CPU Component
has no problem, and is useful (At least someone had been doing it by removi=
ng
the limitation locally).

I had thought similar things are happening.

Yes, "my case" is not same as "any cases".
It's impossible to make "perfect" one from the beginning,
so I thought start from small, and expand step-by-step (=3D complex Power/C=
lock).
My suggestion was for first step.

> Thanks for your input Kuninori! Some questions first though :) On top of=
=20
> what Amadeo already highlighted, I'd like to understand what do the=20
> below three mean:
>=20
>  >>     - fixed playback vs capture
>  >>     - fixed CPU vs Codec
>  >>     - DPCM connection vs normal connection
>=20
> Especially the first two - what does 'fixed' stand here for?

Oops, sorry to my lack of explanation.
About 1st one (=3D playback vs capture),
Current ASoC is assuming it has both playback and capture,
but sometimes it is playback only or capture only.
We are handling it, but I think it can be more flexible
(or we can have multi playbacks or multi capture ? I'm not sure).
And/or in Codec2Codec case, this naming is confusable.
From HW point of view, Transmit/Receive is more understandable ?

Similar things happen on 2nd one case (=3D CPU vs Codec).
ASoC is assuming it has both CPU and Codec.
I think we can handle it more flexible.
Codec2Codec is good sample.

And topic is back and forth, but if we can handle "normal connection"
as one of "DPCM connection", we don't need to have both CPU vs Codec,
because no one want to have "dummuy CPU" or "dummuy Codec".

Thank you for your help !!

Best regards
---
Kuninori Morimoto
