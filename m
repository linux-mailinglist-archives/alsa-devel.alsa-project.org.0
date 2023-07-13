Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D69751C19
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jul 2023 10:48:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7FD6207;
	Thu, 13 Jul 2023 10:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7FD6207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689238124;
	bh=9eiKflHmxp6IVuWN/T2cYh4HfFJHZdgv8RWf8Xy/laU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l0M6u+OV1eL4Ib0UBpx8v4j39BHAMprncOrGhogw9gRZB7UnCONsn2ofHUPaDh+fY
	 q+2jQIdt4HxlCX3WxptqxSa3ldTFi+JK2zBzjqfNgOzDTqrOw1J6jeNI9RtM5lQSIh
	 ZjVQnYAoeROPKMMvnSYB6tnhl7+LEujEhcUGNMdo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 455B4F8047D; Thu, 13 Jul 2023 10:47:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EA559F80153;
	Thu, 13 Jul 2023 10:47:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC729F80236; Thu, 13 Jul 2023 10:47:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4902FF800E4
	for <alsa-devel@alsa-project.org>; Thu, 13 Jul 2023 10:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4902FF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=AOaOkSEa;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=D8oHXgP3
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B9A351F855;
	Thu, 13 Jul 2023 08:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689238063;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLtfPAZsvpeWczNM+t4zcESEp5Dk4o94Mp02aHG++MY=;
	b=AOaOkSEa/3bsAS0pOGj2OvVlAls79RqKFxDN3P8nEtp1oN7C11Vk5vwXmWhhjDp2GXOW4d
	pVtarbjWl9UyAQimXe+IplLDZ55aq03uvW11nV/GUQEkN6TH+I+48qunFLSb2sdwkIZv83
	W+MlH2bNb20pQlZay3sPlpjTjLMZt6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689238063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yLtfPAZsvpeWczNM+t4zcESEp5Dk4o94Mp02aHG++MY=;
	b=D8oHXgP3NXxjChhLS6TUZQ/1kY6OYIOP2fuUEGgEJzKgRlRgbgdt+En8XmjkvBYpbVe2kh
	UcQOay5an3KIaBAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8174613489;
	Thu, 13 Jul 2023 08:47:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id fjDEHi+6r2SHOAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 13 Jul 2023 08:47:43 +0000
Date: Thu, 13 Jul 2023 10:47:43 +0200
Message-ID: <87ilaofb9s.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: =?ISO-8859-1?Q?=22N=EDcolas_F=2E_R=2E_A=2E=22?= Prado
 <nfraprado@collabora.com>,	Jaroslav Kysela <perex@perex.cz>,
	kernel@collabora.com,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Shuah Khan <shuah@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/alsa: pcm-test: Decrease stream duration
 from 4 to 2 seconds
In-Reply-To: <87ef1544-c1aa-4cce-82f2-60c6f1c2b1c8@sirena.org.uk>
References: <20230620220839.2215057-3-nfraprado@collabora.com>
	<33bea0d3-b8dd-4936-812e-392166df4437@sirena.org.uk>
	<443f697b-fecf-6e8e-0b76-65257aff7da8@perex.cz>
	<9069ad0c-d166-4620-a3de-a36ab233cab0@sirena.org.uk>
	<5c2d5213-5299-44f1-9611-26002c8a5d3a@notapiano>
	<87352krcz5.wl-tiwai@suse.de>
	<f5cab2c2-1638-4d19-aff3-d46ed34b857e@sirena.org.uk>
	<87wmzwptu0.wl-tiwai@suse.de>
	<06b8bfde-e4f1-48ea-aa3e-35d2fe5df046@sirena.org.uk>
	<87wmz8i746.wl-tiwai@suse.de>
	<87ef1544-c1aa-4cce-82f2-60c6f1c2b1c8@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: LJH6JEGZ2F2PLA2AWS4YQWZAACUJP2UM
X-Message-ID-Hash: LJH6JEGZ2F2PLA2AWS4YQWZAACUJP2UM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LJH6JEGZ2F2PLA2AWS4YQWZAACUJP2UM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 13 Jul 2023 00:03:24 +0200,
Mark Brown wrote:
> 
> On Mon, Jul 10, 2023 at 09:00:09AM +0200, Takashi Iwai wrote:
> > Mark Brown wrote:
> 
> > > For KernelCI we've got coverage on both.  I can also run stuff on the
> > > boards I have in my lab on demand of course, but there's more coverage
> > > in KernelCI.
> 
> > OK, now I applied those two patches to for-next branch (i.e. for 6.6
> > kernel).  Let's watch out.
> 
> I'm seeing failures on my i.MX6 boards, both the Q and DL have started
> failing in the same way:
> 
> # default.time3.0.0.0.PLAYBACK - 44.1kHz stereo large periods
> # default.time3.0.0.0.PLAYBACK hw_params.RW_INTERLEAVED.S16_LE.44100.2.16383.131064 sw_params.131064
> not ok 10 default.time3.0.0.0.PLAYBACK
> # time mismatch: expected 2000ms got 2229
> 
> reliably (the actual time drifts by a few ms).  The other boards I've
> got coverage of seem fine, and I didn't check any broader CI yet.

Interesting.  With the current patch, we rather extended the margin in
proportion; formerly 4 sec +/- 0.1s, now 2 sec +/- 0.1s.  And it
exceeded out of sudden.

I guess this rather caught a problem of the driver itself.


thanks,

Takashi
