Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0183A749D3
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Mar 2025 13:33:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2A20601D4;
	Fri, 28 Mar 2025 13:32:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2A20601D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743165189;
	bh=0H5it2xIKnE5BTRJ7GYMNekXuQoGpGDaCDpjF0vYegY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NbxP5zHbOmwvzSPkbjnpFXZx8PgPGQRAAjgeIVuxlT1RSvw2LSBv0zpmI/maMEUIR
	 ZMROF7Ar0rcCtWyjk+8ZJeFWJ3FgwAydC9N1J/ECw4x5DKCZ7jk/DWEIZB9es0AYdI
	 NHD1tvgDCleg65ObWZenvxa0VNNAr+7ohLyUQ2aA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FF5EF805C1; Fri, 28 Mar 2025 13:32:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1ECD8F805AC;
	Fri, 28 Mar 2025 13:32:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C7FCF80548; Fri, 28 Mar 2025 13:32:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48C83F80095
	for <alsa-devel@alsa-project.org>; Fri, 28 Mar 2025 13:32:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48C83F80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KFrRD143;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YBu+Lp3x;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=KFrRD143;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YBu+Lp3x
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4E688211D3;
	Fri, 28 Mar 2025 12:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1743165149;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KlEQLPwbcSypN8cs0uxLeuy5r1kRFmvFuvn20PzGOKo=;
	b=KFrRD1434v+nCItpBpaRCJRwUYX9QY/pYvVqyWx58RgRb5GvJ4zM0XuLtCaAIfPUDLncRO
	C9nytR3wKbE6cm2s9/m7i8p3jf5gmCkzdfZQAuHZjQ0TNylQZGa9Myx8G/rVYM1WOMXGtg
	c5C3D01qeqGMXOhWBzhxKBaPRiBXh6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743165149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KlEQLPwbcSypN8cs0uxLeuy5r1kRFmvFuvn20PzGOKo=;
	b=YBu+Lp3xH+/3bzrySju9eV+IuR2XbnxZcogmtBgiqR3Jk3BNqwPWHTHKrLupgyWXAW5+j2
	ngjft/UmaLjtvCDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KFrRD143;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YBu+Lp3x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1743165149;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KlEQLPwbcSypN8cs0uxLeuy5r1kRFmvFuvn20PzGOKo=;
	b=KFrRD1434v+nCItpBpaRCJRwUYX9QY/pYvVqyWx58RgRb5GvJ4zM0XuLtCaAIfPUDLncRO
	C9nytR3wKbE6cm2s9/m7i8p3jf5gmCkzdfZQAuHZjQ0TNylQZGa9Myx8G/rVYM1WOMXGtg
	c5C3D01qeqGMXOhWBzhxKBaPRiBXh6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1743165149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KlEQLPwbcSypN8cs0uxLeuy5r1kRFmvFuvn20PzGOKo=;
	b=YBu+Lp3xH+/3bzrySju9eV+IuR2XbnxZcogmtBgiqR3Jk3BNqwPWHTHKrLupgyWXAW5+j2
	ngjft/UmaLjtvCDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 013A013927;
	Fri, 28 Mar 2025 12:32:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ui6YOtyW5mcwUQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 28 Mar 2025 12:32:28 +0000
Date: Fri, 28 Mar 2025 13:32:28 +0100
Message-ID: <87jz89e3oj.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<13564923607@139.com>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<baojun.xu@ti.com>,
	<Baojun.Xu@fpt.com>,
	<robinchen@ti.com>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Upgrade calibratd-data writing code
 to support Alpha and Beta dsp firmware
In-Reply-To: <20250328074326.796-1-shenghao-ding@ti.com>
References: <20250328074326.796-1-shenghao-ding@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 4E688211D3
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,ti.com,fpt.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,ti.com:email]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
Message-ID-Hash: SD7BFV6LWFYW2KIH46FXYVB7W7UXZZ5T
X-Message-ID-Hash: SD7BFV6LWFYW2KIH46FXYVB7W7UXZZ5T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SD7BFV6LWFYW2KIH46FXYVB7W7UXZZ5T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 28 Mar 2025 08:43:26 +0100,
Shenghao Ding wrote:
> 
> Since 2025, the firmware for tas2781 has been added more audio acoustic
> features, such as non-linear compensation, advanced battery guard,
> rattle-noise suppression, etc. The version was divided into two different
> series. Both series have a slight change on the calibrated data storage
> addresses, which becames flexible instead of fixed. In order to support
> new firwmares in time, the code have some related upgrades.
> 
> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> ---
> v2:
>  - revise the subject and description.
> v1:
>  - Add updating calibration addresses code into tas2781_apply_calib in
>    case of Alpha and Beta firmware.

This looks *much* better.  Applied now.


thanks,

Takashi
