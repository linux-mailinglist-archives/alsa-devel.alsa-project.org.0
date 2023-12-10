Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7604080B9ED
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Dec 2023 10:08:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B04BAA4A;
	Sun, 10 Dec 2023 10:07:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B04BAA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702199284;
	bh=WLb9sRAUqubo0gIXdFnWkZMqpdPuq3FIZs1lcsuXeSo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UZ9SJ1pGUcZLcSoxh7+jgQvrh3Wu3Nwxgc9Xx/i7r8doXQU+SSoGzIiLBh6h1XMNN
	 nJbbgBMtClG7iN5RMOK7GGgfXAv+ZsEAVmksh25V1+w5Ce/X2TOLbr3QCYxSWLSNG3
	 hdQlqhyvWeaEtxpCUtSSRdYNJ3LeWZNxscQNk/io=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95A62F80587; Sun, 10 Dec 2023 10:07:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71241F80578;
	Sun, 10 Dec 2023 10:07:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7152BF8020D; Sun, 10 Dec 2023 10:04:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18847F8016A
	for <alsa-devel@alsa-project.org>; Sun, 10 Dec 2023 10:03:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18847F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=fOoUm34G;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vGCuJq7e;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=fOoUm34G;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vGCuJq7e
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0BAC4220B8;
	Sun, 10 Dec 2023 09:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702199037;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=os1iGuBTojB72Hkct1nnoua+sHFGgyWEWxG/fW38jVM=;
	b=fOoUm34Gs+BNDuUlt72TFgfP1Cg2V3XPOcl1jCX1Cy1HyEGupX+fV+KuL40UXv5+F/MYLj
	K2h+4mBr02JIevzTAlsnZ9AwX57WzQdGQL+Bhv8aZK3EdkiY4sBhjA/GQOOFKsv828ILr4
	yeYRU77PMpu8P1YUDEeGc2SbY+j+Hos=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702199037;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=os1iGuBTojB72Hkct1nnoua+sHFGgyWEWxG/fW38jVM=;
	b=vGCuJq7e9viSi593q/nDWJU4i1WMAP608dNnNomXx/FrGq0gtffl9oOuEaYSI/3H57CBNH
	Wyf7Sli2a+HlFTCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1702199037;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=os1iGuBTojB72Hkct1nnoua+sHFGgyWEWxG/fW38jVM=;
	b=fOoUm34Gs+BNDuUlt72TFgfP1Cg2V3XPOcl1jCX1Cy1HyEGupX+fV+KuL40UXv5+F/MYLj
	K2h+4mBr02JIevzTAlsnZ9AwX57WzQdGQL+Bhv8aZK3EdkiY4sBhjA/GQOOFKsv828ILr4
	yeYRU77PMpu8P1YUDEeGc2SbY+j+Hos=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1702199037;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=os1iGuBTojB72Hkct1nnoua+sHFGgyWEWxG/fW38jVM=;
	b=vGCuJq7e9viSi593q/nDWJU4i1WMAP608dNnNomXx/FrGq0gtffl9oOuEaYSI/3H57CBNH
	Wyf7Sli2a+HlFTCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CFB1C137D2;
	Sun, 10 Dec 2023 09:03:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id dU16MPx+dWVuVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 10 Dec 2023 09:03:56 +0000
Date: Sun, 10 Dec 2023 10:03:56 +0100
Message-ID: <87il565szn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/2] ALSA: hda/hdmi: add force-connect quirks
In-Reply-To: <20231208132127.2438067-1-kai.vehmanen@linux.intel.com>
References: <20231208132127.2438067-1-kai.vehmanen@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=fOoUm34G;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vGCuJq7e;
	dmarc=pass (policy=none) header.from=suse.de;
	spf=softfail (smtp-out1.suse.de: 2a07:de40:b281:104:10:150:64:97 is neither
 permitted nor denied by domain of tiwai@suse.de) smtp.mailfrom=tiwai@suse.de
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [-9.12 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_SPF_SOFTFAIL(0.00)[~all:c];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.de:+];
	 DMARC_POLICY_ALLOW(0.00)[suse.de,none];
	 MX_GOOD(-0.01)[];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 NEURAL_HAM_SHORT(-0.04)[-0.192];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-0.27)[73.98%];
	 ARC_NA(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[3];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 WHITELIST_DMARC(-7.00)[suse.de:D:+];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Queue-Id: 0BAC4220B8
Message-ID-Hash: 2ZCCPHYW4P2V2Z2IBJRIHHCEV24XTLES
X-Message-ID-Hash: 2ZCCPHYW4P2V2Z2IBJRIHHCEV24XTLES
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZCCPHYW4P2V2Z2IBJRIHHCEV24XTLES/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 08 Dec 2023 14:21:25 +0100,
Kai Vehmanen wrote:
> 
> This series addresses problems seen on a few older Intel based
> systems as found by the DRM i915 CI and the inject-audio test.
> 
> The patches in series have been separately tested on top
> of drm-tip at:
> https://patchwork.freedesktop.org/series/127515/
> https://patchwork.freedesktop.org/series/127305/
> 
> Kai Vehmanen (2):
>   ALSA: hda/hdmi: add force-connect quirk for NUC5CPYB
>   ALSA: hda/hdmi: add force-connect quirks for ASUSTeK Z170 variants

Applied both patches now.  Thanks.


Takashi
