Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB8353768
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Apr 2021 10:30:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DADE16BF;
	Sun,  4 Apr 2021 10:30:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DADE16BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617525057;
	bh=SC9tAIcBa1vquFqizJokdOEFUcMfm3EmyXVMckUm7Bc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NeCfil5ia9BblMSPmNFe5NRPCW4wn2ZdgzdNMm4z9m41Kh76cfe5NLFNpt91FEe28
	 vdmaQMdPecZqLxRepZBeemXKyMvduWiQWkVLnQDXZbRgHAUi6k/5XzKPvyKhpZ3dPr
	 dYBgwIt1rF/cnXbj5D31wbBktLGU0wurfoTK28t0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31BAFF80249;
	Sun,  4 Apr 2021 10:29:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01903F80168; Sun,  4 Apr 2021 10:29:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F13A2F80127
 for <alsa-devel@alsa-project.org>; Sun,  4 Apr 2021 10:29:06 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 359D3A0040;
 Sun,  4 Apr 2021 10:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 359D3A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1617524946; bh=Jy6ZL8vcnLwysh9qCk8l/eV3h3Hxn6GnLUt4s3AbtSU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SbXLj7ho5qKp4WbE5/AJSe4hVLr0vnx9bs5gFwUAgFRk8p6AAI/pr1hvzkGUrncKc
 fIcZGRzNAgboO8Zrb1KCw+C8CIkYVP6YRbk44d4PZN/msGGiNUDMGqLmF6SH4uC6W+
 U2GQ8xVAvEXgvMZyevCfOG9aS2TErVeesNSR+lNU=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun,  4 Apr 2021 10:29:03 +0200 (CEST)
Subject: Re: [PATCH] ALSA: control_led: fix stack frame usage over 1024 bytes
 in snd_ctl_led_get()
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, tiwai@suse.de
References: <20210404065929.52501-1-o-takashi@sakamocchi.jp>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <ed5793ef-65d7-661d-cc93-9e6e584c49cb@perex.cz>
Date: Sun, 4 Apr 2021 10:29:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210404065929.52501-1-o-takashi@sakamocchi.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Dne 04. 04. 21 v 8:59 Takashi Sakamoto napsal(a):
> GCC warns that snd_ctl_led_get() uses stack frame over 1024 bytes.
> 
> control_led.c: In function ‘snd_ctl_led_get’:
> control_led.c:128:1: warning: the frame size of 1504 bytes is larger than 1024 bytes [-Wframe-larger-than=]
> 
> When taking care of convension in Linux kernel development. it's preferable
> to suppress too large usage of kernel stack, when the function call is not
> in critical part.
> 
> This commit fixes the bug, including some minor code refactoring relevant
> to variable names.
> 
> Fixes: 22d8de62f11b ("ALSA: control - add generic LED trigger module as the new control layer")
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  sound/core/control_led.c | 68 ++++++++++++++++++++++++++--------------
>  1 file changed, 44 insertions(+), 24 deletions(-)
> 
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index b97f118cd54e..1be854a861f0 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -94,34 +94,35 @@ static struct snd_ctl_led *snd_ctl_led_get_by_access(unsigned int access)
>  	return &snd_ctl_leds[group];
>  }
>  
> -static int snd_ctl_led_get(struct snd_ctl_led_ctl *lctl)
> +static int snd_ctl_led_get(struct snd_ctl_led_ctl *lctl, struct snd_ctl_elem_info *elem_info,
> +			   struct snd_ctl_elem_value *elem_value)

I think info, value should be enough as names for the arguments here. It
increases readability.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
