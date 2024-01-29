Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10359840A7B
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 16:49:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62EDE850;
	Mon, 29 Jan 2024 16:49:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62EDE850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706543360;
	bh=ZBeINZczaGWk7YpO/vUWjA9wH+oqPxsQELbhYWq5XlU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mX7O3sO1Ksf0dIMp85sd8zWJvprsSsbl25i3oJiaHL2TmsdOKxDuj6loP5k1IOxWf
	 XSk7jWY0QB7DeRK/TXdlJxt1LXbdVWgPkiQIzRwqDVvLSYuKk4W8u5a7eBIQkh7+VL
	 ySmQoUzfq8yB8L7/Z1dvfKipJgwapEj9Apvv8u0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70D5AF805AE; Mon, 29 Jan 2024 16:48:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCFCDF80589;
	Mon, 29 Jan 2024 16:48:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51F80F80563; Mon, 29 Jan 2024 16:48:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA2B1F800FB
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 16:48:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA2B1F800FB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=I8Ev72vM;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=sCJocLu7;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=laAwEwRW;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=fkzYpioS
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 93B971F7F5;
	Mon, 29 Jan 2024 15:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706543315;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r2piSA/L0xGXRF3p4mL65FwT4JjlOO72QInXPEV3YXQ=;
	b=I8Ev72vMkM8hIH9ZjNz2F80DC4ZMniWAlkeJoKjr4LsZno6WkcYa3NFFWqpPRs9Qq4rfM+
	5sXtzyzJtFRxB8mZz8gDqlwFGTGtMXmxct6WOmLvkhNpjBI6qSoR6rVTocgVN1rEcEUidM
	S/KucNMWh2T4YIShJwUqujeheoOViqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706543315;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r2piSA/L0xGXRF3p4mL65FwT4JjlOO72QInXPEV3YXQ=;
	b=sCJocLu7ISblTsBFJnxXB9w53nNKIlfbiZFAAVbbj0KmuyJsltxQNY1H8868pApwqM+q/r
	ScGTl5htHFtVNaDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1706543313;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r2piSA/L0xGXRF3p4mL65FwT4JjlOO72QInXPEV3YXQ=;
	b=laAwEwRWIy+EYFplD+Vp13TzOVSK5YMjYCbRrnktKY+Iux3bP7Mwd6GwmtIaXQAM4UmO1M
	EYF/u1kUuqLp7e8yH64m6tokblg28kdE7r0juuqwQhXw6vlsYhc9xE5qwgLCUA4URN/wIh
	fDpuEJaYHLqIe8331YIiX61kmqKLjQo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1706543313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r2piSA/L0xGXRF3p4mL65FwT4JjlOO72QInXPEV3YXQ=;
	b=fkzYpioSMebr2PMwwGe84OUFkyLB6I49j3UV8hhkDuSLiQkllD/B/pJHmeMHDsjl1PP46D
	xPX1tX5PwteKbhBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 751CB13647;
	Mon, 29 Jan 2024 15:48:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id q2BoG9HIt2UCSgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 29 Jan 2024 15:48:33 +0000
Date: Mon, 29 Jan 2024 16:48:33 +0100
Message-ID: <87jzns5eem.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alexander Tsoy <alexander@tsoy.me>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Check presence of valid altsetting
 control
In-Reply-To: <20240129121254.3454481-1-alexander@tsoy.me>
References: <20240129121254.3454481-1-alexander@tsoy.me>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=laAwEwRW;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fkzYpioS
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,tsoy.me:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Rspamd-Queue-Id: 93B971F7F5
Message-ID-Hash: PLQN2V5KRONDFCOUVSKM3PFTVDVU4C3G
X-Message-ID-Hash: PLQN2V5KRONDFCOUVSKM3PFTVDVU4C3G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PLQN2V5KRONDFCOUVSKM3PFTVDVU4C3G/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 29 Jan 2024 13:12:54 +0100,
Alexander Tsoy wrote:
> 
> Many devices with a single alternate setting do not have a Valid
> Alternate Setting Control and validation performed by
> validate_sample_rate_table_v2v3() doesn't work on them and is not
> really needed. So check the presense of control before sending
> altsetting validation requests.
> 
> MOTU Microbook IIc is suffering the most without this check. It
> takes up to 40 seconds to bootup due to how slow it switches
> sampling rates:
> 
> [ 2659.164824] usb 3-2: New USB device found, idVendor=07fd, idProduct=0004, bcdDevice= 0.60
> [ 2659.164827] usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [ 2659.164829] usb 3-2: Product: MicroBook IIc
> [ 2659.164830] usb 3-2: Manufacturer: MOTU
> [ 2659.166204] usb 3-2: Found last interface = 3
> [ 2679.322298] usb 3-2: No valid sample rate available for 1:1, assuming a firmware bug
> [ 2679.322306] usb 3-2: 1:1: add audio endpoint 0x3
> [ 2679.322321] usb 3-2: Creating new data endpoint #3
> [ 2679.322552] usb 3-2: 1:1 Set sample rate 96000, clock 1
> [ 2684.362250] usb 3-2: 2:1: cannot get freq (v2/v3): err -110
> [ 2694.444700] usb 3-2: No valid sample rate available for 2:1, assuming a firmware bug
> [ 2694.444707] usb 3-2: 2:1: add audio endpoint 0x84
> [ 2694.444721] usb 3-2: Creating new data endpoint #84
> [ 2699.482103] usb 3-2: 2:1 Set sample rate 96000, clock 1
> 
> Signed-off-by: Alexander Tsoy <alexander@tsoy.me>

Thanks, applied now.

But at the next time, please put maintainers to Cc, so that it can be
caught better.


Takashi
