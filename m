Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A2A509241
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 23:43:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46DED1B5C;
	Wed, 20 Apr 2022 23:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46DED1B5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650490996;
	bh=pF71VMayyryoyp9jgJoRbg+bg0B2Uk3dltg/2exZUhg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P8dVQ741CuFus9escR3iRECf+G3cRgXezWyN4I0Qd1rZ9xQ6uYLT4AfhDuHH2zVrz
	 iV8simKeCHvTF9bXXbKXkGJscJ8Js7GEBNq5HlqhOAeTK3+74hUIXxMT+4J3MS4rc6
	 eGxjvclBm4TH4H4NpaNCA8CoEiHZKczR5pecy5Og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70280F8052E;
	Wed, 20 Apr 2022 23:41:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C15CF8050F; Wed, 20 Apr 2022 23:41:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A566DF804FE
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 23:40:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A566DF804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lFc7x9Rx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 10B566197F;
 Wed, 20 Apr 2022 21:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F134C385A0;
 Wed, 20 Apr 2022 21:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650490855;
 bh=pF71VMayyryoyp9jgJoRbg+bg0B2Uk3dltg/2exZUhg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lFc7x9RxqD9kGfP1oRev4q76orJwO381Wzk/d1jX9L0HqgUZSWASk9LDTWMO/AodR
 tTsA8ZAl77TllPQS1ASdWhQ6wvJoqA69NTYcP0EL5HtVS8eDg6rnPdhMJLe2T8YAPR
 MRwb9pFDZvr5xw9LoDCmvtVoimNm2OtmFzya/X55cw4qIiILZvKYV5+o3TYZnXSsXJ
 4QeWe1ygLVoUSWa6fCda7pHLBvRZvyzOoTx7K5aN9yn1dFNAWlrmd3FkaE7AzWt42g
 yejpM0ncjwH0IAK6zWFgg7V8wyQRkTbxj+F9wkBome20U43hurrhUEB/l2meF7KL/X
 W9s+1mc8jddsA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20220406190056.233481-1-pierre-louis.bossart@linux.intel.com>
References: <20220406190056.233481-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: soc-pcm: improve BE state transitions
Message-Id: <165049085490.138067.16905252029264883162.b4-ty@kernel.org>
Date: Wed, 20 Apr 2022 22:40:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Wed, 6 Apr 2022 14:00:54 -0500, Pierre-Louis Bossart wrote:
> With additional tests with the introduction of a 'deep-buffer' PCM
> device mixed with the regular low-latency path, we came up with two
> improvements in the BE state machine and transitions. The short
> explanation is that the BE cannot directly use the trigger commands
> provided by the FE, and a translation is needed to deal with paused
> states.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: soc-pcm: improve BE transition for PAUSE_RELEASE
      commit: 9995c1d096c8ab1b5f1edc4141257719f6a53524
[2/2] ASoC: soc-pcm: improve BE transition for TRIGGER_START
      commit: 374b50e234a3e2f92bb881a814218f9740e85dcc

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
