Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEGPGlE0j2lEMgEAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Feb 2026 15:25:21 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF53C1370D1
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Feb 2026 15:25:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24253601AB;
	Fri, 13 Feb 2026 15:25:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24253601AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1770992720;
	bh=yL22VrCdbtL0JOgFFT+AtDbSBSwkpiMRoG8dF/x5QoE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g0CgW9fd8ohru+nMcBTf03Yo/pHItrKJzFo2ZK5kCRAN5HviNk55O6EubWGVU+Gs6
	 NTHmPAr74OcHNjFuakq06WpV89S4enDss/an9CKV9LO1LAXgNT+0dc+Hf9Ur+X4mPc
	 eehnaQsG9tn1veQ0LL03Sna/2uFZ9v3CRNGnjTGM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D2ECF805E7; Fri, 13 Feb 2026 15:24:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39A88F805E7;
	Fri, 13 Feb 2026 15:24:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FCB7F8014E; Fri, 13 Feb 2026 15:21:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1642BF8014E
	for <alsa-devel@alsa-project.org>; Fri, 13 Feb 2026 15:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1642BF8014E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=IjXsn5E6;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CI5zpZMP;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=IjXsn5E6;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CI5zpZMP
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9AD1C3E74B;
	Fri, 13 Feb 2026 14:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1770992478;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+LPEL2+Bn0iwRwvpIUPTB8lwCB4NEFiSBMvivx9L44=;
	b=IjXsn5E6eDoWcDGXUx8kPH+NNLkSxNC0naqB4mALbHBBppMwi9wVFdKX4he0uMs01NfJA8
	fnc5zotcF8X9Ws5p/hPdm0mLHZSbZ3yXmge11UOqrWde/oV3hfH/Grq/hXKdnExr0lfyxf
	i2IyGWFbUu2J3+Xx/bjQECWNthGm60E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770992478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+LPEL2+Bn0iwRwvpIUPTB8lwCB4NEFiSBMvivx9L44=;
	b=CI5zpZMPYnl+GZoqyCiYzNlmM5U/ow1Cfiy/+NDnPDktwkJ5Mm/9XEcZJTRDcRlcIil/fJ
	qOzKX4hbZsbeDLDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1770992478;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+LPEL2+Bn0iwRwvpIUPTB8lwCB4NEFiSBMvivx9L44=;
	b=IjXsn5E6eDoWcDGXUx8kPH+NNLkSxNC0naqB4mALbHBBppMwi9wVFdKX4he0uMs01NfJA8
	fnc5zotcF8X9Ws5p/hPdm0mLHZSbZ3yXmge11UOqrWde/oV3hfH/Grq/hXKdnExr0lfyxf
	i2IyGWFbUu2J3+Xx/bjQECWNthGm60E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1770992478;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2+LPEL2+Bn0iwRwvpIUPTB8lwCB4NEFiSBMvivx9L44=;
	b=CI5zpZMPYnl+GZoqyCiYzNlmM5U/ow1Cfiy/+NDnPDktwkJ5Mm/9XEcZJTRDcRlcIil/fJ
	qOzKX4hbZsbeDLDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 6C1CC3EA62;
	Fri, 13 Feb 2026 14:21:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id /MkEGV4zj2nUeQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 13 Feb 2026 14:21:18 +0000
Date: Fri, 13 Feb 2026 15:21:17 +0100
Message-ID: <87o6lsu3ky.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Rob Hermann <supgeek@gmail.com>
Cc: alsa-devel@alsa-project.org,
	kailang@realtek.com
Subject: Re: [PATCH] ALSA: hda/realtek: Fix speaker output on ASUS ROG Strix
 G512
In-Reply-To: <20260213141311.29199-1-supgeek@gmail.com>
References: <20260213141311.29199-1-supgeek@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: ZYNKO3KDW56ZCT66ZL7D2L73ZV4LTHHP
X-Message-ID-Hash: ZYNKO3KDW56ZCT66ZL7D2L73ZV4LTHHP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZYNKO3KDW56ZCT66ZL7D2L73ZV4LTHHP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:supgeek@gmail.com,m:alsa-devel@alsa-project.org,m:kailang@realtek.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tiwai@suse.de,alsa-devel-bounces@alsa-project.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,alsa0.perex.cz:helo,alsa0.perex.cz:rdns,alsa-project.org:dkim,endeavouros.com:url];
	DKIM_TRACE(0.00)[alsa-project.org:+,suse.de:+];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: EF53C1370D1
X-Rspamd-Action: no action

On Fri, 13 Feb 2026 15:13:11 +0100,
Rob Hermann wrote:
> 
> The ASUS ROG Strix G512LW (subsystem ID 0x10431f21) with ALC294 codec
> has no speaker output on Linux. The internal speaker amplifier requires
> specific codec coefficient writes that differ from the existing
> ALC294_FIXUP_ASUS_SPK quirk values.
> 
> The required coefficients were identified by comparing codec register
> dumps with and without working speaker output:
>   - Coefficient index 0x0f needs value 0x7778 (vs 0x7774 in existing quirk)
>   - Coefficient index 0x40 needs value 0x0800 (vs 0x8800 in existing quirk)
> 
> Without this patch, speakers are completely silent. Headphones and HDMI
> audio work correctly.
> 
> This affects at least the following models:
>   - ASUS ROG Strix G512LW (i7-10750H, RTX 2070)
>   - ASUS ROG Strix G512LV (reported on Fedora forums)
> 
> Link: https://discussion.fedoraproject.org/t/asus-rog-strix-g512lv-speakers-do-not-work-headset-works-fine/74918
> Link: https://forum.endeavouros.com/t/asus-rog-strix-g15-g512lw-no-audio-through-the-speakers-alc294/72857
> Signed-off-by: Rob Hermann <supgeek@gmail.com>

Could you resubmit to linux-sound@vger.kernel.org?  That's the right
ML for a kernel patch.  alsa-devel ML is mainly for user-space stuff.


thanks,

Takashi
