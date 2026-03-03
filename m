Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMLFEcqspmn9SgAAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Tue, 03 Mar 2026 10:41:30 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FA51EC046
	for <lists+alsa-devel@lfdr.de>; Tue, 03 Mar 2026 10:41:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 203196021F;
	Tue,  3 Mar 2026 10:41:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 203196021F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772530886;
	bh=86YnKJkvgls7S7NRvOIKlMNfbeiejYiof+gCr0J4oCQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ongSuEebyN70R8XlJUY2wEqDx94hFjmvznxXqZVv/HuAEwOxBHC/mfUvwksomYxed
	 lxqFBGhumZ5VzbuxXNgvCh1rySag0nw/hN0ev7asXZOssictr0X45emJGvnTw2cNi4
	 Ro0Jlbb54XQ/hm1JqIdoXqTnQT6JrYkP22O+auc0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98CA9F805ED; Tue,  3 Mar 2026 10:40:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51EBEF805BE;
	Tue,  3 Mar 2026 10:40:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72AADF80496; Tue,  3 Mar 2026 10:38:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FE9CF800F3
	for <alsa-devel@alsa-project.org>; Tue,  3 Mar 2026 10:38:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FE9CF800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BmqJTbjC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lB/j4g6E;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=BmqJTbjC;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lB/j4g6E
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 3C1815BCFE;
	Tue,  3 Mar 2026 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1772530703;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4BuEUpCMWOOLFe/pAIjAxPQhDm2qNUbB66oqFTXXYc=;
	b=BmqJTbjC1nbbjHvU4iN98YL1d72iXzSgDvgBV3Mr49CHfVCrqaTx7XeIRINjwIWZClt5RG
	uTJhe+K6suEUNSSSWezKKovBDjSdkunvNDU79l2NppmmGKc1aaIbYxU2+YvVaXXGjmFekk
	HhlZr50bxOUCM54k4kRWxMlAQ3dp7Qs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772530703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4BuEUpCMWOOLFe/pAIjAxPQhDm2qNUbB66oqFTXXYc=;
	b=lB/j4g6E9N7fdc2dHIll1ifClK2xloSpDLGRyg8Fp+bjG2gBi7EILl0XbPW0wmlmA//Ue1
	5unJGXgsCs/dkxCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BmqJTbjC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="lB/j4g6E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1772530703;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4BuEUpCMWOOLFe/pAIjAxPQhDm2qNUbB66oqFTXXYc=;
	b=BmqJTbjC1nbbjHvU4iN98YL1d72iXzSgDvgBV3Mr49CHfVCrqaTx7XeIRINjwIWZClt5RG
	uTJhe+K6suEUNSSSWezKKovBDjSdkunvNDU79l2NppmmGKc1aaIbYxU2+YvVaXXGjmFekk
	HhlZr50bxOUCM54k4kRWxMlAQ3dp7Qs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772530703;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l4BuEUpCMWOOLFe/pAIjAxPQhDm2qNUbB66oqFTXXYc=;
	b=lB/j4g6E9N7fdc2dHIll1ifClK2xloSpDLGRyg8Fp+bjG2gBi7EILl0XbPW0wmlmA//Ue1
	5unJGXgsCs/dkxCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 133EF3EA69;
	Tue,  3 Mar 2026 09:38:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +apRAw+spmmoVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 03 Mar 2026 09:38:23 +0000
Date: Tue, 03 Mar 2026 10:38:22 +0100
Message-ID: <87ikbdjlrl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ngon <ngon36201@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: Re: [REPORT] ALSA: hda/realtek: Fix silent/extremely quiet audio on
 HP Pavilion x360 (ALC295) with uninitialized SSID 103c:0000
In-Reply-To: 
 <CAF2ktaUW2oaWwGazGtJQ3o1JyE2R4O2xPd-Dchr=qqi7_QRruQ@mail.gmail.com>
References: 
 <CAF2ktaUW2oaWwGazGtJQ3o1JyE2R4O2xPd-Dchr=qqi7_QRruQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AOUDW7U55UPF42F4WFO2U2NMDQGH3JSE
X-Message-ID-Hash: AOUDW7U55UPF42F4WFO2U2NMDQGH3JSE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AOUDW7U55UPF42F4WFO2U2NMDQGH3JSE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: D3FA51EC046
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ngon36201@gmail.com,m:alsa-devel@alsa-project.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[tiwai@suse.de,alsa-devel-bounces@alsa-project.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,alsa0.perex.cz:rdns,alsa0.perex.cz:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,suse.de:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On Sun, 01 Mar 2026 06:57:31 +0100,
Ngon wrote:
> 
> 
> Hi Takashi and ALSA developers,
> 
>   I would like to report a hardware quirk and a verified fix for the
> HP Pavilion x360 Convertible 14-cd0xxx (Codec:
>   Realtek ALC295).
> 
>   Problem:
>   The BIOS on this model reports a generic/uninitialized Subsystem ID:
> 103c:0000. Because of this, the kernel fails to
>   apply the necessary HP-specific quirks. The audio output is either
> completely silent or extremely quiet, even when all
>   mixers are at 100%. This issue is particularly severe on machines
> where the original screen has been removed/modified,
>   which seems to trigger a "protection mode" in the hardware
> amplifier.
> 
>   Hardware Details:
>    - Model: HP Pavilion x360 Convertible 14-cd0xxx
>    - Codec: Realtek ALC295
>    - Reported Subsystem ID: 103c:0000

This SSID with 0 is a problem.  0 is used for a wild card matching,
hence it won't match properly.

I suppose the above is PCI SSID, and the codec SSID is a valid number?
You can see it in the proc output.

>   The Fix:
>   I found that manually forcing the amplifier gain and processing
> coefficients using hda-verb restores the audio to
>   normal volume levels. The following verbs are required:
> 
>    1. hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x07 followed by
> SET_PROC_COEF 0x7770 (Forces Amplifier Gain)
>    2. hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX 0x0d followed by
> SET_PROC_COEF 0x3000 (Sets Processing State)
> 
>   Proposed Solution:
>   Could these verbs be integrated as a default quirk for ALC295 when
> the Subsystem ID 103c:0000 is detected on HP
>   hardware?

If a codec SSID has valid numbers, you can put a quick entry with
HDA_CODEC_QUIRK() instead of SND_PCI_QUIRK().

> Or perhaps added to the ALC269_FIXUP_HP_GPIO_LED chain?

Depends on the hardware implementation :)
If the GPIO LED control works with that quirk, you should chain it,
indeed.

>   I have verified this fix on Pop!_OS 22.04 (Kernel 6.17) and it
> consistently solves the issue.

In anyway, could you give alsa-info.sh output?  Run the script with
--no-upload option, and attach the output.

Also, please rather post to linux-sound@vger.kernel.org instead of
alsa-devel ML.  It's a better place for tracking the kernel issue (and
the patches).


thanks,

Takashi
