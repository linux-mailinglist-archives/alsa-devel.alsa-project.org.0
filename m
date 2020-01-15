Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EB513BB7A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jan 2020 09:49:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38B9817B0;
	Wed, 15 Jan 2020 09:48:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38B9817B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579078149;
	bh=/EF5lJATKevC4T7XNv2+UWya2tUECVY2zi0XgYQv97U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iVHwzgitYrv0nP56KLK9PHnUX+l3/7vj3/0crQDrswn8/eHiolTQTB/D51s662+Iq
	 /HU/oSU83lqQF1nMxsemPVn0ArcfrE5VWIzXWADc4Mx7Ej33DjM8+birsvzQtdwTkf
	 JsxIuxbeSa9mZuNLCUOq2eMZC/x7UwyMqwKoy1PE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74167F801F8;
	Wed, 15 Jan 2020 09:47:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43961F801EB; Wed, 15 Jan 2020 09:47:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B50C7F800E9
 for <alsa-devel@alsa-project.org>; Wed, 15 Jan 2020 09:47:15 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4E1C5A003F;
 Wed, 15 Jan 2020 09:47:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4E1C5A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1579078035; bh=4wxe9sal8m3N/YS5+tlHDe5Tol0tY+C1kQ5btwA0d7s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CV/1UiKPpuqmllEFFBr7oNTnpURm29FtmiftUPB4Gl4t7RyV6Nb8AFZQPgkZDMNTi
 9Oss8fkSypwqIQBYVgIc5CWrg0QRkPmZOCs+tPK5NirJX8dLBSoPBZCMjfu8kkkD1v
 5pmuKVzrW/Oc2jxg/7xHvYNqAC8uMJNPO6aqO00Q=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 15 Jan 2020 09:47:12 +0100 (CET)
To: Jordi Mallach <jordi@debian.org>, alsa-devel@alsa-project.org
References: <1fbf9bffb1f13e1ea8e1212a633998b9e6380298.camel@debian.org>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a009ee4f-e0c5-a944-6575-b0df79388fb6@perex.cz>
Date: Wed, 15 Jan 2020 09:47:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <1fbf9bffb1f13e1ea8e1212a633998b9e6380298.camel@debian.org>
Content-Language: en-US
Cc: pkg-alsa-maintainers@lists.alioth.debian.org
Subject: Re: [alsa-devel] ABI breakage in alsa-lib 1.2
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

Dne 10. 01. 20 v 23:58 Jordi Mallach napsal(a):
> [Please Cc me on replies, I'm not currently subscribed to alsa-devel]
> 
> Hello,
> 
> I'm one of the ALSA Debian maintainers, and some weeks ago I looked
> into updating our ALSA packages to 1.2.1.
> 
> I quickly noticed there's been some fundamental change to libasound2,
> one that appears to break ABI and should have warranted an soname bump
> at least.
> 
> With the split of the snd_tplg API to the new libatopology2, libasound2
> has been left missing that part of the API that was part of the
> asound.h header, etc. This could have been a somewhat lesser issue if
> libasound2 linked to libatopology, but unfortunately this goes in the
> other direction, so the ABI and API breakage is not avoided.
> 
> I cannot update alsa-lib in this state. I could hack around and patch
> it to reinstate the missing api in libasound, but this sounds like pain
> and suffering for everyone involved. How should we move forward with
> this?
> 
> I am sorry I only come up with this 2 months after the release when I
> had identified the problem many weeks ago, I've been extremely busy.

It's not a problem at all. Those API/ABI is used only in the alsatplg utility 
from the alsa-utils package which has the specific usage - compilation the 
topology files from the configuration file to the binary form for the driver. 
This tool is used only by the developers. I believe that you have zero users 
for this. No other applications are expected to be touched. I would not do 
this split, if it affects something serious.

					Jaroslav

> 
> Thanks,
> Jordi
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
