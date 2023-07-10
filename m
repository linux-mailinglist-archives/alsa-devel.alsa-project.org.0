Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D71FA74D983
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 17:06:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65FEF201;
	Mon, 10 Jul 2023 17:05:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65FEF201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689001570;
	bh=fDkcDvEbyHYSVId/Bc8Y8N4LnZWI0qxac2qR6iigFZc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j1wKWCVFm48KQdvYZ3aTtyf6olDx2aUdT/79u5OA6CE+NAdeqweJi2SdRQP0yvtZF
	 F7ikJ5hzfa2K09MBidowVPt+ZUCfcb/PoBMviNmyUqyNe1M86RgtQ49nMqd8iiioQF
	 jG5ED2sOwaFT1vvd2LwEo3UoUB5jNvuIW7kJGO08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 264A9F800E4; Mon, 10 Jul 2023 17:05:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81FB2F80153;
	Mon, 10 Jul 2023 17:05:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30027F80249; Mon, 10 Jul 2023 17:05:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60242F800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 17:05:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60242F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=QV09bppg;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=J0WpB4G8
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BBB2F1FE71;
	Mon, 10 Jul 2023 15:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689001506;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cGUMX372PUaKq7acnFzkbYZZUwzapc2DQBNFDawUgGs=;
	b=QV09bppgGqnXl5RtI4LdzPpid7MAWTSIkpp4cW25R+75SqzCwzvMTJDDSihpn/F5EGxORB
	7o2YuFxjDcFQLc33K3wmRoRFFtf5p35zS1AW6rRhpcdK3Y49GL/CoYqbRnYPxldubL9+tB
	zj0MGIyuEtZhsejfd8q2N9BO3ZQv5DE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689001506;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cGUMX372PUaKq7acnFzkbYZZUwzapc2DQBNFDawUgGs=;
	b=J0WpB4G8YPz9x7We/kY4N3z0xbtc+jYrbE+MxgAYoYj6026K+cpzl9kofStKGn47/ysTJk
	uKlsOx4fW48+WmAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 95C7E13A05;
	Mon, 10 Jul 2023 15:05:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8DVkIyIerGTZVgAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 10 Jul 2023 15:05:06 +0000
Date: Mon, 10 Jul 2023 17:05:06 +0200
Message-ID: <87ttubyfh9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 2/2] ALSA: emu10k1: track loss of external clock on E-MU
 cards
In-Reply-To: <20230710065956.1246364-2-oswald.buddenhagen@gmx.de>
References: <20230710065956.1246364-1-oswald.buddenhagen@gmx.de>
	<20230710065956.1246364-2-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: 76FRAVC6FYGMUUHJZGU2LZRBLMMWN53M
X-Message-ID-Hash: 76FRAVC6FYGMUUHJZGU2LZRBLMMWN53M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76FRAVC6FYGMUUHJZGU2LZRBLMMWN53M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 10 Jul 2023 08:59:56 +0200,
Oswald Buddenhagen wrote:
> 
> +static void emu1010_clock_work(struct work_struct *work)
> +{
> +	struct snd_emu10k1 *emu;
> +	struct snd_ctl_elem_id id;
> +
> +	emu = container_of(work, struct snd_emu10k1,
> +			   emu1010.clock_work);
> +	if (emu->card->shutdown)
> +		return;
> +#ifdef CONFIG_PM_SLEEP
> +	if (emu->suspend)
> +		return;
> +#endif
> +
> +	// We consider this a mixer setting, so use the mixer's lock
> +	down_write(&emu->card->controls_rwsem);

I really don't want to see the driver touching this lock.  It's
basically an internal stuff of ALSA core code.  And, as already
discussed, the controls_rwsem wasn't intended as a lock for the mixer
content protection originally.  It took over the role partially, but
the drivers shouldn't rely on it.

> +	snd_emu1010_update_clock(emu);
> +	downgrade_write(&emu->card->controls_rwsem);
> +	snd_ctl_build_ioff(&id, emu->ctl_clock_source, 0);
> +	snd_ctl_notify(emu->card, SNDRV_CTL_EVENT_MASK_VALUE, &id);
> +	up_read(&emu->card->controls_rwsem);

Err, too ugly and unnecessary change.  snd_ctl_notify() doesn't take
the rwsem, and it can be called at any place without fiddling the
rwsem.  It's snd_ctl_notify_one() that needs the downgrade to read
(and maybe we should rename the function to be clearer).


thanks,

Takashi
