Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 580421235D0
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 20:38:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D644082A;
	Tue, 17 Dec 2019 20:37:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D644082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576611515;
	bh=Jqwp7uOvtBjaiaGlvagFwatNdk3mi3Ixx6Yw7v0NY8Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hdSQB3TGWfkOEblDkzV3yTGsKHXh3tEjDgMUnPOq/bGY+LvXQdEhOv45Y1VixSBXL
	 F9Gj2mcLLCOOaj+nk27DAyjprN7NpW1NSsYibxlJJLkgB9FD7pKgI2unLKo5Bk7M0q
	 wy1pmH3hrRQkilmqhLqgk0dh+G+GC57aZooGmjFQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05084F80256;
	Tue, 17 Dec 2019 20:36:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07311F80234; Tue, 17 Dec 2019 20:36:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
 by alsa1.perex.cz (Postfix) with ESMTP id 7F0B3F80100
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 20:36:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F0B3F80100
Received: from [192.168.178.106] (pD95EF574.dip0.t-ipconnect.de
 [217.94.245.116])
 by mail.bugwerft.de (Postfix) with ESMTPSA id 2FC83281AEB;
 Tue, 17 Dec 2019 19:30:17 +0000 (UTC)
To: Lee Jones <lee.jones@linaro.org>
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-8-daniel@zonque.org> <20191217133952.GJ18955@dell>
 <20191217134617.GK18955@dell>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <ff062a37-e07d-3d6c-7fa5-9e6dc74b1aa9@zonque.org>
Date: Tue, 17 Dec 2019 20:36:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217134617.GK18955@dell>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lars@metafoo.de,
 sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org,
 linux-i2c@vger.kernel.org, pascal.huerst@gmail.com, linux-clk@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 06/10] mfd: Add core driver for AD242x A2B
	transceivers
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Lee,

On 12/17/19 2:46 PM, Lee Jones wrote:
> One thing I should mention upfront; there is too much code "doing
> things" in here for it to be an MFD.  MFDs don't care about; syncs,
> slots, TDM, inverting lines, upstreams, downstreams, etc etc etc.
> Anything remotely technical or functional, the code that "does things"
> should be moved out to the relevant areas.  In the case of this
> device, that's looking like one of the Audio related subsystems.

Okay, that's good to know.

I in fact considered that when I started working on it; after all, A2B 
stands for "automotive audio bus". The reason why I didn't do it was the 
fact that these devices certainly do have multiple functions, where 
audio is just one of them, and there needs to be a 'top-level' layer 
that enables all these functions and does the node discovery etc. Hence 
I thought it's cleaner to separate things that way.

I can move things over to the ASoC layer for the next iteration, and 
then maybe also merge the codec driver with the baseline drivers. Let's 
see how this looks like then.


Thanks,
Daniel
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
