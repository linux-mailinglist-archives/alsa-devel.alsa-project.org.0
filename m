Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BC776CC4F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 14:09:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA7181E7;
	Wed,  2 Aug 2023 14:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA7181E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690978175;
	bh=whQlH0dOc48bO3JEIL0F7sPMnnLRJntQO65G1/ZHeWQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nqXZVBgX05wLlvCWOfnaLOGC3Vqb3wGog9KuA/LmAggU9ZMuhFLZNNQz4sz4UqUp3
	 urBfZ7oZIofp/++t4P/uhF8UfYZHGt7llBsUjrzDkeSp+tkf3+fi23SvWbUHKCmVLb
	 actJhnLDNbFVbou2M1si86VeCfvOE6Y+qWRODpHo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41235F80535; Wed,  2 Aug 2023 14:08:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0909EF801D5;
	Wed,  2 Aug 2023 14:08:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F0C17F8025A; Wed,  2 Aug 2023 14:08:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 17702F80149
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 14:08:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17702F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=AXjMJDzt;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=a5+VLwV3
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 122E81F38D;
	Wed,  2 Aug 2023 12:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690978116;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxPHjo3+ia+QJjBrjbeie8E5g2hZQ55e92AAzrGOhEI=;
	b=AXjMJDzt8LQ5Aws+NBUjfUEoMB9Yz7f6O0HMW0it0ifUd7WEIaIHEP4qncTGjhhD6EDoxb
	F7gnLl+5o8NiHW19hpC3ep6emXodiyGqOw2WhbgfiVBTf4qGBKd7jTJ1qGRp85rauiY6Oa
	d1aiZV+hUmtFcwdfyiPu5SoMzIcBsZw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690978116;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxPHjo3+ia+QJjBrjbeie8E5g2hZQ55e92AAzrGOhEI=;
	b=a5+VLwV3cvmphzmj2zlwrNKt4nmwdNbp2bySub5cb7YvNuOmBZ5b0GmUbqi8u7jfqmS9X0
	to8kobwjwCyaFLAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB90A13909;
	Wed,  2 Aug 2023 12:08:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id WG4jNUNHymR8PwAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 02 Aug 2023 12:08:35 +0000
Date: Wed, 02 Aug 2023 14:08:35 +0200
Message-ID: <87il9xoddo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	sakari.ailus@iki.fi,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v2 0/7] Add audio support in v4l2 framework
In-Reply-To: 
 <CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
References: <1690265540-25999-1-git-send-email-shengjiu.wang@nxp.com>
	<47d66c28-1eb2-07f5-d6f9-779d675aefe8@xs4all.nl>
	<87il9xu1ro.wl-tiwai@suse.de>
	<CAA+D8ANmBKMp_L2GS=Lp-saMQKja6L4E6No3yP-e=a5YQBD_jQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CSGO3GYA4VB3EKOOAFRIW3WLKDWVJ6WL
X-Message-ID-Hash: CSGO3GYA4VB3EKOOAFRIW3WLKDWVJ6WL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CSGO3GYA4VB3EKOOAFRIW3WLKDWVJ6WL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 02 Aug 2023 14:02:29 +0200,
Shengjiu Wang wrote:
> 
> On Wed, Aug 2, 2023 at 7:22 PM Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Wed, 02 Aug 2023 09:32:37 +0200,
> > Hans Verkuil wrote:
> > >
> > > Hi all,
> > >
> > > On 25/07/2023 08:12, Shengjiu Wang wrote:
> > > > Audio signal processing has the requirement for memory to
> > > > memory similar as Video.
> > > >
> > > > This patch is to add this support in v4l2 framework, defined
> > > > new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
> > > > V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
> > > > for audio case usage.
> > > >
> > > > The created audio device is named "/dev/audioX".
> > > >
> > > > And add memory to memory support for two kinds of i.MX ASRC
> > > > module
> > >
> > > Before I spend time on this: are the audio maintainers OK with doing
> > > this in V4L2?
> > >
> > > I do want to have a clear statement on this as it is not something I
> > > can decide.
> >
> > Well, I personally don't mind to have some audio capability in v4l2
> > layer.  But, the only uncertain thing for now is whether this is a
> > must-have or not.
> >
> 
> Thanks,  I am also not sure about this.  I am also confused that why
> there is no m2m implementation for audio in the kernel.  Audio also
> has similar decoder encoder post-processing as video.
> 
> >
> > IIRC, the implementation in the sound driver side was never done just
> > because there was no similar implementation?  If so, and if the
> > extension to the v4l2 core layer is needed, shouldn't it be more
> > considered for the possible other route?
> >
> 
> Actually I'd like someone could point me to the other route. I'd like to
> try.
> 
> The reason why I select to extend v4l2 for such audio usage is that v4l2
> looks best for this audio m2m implementation.  v4l2 is designed for m2m
> usage.  if we need implement another 'route',  I don't think it can do better
> that v4l2.
> 
> I appreciate that someone can share his ideas or doable solutions.
> And please don't ignore my request, ignore my patch.

Can you explain a bit more details of your demand?
At least, a "big picture" showing how your hardware is implemented and
what is exactly necessary would be helpful for understanding the
problem.


thanks,

Takashi
