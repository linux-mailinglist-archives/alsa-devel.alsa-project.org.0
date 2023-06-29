Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83641742420
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 12:45:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAD067F1;
	Thu, 29 Jun 2023 12:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAD067F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688035533;
	bh=nRRm4COrztPDc9d4lK66YBTeFaRthBZjzVF09aZ+V/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fhuvklhn24B4CNsuXLYfALXqKDcaOxSTKATP7RqJawQuslXrstkqePgYv42GDoZCX
	 AMF88uVyDK58avoFybElQjbtLd/UDF4DzNsohqH0x8cu+eP5tGQ8t3ok06svrwffAv
	 tet8U2Ty2PIq+tk74bcOs3VuGZ/WaV6CrghKdOBo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4384EF80212; Thu, 29 Jun 2023 12:44:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0594DF80212;
	Thu, 29 Jun 2023 12:44:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D317F80246; Thu, 29 Jun 2023 12:44:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D30D6F80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 12:44:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D30D6F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=FnZsrKJb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gQMuUdfB
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 365431F8CC;
	Thu, 29 Jun 2023 10:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688035476;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jMIvzrr3FC/XxOCIX56sg3CyA8NZGg8bEmD3ORrTSlM=;
	b=FnZsrKJb9M/pkagQKIgnoBaRWdjCWbaiiBRe+Q2pE4V7ylRSps18RxWKh4XAgPYN2aJbWs
	s62wqn9LGFzjy6RIA0A7viAMKTNV92all3dGF75gFBOr9oXAa+EeRWeSFQH0RMT06IHS/9
	7MH2UkaDk4rltepPKtfr1DydLmM1j0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688035476;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jMIvzrr3FC/XxOCIX56sg3CyA8NZGg8bEmD3ORrTSlM=;
	b=gQMuUdfBHIVrpWfegvuO9d6Fgm7HsdUJDPzcqEKdMxIdrQujIjjkYLQCP9AoZfL+VJjzR/
	gXRJkfWrfKDsCGCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B3E5139FF;
	Thu, 29 Jun 2023 10:44:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id DpkvBpRgnWRpJAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 29 Jun 2023 10:44:36 +0000
Date: Thu, 29 Jun 2023 12:44:31 +0200
Message-ID: <87zg4ifsz4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Reichl <hias@horus.com>,
	Dom Cobley <popcornmix@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: hdmi-codec: fix channel info for compressed formats
In-Reply-To: <168803481324.25247.5593448279992144349.b4-ty@kernel.org>
References: <20230624165232.5751-1-hias@horus.com>
	<168803481324.25247.5593448279992144349.b4-ty@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: U4EJVQQUGNZSIW5JPDO6O5HQOUSEGTNR
X-Message-ID-Hash: U4EJVQQUGNZSIW5JPDO6O5HQOUSEGTNR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4EJVQQUGNZSIW5JPDO6O5HQOUSEGTNR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 29 Jun 2023 12:33:33 +0200,
Mark Brown wrote:
> 
> On Sat, 24 Jun 2023 18:52:32 +0200, Matthias Reichl wrote:
> > According to CTA 861 the channel/speaker allocation info in the
> > audio infoframe only applies to uncompressed (PCM) audio streams.
> > 
> > The channel count info should indicate the number of channels
> > in the transmitted audio, which usually won't match the number of
> > channels used to transmit the compressed bitstream.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Oh, I already applied this one together with another fix for HDMI,
and it's in the ongoing PR to Linus.  I didn't notice that it was
ASoC-only.  Sorry for confusion!


Takashi
