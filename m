Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA92B78C6C4
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Aug 2023 16:03:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C84A01E3;
	Tue, 29 Aug 2023 16:02:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C84A01E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693317814;
	bh=xSDlCMC8ZDwk7VnoEWKhkvMJ12cGm/xsxUcHX+90ztA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=swN5MKKtJeTQ8GQuXwRR+NJ/2I355dPnzuhZMmWbHKvHY7RaISKcnU1K6mMb+5FD1
	 y2pw7kxcuQhbfjZR+UmmvDiH2n4BK/R2x7yAI7p9lfWzzWkwWVN4KgZjiIC1UQdCP/
	 fTWxXnMTGF0AAR412aYM+YJj5gxZUI0wap3yAPfc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BB52F8023B; Tue, 29 Aug 2023 16:02:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25319F80155;
	Tue, 29 Aug 2023 16:02:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9707F80158; Tue, 29 Aug 2023 16:02:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 526ADF800D1
	for <alsa-devel@alsa-project.org>; Tue, 29 Aug 2023 16:02:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 526ADF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wnrKST8X;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tgCqGLmR
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B8DAD1F45B;
	Tue, 29 Aug 2023 14:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693317758;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HuJwsEjFs3aON1DYkqyWRhvakhtypYRrXkSad5cu0Ho=;
	b=wnrKST8XzNQfau6PiaYP7/a/I4E4NoYHecflZlPdv45CL6o7T5FDEPOKbpS5wbqgldqurz
	U3boTQgG7oMHSoWNnEkSS+08P7J9ne7bAqPzuOQ2oD2y4lxvX5IyGzBLM4BxC1haU4lZIm
	HZs6NDNYlus5DFd1os8tVxGUd6lt1Lw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693317758;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HuJwsEjFs3aON1DYkqyWRhvakhtypYRrXkSad5cu0Ho=;
	b=tgCqGLmRL8fGVlha75IM7tlVI8GvC3NKfH+dVv8PFUeLplIrPmbeQTFbUf+ommOKsVJBRx
	oWbzxFx4mgEOO3Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 967AE138E2;
	Tue, 29 Aug 2023 14:02:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kQPiI3767WTLcAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 29 Aug 2023 14:02:38 +0000
Date: Tue, 29 Aug 2023 16:02:38 +0200
Message-ID: <87ttsit08x.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 1/1] ALSA: control: Use list_for_each_entry_safe()
In-Reply-To: <20230829135252.3915124-1-andriy.shevchenko@linux.intel.com>
References: <20230829135252.3915124-1-andriy.shevchenko@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 4ZPAV66EVRSVIC2CQYHKZWKIGLPSHKAC
X-Message-ID-Hash: 4ZPAV66EVRSVIC2CQYHKZWKIGLPSHKAC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ZPAV66EVRSVIC2CQYHKZWKIGLPSHKAC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 29 Aug 2023 15:52:52 +0200,
Andy Shevchenko wrote:
> 
> Instead of reiterating the list, use list_for_each_entry_safe()
> that allows to continue without starting over.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Through a quick glance, it should be OK, but I need to read and
understand whether this change is perfectly safe or not -- unless
Jaroslav gives his review and ack.

> ---
> 
> Takashi, if you have anybody or want yourself to spend some time,
> I believe you can simplify a lot the parser in this file with
> the help of lib/cmdline.c APIs.

Thanks for the hint.  Yeah, it looks feasible, but too late for 6.6,
it's a nice TODO ;)


Takashi

> 
>  sound/core/control_led.c | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index a78eb48927c7..afc9ffc388e3 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -297,16 +297,13 @@ static void snd_ctl_led_clean(struct snd_card *card)
>  {
>  	unsigned int group;
>  	struct snd_ctl_led *led;
> -	struct snd_ctl_led_ctl *lctl;
> +	struct snd_ctl_led_ctl *lctl, _lctl;
>  
>  	for (group = 0; group < MAX_LED; group++) {
>  		led = &snd_ctl_leds[group];
> -repeat:
> -		list_for_each_entry(lctl, &led->controls, list)
> -			if (!card || lctl->card == card) {
> +		list_for_each_entry_safe(lctl, _lctl, &led->controls, list)
> +			if (!card || lctl->card == card)
>  				snd_ctl_led_ctl_destroy(lctl);
> -				goto repeat;
> -			}
>  	}
>  }
>  
> @@ -314,7 +311,7 @@ static int snd_ctl_led_reset(int card_number, unsigned int group)
>  {
>  	struct snd_card *card;
>  	struct snd_ctl_led *led;
> -	struct snd_ctl_led_ctl *lctl;
> +	struct snd_ctl_led_ctl *lctl, _lctl;
>  	struct snd_kcontrol_volatile *vd;
>  	bool change = false;
>  
> @@ -329,14 +326,12 @@ static int snd_ctl_led_reset(int card_number, unsigned int group)
>  		return -ENXIO;
>  	}
>  	led = &snd_ctl_leds[group];
> -repeat:
> -	list_for_each_entry(lctl, &led->controls, list)
> +	list_for_each_entry(lctl, _lctl, &led->controls, list)
>  		if (lctl->card == card) {
>  			vd = &lctl->kctl->vd[lctl->index_offset];
>  			vd->access &= ~group_to_access(group);
>  			snd_ctl_led_ctl_destroy(lctl);
>  			change = true;
> -			goto repeat;
>  		}
>  	mutex_unlock(&snd_ctl_led_mutex);
>  	if (change)
> -- 
> 2.40.0.1.gaa8946217a0b
> 
