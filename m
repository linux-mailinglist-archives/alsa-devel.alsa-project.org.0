Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AB27F47F5
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 14:41:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43E40AE8;
	Wed, 22 Nov 2023 14:41:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43E40AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700660477;
	bh=cRf5SZw1b1ns5GSoCD8M4AIM5Q8VCTkrAoytmwtL+cc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ktqvgMNK91uDofHlwrzPrSGyrglc5cIGvyCiz5Nh1BluqUL5KkQ14TdVvN7Nm9M8K
	 IyyMJOnogo438q1E8dj2d92YMA5K4ezA/MsH2OpbfhXQjumGpaofe4gY/sbdbl/x6T
	 t+iINu5x2yePkOAVOXpJjSgfI6bC7sbBM0hxr1GQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B8E5F8057A; Wed, 22 Nov 2023 14:40:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A871F8047D;
	Wed, 22 Nov 2023 14:40:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F956F802E8; Wed, 22 Nov 2023 14:40:50 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 653DFF80246
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 14:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 653DFF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=LbnwH9Mb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=on5V3Px+
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ABCC721982;
	Wed, 22 Nov 2023 13:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1700660440;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9gGmYo4GGQsuh8hITKaYDqM8JQ11gZwcjahtThUAeRc=;
	b=LbnwH9MbFIfOuDeb1eRHuAMvU5J0CN+a3X/ksA23uS0fMnjjMFlPv4FsZ2ETJOtdhR83t/
	MkCCqZbeKeHsq4NufrXo+YLm/G8m4Oc/YF30bMd6SozRhd+phwLKU/WNXove7nK9wxoFf+
	kVhN/JkvRm5dGLysAt22o6afz9H/2rI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1700660440;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9gGmYo4GGQsuh8hITKaYDqM8JQ11gZwcjahtThUAeRc=;
	b=on5V3Px+T1NwJyLID7d2FpzVAbVvPuy9aWL2FZsbKjiLCvsGxMf3KmEw7uza6tX4OjmULy
	bhWnF7x1N4awNVCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8FBAE13467;
	Wed, 22 Nov 2023 13:40:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id vP7KItgEXmVicAAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 22 Nov 2023 13:40:40 +0000
Date: Wed, 22 Nov 2023 14:40:40 +0100
Message-ID: <87pm013nzb.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>
Subject: Re: [PATCH] ALSA: hda: cs35l56: Enable low-power hibernation mode on
 SPI
In-Reply-To: <1528da8b-4ca3-4f12-be17-a3222039fa20@opensource.cirrus.com>
References: <20231121154419.19435-1-rf@opensource.cirrus.com>
	<87h6lealos.wl-tiwai@suse.de>
	<1528da8b-4ca3-4f12-be17-a3222039fa20@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.53 / 50.00];
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
	 NEURAL_HAM_SHORT(-0.20)[-0.997];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.23)[72.66%]
Message-ID-Hash: CCAFQ7JFIR6HJJFQVXFNQZVKPUSHHHGO
X-Message-ID-Hash: CCAFQ7JFIR6HJJFQVXFNQZVKPUSHHHGO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCAFQ7JFIR6HJJFQVXFNQZVKPUSHHHGO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Nov 2023 12:04:27 +0100,
Richard Fitzgerald wrote:
> 
> On 21/11/23 20:36, Takashi Iwai wrote:
> > On Tue, 21 Nov 2023 16:44:19 +0100,
> > Richard Fitzgerald wrote:
> >> 
> >> SPI hibernation is now supported with the latest hibernation/wake
> >> sequences in the shared ASoC code.
> >> 
> >> This has a functional dependency on two commits:
> >> 
> >> commit 3df761bdbc8b ("ASoC: cs35l56: Wake transactions need to be issued
> >> twice")
> >> 
> >> commit a47cf4dac7dc ("ASoC: cs35l56: Change hibernate sequence to use
> >> allow auto hibernate")
> >> 
> >> To protect against this, enabling hibernation is conditional on
> >> CS35L56_WAKE_HOLD_TIME_US being defined, which indicates that the new
> >> hibernation sequences are available.
> >> 
> >> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> > 
> > Is this expected to be merged for 6.7?  Or it can be post 6.7?
> > I guess the former, but just to make sure.
> > 
> 
> It would be good to get it into 6.7 because it reduces the power
> consumption in runtime-suspend and suspend-to-RAM. But it's not
> critical (it's not a bugfix).

OK, now applied to for-linus branch (for 6.7).


thanks,

Takashi
