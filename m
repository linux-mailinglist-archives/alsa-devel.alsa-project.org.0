Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A93201B711C
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 11:41:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DA0716AF;
	Fri, 24 Apr 2020 11:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DA0716AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587721300;
	bh=x2gp2/fbjFbxpBuijZ41lNkp0XU8gn6JbbmLOnFn/Qw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dQKkQ1GBP5gOcYBM3hCAVADBOHHIbHp4CkfvtgH+TTJP5bSR0vv28FnTVztZFeDCt
	 QCFC0kYrVEu7G/9EMhvL5pkGOfvUpc0CjWWVrCg9JZeVuBO+IpRwaw0wrWsPcgnbIr
	 y2lvSgBaL2/3FUf2AyW1PE/ASKBV/WOVYWZ+U7aY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7340FF801D9;
	Fri, 24 Apr 2020 11:39:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81FE8F80142; Fri, 24 Apr 2020 11:39:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BDC5F80117
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 11:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BDC5F80117
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 9A7D1A1F2BCF5;
 Fri, 24 Apr 2020 11:39:45 +0200 (CEST)
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sQAKygH1canS; Fri, 24 Apr 2020 11:39:40 +0200 (CEST)
Received: from [192.168.105.191] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 31226A1F2BCEB;
 Fri, 24 Apr 2020 11:39:40 +0200 (CEST)
Subject: Re: [PATCH 1/2] ALSA: usb-audio: Improve frames size computation
To: Alexander Tsoy <alexander@tsoy.me>, alsa-devel@alsa-project.org
References: <20200424022449.14972-1-alexander@tsoy.me>
 <11dca14b-39a7-635a-a62f-ea10f21aa697@ivitera.com>
 <a876d867496c2c58866a626430dd2f174f16c107.camel@tsoy.me>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <a55e9f9e-c5fa-8602-1766-7b6602e03ef1@ivitera.com>
Date: Fri, 24 Apr 2020 11:39:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a876d867496c2c58866a626430dd2f174f16c107.camel@tsoy.me>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Gregor Pintar <grpintar@gmail.com>,
 Roope Salmi <rpsalmi@gmail.com>
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



Dne 24. 04. 20 v 11:29 Alexander Tsoy napsal(a):
> 
> "sync endpoints" actually means "feedback endpoints" here. This is the
> terminology used by the driver. So it is not the type of
> synchronization of the endpoint for which this function is being
> called. :)
> 
> Probably comment I made for snd_usb_endpoint_next_packet_size() is
> slightly inaccurate, because this function will be also used for
> asynchronous endpoints in the case feedback endpoint is not configured
> for some reason.
> 

OK, thanks for the implementation. Being a noob I got confused. But
still maybe a few words like in your message could clear the noob
confusion, thanks for considering.

Regards,

Pavel.
