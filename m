Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DF07F3794
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Nov 2023 21:36:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C68A2AEA;
	Tue, 21 Nov 2023 21:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C68A2AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700599001;
	bh=/cR8swiuChQE8W/6ASPwL+h7wHv7gPdPjnGPUSUxLL8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fw4iKT4nm9OC0sPMjOg+8FkVIHzAOh+Ug6hG2brcerqK9rbsB9Oo3Ec+oFnDsCczw
	 gxdsagGOEC2FNieX2cACBDZfN4GVq9mEmUa56cS99RLQqW8ZXqNHxro4moBCLyOTT+
	 /MJobV43eL+eABZxJMWM2kRLAu2Tk67oTtSCJVh8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CF7DF8056F; Tue, 21 Nov 2023 21:36:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A9E2F80551;
	Tue, 21 Nov 2023 21:36:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D3C8F802E8; Tue, 21 Nov 2023 21:36:14 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 56DACF80166
	for <alsa-devel@alsa-project.org>; Tue, 21 Nov 2023 21:36:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56DACF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=j0eEAAa1;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=nxZ38h43
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4A33321983;
	Tue, 21 Nov 2023 20:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1700598964;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k+ruGARSLlvvYgIq0vMNTbnXxDWEq0hWruIbgbcfbEw=;
	b=j0eEAAa1q5OFbGKC0qhw+W/IRbb+z9H92G1grmLXyGokRsPQTN/qx8zYqQQIReMO+QhoME
	MrEXqLdK2siX9vk3hkOAnvcb19kQ4zktmEYESRD/fGuwfpn+u/PUkvVzjRVEvbSiMHB6TY
	q9C4UQAHI6Q5zRyHr1f8oD7OFRxPMLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700598964;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k+ruGARSLlvvYgIq0vMNTbnXxDWEq0hWruIbgbcfbEw=;
	b=nxZ38h43dJg7eI9+TkXrPsMdzA6IuWAit6d3wf2v9NMnMD29jya91I1cMd+13q/LZTCEev
	+LxfjV5tDBXNc4Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BB49139FD;
	Tue, 21 Nov 2023 20:36:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +tfjAbQUXWW0BgAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 21 Nov 2023 20:36:04 +0000
Date: Tue, 21 Nov 2023 21:36:03 +0100
Message-ID: <87h6lealos.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda: cs35l56: Enable low-power hibernation mode on
 SPI
In-Reply-To: <20231121154419.19435-1-rf@opensource.cirrus.com>
References: <20231121154419.19435-1-rf@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.31 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.12)[-0.608];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.09)[64.79%]
Message-ID-Hash: OEYNZYBSZKSQ7PJSA4FUPICJVMCLGL2J
X-Message-ID-Hash: OEYNZYBSZKSQ7PJSA4FUPICJVMCLGL2J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OEYNZYBSZKSQ7PJSA4FUPICJVMCLGL2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 21 Nov 2023 16:44:19 +0100,
Richard Fitzgerald wrote:
> 
> SPI hibernation is now supported with the latest hibernation/wake
> sequences in the shared ASoC code.
> 
> This has a functional dependency on two commits:
> 
> commit 3df761bdbc8b ("ASoC: cs35l56: Wake transactions need to be issued
> twice")
> 
> commit a47cf4dac7dc ("ASoC: cs35l56: Change hibernate sequence to use
> allow auto hibernate")
> 
> To protect against this, enabling hibernation is conditional on
> CS35L56_WAKE_HOLD_TIME_US being defined, which indicates that the new
> hibernation sequences are available.
> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Is this expected to be merged for 6.7?  Or it can be post 6.7?
I guess the former, but just to make sure.


thanks,

Takashi
