Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D5D5707D7
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 18:02:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60A74822;
	Mon, 11 Jul 2022 18:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60A74822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657555360;
	bh=zuh6kJICwJqVdtmkDlZ+pz4u83tBeJQW01/tZMII99Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JhSe+W7I3lM/ztAQcCWb7rRUBdeoDek42LN0V0wpRonB/9DqqWaYkQ1sT8kR2bA/e
	 MyKpEZ7Okreewn67rLu5vL8VapC1amQA681dPF7q+sHsJJFQFD2mTTKfcWItbCZ7z8
	 IKlrBRHid6PQ443gvIXCGXhjmv0F4/9zhxEiWHCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2B21F80256;
	Mon, 11 Jul 2022 18:01:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3338DF800E8; Mon, 11 Jul 2022 18:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0B92F800E8
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 18:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0B92F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jRnTsy+z"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DD0BDB81092;
 Mon, 11 Jul 2022 16:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329DBC34115;
 Mon, 11 Jul 2022 16:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657555289;
 bh=zuh6kJICwJqVdtmkDlZ+pz4u83tBeJQW01/tZMII99Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jRnTsy+zFVsX8NjdrrLm8mwT4tXl8Kf8/pGXyssG4JOdGQiourhoqjs2Kp72aae8c
 zt3oURuFLuixGvwp9yjZSYlW/logbElsBripUHoe+6XkDvai++LR8Omr9J7dvz6ApC
 E3nM6OK2KIy0oZ/GdEiKbAoxms+TaPyoFJi8UlvCeNQB1fD0JHw77fNFoEeKuBvPia
 uTG0Xq6/uwu1TWQTamzr/ZT49KPzkvuH/FaEcMAjKQZoyLGxqdAAy8psklxwBDK10I
 4Z9AaejREu7y6Rlvd6tSrRJLkVHqdB0JpmKfAJrysqPKlsTbzItMCHNQg1xnzpjclY
 d8bL2Go2PbEiQ==
From: Mark Brown <broonie@kernel.org>
To: amadeuszx.slawinski@linux.intel.com, oder_chiou@realtek.com
In-Reply-To: <20220707125701.3518263-1-amadeuszx.slawinski@linux.intel.com>
References: <20220707125701.3518263-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v2 0/5] ASoC: codecs: Series of fixes for realtek codecs
 used on RVPs
Message-Id: <165755528790.586142.14013777142744915340.b4-ty@kernel.org>
Date: Mon, 11 Jul 2022 17:01:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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

On Thu, 7 Jul 2022 14:56:56 +0200, Amadeusz Sławiński wrote:
> Our tests platforms do use realtek codecs, while implementing avs driver
> and machine boards for it, we identified some problems with those codec
> drivers.
> 
> This series aims to fix those issues.
> 
> Changes in v2:
>  - Drop patches which were merged from v1
>  - Drop patches changing IRQ behaviour
>  - Add patches to set component to NULL on remove - disabling IRQs
>    worked around the problem, so those patches weren't needed in earlier
>    series
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: codecs: rt298: Fix NULL jack in interrupt
      commit: 9b6803ec1fe0f10942b9297d2d60ec46f2999323
[2/5] ASoC: codecs: rt298: Fix jack detection
      commit: c0c5a242bba878b4d34f7c9612fd6cd6c404d414
[3/5] ASoC: codecs: rt286: Set component to NULL on remove
      commit: c1d7ebda11aae4659b665af61d7277dd351659b9
[4/5] ASoC: codecs: rt298: Set component to NULL on remove
      commit: af3b33b9707d453a12e0cf5ac35d7b97b3524ace
[5/5] ASoC: codecs: rt274: Set component to NULL on remove
      commit: b9f098aa7ae2a022dee06a8ca363e3e0e077f05a

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
