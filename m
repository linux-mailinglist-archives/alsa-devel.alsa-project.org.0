Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF80893A6B
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 12:53:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F04EB21B6;
	Mon,  1 Apr 2024 12:53:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F04EB21B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711968791;
	bh=u3XaJkclcTx5aDl1NNh3YWbJr5Q13LsVBOoR1aNlfVE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BiF2jvOJ9bahAR275DA5wxBEJk2H0Uvg6wqAvBUSd0I4+vUwdxBO3qZZKt165Kj9M
	 EX0E2Ykti9bvb/eXtt/7qSJUS7plNXhvRYu8RgG0IkBAqs+QQr6CCH14/w+5JmLHc9
	 39Q5ZuuPg0byYP+n2N3dKBqDCPi3NNU/Gr8fj4Ro=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D172F805AD; Mon,  1 Apr 2024 12:52:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AEA5F80587;
	Mon,  1 Apr 2024 12:52:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFC9CF80236; Mon,  1 Apr 2024 12:52:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4EB64F8016E
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 12:52:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EB64F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MU3rqLDV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=X9FHJKH7
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 83C7733935;
	Mon,  1 Apr 2024 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1711968745;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RSdskMO+se5WHDoFnKtwHnPO338M8VeqY612MQlI89M=;
	b=MU3rqLDVwOglNcj41oBVr9KaGIfEKZ7HAAZvaRQWYPwx6ubfHQF4Z9C4B0G3W0RlQz8ncm
	uidoVQEQuvds3+2moeYxfvmSp7jIkLpxM71LzXmVOMTnGGA+0KF4UzObdSdajPfhtWNt9j
	jO3v7GtWNhq5oH4gq7UiNFThr4d4B6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1711968745;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RSdskMO+se5WHDoFnKtwHnPO338M8VeqY612MQlI89M=;
	b=X9FHJKH7HgNyQ8/7hsBZ72tPBCkltn9Hk387tdOErwSZ3+NmOGIskD0SkT/fTdmnPIFQJ9
	3IqdmFZVKfL1S0Dw==
Authentication-Results: smtp-out1.suse.de;
	dkim=none
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 5D28C1348C;
	Mon,  1 Apr 2024 10:52:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id Sf1cFemRCmbsfwAAn2gu4w
	(envelope-from <tiwai@suse.de>); Mon, 01 Apr 2024 10:52:25 +0000
Date: Mon, 01 Apr 2024 12:52:29 +0200
Message-ID: <87plv95p8y.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
Cc: alsa-devel@alsa-project.org,
	Jaroslav Kysela <perex@perex.cz>,
	Manuel Lauss <mano@roarinelk.homelinux.net>
Subject: Re: [PATCH] ALSA: soc/au1x: declare that FIFO is reported in frames
In-Reply-To: <20240401101339.506639-1-oswald.buddenhagen@gmx.de>
References: <20240401101339.506639-1-oswald.buddenhagen@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.89 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 NEURAL_HAM_SHORT(-0.20)[-0.999];
	 FREEMAIL_TO(0.00)[gmx.de];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.00)[43.11%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 FREEMAIL_ENVRCPT(0.00)[gmx.de];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 83C7733935
Message-ID-Hash: PL4ZHPWO7RAFKSGP2CVNCMQDVMMJ7Z4W
X-Message-ID-Hash: PL4ZHPWO7RAFKSGP2CVNCMQDVMMJ7Z4W
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PL4ZHPWO7RAFKSGP2CVNCMQDVMMJ7Z4W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Apr 2024 12:13:39 +0200,
Oswald Buddenhagen wrote:
> 
> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
> ---
> 
> Is this right? The comment on the field says "fifo entries of AC97/I2S
> PSC", which suggests frames, but that may mean whatever.
> 
> Cc: Manuel Lauss <mano@roarinelk.homelinux.net>

Use a right subject prefix (ASoC in this case) and put the
corresponding maintainers to Cc.


thanks,

Takashi

> ---
>  sound/soc/au1x/dbdma2.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
> index ea01d6490cec..2c8c01a5fb8f 100644
> --- a/sound/soc/au1x/dbdma2.c
> +++ b/sound/soc/au1x/dbdma2.c
> @@ -66,7 +66,8 @@ struct au1xpsc_audio_dmadata {
>  /* PCM hardware DMA capabilities - platform specific */
>  static const struct snd_pcm_hardware au1xpsc_pcm_hardware = {
>  	.info		  = SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_MMAP_VALID |
> -			    SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_BATCH,
> +			    SNDRV_PCM_INFO_INTERLEAVED | SNDRV_PCM_INFO_BATCH |
> +			    SNDRV_PCM_INFO_FIFO_IN_FRAMES,
>  	.period_bytes_min = AU1XPSC_PERIOD_MIN_BYTES,
>  	.period_bytes_max = 4096 * 1024 - 1,
>  	.periods_min	  = 2,
> --
> 2.42.0.419.g70bf8a5751
> 
