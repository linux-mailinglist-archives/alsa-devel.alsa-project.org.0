Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E67D745D23
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jul 2023 15:26:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D99A20C;
	Mon,  3 Jul 2023 15:25:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D99A20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688390764;
	bh=9CLrsahvoROX7e6wHLDwzEZz6n/a/K8cEFgt6x7hXUg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k4iCU++XT4gZPcR04Xso4G4poPgzaTZoArjWnM77FPASmFdQS5kO5c25ZB2Rz2BFA
	 28Dqi1adVwwGVKRIcGsd3NZj6ciiSPl2bgAJcYE8JAN02sRKl/qRcbQQri2l+SJeWk
	 bWMWjbeRrXQ+acOOlOWTUI34dLxoWftvmBPbHiPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE8D0F80535; Mon,  3 Jul 2023 15:25:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4387DF80124;
	Mon,  3 Jul 2023 15:25:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EB4EF80125; Mon,  3 Jul 2023 15:25:09 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 97F77F80100
	for <alsa-devel@alsa-project.org>; Mon,  3 Jul 2023 15:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97F77F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=F05OyKor;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tuFNu4N3
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8851A219D0;
	Mon,  3 Jul 2023 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1688390705;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pecUI4xOagetnVa0y89RSrIZk+VfXoyy55j+EXMIhrE=;
	b=F05OyKorIVsZtJqSMTMTx2t4OhAdEC/+OO3iv9HroaH4bvA/CM8OMjuNHFZ2+GEHEXkgqH
	uFTcf7/rSKY7BW3dM7dhnk9sWJ+2GIYX9wQmt+rLnjVoSivGha8kzGX57U01sopLZEhHYB
	IXoW6+Ab60AQaXMd1aiGey/SEvhI804=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688390705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pecUI4xOagetnVa0y89RSrIZk+VfXoyy55j+EXMIhrE=;
	b=tuFNu4N3pjt+/HNuE1JNIS8OM3bR2Y7JFd2FQpVfNUN1FcT+bRDEe+pgdO0Pspz50R1ewD
	rihp3pAoxFfHeaBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA3A6138FC;
	Mon,  3 Jul 2023 13:25:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 1n/1NzDMomQMGAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 03 Jul 2023 13:25:04 +0000
Date: Mon, 03 Jul 2023 15:25:04 +0200
Message-ID: <8735255dqn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH 1/6] media: v4l2: Add audio capture and output support
In-Reply-To: <d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl>
References: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
	<1688002673-28493-2-git-send-email-shengjiu.wang@nxp.com>
	<ZJ6o5fT4V4HXivFa@valkosipuli.retiisi.eu>
	<CAA+D8AND1yZ7eZLjBGxVF=i3hLMecUm-j7AVHN9npJi-4=3VrA@mail.gmail.com>
	<87h6ql5hch.wl-tiwai@suse.de>
	<43f0ecdf-7454-49ae-96b3-2eae5487e9a5@sirena.org.uk>
	<d78e6ec3-a531-8fd4-a785-29b6712f83ae@xs4all.nl>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EVTRQFIJMLCCZ4XVC2SR6HB577VQ2HZ4
X-Message-ID-Hash: EVTRQFIJMLCCZ4XVC2SR6HB577VQ2HZ4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EVTRQFIJMLCCZ4XVC2SR6HB577VQ2HZ4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Jul 2023 15:12:55 +0200,
Hans Verkuil wrote:
> 
> On 03/07/2023 14:53, Mark Brown wrote:
> > On Mon, Jul 03, 2023 at 02:07:10PM +0200, Takashi Iwai wrote:
> >> Shengjiu Wang wrote:
> > 
> >>> There is no such memory to memory interface defined in ALSA.  Seems
> >>> ALSA is not designed for M2M cases.
> > 
> >> There is no restriction to implement memory-to-memory capture in ALSA
> >> framework.  It'd be a matter of the setup of PCM capture source, and
> >> you can create a corresponding kcontrol element to switch the mode or
> >> assign a dedicated PCM substream, for example.  It's just that there
> >> was little demand for that.
> > 
> > Yeah, it's not a terrible idea.  We might use it more if we ever get
> > better support for DSP audio, routing between the DSP and external
> > devices if driven from the CPU would be a memory to memory thing.
> > 
> >> I'm not much against adding the audio capture feature to V4L2,
> >> though, if it really makes sense.  But creating a crafted /dev/audio*
> >> doesn't look like a great idea to me, at least.
> > 
> > I've still not looked at the code at all.
> 
> My main concern is that these cross-subsystem drivers are a pain to
> maintain. So there have to be good reasons to do this.
> 
> Also it is kind of weird to have to use the V4L2 API in userspace to
> deal with a specific audio conversion. Quite unexpected.
> 
> But in the end, that's a decision I can't make.
> 
> So I wait for that feedback. Note that if the decision is made that this
> can use V4L2, then there is quite a lot more that needs to be done:
> documentation, new compliance tests, etc. It's adding a new API, and that
> comes with additional work...

All agreed.  Especially in this case, it doesn't have to be in V4L2
API, as it seems.

(Though, the support of audio on V4L2 might be useful if it's closely
tied with the a stream.  But that's another story.)


thanks,

Takashi
