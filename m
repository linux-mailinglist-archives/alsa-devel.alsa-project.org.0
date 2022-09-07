Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD7C5AFC8E
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 08:37:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6613220C;
	Wed,  7 Sep 2022 08:36:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6613220C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662532655;
	bh=a1lcLGGLHT0sz1LNLscP9liMK3J0I04L0FfjKDfnLQY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ugkoq94H8z2DhcJ84sU6/0fKjkwzVBZRRFx+gpD1yXhILchd8f3eQHYiizv0BpFQ8
	 /r+7vMU48jmUs1INOFiKOE3br+LJ6wGDWFAwfrVGVPV4PYX+A7DF0sQy2S9m7GpGKW
	 E8t6GOQvy647DAG6qfBvXGJ21xg4GH0G8cjG9N7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA3EDF80423;
	Wed,  7 Sep 2022 08:36:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2855F8028D; Wed,  7 Sep 2022 08:36:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 648EBF8023B
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 08:36:25 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 59E0BA0040;
 Wed,  7 Sep 2022 08:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 59E0BA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1662532585; bh=GzIN9WKLOsXQF0tibQavGfxltW/YH8mjlBzsDk3r480=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=f4I/kqY7KGHDr+iGzmdkez2JVww0e1O1Sej/Y8PpLGYYs3EqfFXz5HrPQnztRFOO4
 YhayK2l/MJ1OEVhJOxxGTTGK2ddCuU1TS3Cd/GOnnNC2FHJobhvS9+T2DpjDgoGt+h
 XCZtI+AiJoQBlgqfAyXR9IhLfK/MboX0LT8FIaSw=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  7 Sep 2022 08:36:23 +0200 (CEST)
Message-ID: <035e62f9-0f27-9501-dfb8-8af643e52394@perex.cz>
Date: Wed, 7 Sep 2022 08:36:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Query for snd_pcm_readi function.
Content-Language: en-US
To: Web X <webx93@gmail.com>, alsa-devel@alsa-project.org
References: <CADP81_VWcrTmQgDRxLwDjMNR9A11q8BTCvZ1bRmPqxcrSkLf9w@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <CADP81_VWcrTmQgDRxLwDjMNR9A11q8BTCvZ1bRmPqxcrSkLf9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 06. 09. 22 15:28, Web X wrote:
> Hi,
> 
> I am using alsa open source library for my project to read and write audio
> data.
> 
> For that I am using snd_pcm_readi function to read audio data. I am able to
> read audio data.
> 
> But issue is that sometimes it will take so much time to read data.(200-230
> msec).
> Normally this function executed in 1-3 ms that is normal case, but after
> every 2-4 frames it is taking 200-300 msec.
> So this is affecting my whole application process.
> 
> I have also try to set this call as nonblock with the help of
> snd_pcm_nonblock function. With that I have observed some improvements but
> still after 2-3 frames it is taking 100msec time to get a data.
> 
> Please do needful as soon as possible.
> 
> Let me know if you want more details.

This question is handled in this github issue:

https://github.com/alsa-project/alsa-lib/issues/270

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
