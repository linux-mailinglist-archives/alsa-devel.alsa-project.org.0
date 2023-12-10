Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D30880B9F2
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Dec 2023 10:12:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C26882B;
	Sun, 10 Dec 2023 10:12:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C26882B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702199566;
	bh=AmlaIGHsDg0x3+/vK428MWUC7shw6+q/3QgewRkh4rs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DASyAqFDRMgI7VaaBzPJtIOGSglZ3E+WujJMiKM2bWDFnPPDJahjNjjl3vQ9B74Rj
	 7HsF01aNq/cco88TwoUnjHpHj17YbNwBcTPIJKBLmSWfNfeE3TIax1EfqbW0dXHJ4Q
	 0etp0QJORRjfmEwbMHPDqSlPv1oOVZm7LApIvAGY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E036CF8055B; Sun, 10 Dec 2023 10:12:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EDFAF8055B;
	Sun, 10 Dec 2023 10:12:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D27F1F80494; Sun, 10 Dec 2023 10:12:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	TIME_LIMIT_EXCEEDED,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4293F8019B
	for <alsa-devel@alsa-project.org>; Sun, 10 Dec 2023 10:06:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4293F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EHaSAi6v;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lLZu/D9a;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=E+ch+QtL;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Ig9Ehg1k
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F1E7821CAD;
	Sun, 10 Dec 2023 09:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702199188;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=auUupgAjZ8IXUgoHrCzFJV3FieXQ2tOxGY/y2JKnUJM=;
	b=EHaSAi6vqN79BtcMYy2DsZehJiFc2Skr+Aul5ISOulZpfbc+Jm1hlTnP2f5IZn4kQJ8tmG
	DdRHskIhEDXrv2Y/dyqUvpz3Wrq1Epx/tRpxZaSw8MLFj61MvdAJMpUdLu9slUI6toKWSM
	6Am8OX+S8xL/kZ3Rwmi+BNISnBAiPhY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702199188;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=auUupgAjZ8IXUgoHrCzFJV3FieXQ2tOxGY/y2JKnUJM=;
	b=lLZu/D9ajZLkUd7nY1MZJmEKvo50YX0Iyk4pqhLqrjtldSdY2Qa/1kJRXrRlBjZEC9fURZ
	ON6lswGFNHqKESAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702199187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=auUupgAjZ8IXUgoHrCzFJV3FieXQ2tOxGY/y2JKnUJM=;
	b=E+ch+QtLS4RZ3jXqqSKJrESOnmXactI0IAmr1U8zN40eiZoZSTLIKa8RIkgd9aEMI1RNKU
	r+0qglLWvnoSWKZvF2F/9QhrsUEStNs/mq8YXB6chel13nvwkaQ9ScPhpJyKmLsK87HR37
	rF+49DUjHlu5WMdoi7HfjUuuzysGjEM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702199187;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=auUupgAjZ8IXUgoHrCzFJV3FieXQ2tOxGY/y2JKnUJM=;
	b=Ig9Ehg1k29XfvFVyMbPNAK6Lazk0rd4Z8KRututqyJavGub8Y3kcPVnCqshChyRb8jgEyo
	zPqtI0mDDr6BVXCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id ADF3A137D2;
	Sun, 10 Dec 2023 09:06:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k/4cKZN/dWUVVQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 10 Dec 2023 09:06:27 +0000
Date: Sun, 10 Dec 2023 10:06:27 +0100
Message-ID: <87fs0a5svg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] ALSA: hda/tas2781: leave hda_component in usable state
In-Reply-To: 
 <8b8ed2bd5f75fbb32e354a3226c2f966fa85b46b.1702156522.git.soyer@irl.hu>
References: 
 <8b8ed2bd5f75fbb32e354a3226c2f966fa85b46b.1702156522.git.soyer@irl.hu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-0.02 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-0.94)[-0.941];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_SPAM_SHORT(2.99)[0.998];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.98)[99.90%]
Message-ID-Hash: IQ7ASSZUM5M5FTDLQPQR26H5EF7OOVZD
X-Message-ID-Hash: IQ7ASSZUM5M5FTDLQPQR26H5EF7OOVZD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IQ7ASSZUM5M5FTDLQPQR26H5EF7OOVZD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 09 Dec 2023 22:18:29 +0100,
Gergo Koteles wrote:
> 
> Unloading then loading the module causes a NULL ponter dereference.
> 
> The hda_unbind zeroes the hda_component, later the hda_bind tries
> to dereference the codec field.
> 
> The hda_component is only initialized once by tas2781_generic_fixup.
> 
> Set only previously modified fields to NULL.
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000322
> Call Trace:
>  <TASK>
>  ? __die+0x23/0x70
>  ? page_fault_oops+0x171/0x4e0
>  ? exc_page_fault+0x7f/0x180
>  ? asm_exc_page_fault+0x26/0x30
>  ? tas2781_hda_bind+0x59/0x140 [snd_hda_scodec_tas2781_i2c]
>  component_bind_all+0xf3/0x240
>  try_to_bring_up_aggregate_device+0x1c3/0x270
>  __component_add+0xbc/0x1a0
>  tas2781_hda_i2c_probe+0x289/0x3a0 [snd_hda_scodec_tas2781_i2c]
>  i2c_device_probe+0x136/0x2e0
> 
> Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
> CC: stable@vger.kernel.org
> Signed-off-by: Gergo Koteles <soyer@irl.hu>

Thanks, applied now.


Takashi
