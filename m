Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA3197A258
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2024 14:31:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDED8E82;
	Mon, 16 Sep 2024 14:31:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDED8E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726489876;
	bh=XlofpYMtyVQKy2CQEZ9vtgpMy0tI2NYSeC/qF+i14OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pyEe1HrXb7XLBl/caa5eSVcXJtO9el5iWpdGxrMaEFyC8762VwFCAFKklxq0/ruKm
	 Z2zOn7ECzpUR8YgkQjJobA3aVfAnl3r4U3Vq6foOuHrODYgGXgcRGwFW1WNWwXFNJC
	 ngUaGmFu4Kk2UfLb/O0d/AvThH7jy/MExvn8t3+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F248EF805B4; Mon, 16 Sep 2024 14:30:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 582A1F805AA;
	Mon, 16 Sep 2024 14:30:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B252F8020D; Mon, 16 Sep 2024 14:30:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85EC8F80074
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 14:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85EC8F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=pzyO8VcD
Received: by mail.gandi.net (Postfix) with ESMTPSA id 649CCE0002;
	Mon, 16 Sep 2024 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726489847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tFf33Dr3Av9cjGRxcivDJ7jSpxWV5p1tiUMWvEOn8Fs=;
	b=pzyO8VcD5eOWNbaF6y5cYWnDO6KCPDjbQFX46CYw8eVowhXH+FOzUJRqgXamOzGtfCk8o+
	l9agNcz7sCkPqj9f/VpFUBciP8le0nMok+7c6gWmjxRoAVSTt5kS+pGT4DyJAm4nq1qzvU
	YPXxSOLi6bDJIb75NFS3QBdz7qsJ/4ghANlb+/daht7GxJIbeEL8eFZKQrqeJeXqlGRd1r
	acaUGZhe1/4tJf2C16Y3y06gDaX1e6g14hbOhuwFAOxW4BsuzFBRK6GeLMsulNNu15tItF
	f6DnNB9CfFndwYLdF8aeREWLYE9slv6onfb91NryaQQJpTZi2/SnDrgLwzEEBg==
Date: Mon, 16 Sep 2024 14:30:45 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andrei Simion <andrei.simion@microchip.com>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
	claudiu.beznea@tuxon.dev, codrin.ciubotariu@microchip.com,
	lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	nicolas.ferre@microchip.com, perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH 2/2] ASoC: atmel: atmel_ssc_dai: Drop S24_LE support due
 to single channel limitation
Message-ID: <2024091612304529f5ebe1@mail.local>
References: <20240916100006f2db7b06@mail.local>
 <20240916113203.17871-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916113203.17871-1-andrei.simion@microchip.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
Message-ID-Hash: 56MOHOV2MKIRBKKTZ4Q52SN7VPRJIXKO
X-Message-ID-Hash: 56MOHOV2MKIRBKKTZ4Q52SN7VPRJIXKO
X-MailFrom: alexandre.belloni@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/56MOHOV2MKIRBKKTZ4Q52SN7VPRJIXKO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/09/2024 14:32:05+0300, Andrei Simion wrote:
> On 16.09.2024 12:59, Alexandre Belloni wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 16/09/2024 11:52:15+0300, Andrei Simion wrote:
> >> From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> >>
> >> Drop S24_LE format because it is not supported if more than 2 channels
> >> (of TDM slots) are used. This limitation makes it impractical for use cases
> >> requiring more than 2 TDM slots, leading to potential issues in
> >> multi-channel configurations.
> >>
> >> [andrei.simion@microchip.com: Reword the commit title and the commit
> >> message.]
> >>
> >> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> >> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> >> ---
> >>  sound/soc/atmel/atmel_ssc_dai.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
> >> index 7047f17fe7a8..475e7579c64c 100644
> >> --- a/sound/soc/atmel/atmel_ssc_dai.c
> >> +++ b/sound/soc/atmel/atmel_ssc_dai.c
> >> @@ -822,7 +822,7 @@ static int atmel_ssc_resume(struct snd_soc_component *component)
> >>  }
> >>
> >>  #define ATMEL_SSC_FORMATS (SNDRV_PCM_FMTBIT_S8     | SNDRV_PCM_FMTBIT_S16_LE |\
> >> -                       SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
> >> +                        SNDRV_PCM_FMTBIT_S32_LE)
> >
> > I believe this requires a comment. Else someone may add it back later
> > on.
> >
> 
> It is unclear to me. Would it be good to send v2 with this update?
> 

Yes, please send a new version. My point is that it is explained in the
commit log. This is fine when you are adding something because then
people will easily use git blame and find the commit and log. However,
because you are removing code, it is not obvious there is a reason why
it isn't there;

> >>
> >>  static const struct snd_soc_dai_ops atmel_ssc_dai_ops = {
> >>       .startup        = atmel_ssc_startup,
> >> --
> >> 2.34.1
> >>
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> 
> Best regards,
> Andrei Simion

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
