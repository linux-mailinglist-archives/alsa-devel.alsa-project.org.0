Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 982D8133E5A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2020 10:31:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02A35172B;
	Wed,  8 Jan 2020 10:31:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02A35172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578475912;
	bh=RaLqjYZP20LC8weu5N6V0NzQo5u2EyisfnSkQKCq4lc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tW6fVOIfZqDxPcwf6hxRZdRlYj60BZZGVU/tXN0NyEds8kOVgDLNguo0Kep6IyJMi
	 jYpVsCw3vur7igmrqJ/yalxQXPsXzWgirs6XcwmV4bnuGFFM4RqxjezXzLEpeFACoa
	 XJ+XklcOaLIChnRytkIUGAKJAkVHwfPIDFO7uOvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28FDBF80161;
	Wed,  8 Jan 2020 10:30:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89E2BF80159; Wed,  8 Jan 2020 10:30:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B2E8F8010B
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 10:29:56 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5123DA003F;
 Wed,  8 Jan 2020 10:29:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5123DA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1578475796; bh=NOMF12Z492qKFfZQNJjWlxJcU+cfzz3wlX1rnauCMEU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Dn/SOaByeBtaUI2NEe+FUKRs3eT6kplXvA3Mj+pFanbl5acaieh5rvIbEN5y38YVz
 X+vm0cn7D4fjlUcv6tPkO8AoypIGwJO+VsbtsZZff81GPqQ/xc+hAnt2sFpy+gMSLA
 8UzpD9XhBwCRHtGjUlmSsURxuX+SyVU6PtJYDHPs=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  8 Jan 2020 10:29:53 +0100 (CET)
To: Kailang <kailang@realtek.com>,
 "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
References: <6d3af68aa0fe48848c62943e9a342698@realtek.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e37b9322-5f47-2d8d-45d0-100169300747@perex.cz>
Date: Wed, 8 Jan 2020 10:29:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <6d3af68aa0fe48848c62943e9a342698@realtek.com>
Content-Language: en-US
Cc: "\(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Add quirk for Lenovo X1 Yoga
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

Dne 08. 01. 20 v 10:19 Kailang napsal(a):
> Hi Takashi,
> 
> Attach patch was for Lenovo X1 Yoga.

Remove the 'Fixes:' line. It's the different device. Otherwise:

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

> 
> BR,
> Kailang
> 
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
