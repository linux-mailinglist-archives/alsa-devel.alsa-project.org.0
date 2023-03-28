Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6B56CEF0E
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:17:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96690E80;
	Wed, 29 Mar 2023 18:16:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96690E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680106629;
	bh=WhMijARNuctIfrKocK37YKWivpUcKt8fjECTBeSAA40=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NQQDNYpYUmFk2reHsabb+BS9olmMcMiGQsufvOYChE0zOH0JrKU+/9B72bV5l4RUM
	 SJ6JTiM2EmU76fUKe2d1cetLGh16yJ/URJ7evci4FTPC+cqMYHtM4lm+S2g3qAoCtH
	 dC5uVhJbsALChW6+gofERRe26ZaaOI+gEiJFUkMo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8BDAF80533;
	Wed, 29 Mar 2023 18:14:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E619FF80114; Tue, 28 Mar 2023 08:04:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-41.mta0.migadu.com (out-41.mta0.migadu.com
 [IPv6:2001:41d0:1004:224b::29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9235DF80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 07:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9235DF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=MOROOZPW
Date: Tue, 28 Mar 2023 07:59:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1679983160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GzZHCypCrHihtxhtaOoFXTCVEh91xd2+CUX2GOi1++0=;
	b=MOROOZPW8anQRQe6dJL28yQLXRTbsMu4nRBqsDgdw0XZlQ7Ux/s1xmjIHzfB/CcwEGM/+Y
	LirFAZn/tCHtxb+UDPn/xz0nkeqpw35pbWXCX8v0OHPheqczMmpNqfK7zMFVsrFXwkf8PU
	hco1BpLAKT0cZmCxyR559eGK0k8z6j8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Richard Leitner <richard.leitner@linux.dev>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 0/3] Add "mclk" support for maxim,max9867
Message-ID: <20230328055916.GA11037@g0hl1n.net>
References: <20230302-max9867-v2-0-fd2036d5e825@skidata.com>
 <167810953075.75807.14829875612499629879.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <167810953075.75807.14829875612499629879.b4-ty@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-MailFrom: richard.leitner@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VN3TKRYXO46DNOW3CDEGX74BA7E6W7CA
X-Message-ID-Hash: VN3TKRYXO46DNOW3CDEGX74BA7E6W7CA
X-Mailman-Approved-At: Wed, 29 Mar 2023 16:14:31 +0000
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Takashi Iwai <tiwai@suse.com>,
 Benjamin Bara <benjamin.bara@skidata.com>, Benjamin Bara <bbara93@gmail.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VN3TKRYXO46DNOW3CDEGX74BA7E6W7CA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark, Hi Krzysztof,

sorry for coming back to you on this series, but I have a question on
the "workflow"...

On Mon, Mar 06, 2023 at 01:32:10PM +0000, Mark Brown wrote:
> On Fri, 03 Mar 2023 11:04:00 +0100, richard.leitner@linux.dev wrote:
> > This series adds support for the clocks properties in the
> > maxim,max9867 bindings. Furthermore the binding definitions are
> > converted from txt to yaml.
> > 
> > The clock property is needed to define the mclk for one of our
> > boards which uses the the i.MX8MP SAI MCLK as clock for the
> > maxim,max9867.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/3] ASoC: dt-bindings: maxim,max9867: convert txt bindings to yaml
>       commit: 6668f70abeea30f4674b2fdbc4232d5c3611b272
> [2/3] ASoC: dt-bindings: maxim,max9867: add clocks property
>       commit: d63e55b3e8ec90da69107f32038f3059d7317cc5
> [3/3] ASoC: maxim,max9867: add "mclk" support
>       commit: 448b06ba107d925d59d02781acdd2e4ad12dda0b
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.

As Krzysztof requested some changes on the clocks property dt-bindings
patch (#2) commit message... How should I handle this?

The changes requested on the patch content (dts example) should be sent
as incremental patch to the original series, I guess?

see https://lore.kernel.org/lkml/45d306d3-8efb-12ac-0a83-f01ca2982b0a@linaro.org/

> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 

Thanks & regards;rl
