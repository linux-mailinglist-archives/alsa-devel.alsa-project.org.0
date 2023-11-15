Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E32A7EC2B6
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Nov 2023 13:44:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1E631ED;
	Wed, 15 Nov 2023 13:43:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1E631ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700052263;
	bh=Go4rFN7PUAMn2XHcJGLv040ssEfG8/gAXkrIoFY6TMQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FjQKcBwj1RP7TswMk6Wb9DlgNn4XszRlo8eewpt0ux1KHvJ/lJsC+9huo4WkdNywB
	 j6YxDE6h6MMhXlyFp7CzC+mu2vztC9XLnT8yytCOCngnhwilX7qUdPmc7/fN9O77S4
	 gDLFOsR8eRU+kipiQ5baWwR504iO8rD3HcgtBT+Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B51DF800ED; Wed, 15 Nov 2023 13:43:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21DE6F8016E;
	Wed, 15 Nov 2023 13:43:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 789EFF801D5; Wed, 15 Nov 2023 13:43:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F26BCF800ED
	for <alsa-devel@alsa-project.org>; Wed, 15 Nov 2023 13:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F26BCF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=oAKnYGjG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=EtUnjFR6
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 197FA228E1;
	Wed, 15 Nov 2023 12:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1700052203;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I3kP+FWiCjTFG4z5PsXOPa2z26/Vk2OryY4GARldTl8=;
	b=oAKnYGjGugashDL9ZtHFzYBXcKIYL9hJgbithWWisoYQVe0KQTNzG5sTFuxNYs0XYPoz01
	GKKKPREG2x/t1075mi/W1E4taHINRWl2yXN0KSoKPoBeC7IBdsNQ7HyJbWMbcaSiCtopSU
	Xi6HWICEFpk2oYdtHswRP/KF80BlylM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700052203;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I3kP+FWiCjTFG4z5PsXOPa2z26/Vk2OryY4GARldTl8=;
	b=EtUnjFR6x6jIpMHZYaHyJK+aP7gcPrZOp3ToSN49umgGtDoV8SKCao/pvTRLPj9wwn+FIW
	yf4mGLqv6UOsFFDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0008E13592;
	Wed, 15 Nov 2023 12:43:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id XmSCOuq8VGX1IAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 15 Nov 2023 12:43:22 +0000
Date: Wed, 15 Nov 2023 13:43:22 +0100
Message-ID: <877cmjuqz9.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org,	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,	Jani Nikula <jani.nikula@linux.intel.com>,
	Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,	Kai
 Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ALSA: hda: i915: Alays handle -EPROBE_DEFER
In-Reply-To: <20231115123625.74286-1-maarten.lankhorst@linux.intel.com>
References: <20231115123625.74286-1-maarten.lankhorst@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-10.08 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[7];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-2.98)[99.90%]
Message-ID-Hash: 5SBNTUCLN34S4K7WGDKEUQBFCTNTYHLP
X-Message-ID-Hash: 5SBNTUCLN34S4K7WGDKEUQBFCTNTYHLP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5SBNTUCLN34S4K7WGDKEUQBFCTNTYHLP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 15 Nov 2023 13:36:25 +0100,
Maarten Lankhorst wrote:
> 
> It turns out that even if the comment says that the driver can load
> fine, it's not really the case and no codecs are detected.
> Specifically for -EPROBE_DEFER, always fail the probe.
> 
> This fixes a regression when HDA-intel is loaded before i915.
> 
> Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Tested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Fixes: e6d0c13e9f46 ("ALSA: hda: i915: Remove extra argument from snd_hdac_i915_init")
> Cc: Takashi Iwai <tiwai@suse.de>
> 
> ---
> Using Takashi's version, as I like the separate -EPROBE_DEFER if more.

Applied now.  Thanks.


Takashi
