Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334C73CF66
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Jun 2023 10:37:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C9C27F8;
	Sun, 25 Jun 2023 10:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C9C27F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687682226;
	bh=XGSkCRqXqmcN3Epl399fMMxT6x6/Ls3rLtId1NCMXaA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LeWrP3DhzlqCdhoiTd/IZXczBEyeddgv0SllraKRMdUEwZqMNqwb2bhrPiW7tyNe8
	 xh0xomFjI278QCxdlzUaDKOtbB0swJpW9oi3+NzbhxLsob/ZSHd0q6c3Zy7UKag5Gf
	 4+VEWSOCp0aQPB4wR8TF7fx7Qxf1Z3f1CEbOqkjI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B38EF80535; Sun, 25 Jun 2023 10:36:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F658F80246;
	Sun, 25 Jun 2023 10:36:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D102BF80535; Sun, 25 Jun 2023 10:34:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5C62F80093
	for <alsa-devel@alsa-project.org>; Sun, 25 Jun 2023 10:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5C62F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=IiM+GAdc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jqZlAibA
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 13CFF1F891;
	Sun, 25 Jun 2023 08:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1687682060;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lk4lEG3wUadjpgO/1kn596bQxR6ykihOV60vyW220OY=;
	b=IiM+GAdcpfR1CjNdneLCdGwrWzrbGwaHcE00iprdjkQKg4L1sHai/WIlEkahBp3e4U1ps7
	oaL22TuCUdyWN/Ndmlbm81GAqxqAkLcq0ByBq/LNpnTQJ1WUe9exwo7jzLUFaEKhT/yab6
	oF8Cg2nbDi3ov/4C0za8iEvNta5ZdzM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1687682060;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lk4lEG3wUadjpgO/1kn596bQxR6ykihOV60vyW220OY=;
	b=jqZlAibA329fR8i9bwl5PQ/JS8MiyZP0BHSbNSDDYHR8V3cP1e4eA8Pia/xxQcsEhXi5tP
	EyecItxqv/GBZaAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D39CD13462;
	Sun, 25 Jun 2023 08:34:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2oSvMgv8l2RrIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 25 Jun 2023 08:34:19 +0000
Date: Sun, 25 Jun 2023 10:34:19 +0200
Message-ID: <87o7l4vt2s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matthias Reichl <hias@horus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Dom Cobley <popcornmix@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: hdmi-codec: fix channel info for compressed formats
In-Reply-To: <20230624165232.5751-1-hias@horus.com>
References: <20230624165232.5751-1-hias@horus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: LAPGWKZ2LW54G5U5EWCKZNUKQBY4PI4B
X-Message-ID-Hash: LAPGWKZ2LW54G5U5EWCKZNUKQBY4PI4B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LAPGWKZ2LW54G5U5EWCKZNUKQBY4PI4B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 24 Jun 2023 18:52:32 +0200,
Matthias Reichl wrote:
> 
> According to CTA 861 the channel/speaker allocation info in the
> audio infoframe only applies to uncompressed (PCM) audio streams.
> 
> The channel count info should indicate the number of channels
> in the transmitted audio, which usually won't match the number of
> channels used to transmit the compressed bitstream.
> 
> Some devices (eg some Sony TVs) will refuse to decode compressed
> audio if these values are not set correctly.
> 
> To fix this we can simply set the channel count to 0 (which means
> "refer to stream header") and set the channel/speaker allocation to 0
> as well (which would mean stereo FL/FR for PCM, a safe value all sinks
> will support) when transmitting compressed audio.
> 
> Signed-off-by: Matthias Reichl <hias@horus.com>

Thanks, applied now.


Takashi
