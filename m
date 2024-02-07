Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 279C584C564
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 08:02:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22103846;
	Wed,  7 Feb 2024 08:02:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22103846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707289368;
	bh=v7msrzpyw2ptuE2fVKl5DgGja6IcIfOGzZaserJmkIY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hlERf0yl/GPt9ag5Z8MP2gGisapUkGwWiVITb898WnbXXZpnr/Zt+b2Vt6YhpxMd7
	 iocz1KqsbHpiki6vGvrYX69ONTzoPoX4sFgkLNNvdUsI1DnQBgwoSR2jHpERMSuNQg
	 bPIBER27roHKn9Fk59MLi4EclB1j7PHlPO8yAmL8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE909F805AF; Wed,  7 Feb 2024 08:02:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5133BF805A1;
	Wed,  7 Feb 2024 08:02:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CA32F801EB; Wed,  7 Feb 2024 08:00:19 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D11BF800E3
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 08:00:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D11BF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=AaqypUD/;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=854zUxh0;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=AaqypUD/;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=854zUxh0
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 679411F456;
	Wed,  7 Feb 2024 07:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707289202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fq3JEuDRzhumdt/uENPOAy/8jwo374BpY8aqwtGc6x4=;
	b=AaqypUD/ThwT5mQhX1+4Zyy1K1xtovP5sTiL+EQppv/EeGB13qVbepfFo0E9GsHdhVt1xv
	JqBzZ3vqCuUk9uD+ig0PLJSOqmZXVy0w3ELqzQe+DhedjpT0lJgRHtXGErbVi3ZVltkhyp
	L7GkqQFhYAZ4D7XlgW/tydX9Xr92ogM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707289202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fq3JEuDRzhumdt/uENPOAy/8jwo374BpY8aqwtGc6x4=;
	b=854zUxh0IZJu0GRTU3i/YEtzchcM+UVIokiuwRAsnvtvh6v6zTdgm2w9BkaiOhAb0IWf1a
	8QzZZcpnWnF631Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1707289202;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fq3JEuDRzhumdt/uENPOAy/8jwo374BpY8aqwtGc6x4=;
	b=AaqypUD/ThwT5mQhX1+4Zyy1K1xtovP5sTiL+EQppv/EeGB13qVbepfFo0E9GsHdhVt1xv
	JqBzZ3vqCuUk9uD+ig0PLJSOqmZXVy0w3ELqzQe+DhedjpT0lJgRHtXGErbVi3ZVltkhyp
	L7GkqQFhYAZ4D7XlgW/tydX9Xr92ogM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707289202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fq3JEuDRzhumdt/uENPOAy/8jwo374BpY8aqwtGc6x4=;
	b=854zUxh0IZJu0GRTU3i/YEtzchcM+UVIokiuwRAsnvtvh6v6zTdgm2w9BkaiOhAb0IWf1a
	8QzZZcpnWnF631Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DEDDF139D8;
	Wed,  7 Feb 2024 07:00:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id weg+NXEqw2XlKwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 07 Feb 2024 07:00:01 +0000
Date: Wed, 07 Feb 2024 08:00:01 +0100
Message-ID: <878r3w7o9a.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: <srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>,
	<perex@perex.cz>,
	<conor+dt@kernel.org>,
	<corbet@lwn.net>,
	<lgirdwood@gmail.com>,
	<andersson@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>,
	<gregkh@linuxfoundation.org>,
	<Thinh.Nguyen@synopsys.com>,
	<broonie@kernel.org>,
	<bgoswami@quicinc.com>,
	<tiwai@suse.com>,
	<robh+dt@kernel.org>,
	<konrad.dybcio@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
Subject: Re: [PATCH v13 48/53] ALSA: usb-audio: mixer: Add USB offloading
 mixer control
In-Reply-To: <dbe544de-dc04-59a8-6642-883fc00214f3@quicinc.com>
References: <20240203023645.31105-1-quic_wcheng@quicinc.com>
	<20240203023645.31105-49-quic_wcheng@quicinc.com>
	<871q9pwy0l.wl-tiwai@suse.de>
	<dbe544de-dc04-59a8-6642-883fc00214f3@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="AaqypUD/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=854zUxh0
X-Spamd-Result: default: False [2.16 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[dt];
	 MIME_GOOD(-0.10)[text/plain];
	 BAYES_HAM(-0.03)[56.23%];
	 R_RATELIMIT(0.00)[to_ip_from(RLe67txhfobum3fqdb5xx8e3au)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_TWELVE(0.00)[23];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[linaro.org,intel.com,perex.cz,kernel.org,lwn.net,gmail.com,linuxfoundation.org,synopsys.com,quicinc.com,suse.com,vger.kernel.org,alsa-project.org];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 679411F456
X-Spamd-Bar: ++
Message-ID-Hash: CKDZF6ENCL4JK7F7YPCMP4Z5OJG7CMRE
X-Message-ID-Hash: CKDZF6ENCL4JK7F7YPCMP4Z5OJG7CMRE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CKDZF6ENCL4JK7F7YPCMP4Z5OJG7CMRE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Feb 2024 02:24:46 +0100,
Wesley Cheng wrote:
> 
> Hi Takashi,
> 
> On 2/6/2024 4:57 AM, Takashi Iwai wrote:
> > On Sat, 03 Feb 2024 03:36:40 +0100,
> > Wesley Cheng wrote:
> >> 
> >> In order to allow userspace/applications know about USB offloading status,
> >> expose a sound kcontrol that fetches information about which sound card
> >> index is associated with the ASoC platform card supporting offloading.  In
> >> the USB audio offloading framework, the ASoC BE DAI link is the entity
> >> responsible for registering to the SOC USB layer.  SOC USB will expose more
> >> details about the current offloading status, which includes the USB sound
> >> card and USB PCM device indexes currently being used.
> >> 
> >> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> > 
> > The concept is understandable, but the control element name ("SNDUSB
> > OFFLD playback available") looks non-intrusive and non-conformant.
> > Use a bit more understandable name instead.
> > 
> > This provides a card number where the offload driver is bound, and the
> > name should indicate something about that.
> > 
> 
> Hmmm, does USB sound have a naming convention that it usually follows
> for mixer/control interfaces?

The old rule is found in Documentation/sound/designs/control-names.rst
(although the prefix and the suffix are often dropped for non-standard
controls).

> For something that is more closely related, how about:
> "USB offload capable card"

Yes, it looks better.  But usually each word begins with an upper
letter.


Takashi
