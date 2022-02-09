Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE29C4AF7F6
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Feb 2022 18:21:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5018F18C5;
	Wed,  9 Feb 2022 18:20:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5018F18C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644427285;
	bh=LRZKvcwRS7VwhUBCPgKP6Vu+fDnrRrpNU46LxrM8iVA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h/vbSAAkcLHrcB6RjL1lylo77UPlh+3pw6oYMK0cDArrVGm9Ji2qkZTVsE7NETAjY
	 VJzVfRQKg3xQDdfgzn0WWyX75+fqHhOxBSPUw5mHgTHexCUVd0izv48ZVxaZUiTJEj
	 TTQAoWpKXV7agz9TKAy9aQvTDASdmvRxGcxY22Wk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B00E5F8016B;
	Wed,  9 Feb 2022 18:20:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F06AF8016A; Wed,  9 Feb 2022 18:20:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AE22F800ED
 for <alsa-devel@alsa-project.org>; Wed,  9 Feb 2022 18:20:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AE22F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="UVHxsZJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1644427211;
 x=1675963211; h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=ZyPDtwYnBZtr+r3B3XVUonvi+pSwueSjBCEanvvBJrg=;
 b=UVHxsZJQYKGlE4KI4U3PvKJyvSTgC6Ue1+v1iY9hi3uliwFa9T8/b7Kd
 B/pjoZIFxW3JCVuj4yIGpR0DCDLJyUPS91RtnogZihhyctK55nZs0rtTK
 DSiDkoTH970Y85B1TOa5wXo49Z4AcubuQHM3qpWPSWVrtWSWvBPoTPCR7
 1524GWq67JfAJl0GsKpKkmWEwxZyTqTVGeaXJ1jpX1uZJ8GukhotnJK35
 gZXs5ebN5sQk5Xr/jMMqkk03Kq/cwOk4hrtDYU0T8LGCdL3uERX/LRMSe
 J+snqLQx+/UDM6xapW8Gpc33bDmxX/kYzw+YE0PezjlpNnimTZCAA6cIS g==;
Date: Wed, 9 Feb 2022 18:20:00 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: tlv320adc3xxx: Add IIR filter configuration
In-Reply-To: <YgPkX4UaYa0jyo6K@sirena.org.uk>
Message-ID: <alpine.DEB.2.21.2202091803550.21772@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.21.2202071806580.31604@lnxricardw1.se.axis.com>
 <YgK81R6ipwLagmoE@sirena.org.uk>
 <alpine.DEB.2.21.2202091518030.21772@lnxricardw1.se.axis.com>
 <YgPkX4UaYa0jyo6K@sirena.org.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail06w.axis.com (10.20.40.12) To se-mail07w.axis.com
 (10.20.40.13)
Cc: alsa-devel <alsa-devel@alsa-project.org>, kernel@axis.com,
 Liam Girdwood <lgirdwood@gmail.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Wed, 9 Feb 2022, Mark Brown wrote:

> > Isn't one consequence of caching that writing to a register which is known 
> > to already have the value to be written are simply skipped? 
> 
> No, look at the code for regmap_write().

Thanks. Good. Should have checked. I had the case previosly described 
deeply ingrained in my mind since it was an elusive issue at the time.

> > I remember having that problem with a codec which did not have any means 
> > of resetting the codec other than power-on-reset (i.e. no reset pin or 
> > software controlled reset). If the system was rebooted without cycling the 
> > power, the registers would potentially contain non-default values, and 
> > this meant that for instance attempting to explicitly set the sample rate 
> > to the default value was not possible, as the regcache assumed that the 
> > default value was already set and thus skipped the corresponding register 
> 
> This is during a cache sync, a sync will only write out non-default
> values if the device was flagged as having been reset in order to reduce
> power on times.  Your driver is not doing a cache sync at any point so
> won't be affected by this, but in any case...
> 
> > write. (A workaround was to write another sample rate and then default).
> 
> If your driver has no way of ensuring that the device has default
> register values your driver should just not specify any register
> defaults, but in this case it sounds like you have some other bug going
> on.  If the device is getting suspended with a default value set in the
> registers then comes out of suspend with a non-default value it's hard
> to see how that could happen in the hardware, either the device will
> retain the value it had or it will reset to power on default but either
> way it's the same value.  I have seen drivers bypassing the cache for a
> shutdown sequence that wrote non-default values to the hardware without
> updating the cache.

In this case it was the ADAU1761 driver and it was several years ago
and I don't know if it still is an issue. Basically the sequence was 
something like:

- System boots up.
- Codec is configured (I think it was the sample rate, but it could have 
  been the format or some other I2S parameter) to something that is non 
  default.
- System reboots. Since the codec has no means of getting reset, it
  retains all its register values.
- This time, an attempt is made to configure the codec with the default
  sample rate. Since the driver believes the default is already set
  it does not attempt to write anything, although looking at 
  regmap_write() now I'm not sure how this could be the case.
- When codec is started, the sample rate / format / whatever is wrong
  compared to what was allegedly set up.

It was all rather academic, because the above sequence only occurred in 
the lab under manual control; in the actual production code the same 
format and sample rate was used every time, so it wasn't an issue that was 
pressing to fix. It could as you said have been a bug somewhere else. I 
distinctly remember the last point about the codec running in seemingly 
the wrong mode after a (power-cycle-less) reboot at any rate.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
