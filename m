Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8E2AF1B7
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 21:11:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3023016CB;
	Tue, 10 Sep 2019 21:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3023016CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568142673;
	bh=muDBfiqknP6buz4oCGByPhktAfZY8jpl1OrDtu5zahk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TIUmkAK9RyT31bQWS36UyqVIh6y9kLAK2a+Dj0eQKiavd4d0AAQw+el9d7JPydKPO
	 ybHEdFcWRhRy/eFKhfTsrtSQkp0+4PYEspoKgCYA9wo5WF4jTO0Jz+YPalFLoOcj6n
	 AFVfGEjlWISduabfi9jslWtMoNdxryeDxTOGDwf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68148F80321;
	Tue, 10 Sep 2019 21:09:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A27ECF80368; Tue, 10 Sep 2019 21:09:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31EBEF800A9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 21:09:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31EBEF800A9
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 8B91328DE09
To: Jaroslav Kysela <jkysela@redhat.com>
References: <15679391594432724-alsa-devel@perex.cz>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <7d27fee4-1dee-3727-1d98-1d21cbe3445b@collabora.com>
Date: Tue, 10 Sep 2019 21:09:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <15679391594432724-alsa-devel@perex.cz>
Content-Language: en-GB
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] Licence change for your alsa-lib UCM commit (Enric
 Balletbo i Serra: 1 total)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 8/9/19 12:39, Jaroslav Kysela wrote:
> As discussed, we would like to move the UCM configuration files from the
> alsa-lib repository to new alsa-ucm-conf repository with the licence change
> from LGPL-2.1 to BSD-3-Clause.
> 
> I would like to check, if you agree with this licence change. Please, answer
> to this e-mail and write your agreement / disagreement (keep CC to
> the alsa-devel mailing list for the archiving purposes).
> 
> Thank you for your time and co-operation.
> 
> Reference:  https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153257.html
> 
> List of your commit(s):
> 
>   a192f52fc63a86e1fbb9a09adb0bc2a6bbc8dab1
>     conf/ucm: ROCKCHIP-I2S: add Rockchip I2S UCM config.
> 

I agree,

Thanks,
 Enric

> ---
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
