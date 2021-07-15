Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 930FC3C99F6
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 09:52:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA8261688;
	Thu, 15 Jul 2021 09:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA8261688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626335544;
	bh=HsoRgdpAD39FHQovZpluCBmTLyioCCaEh0n6n3zuoxw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XoEn8FtSVJb01D+PGJ2penNG1bL67/VPngHw2SoworiuP/NOlvMLXLBvEKvonBv+8
	 z3M9pt6SyDFrg7S4qrPbULMqWu72N9/TT8SzrR9FAses8Ar9b+SBqnq6rJcGn+N8dF
	 nEi310/yJqTHHtdc38+ORrqaCK7GmzjTUt70V5aw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 952BAF8013C;
	Thu, 15 Jul 2021 09:51:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D5F68F80229; Thu, 15 Jul 2021 09:51:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FFEFF8013C
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FFEFF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qOjl3JeQ"
Received: by mail-lj1-x236.google.com with SMTP id h9so7461535ljm.5
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 00:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JNRwliBCNdVn2pAZ1M77juKCDNZc4rrhNTC9ii63Vgg=;
 b=qOjl3JeQAM+VvZShSUcMJoyhzHarKBYgFpCMlNeqk451jgcbAsVj4EqOo333MW3urZ
 G1INpKBDxT/6AMMm/9VEknsoYi/FXr7SZLbZfPUjn7+klrniBJLK2KCIJqMy2fJXA5Mq
 0FyHIeD+cZyLfUFk8JoH4wL4PUje1IA5gV6ptfcrn2rhCGq5OvF2IcPipWvs8NLyz0dD
 iNpxugz9CaGqOFGxKNQMtllc2zvdhZibaEMDelOMavMIkgBzPnyUzD4FbSsMPi1/t1xh
 lOd6BgT5ocVYyhhk/b3QN/POCL/JhupoOZiDb9D2jnHqDkeXzYoxhB3g0nJj7KxTd7qT
 7zDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JNRwliBCNdVn2pAZ1M77juKCDNZc4rrhNTC9ii63Vgg=;
 b=sVKZv5vOugzsDK4s+CrIyT8Mqts3Lv/pCugQsomoL5nuZAMYxX7TsJPuaJphdAIMFO
 NjilXVMglKNTmueVEIBjbb9FGPKDZTp9+31PG7kEV1nBsyl2yZfyTacjww3vNwXHAvCg
 c3SS6fV6iEBKqSlk6ITAPL4yt64qDBTlSqPzV3dKbZtMsQNSXBbvfZfrvCyvoS67QVpX
 W9bEZHAusO9lobCfbMyq7SkBnaE5aOhp4rRF9VXAxzWmTgAAIUrWWh9Tuq5zp3nl2p+9
 pBybvVq6qBmuI2E4eC06A5ji4FoIx/IYRxfE6fnAx9ojrgQZOQG4KaIs55MQiuSmhQok
 NBjg==
X-Gm-Message-State: AOAM530OPbNWjtG7dFbUGNcVn8bxxSqHE3OlZBhuneL05JG0mxhgWjGW
 CwKerPg+XXKFxxE0rnPc9PA=
X-Google-Smtp-Source: ABdhPJwFm3Rxejd0C5nm1R7+YQQjTbYy4lIwK1s527d2ahb5/3of/oUw35G4ngXi6oa5qw8qk4xQBw==
X-Received: by 2002:a2e:990e:: with SMTP id v14mr2820107lji.353.1626335482859; 
 Thu, 15 Jul 2021 00:51:22 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi.
 [91.155.111.71])
 by smtp.gmail.com with ESMTPSA id p7sm345719lfk.51.2021.07.15.00.51.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 00:51:22 -0700 (PDT)
Subject: Re: [PATCH 0/2] ALSA: compress: Cleanup and a potential fix
To: Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.de>
References: <20210714162424.4412-1-tiwai@suse.de> <YO+uAyrdT1xzLFIa@matsya>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <74151b06-a1cd-3a6b-ef1e-8db03eb815ad@gmail.com>
Date: Thu, 15 Jul 2021 10:51:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YO+uAyrdT1xzLFIa@matsya>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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



On 15/07/2021 06:39, Vinod Koul wrote:
> On 14-07-21, 18:24, Takashi Iwai wrote:
>> Hi,
>>
>> this series contains a couple of patches for compress-offload API, one
>> for a cleanup of unused API functions and another for the proper mutex
>> initialization.  I stumbled on the second while doing the first.
> 
> Thanks for the cleanup. We never have a compress only device and it is a
> mix of PCM and compress FEs mostly :)

Actually I'm working on a series where a card would only contain nothing
else but a compr, no PCMs...

> 
> So:
> 
> Acked-By: Vinod Koul <vkoul@kernel.org>
> 

-- 
Péter
