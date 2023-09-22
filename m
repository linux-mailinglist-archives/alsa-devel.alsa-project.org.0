Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DA17AB430
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Sep 2023 16:54:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96773E10;
	Fri, 22 Sep 2023 16:54:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96773E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695394496;
	bh=rkvjl+cUcdyuV15kivpc2Z7VM6v9OOJvjVPN5h52lmI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hXvHThEfoJkfeDC6eYiFaNx2kipbQ0tO5DKvCTRp5oBJvIyBP8o/Z1nN4cIU7wGOC
	 mhDjy7NrsJ5d1QoOrjStMX6uvAThjlpMo/soZnmtAO/A6uyxYXT5PSncKg7LTU1A94
	 7vcjBl4hA0w2JkwbXET2njgRMaLo1CSqP2eNfHH4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8400F8047D; Fri, 22 Sep 2023 16:54:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F864F80124;
	Fri, 22 Sep 2023 16:54:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1C9CF80125; Fri, 22 Sep 2023 16:54:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAE6DF80005
	for <alsa-devel@alsa-project.org>; Fri, 22 Sep 2023 16:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAE6DF80005
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=SKR7MVfh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=FZylKUip
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4D9E41FF15;
	Fri, 22 Sep 2023 14:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1695394439;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LvTCQY7k7nnowMU+jFMv3KGql5NAe6iiCHB4NbReDmY=;
	b=SKR7MVfha8KJajqNoSIoNfuzDo8hA29XQ/OPGBmSR5QE5wuB1bKtn7LeHna2syllToMQ2y
	OrUWWAZgTvz6tvYfifsv0pR2cXJqxgU5JRbM5lUVbUX6f8ALdoEZg7aKigwWtuR2SECvhg
	RvsCFoM0OGYmK1p33U+SZciaxNVJSuM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1695394439;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LvTCQY7k7nnowMU+jFMv3KGql5NAe6iiCHB4NbReDmY=;
	b=FZylKUipWFEqof2WguB0WjdRSVSGARkDD7hgCucHlbOMzP/ATF1epoX6aS63BbWd3aUCjP
	9r4V4umJOUAw0wAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC01213478;
	Fri, 22 Sep 2023 14:53:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 7wa6NIaqDWV/DAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 22 Sep 2023 14:53:58 +0000
Date: Fri, 22 Sep 2023 16:53:58 +0200
Message-ID: <871qeqcl89.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>,
	'Jaroslav Kysela' <perex@perex.cz>,
	'Takashi Iwai' <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v1 0/2] ALSA: cs35l41: prevent old firmwares using
 unsupported commands
In-Reply-To: <8adda3b7-90f0-4d0b-b990-669a591becad@sirena.org.uk>
References: <20230922142818.2021103-1-sbinding@opensource.cirrus.com>
	<87a5tecm2m.wl-tiwai@suse.de>
	<005e01d9ed63$4b605550$e220fff0$@opensource.cirrus.com>
	<8adda3b7-90f0-4d0b-b990-669a591becad@sirena.org.uk>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: NDAJZ27PTA2V7RLE5RDO5DI4GFZXOEHQ
X-Message-ID-Hash: NDAJZ27PTA2V7RLE5RDO5DI4GFZXOEHQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NDAJZ27PTA2V7RLE5RDO5DI4GFZXOEHQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 22 Sep 2023 16:48:03 +0200,
Mark Brown wrote:
> 
> On Fri, Sep 22, 2023 at 03:44:30PM +0100, Stefan Binding wrote:
> 
> > > So those are fixes needed for 6.6 kernel?  Or they are something
> > new?
> 
> > These are to fix the issue that was reported on the Lenovo Legion 7
> > 16ACHg6,
> > which was introduced after the fixes to CS35L41 HDA System Suspend.
> 
> Could you be more specific about which fixes these are and which tree
> they're in?  If they're fixes then I don't have anything queued for 6.6
> so I'm confused about why you say there's a dependency on my tree.

Yeah.  The suspend fix has been landed in 6.6-rc1, so it's for 6.6, I
suppose.

Stefan, if it's a fix for a known commit, please put Fixes tag at the
next time.


thanks,

Takashi
