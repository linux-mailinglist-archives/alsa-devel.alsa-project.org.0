Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB23B760AFB
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 08:53:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62BC6EAA;
	Tue, 25 Jul 2023 08:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62BC6EAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690268023;
	bh=T0rDMFo2ptVyZQ9LwgDcM+RAKSS0VsIyT1RZF8Cl9ZI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s0dsftvqEwNeV+08T+CWHE6zSE/17hKpy1J4Lc0i0Lyzjx0oKUsGaWmuJQTFX4bE5
	 PBZhP2MZJx+6HrozS+FH3kHz4oNEYftr0/t0zaDYnpa/rl1Q3IwxHJmrSTXHu5CsGw
	 v6O0yktHhPz8+MVtVi7HOfy2w1nPgZVy612f+LBs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C4DFF800C7; Tue, 25 Jul 2023 08:52:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0B64F80163;
	Tue, 25 Jul 2023 08:52:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F17DF8019B; Tue, 25 Jul 2023 08:52:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EC7AF800C7
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 08:52:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EC7AF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=V09BnU+C;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=FJWgbs5S
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 693D2222E4;
	Tue, 25 Jul 2023 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690267944;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3fiz/GAQEWx3SIzY3E0OUJjDkJoVl0+B7hUfn4FB+Zw=;
	b=V09BnU+Cne9bAAtVAihoPWSlYxSS0Qa4K1SHj6xqG9YCgj5D1OyGwCYEvWUtlCCWli2425
	s1YQn0m00jl0LjdFsbM8BhoogRk+0MmMFGSpKajQLMgigB7tK96G8u1W7a7yHUhe6TvMTK
	BH4C/SaEohe3A4R5RrL+UHySiDzebTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690267944;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3fiz/GAQEWx3SIzY3E0OUJjDkJoVl0+B7hUfn4FB+Zw=;
	b=FJWgbs5SW0SqnSEQOd9fKiFBInVAXNWtpBCwl53tegK72WdXL/hrSRCv7hM2ssYAm/XoHX
	jVRE5q0ssiXllQAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFCAB13487;
	Tue, 25 Jul 2023 06:52:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id urXBMSdxv2QNBAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 25 Jul 2023 06:52:23 +0000
Date: Tue, 25 Jul 2023 08:52:23 +0200
Message-ID: <87fs5cv5y0.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>,
	agross@kernel.org,
	andersson@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	mathias.nyman@intel.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	Thinh.Nguyen@synopsys.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	quic_jackp@quicinc.com,
	pierre-louis.bossart@linux.intel.com,
	oneukum@suse.com,
	albertccwang@google.com,
	o-takashi@sakamocchi.jp
Subject: Re: [PATCH v4 12/32] sound: usb: Export USB SND APIs for modules
In-Reply-To: <2023072542-playtime-charger-dcfc@gregkh>
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
	<20230725023416.11205-13-quic_wcheng@quicinc.com>
	<2023072542-playtime-charger-dcfc@gregkh>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 7UPZRPVKKPUPIHKMNTPWH7N5TGW4XVYH
X-Message-ID-Hash: 7UPZRPVKKPUPIHKMNTPWH7N5TGW4XVYH
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7UPZRPVKKPUPIHKMNTPWH7N5TGW4XVYH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 25 Jul 2023 07:33:57 +0200,
Greg KH wrote:
> 
> On Mon, Jul 24, 2023 at 07:33:56PM -0700, Wesley Cheng wrote:
> > --- a/sound/usb/pcm.c
> > +++ b/sound/usb/pcm.c
> > @@ -87,7 +87,7 @@ static snd_pcm_uframes_t snd_usb_pcm_pointer(struct snd_pcm_substream *substream
> >  /*
> >   * find a matching audio format
> >   */
> > -static const struct audioformat *
> > +const struct audioformat *
> >  find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
> >  	    unsigned int rate, unsigned int channels, bool strict_match,
> >  	    struct snd_usb_substream *subs)
> > @@ -147,8 +147,9 @@ find_format(struct list_head *fmt_list_head, snd_pcm_format_t format,
> >  	}
> >  	return found;
> >  }
> > +EXPORT_SYMBOL_GPL(find_format);
> 
> This is a horrible symbol name for a global function, same for the other
> ones in this file.  If you really want to export them, please put them
> in the proper "snd_" prefix namespace, or better yet, use a module
> namespace as well to ensure that we know who is using them.

Yes, please add snd_usb_ prefix for all exported symbols from
USB-audio driver code.

Also, make sure that EXPORT_SYMBOL_GPL() is used for those, too.


thanks,

Takashi
