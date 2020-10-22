Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6BC295C61
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 12:05:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED99317C2;
	Thu, 22 Oct 2020 12:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED99317C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603361109;
	bh=ysyEE8TNfPUmO1fl3XMOCceMyt3I8fiv/UQ7oaR+j24=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VNShf/iOFgS2GsqIu6X38leN5K7nB6UDEVgGQ+btPPqxca6HTCRy8RdXOdBBgAtD0
	 YrbrGQK1MiiBYrzsBNcVUpI3WCxV+CCwMQXT14m1ETM0+Lo7FTVtTT270E2BbRvm9T
	 aOfOQCKcTIZOSesuiAXwntdkpjPb828zs4FWYQYw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 439FEF800CE;
	Thu, 22 Oct 2020 12:03:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9822F804A9; Thu, 22 Oct 2020 12:03:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 516E2F80247
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 12:03:29 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3EB98A0040;
 Thu, 22 Oct 2020 12:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3EB98A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1603361008; bh=lXoh+KKoCCjpmbseFyBsxIaO14Gfb2SvYAq3LoV3XpQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NVNO0hPS0PB46y98mKoU43gSrfjrLeM+6k4x+areXIrgcSKhmUf6h0jkTiQz4K+/6
 NUQAWQjI2K3wzlweVtoxyzDdSOXp8Rya+PwUwm6Lp1dgpuUmsMtXPFE6aseloANrDK
 NKFQ9mksgdiOCNY1j8t4VQ95LNui0CuCI3oha6aw=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 22 Oct 2020 12:03:19 +0200 (CEST)
Subject: Re: Context expectations in ALSA
To: Maxime Ripard <maxime@cerno.tech>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20201022095041.44jytaelnlako54w@gilmour.lan>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <30226f94-72e9-34d2-17d0-11d2501053f0@perex.cz>
Date: Thu, 22 Oct 2020 12:03:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201022095041.44jytaelnlako54w@gilmour.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Dom Cobley <dom@raspberrypi.com>
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

Dne 22. 10. 20 v 11:50 Maxime Ripard napsal(a):

> So, I'm not really sure what I'm supposed to do here. The drivers
> involved don't appear to be doing anything extraordinary, but the issues
> lockdep report are definitely valid too. What are the expectations in
> terms of context from ALSA when running the callbacks, and how can we
> fix it?

I think that you should set the non-atomic flag and wake up the workqueue or
so from interrupt handler in this case. Call snd_pcm_period_elapsed() from the
workqueue not the interrupt handler context.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
