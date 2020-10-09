Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22431288DDB
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 18:13:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 939E8167F;
	Fri,  9 Oct 2020 18:12:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 939E8167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602260006;
	bh=rg3NzeIUJyRhRU+/+bBA4YDLKL3yDrhNNXeKsNQOdjs=;
	h=Subject:Cc:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RbaWCtH2d70QIllUXDMzBNLOLMttUAPkeoCJCT3eZAOjngGHJimIuz5U5i46UtZyI
	 lezZLu6YBtoOfXPKjQ4WJu4hso+TRkpkJOoRH0Fv6YX05fJqrMQu0Q4TcPisSJ0kF1
	 eR2xM9syUc7M2wNqbYdFcIKiucSi1buzboRMAV/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F4C2F80128;
	Fri,  9 Oct 2020 18:11:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6436CF8015B; Fri,  9 Oct 2020 18:11:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=KHOP_HELO_FCRDNS,
 MISSING_HEADERS,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.earthlovesme.ca (24-65.162.static.aei.ca [216.162.65.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C05FDF800BF
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 18:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C05FDF800BF
Received: from localhost.localdomain (Unknown [10.10.10.3])
 by mail.earthlovesme.ca with ESMTPSA
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128)
 ; Fri, 9 Oct 2020 12:11:43 -0400
Subject: Re: Discover a microphone device, to later discover if it is
 receiving input
Cc: alsa-devel@alsa-project.org
References: <de6ebf17-8f71-c497-28bc-7819338baddb@dressmaker.ca>
 <s5hlfgfs986.wl-tiwai@suse.de>
From: info <info@dressmaker.ca>
Organization: Dressmaker Canada Inc.
Message-ID: <84f644cb-427e-487e-123a-6b1cd15e1d25@dressmaker.ca>
Date: Fri, 9 Oct 2020 12:11:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <s5hlfgfs986.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

When Audacity uses ALSA, it somehow knows that something is a front mic.
In the total absence of documentation that I noted in my other email, 
how can I replicate this behaviour?
I do not insist on using hints. They were just mentioned somewhere on 
the Net. I am agreeable to use any methods in ALSA API to discover the 
mic, but w/o documentation, I have no way of knowing what it is, short 
of reverse engineering your library. Is this the way you envisioned 
adoption of ALSA: everyone is supposed to reverse-engineer?

Regards
Alex

On 2020-10-09 11:35 AM, Takashi Iwai wrote:
> Apart from the lack of the Input direction (maybe a bug in the hint
> code), the fundamental problem is that the driver cannot tell always
> the device type at all for each PCM stream.  It's simply because a
> stream may give you any input type depending on the mixer route; it's
> the case of HD-audio.  So, the same PCM device may be a mic, or a
> headset mic, or a line-in, or whatever.
>
> Sometimes there are dedicated PCM devices for certain inputs, but most
> of the PCM streams are generic purpose.
>
>
> Takashi
>


