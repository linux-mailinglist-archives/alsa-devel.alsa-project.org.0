Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F033E82748B
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jan 2024 16:56:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30CDE826;
	Mon,  8 Jan 2024 16:56:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30CDE826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704729403;
	bh=rQ2H0o8DKlz6IxN0XBgak7Ugha/X2lcaxPUNPOmoVWc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L8g3pZHWyZdtMdUpyTkYSdwts8scyNyXielDWMSanm/+1OHKePPii1CTtwQW8RzCM
	 txRDKTNeo9gtBKQBPIx/K2NMsoPguOcKCjNgKdgNDOCVXs5rMV8D8Zv38xHRrRmfON
	 SksTWTRBxsTMXlFjGHFTklA52ICK5UFi4JzVr8Tc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85218F8059F; Mon,  8 Jan 2024 16:56:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66B8AF80548;
	Mon,  8 Jan 2024 16:56:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A638BF80254; Mon,  8 Jan 2024 16:56:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AA42F8003A
	for <alsa-devel@alsa-project.org>; Mon,  8 Jan 2024 16:55:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AA42F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZJQVvH7W;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=eDZe2EO2;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=HjGvnfss;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=c24dex0e
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 463E021D25;
	Mon,  8 Jan 2024 15:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704729353;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=otoEBLYRoxPbrNf5ndZA3E2Sne8+a1o3mng2AXb1V7w=;
	b=ZJQVvH7W1X95OoXG34l0tc5Fhg14eC4KVJdQLFdIjJ9v33jVVQNZgzF0rQZpW1V8QAbzMs
	YnsWbaZXng7ZYUBBafRRda6qrsHu9/sPczMyAJHgB8wU4O46Fzl4oE+mCeTK6/Dfgwav2D
	F2JCQ/Kkdayqn3+bDWOY5GGFSIcboDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704729353;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=otoEBLYRoxPbrNf5ndZA3E2Sne8+a1o3mng2AXb1V7w=;
	b=eDZe2EO2dcsWupH4p3VXx+OrYyL4ncrgZaihev/KxUJdpJxBjP3+WE16VGPbV7LVKul+Jy
	ZJht15S3FlrdqeDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704729352;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=otoEBLYRoxPbrNf5ndZA3E2Sne8+a1o3mng2AXb1V7w=;
	b=HjGvnfss//wX/DWEtqZmc2EEStma2Hd35QyN2Xn6t4smYxm3V8GQmAv5rRYKGo02F2ldU0
	ke+qjD6x0Gs/kHzih2iAai5o+xxL+9IF0M1gsjpr7geFIltE8vzmDnGMCfNImdzKad4Ef4
	jMJtbTm0WTdfWddt5gxEsA8xf6Lc4mc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704729352;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=otoEBLYRoxPbrNf5ndZA3E2Sne8+a1o3mng2AXb1V7w=;
	b=c24dex0eU03cKRrUE0Tim4SIoN0ebcpbs7E0pccvi9yxT9P6ZXKugMfEdpAwS7tHYSu6S+
	d1zNGKDS2wezIeBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0E45513686;
	Mon,  8 Jan 2024 15:55:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id fv+5AQgbnGVUawAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 08 Jan 2024 15:55:52 +0000
Date: Mon, 08 Jan 2024 16:55:51 +0100
Message-ID: <87sf37sttk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Tom Jason Schwanke <tom@catboys.cloud>
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP Envy
 X360 13-ay0xxx
In-Reply-To: <651b26e9-e86b-45dd-aa90-3e43d6b99823@catboys.cloud>
References: <651b26e9-e86b-45dd-aa90-3e43d6b99823@catboys.cloud>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 463E021D25
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=HjGvnfss;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=c24dex0e
X-Spamd-Result: default: False [-1.41 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.90)[86.01%]
Message-ID-Hash: BJE2FKJN72PWFTQ2I57YF2C245JUVFTT
X-Message-ID-Hash: BJE2FKJN72PWFTQ2I57YF2C245JUVFTT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJE2FKJN72PWFTQ2I57YF2C245JUVFTT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 Jan 2024 16:15:21 +0100,
Tom Jason Schwanke wrote:
> 
> This enables the mute and mic-mute LEDs on the HP Envy X360 13-ay0xxx convertibles.
> The quirk 'ALC245_FIXUP_HP_X360_MUTE_LEDS' already exists and is now enabled for this device.
> Fixes https://bugzilla.kernel.org/show_bug.cgi?id=216197
> 
> Signed-off-by: Tom Jason Schwanke <tom@catboys.cloud>

The patch was somewhat based on the old kernel (and had a typical mail
tab/space problem), so I adjusted and applied manually.


thanks,

Takashi
