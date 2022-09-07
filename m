Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4035B007F
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 11:30:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B58715C2;
	Wed,  7 Sep 2022 11:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B58715C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662543013;
	bh=8m5vdg6DxPXlzmT87wXwI4A2du4uSsmQZUWTo3/dU2s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=McYeT//y07VgB92JseKXMZzD7Luk/WzgNVejtizQXYub6H3IopUPWBDCzgcXZk1CY
	 WDFdx95KFkePWwkn1fO0fxxw7H2hhsZe5ow8ccXgJcVqJ7zTctOKCl2TuB3qhvwk77
	 nGcuWcQtyNdnG+n06qi8OHPxUVr3vX8F8Xo4u9sk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FE8AF80423;
	Wed,  7 Sep 2022 11:29:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A77AFF8028D; Wed,  7 Sep 2022 11:29:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78EE3F8011C
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 11:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78EE3F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ZogZr9A8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F175DB81BEB;
 Wed,  7 Sep 2022 09:29:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2D9DC433C1;
 Wed,  7 Sep 2022 09:28:58 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ZogZr9A8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1662542937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uvCPcOxnUC4wGn1S/Nv7nd9/+PzZUA4XVj1lOT3gFj8=;
 b=ZogZr9A8RtJMjPkzMWOPgXLUIuyAp4smpWeF8UG8T7y3j5NvXCzINOJFhYJuekur2aQ1IV
 Yd2LUGDH40IXxwcgs4ooIw1jgOi+UjSbltY+FwG8OJdhqIGB0CTs4MtoPOdxjXJlEFiAMv
 Zzjbs78gDkMqWX7Ma8bS77RmYVILMN0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7e084ecb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 7 Sep 2022 09:28:57 +0000 (UTC)
Date: Wed, 7 Sep 2022 11:28:54 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] ALSA: usb-audio: Don't refcount multiple accesses on the
 single clock
Message-ID: <YxhkVmiMlKghq+nY@zx2c4.com>
References: <20220905101403.1435037-1-Jason@zx2c4.com>
 <87sfl6jbb3.wl-tiwai@suse.de>
 <CAHmME9oUtVgwtUY5afG5Yed1j6OVKwvLH=keCp63gDSOQRgDSA@mail.gmail.com>
 <87czc7ehqp.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87czc7ehqp.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Wim Taymans <wtaymans@redhat.com>,
 =?utf-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <89q1r14hd@relay.firefox.com>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>
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

On Wed, Sep 07, 2022 at 10:00:46AM +0200, Takashi Iwai wrote:
> On Mon, 05 Sep 2022 14:16:39 +0200,
> Jason A. Donenfeld wrote:
> > 
> > On Mon, Sep 5, 2022 at 1:44 PM Takashi Iwai <tiwai@suse.de> wrote:
> > > When you load snd-usb-audio with dyndbg=+p option, does it show the
> > > new error message "Mismatched sample rate xxx"?
> > 
> > No.
> 
> What about the patch below?
> 
> 
> Takashi
> 
> -- 8< --
> --- a/sound/usb/endpoint.c
> +++ b/sound/usb/endpoint.c
> @@ -925,6 +925,8 @@ void snd_usb_endpoint_close(struct snd_usb_audio *chip,
>  		endpoint_set_interface(chip, ep, false);
>  
>  	if (!--ep->opened) {
> +		if (ep->clock_ref && !atomic_read(&ep->clock_ref->locked))
> +			ep->clock_ref->rate = 0;
>  		ep->iface = 0;
>  		ep->altsetting = 0;
>  		ep->cur_audiofmt = NULL;

I think this works.

Niklāvs - can you give it a try to and confirm?

Jason
