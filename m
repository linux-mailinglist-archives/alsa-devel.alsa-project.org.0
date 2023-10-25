Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7DE7D6D80
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 15:42:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 701A17F1;
	Wed, 25 Oct 2023 15:41:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 701A17F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698241357;
	bh=Am8IWDpQ5aBaB8L/fWKYeZWmXMyHLEfNF13gDT4vHms=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VYDdYTlNcRAAOmAz08jOsGc+BNsn9FrdfOCjnnUIo6pOc9j4UG9u7LR33lVFZN3/t
	 QzOReNb7ejfh0dMV6gMiJaGoJTf8wwJdMSF3CfEDngUhpoyEfqrwljVHJR8S9LgunL
	 yNzdV+vUiKrN/vTGcq/U15bhuaj9stnQyUxqCK40=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBA8FF80537; Wed, 25 Oct 2023 15:41:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69CBDF80157;
	Wed, 25 Oct 2023 15:41:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4597FF80165; Wed, 25 Oct 2023 15:41:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C419CF8012B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 15:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C419CF8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=kR/dRF1g;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=KHeCEYzl
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 58DC821DC7;
	Wed, 25 Oct 2023 13:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1698241292;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bwQTODhlamcgW+Q25NUqPOQBPGtcFSDsCCsgM0bk7Bw=;
	b=kR/dRF1gb2L7Z0vOn9SbHI5+tqN8HzO1N92c5hJ8Y4JTusT9IVpnzS7MJR5fFIjKw30LZC
	tHpmJj6ZKr3oHiOSCyqHY8gQIYOwB17gguCvVf5Mny0SbiT6uoDLi8sRdmzEHOe5oa4cR7
	cJeoF+qi8OfMGye0Z7DFKYAjQ1VCWY8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1698241292;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bwQTODhlamcgW+Q25NUqPOQBPGtcFSDsCCsgM0bk7Bw=;
	b=KHeCEYzlFQCPbAzBbLA0khMQzFiSGcuZ0euPKPxISUA0r7ci9LcDWATUwYhvvU+WlLXfis
	IPk3eNgKteSP0lAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44FF513524;
	Wed, 25 Oct 2023 13:41:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id M+llEAwbOWVyBQAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 25 Oct 2023 13:41:32 +0000
Date: Wed, 25 Oct 2023 15:41:31 +0200
Message-ID: <87wmvax1is.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jaroslav Kysela <perex@perex.cz>
Cc: ALSA development <alsa-devel@alsa-project.org>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] MAINTAINERS: ALSA: change mailing list to linux-sound on
 vger
In-Reply-To: <87wmvdwkxm.wl-tiwai@suse.de>
References: <20231020071247.973909-1-perex@perex.cz>
	<87wmvdwkxm.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-4.59 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_HAM(-2.99)[99.96%];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-3.00)[-1.000];
	 RCPT_COUNT_FIVE(0.00)[6];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 TO_DN_ALL(0.00)[];
	 NEURAL_HAM_SHORT(-1.00)[-1.000];
	 MID_CONTAINS_FROM(1.00)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_COUNT_TWO(0.00)[2];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[];
	 FREEMAIL_CC(0.00)[alsa-project.org,suse.com,kernel.org,gmail.com,linuxfoundation.org]
Message-ID-Hash: CEHXDYAA7IG65A3XUUKSMJIHAWLMQXXT
X-Message-ID-Hash: CEHXDYAA7IG65A3XUUKSMJIHAWLMQXXT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CEHXDYAA7IG65A3XUUKSMJIHAWLMQXXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 23 Oct 2023 15:03:01 +0200,
Takashi Iwai wrote:
> 
> On Fri, 20 Oct 2023 09:12:47 +0200,
> Jaroslav Kysela wrote:
> > 
> > As discussed on alsa-devel mailing list [1], it is useful to have an open
> > mailing list to avoid moderation delays for the kernel patch work. Use
> > linux-sound mailing list for kernel driver related threads.
> > 
> > In the first stage, change the list for the ALSA core, ASoC and tests.
> > 
> > [1] https://lore.kernel.org/alsa-devel/20231019-posture-cache-fe060b@meerkat/
> > 
> > Cc: Takashi Iwai <tiwai@suse.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Ivan Orlov <ivan.orlov0322@gmail.com>
> > Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
> > Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> 
> Applied to for-next branch now.  Thanks.

... and I tested posting patches to linux-sound ML:
  https://lore.kernel.org/linux-sound/20231025132314.5878-1-tiwai@suse.de

I thought those are forwarded to alsa-devel, but apparently they
aren't.  So we all devs need to subscribe this ML now?


thanks,

Takashi
