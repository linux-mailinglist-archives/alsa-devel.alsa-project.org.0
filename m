Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3D935EEAA
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Apr 2021 09:50:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 626AB16DF;
	Wed, 14 Apr 2021 09:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 626AB16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618386625;
	bh=aM19r35XL/9Kx7XTPedZbA5Qq7Pwe1S7yiQmxtArev4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qTxXo+zQ4y85xIZJHN0V4IjiA3gpwGep0PoZD3DCA7m+aTxD7G6SfSM59zNSkDf1p
	 aRLw+5ywwMquNZne1D1ls+Qy14PINWXjvI+4/Ofs+LpaftPG2zdFBNYp9GMoX1mixH
	 r2uAGbARBMVP4/Fh53wVl4/4je0GvXkeOEAHsm3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD9A3F8025B;
	Wed, 14 Apr 2021 09:48:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84362F80269; Wed, 14 Apr 2021 09:48:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 356A6F80128
 for <alsa-devel@alsa-project.org>; Wed, 14 Apr 2021 09:48:38 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A7C01A003F;
 Wed, 14 Apr 2021 09:48:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A7C01A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618386517; bh=P9Nd0rEqpNS1T/TZ3X/vBQWYda+UUYjcmNJW+viXk4Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=1LJjkMDc2D/1b/2etxmJf2HiasUj4zZ18pXBc2p33SRPItZcnqxVXh1sS+gS6XFiF
 qFEerQYZXN0cv0xd6QMMYYQALrbjHbU3DR0aj8z5GUWqQDlPCiW55IxwMUrD2cOlET
 /qXwKPaFd2Qk9wynVLPuNA02NLy5DL9s3XyF2Wm0=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 14 Apr 2021 09:48:33 +0200 (CEST)
Subject: Re: [PATCH] ALSA: control_led: fix stack frame usage over 1024 bytes
 in snd_ctl_led_get()
To: Takashi Iwai <tiwai@suse.de>, Nathan Chancellor <nathan@kernel.org>
References: <20210404065929.52501-1-o-takashi@sakamocchi.jp>
 <YHYEzjCuA6o0Myyj@archlinux-ax161> <s5him4pwcbx.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <930e0e7f-585a-5e48-d006-8c066132c179@perex.cz>
Date: Wed, 14 Apr 2021 09:48:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <s5him4pwcbx.wl-tiwai@suse.de>
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

Dne 14. 04. 21 v 9:32 Takashi Iwai napsal(a):

>> This patch is still relevant on latest -next and this hunk prevents the
>> patch from applying cleanly because that patch was NAK'd:
>>
>> https://lore.kernel.org/alsa-devel/20210404064031.48711-1-o-takashi@sakamocchi.jp/
> 
> Can anyone re-submit a version that just does fix this issue without
> doing anything else?

I'll create a proper fix with the cached allocations in struct snd_ctl_led.

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
