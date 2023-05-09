Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F6A6FBF68
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 08:41:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2722114A;
	Tue,  9 May 2023 08:40:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2722114A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683614474;
	bh=wNzKQRvFcfMVUIvv9+cNT/9rkrHms8a9kZvsENS9+os=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R97L6BYIPNsMdeIJKJJYIeJLPU3rYfCxQv+Yxg5JMd9RyN4GD8VIb7CKvnAiNGbAd
	 JpdEaiictYGJFAuZp5TR1KJjwZHJnNQhiREnX6MRDUpp20ZUMO8IOg3/2qe3OTmABr
	 m4GUXs14TDvyfE8Mp3emaS7TtpS4aqRGR2ub2YYQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E51F2F80563;
	Tue,  9 May 2023 08:39:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A66CCF80548; Tue,  9 May 2023 08:39:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D652FF8052E
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 08:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D652FF8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OUl0rrj9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C70A962E92;
	Tue,  9 May 2023 06:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B35C433EF;
	Tue,  9 May 2023 06:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683614335;
	bh=wNzKQRvFcfMVUIvv9+cNT/9rkrHms8a9kZvsENS9+os=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OUl0rrj95UTRGzGCvWR57cGDl6SRnVxV7IYotdf1W75dAYG+/HRYqZ+6llpb43EuN
	 P1Xu2xV7SZidT66XI0KjGv4+JN3SLF4RxkDhF9lXIJ1y7P1XBCj+XVxi8fqdUoj9GO
	 JxBynGXAP3HqhP137wy0wE4OfHFTjAQ2IFxGPQZU4FL7LRjCSirJtbbEfIdnyJvdtt
	 wLLOBhhc/q8GNQUee6vh2l9dkBkumyr+cwWoF+t707RYcmZWoKEroOxHktSNJ5CMbJ
	 NK5oQHKqDVt3lGxlOI3Nk6wunbTRUnChQBdOjtDUO+oP/Ko505uNU1bnfPe6GPEi68
	 G0EQSLnXORCEg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Yang Li <yang.lee@linux.alibaba.com>
In-Reply-To: <20230505004538.70270-1-yang.lee@linux.alibaba.com>
References: <20230505004538.70270-1-yang.lee@linux.alibaba.com>
Subject: Re: [PATCH -next] ASoC: codecs: wcd938x: Remove unneeded semicolon
Message-Id: <168361433237.303059.8240679146907792775.b4-ty@kernel.org>
Date: Tue, 09 May 2023 15:38:52 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: MD57PGWDMZYE6RCNP3AXY7IER3ZDMUBA
X-Message-ID-Hash: MD57PGWDMZYE6RCNP3AXY7IER3ZDMUBA
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Abaci Robot <abaci@linux.alibaba.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MD57PGWDMZYE6RCNP3AXY7IER3ZDMUBA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 05 May 2023 08:45:38 +0800, Yang Li wrote:
> ./sound/soc/codecs/wcd938x-sdw.c:1274:2-3: Unneeded semicolon
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wcd938x: Remove unneeded semicolon
      commit: 101b23830d3c26e9549274d16e8d4542c8bce4af

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

