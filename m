Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D393948BF37
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jan 2022 08:48:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B95F1932;
	Wed, 12 Jan 2022 08:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B95F1932
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641973709;
	bh=aU+3XSAFQK31OBoiBs9bCDLewsLCxJGw6yIc3glOGwU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Igboi0gYnm2yxmFm0RruR9pZFRyOSEIJcaEQdaRC8kPBf8UhxATjA30JsVuuAB2d+
	 DB4uOwpWioLKhx0lipy1OBHcKgQWIdrIGr2+FMeX149vyI13nmU165IPwh4WieejDJ
	 IqHxfcK/HpYFegSGFp4wrGYghPv8tTxi1h3aRCEI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C65E2F80236;
	Wed, 12 Jan 2022 08:47:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F833F80236; Wed, 12 Jan 2022 08:47:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89F30F80236
 for <alsa-devel@alsa-project.org>; Wed, 12 Jan 2022 08:47:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89F30F80236
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 1916744B5E;
 Wed, 12 Jan 2022 07:47:07 +0000 (UTC)
Message-ID: <0beed477-adc4-5362-f116-669832c862b1@marcan.st>
Date: Wed, 12 Jan 2022 16:47:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 0/3] firewire: assist unit driver to compute packet
 timestamp
Content-Language: en-US
To: stefanr@s5r6.in-berlin.de, alsa-devel@alsa-project.org,
 linux1394-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20211202113457.24011-1-o-takashi@sakamocchi.jp>
 <YcGycqUrptkWYeOV@workstation> <YdgdfrcvhJrUXwYF@workstation>
 <Yd5QNs/YnvzGOy0g@workstation>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <Yd5QNs/YnvzGOy0g@workstation>
Content-Type: text/plain; charset=UTF-8
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

On 2022/01/12 12:51, Takashi Sakamoto wrote:
> Hi Stefan,
> 
> I'm sorry to post messages several times for the patchset if you are
> still busy. But I'm still waiting for any reaction.
> 
> I note that Linus have announced merge window for v5.17 kernel.
>  * https://lore.kernel.org/lkml/CAHk-=wgUkBrUVhjixy4wvrUhPbW-DTgtQubJWVOoLW=O0wRKMA@mail.gmail.com/T/#u
> 
> I'm glad if seeing your action for pull request as a response to the
> window.

Hi Tahashi,

Just FYI, I think a lot of maintainers have been off or doing less work
over December/the holidays; I also have some things that didn't make it
into subsystem trees for 5.17. So I'm guessing this patchset will have
to wait for 5.18. AIUI most maintainers don't merge things into
subsystem trees after the upstream merge window opens.

I've also been meaning to test your Firewire improvements again (and
also with Pipewire), but I've been pretty busy lately... hopefully I'll
get a chance soon. When I tried the first round of improvements that got
merged (the sequence replay stuff) I noticed it fixed the glitchy audio
problem, but the minimum stable period size with JACK+ALSA was still
higher than with JACK+FFADO, and Pipewire also had even higher
latencies. So I'm back using FFADO but I hope I can switch to ALSA soon :)

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
