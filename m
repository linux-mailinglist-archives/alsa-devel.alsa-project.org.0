Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF577A61C0
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 13:54:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4764DF0;
	Tue, 19 Sep 2023 13:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4764DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695124477;
	bh=4YTf3X4hjuvkstDcAzFSOGk9Jz87WzN0w+ufxwEhcq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fV8z+ehcapWGVcaA+PNu1YwzaZqzx61N9aElliJyTuLncJwvNMUVAsoFFf5j+3EC4
	 1EjtWMaQ9aDEdXrMVD1ySMjXIsCqTNLGC0hYPh2ijRnfNH1nU8boJWhHZXg+WUaKZR
	 CyVMZVsOnC/vvbpuC3aYYXh6l6GOIQ7/WdNPNZRQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0ACB3F80552; Tue, 19 Sep 2023 13:53:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7592F801F5;
	Tue, 19 Sep 2023 13:53:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3D70F8025A; Tue, 19 Sep 2023 13:53:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABB5EF800F4
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 13:53:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABB5EF800F4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256
 header.s=meesny header.b=JVfvVWF3
Received: from hillosipuli.retiisi.eu
 (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Rqg6N0JTqzyWG;
	Tue, 19 Sep 2023 14:53:31 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1695124415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1ht4TYyMqtORFb+jrpIwatEN0+f4oqZUMY+pMT7/vwA=;
	b=JVfvVWF3ssTBxG4diRG2B64YM5PO8+4ld0NrjbCZ3w+ZD4COq/wU3B1QbvazHycywXM8P6
	TlskQlmOL6ietCo1sT86Kr7HIhtKQr/7sGwMjU+yAK3lMQ9M3SR91cM6sSM8Y3gd4Z0TCd
	7i20jaKpCUy1zlhJxpfsgEFBzuzRN38=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1695124415; a=rsa-sha256; cv=none;
	b=s0zYPpdyJ2gsZvItLn4pN5SKlhMV/BbrD68Yz+8kf7D7skiow/+jYIImZKB+iwCmFI1jIi
	pqHIPE+gorkqxHFJIO/0qbt676HNuZEiLHZw5XdEK9/HUcIiHRJ6uE1XyZ+4f90H2IzU9p
	fj4bUpnwoKSSFFhbBQChE8hpRTEi7DQ=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1695124415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1ht4TYyMqtORFb+jrpIwatEN0+f4oqZUMY+pMT7/vwA=;
	b=oIXFJn+l32e06PFaKnf9c1GOvRO5SY2JVZT2b3lHLDKsCC9936t4XzljiwceiORW/Dt9d3
	m7TjUQRxRFttD8YxO7ED6KOraN37K7QyZ4WwE5gz0ljSg4IAfq0TOvWnaKBZFD+h3X3NoV
	lS7xVXdR6YFbC729RK2zONasWrbcErQ=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0AC8A634C93;
	Tue, 19 Sep 2023 14:53:30 +0300 (EEST)
Date: Tue, 19 Sep 2023 11:53:30 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
	tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH v3 6/9] media: v4l2: Add audio capture and output
 support
Message-ID: <ZQmLuo5OwvttG0sR@valkosipuli.retiisi.eu>
References: <1694670845-17070-1-git-send-email-shengjiu.wang@nxp.com>
 <1694670845-17070-7-git-send-email-shengjiu.wang@nxp.com>
 <ZQLdxMaqFYUukt4J@valkosipuli.retiisi.eu>
 <CAA+D8AMB1zxSs_RgeoeUKxzWsNuEb0xANUZ0KxLX9UsQR8D=9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAA+D8AMB1zxSs_RgeoeUKxzWsNuEb0xANUZ0KxLX9UsQR8D=9Q@mail.gmail.com>
Message-ID-Hash: I6U6O3CZJ3VIOBLRP6NGPFFKJC7HPESD
X-Message-ID-Hash: I6U6O3CZJ3VIOBLRP6NGPFFKJC7HPESD
X-MailFrom: sakari.ailus@iki.fi
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I6U6O3CZJ3VIOBLRP6NGPFFKJC7HPESD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Shengjiu,

On Tue, Sep 19, 2023 at 06:31:09PM +0800, Shengjiu Wang wrote:

...

> > > +*************************
> > > +V4L2_AUDIO_FMT_LPCM ('LPCM')
> > > +*************************

Something to fix here, too...?

> > > +
> > > +Linear Pulse-Code Modulation (LPCM)
> > > +
> > > +
> > > +Description
> > > +===========
> > > +
> > > +This describes audio format used by the audio memory to memory driver.
> > > +
> > > +It contains the following fields:
> > > +
> > > +.. flat-table::
> > > +    :widths: 1 4
> > > +    :header-rows:  1
> > > +    :stub-columns: 0
> > > +
> > > +    * - Field
> > > +      - Description
> > > +    * - u32 samplerate;
> > > +      - which is the number of times per second that samples are taken.
> > > +    * - u32 sampleformat;
> > > +      - which determines the number of possible digital values that can be used to represent each sample
> >
> > 80 characters (or less) per line, please.
> 
> Ok, will change it.
> 
> >
> > Which values could this field have and what do they signify?
> 
> The values are SNDRV_PCM_FORMAT_S8, SNDRV_PCM_FORMAT_U8...
> which are the PCM format, defined in ALSA.

I suppose this is documented in ALSA documentation. Could you refer to
that?

> 
> >
> > > +    * - u32 channels;
> > > +      - channel number for each sample.
> >
> > I suppose the rest of the buffer would be samples? This should be
> > documented. I think there are also different ways the data could be
> > arrangeed and this needs to be documented, too.
> 
> All data in the buffer are the samples,  the 'samplerate', 'sampleformat'
> 'channels'  I list here is try to describe the samples.
> I was confused how to write this document, so I list the characters.

The layout of this data in memory needs to be documented. I think a
reference to ALSA documentation would be the best.

-- 
Regards,

Sakari Ailus
