Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE8359C668
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 20:33:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B79BA1637;
	Mon, 22 Aug 2022 20:32:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B79BA1637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661193181;
	bh=gfZjPJT5G7lpjIu/0Jy28SoaFgeZIqpxf0POXqDEnMQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qu877Rnob7YY2elDmPhQ0JjzLHJhnxVGaJUpgMCetI/GA+RU9+fgBdDKGDFz/ZRnt
	 bgMnITzUCo/feoMlDXpXyHNmthxhuIfzII5ADx8IAIRn2hWs+e3edxABJNgil/oEjv
	 eO48mva/rkcauCAt1uU0YLbPUgkfGQr0QMM9iS1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A373CF80517;
	Mon, 22 Aug 2022 20:32:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A48E2F80152; Mon, 22 Aug 2022 20:32:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2767BF80152
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 20:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2767BF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="V7UOEFle"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A6826090A;
 Mon, 22 Aug 2022 18:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBE0C433C1;
 Mon, 22 Aug 2022 18:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661193123;
 bh=gfZjPJT5G7lpjIu/0Jy28SoaFgeZIqpxf0POXqDEnMQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V7UOEFled3s96Est+17agM3GtQ6UvjepLkC8J4vcoBFlVFLEU/vF1CCXXIJTxb2aa
 s5ZiGbhY9yzE6XqyuTX8vZbpd0+xE1hubC7trUqz5Dz6UbCGzw6wFWn4k6xAXH6sQ9
 hFRgwGjcJ+gCg28wDCKYyDt5Qz2RX35oFlOYNjeRRG/I+ilCSEVqYMFHVzl6O0U81E
 YBGu9yeH+3wRhgj6ALfl0NkAOy6lPF+w71RbBBe91doRY+BTi8ZNl1Nz1Ac4YKJF2i
 x6nFfnPmb8QfrgcLvoUFOrW4VUv5c3vRjfwCRGhOzVdgjFucHliXFhap+VcfAYgs72
 Vi5NKaGikPFbg==
Date: Mon, 22 Aug 2022 11:32:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Message-ID: <YwPLoSWuYzsJ6Bhp@dev-arch.thelio-3990X>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
 <202208090909.Pg0BZGie-lkp@intel.com>
 <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
 <f8439531-897a-c25a-688b-be01290b006d@flatmax.com>
 <Yv0NLxzwqdBaZ3Jf@dev-arch.thelio-3990X>
 <YwPGQZHs1o0jsv2m@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YwPGQZHs1o0jsv2m@sirena.org.uk>
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, Matt Flax <flatmax@flatmax.com>
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

On Mon, Aug 22, 2022 at 07:09:05PM +0100, Mark Brown wrote:
> On Wed, Aug 17, 2022 at 08:45:51AM -0700, Nathan Chancellor wrote:
> > On Wed, Aug 17, 2022 at 03:44:33PM +1000, Matt Flax wrote:
> > > On 17/8/22 04:00, Nathan Chancellor wrote:
> 
> > > > In the final commit, there is a 'break' here. Should it be a 'return 0'
> > > > instead? Or should there be a different fix for these warnings?
> 
> > > The state of DIR PLL registers aren't important if the user doesn't specify
> > > a known mclk frequency.  The implication is that the DIR will not function,
> > > however that is already implied by the user lacking to specify a known mclk
> > > frequency.
> 
> > > The other functions on the chip (port A/B I2S, SRC, DIT, etc) will behave as
> > > per usual, only the DIR will be dysfunctional.
> 
> > So I suppose there is little point to all of the calls to regmap_write()
> > and regmap_update_bits() in the default case then, meaning a 'return 0'
> > would be appropriate? Sorry, I am having a hard time parsing what should
> > be done about the warnings, which are fatal for allmodconfig due to
> > CONFIG_WERROR.
> 
> Are either of you still looking at fixing this?

I sent https://lore.kernel.org/20220822183101.1115095-1-nathan@kernel.org/.

If that is not the right fix, I need some guidance on what it should be.

Cheers,
Nathan
