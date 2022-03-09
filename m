Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 598494D334B
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 17:20:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C54AE1705;
	Wed,  9 Mar 2022 17:19:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C54AE1705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646842845;
	bh=fg3IFnsJFfDd1gxwFRGWd+tAbwJh/0zdk6z9RWnjDqA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uDg1hIiwcsIJY4MWeyNIUN+90CCQ8y1NP8acgPIHJ/w9pZzzzjPc0fB0su+a+/RYH
	 MEyFOjnLzoqVOCpS/H9xb4AvC8vAlwIlqc7cen2VHg/SfGlOxeO+F2egO+l7cJLG5m
	 vq2kIms9GSS9J6Kx53BaI8K3MXi3LiRh6onFkl38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28757F80236;
	Wed,  9 Mar 2022 17:19:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E1D5F8016C; Wed,  9 Mar 2022 17:19:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31249F800D2
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 17:19:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31249F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.b="jcRm9kij"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=C6/n0ZrR9zK0w+X6zEmOY3Yoka9sh8gy0v8jEkCxVM0=; b=jcRm9
 kijG8+vrjh62enKeAf0xrHMHEKBQlQXSoeBHCpx8oi19tOnyErNk8jyFl0Pl4EJi8YjihK/v7Sida
 c2Yi3KNHOoL1NE2KtaZTwQ5uvucLWA9wNHTTk6vcJ8+MP3MXZOJ6d535TgvSjDOmN1GyWiiFrmYIH
 zYrwaeUtM1rMePyAVAD350+y6z9c4px6rjU5M6UAhFv4ExYli0Bn9L8GYyPB64Um5V11we5kfRiY6
 eHOZ/6E3Zg7OsDEaa/u2yQ1r7d1nPwCVq3X7H0NrZRyfz2DBCHVdN/PQZBo5K6wh5Hv5XS/DLHFYJ
 6uPcXOREdAB6QiM+Q3CT+xrPmFY5A==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1nRz2D-0004Ud-2p; Wed, 09 Mar 2022 16:19:33 +0000
Date: Wed, 9 Mar 2022 16:19:31 +0000
From: John Keeping <john@metanate.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] ASoC: tas5805m: fix pdn polarity
Message-ID: <YijTk0/UTXpjFiRq@donbot>
References: <20220309135649.195277-1-john@metanate.com>
 <YijOHNT0eqDyoviP@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YijOHNT0eqDyoviP@sirena.org.uk>
X-Authenticated: YES
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Daniel Beer <daniel.beer@igorinstitute.com>, Takashi Iwai <tiwai@suse.com>,
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

On Wed, Mar 09, 2022 at 03:56:12PM +0000, Mark Brown wrote:
> On Wed, Mar 09, 2022 at 01:56:49PM +0000, John Keeping wrote:
> 
> > The binding defines the GPIO as "pdn-gpios" so when the GPIO is active
> > the expectation is that the power down signal is asserted and this is
> > how all other drivers using this GPIO name interpret the value.
> 
> > But the tas5805m driver inverts the sense from the normal expectation so
> > when the powerdown GPIO is logically asserted the chip is running.
> 
> > This is a new driver that is not yet in a released kernel and has no
> > in-tree users of the binding so fix the sense of the GPIO so that
> > logically asserted means that the device is powered down.
> 
> > - Rewrite commit message to make it more obvious that this is a change
> >   to the interpretation of the GPIO in the binding
> 
> I'm still not seeing the functional change here.  The actual state of
> the GPIO is identical in both cases, all that's changing is the logical
> view internally to the kernel.

Ah, sorry, I'm considering it functional since it changes the device
tree ABI.

Used with the same device tree with, say, GPIO_ACTIVE_HIGH the physical
state of the GPIO will change as a result of this patch and the device
tree needs to be updated to use GPIO_ACTIVE_LOW.
