Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0819B341624
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 07:56:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 864DD1694;
	Fri, 19 Mar 2021 07:55:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 864DD1694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616136973;
	bh=37sGlGbo1W4d/H0baQpnQp1ehNkuIW+krxhAkY2XKag=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RF4LOK4DTTfvwyh6hl/uNVIM245MpKHajWucRp8eyvZaPrgWOXl9ciz1YV9H+u/TT
	 QelbqUb9UCUbVrA6TUgMrnZifq2vluTfozMcbwk/bddsuvfa2JyZGsTooNs4QGoHi+
	 rRwcyatSi59QjGlzBHKDWCkjD8ZdwRtBAlz90/hg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA71AF801F7;
	Fri, 19 Mar 2021 07:54:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E59DF8021C; Fri, 19 Mar 2021 07:54:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E53FF80124
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 07:54:32 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D81D9A003F;
 Fri, 19 Mar 2021 07:54:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D81D9A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1616136870; bh=P/qyZmhVW0dKKRsxR1Cz5ZqR6oAiQHxSnKurai0R6o8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RKggjy1LUAtiRM9xZSvXbg5PauHzTFaMG8AIrUVXKC6QcZOwgofRkYiLnT/tv9/p5
 BfrExemCdXhGtosFyWb8By6SIzB0fbqVjZ8ugFg78mSl4RuQP71R5GQs1OiAhkftkH
 A5PxeQEHWaRo4cOfYULzl15+CwW9AtI/sKPKvs9w=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 19 Mar 2021 07:54:21 +0100 (CET)
Subject: Re: [PATCH 1/2] ASoC: rt715: add main capture switch and main capture
 volume
To: Jack Yu <jack.yu@realtek.com>, broonie@kernel.org, lgirdwood@gmail.com
References: <20210319030337.16213-1-jack.yu@realtek.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <2d55b97c-e781-552a-5064-5715443fb7e9@perex.cz>
Date: Fri, 19 Mar 2021 07:54:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210319030337.16213-1-jack.yu@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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

Dne 19. 03. 21 v 4:03 Jack Yu napsal(a):
> Add main capture switch and main capture volume control.
> Main capture control has its own channel value respectivelly.

It's a 'deja vu' without a proper solution. Please, resolve issues described
in the first thread:

https://lore.kernel.org/alsa-devel/20201214064903.2746-1-jack.yu@realtek.com/#t

It's bad to map multiple controls to operate on top of the same registers
without any kind of synchronization.

Also, I note that the put callback should return 1 when the value is changed.
Your callbacks return only 0 in all cases.

I would not apply this patch.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
