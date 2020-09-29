Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4CD27D319
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 17:48:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 908C81841;
	Tue, 29 Sep 2020 17:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 908C81841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601394532;
	bh=9C9NA9gs7eDjTFf8QLP3+29e3J/YqyHLDmkT6XH2WMI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BgjPNeT4pfPeU030Fm+A9kDjW7FgpHZz/m98z8rD0fLmp5pBKskMTB6qOg7FkmMXr
	 I+qOtRfHu7+x3j2grWO7UekE2P7ycKxFyrRu+HckjtGfHSguGWuIb+/Ib1we52+gEg
	 VeqODORh0DNSjX7+h/bm07n7xfsPQGp04g1blNwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD6A2F801DB;
	Tue, 29 Sep 2020 17:47:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C55D2F801F5; Tue, 29 Sep 2020 17:47:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 887D2F800AB
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 17:47:01 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7077BA0040;
 Tue, 29 Sep 2020 17:47:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7077BA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1601394420; bh=me70nD+qBMspyY77HK834GqF5MXlgWAJCcZFv0yqiYs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=C22svMhzgc8fetdX1s8le8wkE4rM8FCnW3oC2GnSvmhQcH0bQWEAoxr+45t9xMrCn
 6lmNy/5vC2sWob5G1n7ybffkAHalNrFfrySUC2O/oeJmex529lG3aaURSn21dxQcLa
 Lu5oowQieSCt+TkUS+ZpI7DrcYyZKLtHqLJLnucg=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 29 Sep 2020 17:46:58 +0200 (CEST)
Subject: Re: HDA-Intel UCM crux
To: Takashi Iwai <tiwai@suse.de>
References: <s5hwo0ciorg.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <46e46e1b-3487-1884-433f-14d569df249e@perex.cz>
Date: Tue, 29 Sep 2020 17:46:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <s5hwo0ciorg.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org
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

Dne 29. 09. 20 v 17:30 Takashi Iwai napsal(a):
> Hi Jaroslav,
> 
> it seems that the recent addition of HDA-Intel.conf in ucm2 caused a
> regression on our CI tests on KVM.  Namely, when this UCM profile is
> used for a plain HD-audio device on KVM, the device remains muted as
> default at the fresh desktop start up.  Without a UCM profile, PA
> properly unmutes and raises the volume, but with a profile, it won't.
> 
> When the volume was once saved in the pulse local config, it seems
> restored, though.  The tested environment was KDE.
> 
> Could you take a look at it?

Hi,

It seems that the '_boot' command succeed (no-op) in this case so the legacy
configuration is skipped in 'alsactl init'. I'll give a look. Thank you for
the report.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
