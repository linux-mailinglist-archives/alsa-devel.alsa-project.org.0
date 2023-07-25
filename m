Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0EB760FCB
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:52:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DF071535;
	Tue, 25 Jul 2023 11:51:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DF071535
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690278762;
	bh=d+xNwV9x8TY+zOpHZyux6/e7VoJ76lBK38gYBl4CUd8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s5wwRvHz6EYSlHuwu7UaOM3uggZCfSmv9BACnkYsMRwPdbYKAwaCbDKkeS+yBToiS
	 +88HQBHiFb7w+j2ae5syzsc4CARTQNYxMGSRAabz/i4OpyLa7He1K3t5jVOySv1C5l
	 N16GMWHs1DHZwA9bwNk8x1zUacWRg8wJV48H02yM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A26BF80535; Tue, 25 Jul 2023 11:51:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0404CF80153;
	Tue, 25 Jul 2023 11:51:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58E63F80163; Tue, 25 Jul 2023 11:51:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12062F800C7
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12062F800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=dnXcXib7;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Te2Kcc8G
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 38BA121CF5;
	Tue, 25 Jul 2023 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690278691;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YuwGiB7CDjEOEo2dqfgTzEoaBo/NkwZrdim6kOaulcc=;
	b=dnXcXib79aRGz0+K5Gx3dX8WOXs7rvUVbmcKKl/MEh1w8rOh6OUl5l5OkdNQd/TwDeQ9Nn
	g0Fzkdd5rfL+Cio6LA2Of9Pr4oboz41H414zlDjdIKb/BYSb3oTsWpWgzCRmrtkCFC1/IK
	2VEl5AdW3SUZTtEled4PF8B+2MAxN54=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690278691;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YuwGiB7CDjEOEo2dqfgTzEoaBo/NkwZrdim6kOaulcc=;
	b=Te2Kcc8Gi6y7zrH9XVLahjn0V0t8gwf0xWQayu+510l1M3h5VGesqzsZrfC0gXkvlnrr+n
	f8m8lxz5haYEhIBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07F7B13487;
	Tue, 25 Jul 2023 09:51:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oDYtASObv2R/ZwAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 25 Jul 2023 09:51:31 +0000
Date: Tue, 25 Jul 2023 11:51:30 +0200
Message-ID: <87tttstj31.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: tiwai@suse.com,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v5 00/11] ALSA: hda: Adding support for CS35L56 on HDA
 systems
In-Reply-To: <169022328831.1044066.6080075080661040862.b4-ty@kernel.org>
References: <20230721132120.5523-1-rf@opensource.cirrus.com>
	<169022328831.1044066.6080075080661040862.b4-ty@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: VKLAQJ6WQCVAPF5IQGK4RCJ4HULN257Y
X-Message-ID-Hash: VKLAQJ6WQCVAPF5IQGK4RCJ4HULN257Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKLAQJ6WQCVAPF5IQGK4RCJ4HULN257Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 24 Jul 2023 20:28:08 +0200,
Mark Brown wrote:
> 
> On Fri, 21 Jul 2023 14:21:09 +0100, Richard Fitzgerald wrote:
> > This set of patches adds support for using the CS35L56 boosted smart
> > amplifier on HDA systems. In these systems the CS35L56 audio is
> > routed through a HDA-to-I2S bridge codec.
> > 
> > This doesn't include the changes to the Realtek driver to actually hook
> > up the CS35L56 driver, because we don't yet have the QUIRK IDs to
> > associate it with. But we want to publish the driver now so that it is
> > available for bringing up hardware with the CS35L56.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Mark, could you send an earlier PR including this?
Otherwise we'll be in a messy situation when applying further
conflicting patches like TAS HD-audio codec patches.


thanks,

Takashi
