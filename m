Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 855014B13D5
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 18:06:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CD951A60;
	Thu, 10 Feb 2022 18:05:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CD951A60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644512779;
	bh=LPif3g+zWERI+c5lBeHI9fWchCyyIczog95rqsWSZKs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VwyToNl3UAX7Je/zJF/PlBbATWKxlfxskEM0whkCzoYt+r7XroPcCsnz5KIrEHPoo
	 aH0WadrIXHDzvQrxT7ndWLpSnWxrJbm0KWfrjiVh9rErO4xINgE9ZDmzc0MRKAhs7H
	 ub955iY7Eh3ZL395eUBqZ/GtAnABl2tjgsZQYaFU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97CD3F80302;
	Thu, 10 Feb 2022 18:05:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B37F7F8028B; Thu, 10 Feb 2022 18:05:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EA1FF80054
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 18:05:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EA1FF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="d7Re5YTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1644512706;
 x=1676048706; h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=o3TSbCbT4nUfOsYtaYmfyDrx/le8KhTL6Jy0Io6SBlY=;
 b=d7Re5YTLa99/4rqhoYJ5dk1UPq+wFKFJjQPFE5RS0HgcyHP7xghH+ORj
 VkLu4jvVsQG2Y6k94mxe6cPF1qc8q111PA0m6UHAzAjX67T7EjMcAsxGB
 OMZJfuazmzvXsxAw1NEYpwGZpL3ITOjA/9upkTHwf99OhzI4mDm4F5RR1
 Q+nn2eeuWBC6Tm8QjTd7zl4nEgtgMKQkFqrCxSh1v1UB/zTmgfBn+eOXB
 EXW6dD/okraM+Z23jM9bWEI1pDbmVQtFy4C1ViwOZ2Y+KudNG1ubiVIaq
 YjlKIE/3yRZQpuwfDwe5dKynfE2niLbcMfaeHPs1Lipt+RXWumLjZYBvB A==;
Date: Thu, 10 Feb 2022 18:04:58 +0100
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: tlv320adc3xxx: Add IIR filter configuration
In-Reply-To: <YgP6ZSqpJQwRoMLE@sirena.org.uk>
Message-ID: <alpine.DEB.2.21.2202101804140.7068@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.21.2202071806580.31604@lnxricardw1.se.axis.com>
 <YgK81R6ipwLagmoE@sirena.org.uk>
 <alpine.DEB.2.21.2202091518030.21772@lnxricardw1.se.axis.com>
 <YgPkX4UaYa0jyo6K@sirena.org.uk>
 <alpine.DEB.2.21.2202091803550.21772@lnxricardw1.se.axis.com>
 <YgP6ZSqpJQwRoMLE@sirena.org.uk>
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

> > In this case it was the ADAU1761 driver and it was several years ago
> > and I don't know if it still is an issue. Basically the sequence was 
> > something like:
> 
> > - System boots up.
> > - Codec is configured (I think it was the sample rate, but it could have 
> >   been the format or some other I2S parameter) to something that is non 
> >   default.
> > - System reboots. Since the codec has no means of getting reset, it
> >   retains all its register values.
> > - This time, an attempt is made to configure the codec with the default
> >   sample rate. Since the driver believes the default is already set
> >   it does not attempt to write anything, although looking at 
> >   regmap_write() now I'm not sure how this could be the case.
> 
> update_bits() could also trigger this if it thinks the value didn't
> change, but that's at a higher level before it ever gets as far as
> trying to do the write and unrelated to the cache (it will also
> suppress redundant writes with no cache present).

Right, that sound even more familiar.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
