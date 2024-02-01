Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C6F84603B
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Feb 2024 19:45:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69AA884D;
	Thu,  1 Feb 2024 19:45:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69AA884D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706813154;
	bh=rRwr543xzRTauiBgH5eDvtoWsNmaZ4DHXqy/QvlK080=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o0/Cus9N86nikX0OTQ0jAa0M5wyTT93s7PqCsCajaKekXR47YGVElUGqXWGSmvB51
	 9Y2PWynVr3ppFhMpx/L5riS5VYuiRR2uJbChuiulxsurC48oLkxg/3urOXcORhKSTZ
	 XaQM1aFt07XZhUBsPktndqleY/JyZlJFKzZJCa68=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7A18F804E7; Thu,  1 Feb 2024 19:45:21 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 92EE9F80568;
	Thu,  1 Feb 2024 19:45:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4EBA0F8055C; Thu,  1 Feb 2024 19:45:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DA10F804E7
	for <alsa-devel@alsa-project.org>; Thu,  1 Feb 2024 19:45:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DA10F804E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nw1oLdkX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7OB3O9Ek;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=nw1oLdkX;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7OB3O9Ek
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A61BB1FB5C;
	Thu,  1 Feb 2024 18:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706813109;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wetY3IBWfLQJNKkPceExE6+JDl3CX3UE4J82soufgVI=;
	b=nw1oLdkX4lRBOdXzcsBl0CUdQhwltnkBae0t+4mWdN/6wl0gOfIZriHUw0hjuamN9yd36B
	paB2tPWc2K2Yi+9zNh7LnYNtASySL2Inmvbr58KiRgvWLGRo6iKdbDcIN2bBzp+4YuFiNy
	ZLCXz+FEzTqoTvwkFcMLzGEaFt2xHQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706813109;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wetY3IBWfLQJNKkPceExE6+JDl3CX3UE4J82soufgVI=;
	b=7OB3O9EkB/2TFCNF0wox8/fJx5gvt0GWGRQ4Cb49bLQHUhNsZa8C0GLsokMDQ88T5mBl/I
	srf728kJnOoq1hBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706813109;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wetY3IBWfLQJNKkPceExE6+JDl3CX3UE4J82soufgVI=;
	b=nw1oLdkX4lRBOdXzcsBl0CUdQhwltnkBae0t+4mWdN/6wl0gOfIZriHUw0hjuamN9yd36B
	paB2tPWc2K2Yi+9zNh7LnYNtASySL2Inmvbr58KiRgvWLGRo6iKdbDcIN2bBzp+4YuFiNy
	ZLCXz+FEzTqoTvwkFcMLzGEaFt2xHQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706813109;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wetY3IBWfLQJNKkPceExE6+JDl3CX3UE4J82soufgVI=;
	b=7OB3O9EkB/2TFCNF0wox8/fJx5gvt0GWGRQ4Cb49bLQHUhNsZa8C0GLsokMDQ88T5mBl/I
	srf728kJnOoq1hBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7BD0F139AB;
	Thu,  1 Feb 2024 18:45:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QfeyHLXmu2VzNwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 01 Feb 2024 18:45:09 +0000
Date: Thu, 01 Feb 2024 19:45:09 +0100
Message-ID: <87o7d02fd6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: [GIT PULL] ASoC fixes for v6.8-rc2-2
In-Reply-To: <1c3b919e-f1ae-48d5-83d3-0a091a3fe9f1@sirena.org.uk>
References: <20240201183548.66010C433C7@smtp.kernel.org>
	<1c3b919e-f1ae-48d5-83d3-0a091a3fe9f1@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spamd-Result: default: False [-0.40 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_DN_SOME(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[gmail.com,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-1.30)[90.08%]
Message-ID-Hash: G34EPDBZ77E5YQBEVT6ZPUJ3GGWKYKYZ
X-Message-ID-Hash: G34EPDBZ77E5YQBEVT6ZPUJ3GGWKYKYZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G34EPDBZ77E5YQBEVT6ZPUJ3GGWKYKYZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 01 Feb 2024 19:38:04 +0100,
Mark Brown wrote:
> 
> On Thu, Feb 01, 2024 at 06:35:41PM +0000, Mark Brown wrote:
> 
> > Johan Hovold (5):
> >       ASoC: codecs: wsa883x: fix PA volume control
> >       ASoC: codecs: lpass-wsa-macro: fix compander volume hack
> >       ASoC: codecs: wcd9335: drop unused gain hack remnant
> >       ASoC: codecs: wcd938x: fix headphones volume controls
> >       ASoC: qcom: sc8280xp: limit speaker volumes
> 
> I should also mention that the Qualcomm people were very keen to get
> these earlier fixes merged into mainline promptly as they have some
> impact on recently merged and released updates to the UCM files, mainly
> the fix for headphone volume controls AIUI.

I'm going to send a PR tomorrow, so all should be included in
6.8-rc3.

Now merged the v2, too.


thanks,

Takashi

