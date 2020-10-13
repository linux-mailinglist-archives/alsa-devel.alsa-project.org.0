Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AFF28D332
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 19:37:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB8D16A2;
	Tue, 13 Oct 2020 19:36:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB8D16A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602610651;
	bh=m+v+XFwmmVe0AkbKMd8+Qti/i+hGeYVHITYxMbHxn9Y=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DLVcvm7NB7FCUEai4yH4uO4emVJ9Y3uAISwVOX89JpDKnIJJB9CK+G6SC7Y6Hjx0h
	 p3Vc5oRq6bQe8ULbOiDnXlcN/Zb7SslLoICWWXW5qndDPOoj1YI5z/wlcBCZY0OWA+
	 wJ0+J3Ds0HEN/LL9id1nLpAT4+PxzG2DJqR/s7fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9B5CF801D9;
	Tue, 13 Oct 2020 19:35:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E6B2F801A3; Tue, 13 Oct 2020 19:35:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03AA9F8012C
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 19:35:42 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A82CDA003F;
 Tue, 13 Oct 2020 19:35:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A82CDA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1602610539; bh=VyUbOVMzwcIf0YWiHD1veq8AMcmuHYi1Zy2QZLmHXP4=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=0jBiwzA4fkdDCSWFfiOo1s+lqb6Zz1toNeI5TUHnjEOm+Fidy9R8lh6sv6v84qUdw
 LiVK4adYhkEokvnRddLWhu/xRPT8ZPglzuoMrSvnyMZGbbJSsE4pvyMzmw+bsbhxXf
 fjuEB8W9vNt+SSnINto4PkiSpTDSbhT0DGig0FyI=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 13 Oct 2020 19:35:36 +0200 (CEST)
Subject: Re: pcm_meter.c issue at s16_update
To: Pavel Hofman <pavel.hofman@ivitera.com>, Go Peppy
 <peppy.player@gmail.com>, alsa-devel@alsa-project.org
References: <CAANJKekdzYeO7vp9o30a4yiB0M8mqjpuf2ZOPem4d8Ma_V8bjA@mail.gmail.com>
 <f05763b6-7b1a-29d1-3072-0642bca3d306@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <fb010ee6-3c20-0d2a-1be4-67500253740b@perex.cz>
Date: Tue, 13 Oct 2020 19:35:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f05763b6-7b1a-29d1-3072-0642bca3d306@ivitera.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Dne 17. 09. 20 v 21:13 Pavel Hofman napsal(a):
> Hi,
> 
> Dne 15. 09. 20 v 5:40 Go Peppy napsal(a):
>>
>> Just to remind what the issue is - while switching from one web radio
>> station to another there is a high CPU usage for about 20 seconds. Because
>> of that high CPU consumption almost all other processes are blocked.
> 
> 20 seconds is only due to 32bit kernel on RPi. On 64bit machines the 
> boundary value is usually many orders of magnitude larger, basically 
> making the method never finish.

Could you try this patch?

https://github.com/alsa-project/alsa-lib/commit/a6c8ac0c85ca1b16684a687c7000c73aa38b7776

It should prevent the big copies which are definitely nonsense and this change
does not hide the real problem.

					Jaroslav

> 
> With regards,
> 
> Pavel.
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
