Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8078220EFEC
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 09:54:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1363D83E;
	Tue, 30 Jun 2020 09:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1363D83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593503674;
	bh=ua+63/YyHw2xHKHwJp8lHJA5sUye4x7D7ikLJyjU4L4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vBoMsKuAocj3f94wbKjTiouC7aAvMIHo/Kq+38LyBfSEjbHe/EHTCRZbFlgNhslWm
	 fXl8LqoCdGsLIWDlXmJ6yg0slGLZ/EjBYzZhUyUY5p0hh9h4xyZnYF3BZ3YDCwpeZG
	 Ppoz9Mpmu5JBKYKl5tCQuR8VGufo9yeVImmabVrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 272A6F80135;
	Tue, 30 Jun 2020 09:52:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6A99F801F2; Tue, 30 Jun 2020 09:52:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DFDF0F800EA
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 09:52:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFDF0F800EA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="idWCh/s5"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efaef170000>; Tue, 30 Jun 2020 00:51:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 30 Jun 2020 00:52:40 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 30 Jun 2020 00:52:40 -0700
Received: from [10.25.97.62] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 07:52:33 +0000
Subject: Re: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI link with
 multiple Codecs
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-13-git-send-email-spujar@nvidia.com>
 <874kqu1x70.wl-kuninori.morimoto.gx@renesas.com>
 <1e0cf6d1-bf4e-8808-5390-c8a3b7c7fe7e@nvidia.com>
 <87mu4lz6pt.wl-kuninori.morimoto.gx@renesas.com>
 <1d7888c7-a8cc-e891-01aa-016e31cc9113@nvidia.com>
 <87ftadyrec.wl-kuninori.morimoto.gx@renesas.com>
From: Sameer Pujar <spujar@nvidia.com>
Message-ID: <492079e9-4518-78ba-a227-859d31594369@nvidia.com>
Date: Tue, 30 Jun 2020 13:22:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <87ftadyrec.wl-kuninori.morimoto.gx@renesas.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593503511; bh=inFa19J1yaZD5c+k8GDWrSjXHyj3mNBTgOyUpUgXV0E=;
 h=X-PGP-Universal:CC:Subject:To:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
 Content-Language;
 b=idWCh/s5jCqd2g/xEk4fW5rOko1xeDBq5QTGJJEIvlyHWyI6tJqFBb6ST1LIz54+P
 vJ9xvFQ2lXR6tjQ9FCBV9A7WSsM5R/N6NwAG/162sKiJaNWijh+9xpmVzdk1zbvnp1
 me/CQTqUq+V+VYTYCDUcaxuouJOYk5lzUi0Cb3NxbJbKC4JqwpUDNpsipiOadKcPVW
 D458mDYm3cIMLtBu36aMyOyUZJDCSKMxPmD0VgvbnwiWVx+RGWrfwRaBgE8RN8fWwS
 Sr1STgi7Qtl/2buW4Z+XT3gENrqBQbLjV6m/VkoAk65u2bFuFghaQBECAB4U3yOedR
 NIklI8ar5x3sg==
Cc: jonathanh@nvidia.com, nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, linux-kernel@vger.kernel.org,
 spujar@nvidia.com, nwartikar@nvidia.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, tiwai@suse.com, viswanathl@nvidia.com, sharadg@nvidia.com,
 broonie@kernel.org, thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com, rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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



On 6/30/2020 12:25 PM, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sameer
>
> Thank you for explaining detail at off-list mail.
>
> Your issue happen on (C) case, and you are tring to solve it.
> It is easy to understand if it was indicated at log area.
> I have imagined other system from "multiple CPU/Codec support".
>
>          (A)    (B)
>          FE <-> BE
>
>          (C)    (D)
>          BE <-> BE
>
>>> I'm not sure, this is just my guess.
>>> I'm happy if we can support it more easily :)
>> Right now I am trying re-use simple-card driver as much as possible
>> and still make it work for flexible sound cards. I will be happy to
>> discuss and improve the patch wherever necessary. Please help me
>> understand which part you think looks to be hacky.
>>> But, if it was difficult to keep compatibility on simple-card,
>>> we/you need to have new one.
>> Patch 17/23 and 18/23 introduce new compatible
>> 'simple-cc-audio-card'. Idea was to use component chaining which
>> allows connection of FE<->BE and multiple BE<->BE components along the
>> DAPM path (patch 16/23). Do you think it would be fine?
> This seems very complex system for current simple-card.
> "concept" of simple-card is simple (but "code" is not so simple...)
> Because of it, it doesn't assume flexible connection.
>
> Maybe your patch works for you, but might breaks other systems.
> Or, makes code or DT settings more complex/ununderstandable.
> Not sure, but my guess.
Yes there are complex use cases, but if we look at the amount of changes 
required in simple-card driver that is not too much. Existing binding 
for simple-card driver would still work fine for our cases. Yes there 
are some deviations and we don't want to break existing users, that is 
why a *new* compatible was introduced and specific items can be pushed 
under it. Majority of the simple-card driver is getting re-used here. We 
just need to make sure it does not affect anyone else.

>
> Using cpu@0 node for BE is the 1st confusable point for me.
Don't we use the same methodology for CODEC<->CODEC link and still 
describe the DAI link with 'cpu@0' and 'codec@0'?

> Using fe/be instead of cpu/codec is easy to understand.
I guess you are referring to DT binding part. The parsing code 
specifically looks for "codec" sub node and thus present conventions had 
to be used.

>
> Thank you for your help !!
>
> Best regards
> ---
> Kuninori Morimoto

