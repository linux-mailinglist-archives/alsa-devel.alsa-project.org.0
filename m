Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B007701C87
	for <lists+alsa-devel@lfdr.de>; Sun, 14 May 2023 11:19:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5348420C;
	Sun, 14 May 2023 11:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5348420C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684055965;
	bh=D1dvz6vayC/ufY6+E45if+habx4D2V+Lfsoxp5/XXQo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hhkYvrUgEeHYajPIp065u+BXf6/ECxCYljnWsMnpuZSavuiyLIYhSOKtETMBlpKU4
	 LbfEAHaAOqxQRIea87yIB18Wwny9NJtOxbWqfCvfJY5iQ4gJ0J9veFib9aFrelXrO2
	 vecnsemcP33X9GWpbufUBzzPUNgTtW6PxJyMA8WM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B265CF8024E; Sun, 14 May 2023 11:18:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E3B7F8025A;
	Sun, 14 May 2023 11:18:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BCD67F80272; Sun, 14 May 2023 11:18:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C22DF8024E
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 11:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C22DF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=YYzOgtkI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=SUM2jczq
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9297D21FF0;
	Sun, 14 May 2023 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684055901;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YbTG3QHxp4xkrUDBC3uMLRB5y/TSfnVZ4mREVa2fxCE=;
	b=YYzOgtkIKMTo5ApVh3WkkM+zMdRBiHBYGIEQHqaspfVEWEuuJxHfHDRYelInR7fW3ujizU
	hWBBTFGjbvE6kRCdpsFGU6m2V+IEjJvi56IKO7NyCL5FVwdEsUQpcSNMCLOEBWm/oCGYh8
	xBYsbKQv9Jtq92G+ahsmj0KKO/XE4RY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684055901;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YbTG3QHxp4xkrUDBC3uMLRB5y/TSfnVZ4mREVa2fxCE=;
	b=SUM2jczqVqNtlR26shiac1QIfpQGMBoUdxPlIfI+gXnnxU1iHIBbsLc5qryuKg6PQ51cLi
	vS/KJrldFTlDp4CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 41991138F5;
	Sun, 14 May 2023 09:18:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8IUQD12nYGTNTwAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 14 May 2023 09:18:21 +0000
Date: Sun, 14 May 2023 11:18:20 +0200
Message-ID: <878rdr8e5f.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: corbet@lwn.net,
	akpm@linux-foundation.org,
	perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org,
	himadrispandya@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 2/3] ALSA: Implement the new virtual driver
In-Reply-To: <20230513202037.158777-2-ivan.orlov0322@gmail.com>
References: <20230513202037.158777-1-ivan.orlov0322@gmail.com>
	<20230513202037.158777-2-ivan.orlov0322@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: V7MPEP7KLYP7O3IJXGKVAE3YKQBF3PXI
X-Message-ID-Hash: V7MPEP7KLYP7O3IJXGKVAE3YKQBF3PXI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V7MPEP7KLYP7O3IJXGKVAE3YKQBF3PXI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 13 May 2023 22:20:36 +0200,
Ivan Orlov wrote:
> 
> We have a lot of different virtual media drivers, which can be used for
> testing of the userspace applications and media subsystem middle layer.
> However, all of them are aimed at testing the video functionality and
> simulating the video devices. For audio devices we have only snd-dummy
> module, which is good in simulating the correct behavior of an ALSA device.
> I decided to write a tool, which would help to test the userspace ALSA
> programs (and the PCM middle layer as well) under unusual circumstances
> to figure out how they would behave. So I came up with this Virtual ALSA
> Driver.
> 
> This new Virtual ALSA Driver has several features which can be useful
> during the userspace ALSA applications testing/fuzzing, or testing/fuzzing
> of the PCM middle layer. Not all of them can be implemented using the
> existing virtual drivers (like dummy or loopback). Here is what can this
> driver do:
> 
> - Simulate both capture and playback processes
> - Generate random or pattern-based capture data
> - Inject delays into the playback and capturing processes
> - Inject errors during the PCM callbacks
> 
> Also, this driver can check the playback stream for containing the
> predefined pattern, which is used in the corresponding selftest to check
> the PCM middle layer data transferring functionality. Additionally, this
> driver redefines the default RESET ioctl, and the selftest covers this PCM
> API functionality as well.
> 
> Pattern-based capture stream data generation works in the following way:
> user can set the pattern by writing to the 'fill_pattern' debugfs file.
> After that, the capture stream in case of reading will be filled with this
> pattern (for example, if the pattern is 'abc', the capture stream will
> contain 'abcabcabc...'). The pattern itself can be up to 4096 bytes long.
> 
> After all, I think this driver would be a good start, and I believe in the
> future we will see more virtual sound drivers.
> 
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>

The idea is interesting, and it's a definitely good thing to have.

I wonder, though, whether it could be better provided as an extention
to the existing snd-dummy driver.  The advantage of extending
snd-dummy driver would be that it already supports different formats,
etc.  OTOH, if we create an individual driver, the pro side is the
simpleness of the code.

I'm inclined to go with a separate driver, but I'm open about this.
Maybe Jaroslav and Mark have some opinions?

About this patch set: the driver name should be a bit more specific,
as this isn't a generic virtual driver that is used for general
purpose but it's only for testing.  And it's only for testing PCM.
So, a name like snd-test-pcm would be more appropriate, IMO.

And, we want the coverage of different formats, channels, rates and
accesses (interleaved vs non-interleaved).  How can we extend somehow
more for that?


thanks,

Takashi
