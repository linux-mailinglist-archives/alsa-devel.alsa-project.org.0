Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1203B2F1AED
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jan 2021 17:30:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A294171D;
	Mon, 11 Jan 2021 17:29:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A294171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610382615;
	bh=xvu1ayX5SPfcjTjctuKIvhJLfdlBnfy8gz+xG2ip0QQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QBsO/8+Sy+660RATRTwsLljDp1cbR9G1y9lKlrmDdLRKdTLrdROSefvmoaWRWdRUK
	 H7+yLw4nRSllwMxkN/lCWhU3mOehmpXhByhE87H9U+06n86JJXfyLrtY9EoIrfu/So
	 Ohgyd3ubYkHVAa+BJXda/TiUGDFA3LeaFLkFsPf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00BB6F8025F;
	Mon, 11 Jan 2021 17:28:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 668F1F80254; Mon, 11 Jan 2021 17:28:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E25AF8013D
 for <alsa-devel@alsa-project.org>; Mon, 11 Jan 2021 17:28:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E25AF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Bf64sETV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FAEC223E4;
 Mon, 11 Jan 2021 16:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610382492;
 bh=xvu1ayX5SPfcjTjctuKIvhJLfdlBnfy8gz+xG2ip0QQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Bf64sETVbsMGBZNuZP0H5kIqjjKr38NzuCZRdgSDVFQR7NzuM+2gyoSMMBm+Cjq49
 JZIHvoZENlAnUr9pB7aGHRxRmjXPZUyn1gwThFACT6GF9TvDCyP0u5BUXRaRwa2Pwn
 nUDmuktjH/XjNHry66JbQDTd8+cPekO8Hh4YxS2KNYiQNPhiriMe+8bhgtyLPYf+20
 1msnGKpZ+v0Y3yXyeaImIBQ4cu3Z5BIkM74bqeKVUG03n7ORciQT+55OQcpaVc8ozV
 N+ZYjG+sLS+/YHQi/jJZpuVLbnLCmyzdfN7m3a5ODqbUykOznWHf8MGmoN7IAm5+Nw
 KtSaAvYi/A2tw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, "shumingf@realtek.com" <shumingf@realtek.com>
In-Reply-To: <20210111092740.9128-1-shumingf@realtek.com>
References: <20210111092740.9128-1-shumingf@realtek.com>
Subject: Re: [PATCH 2/2] ASoC: rt5682: fix getting the wrong device id when
 the suspend_stress_test
Message-Id: <161038245912.32701.3133407557726476822.b4-ty@kernel.org>
Date: Mon, 11 Jan 2021 16:27:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, flove@realtek.com, naveen.m@intel.com,
 bard.liao@intel.com
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

On Mon, 11 Jan 2021 17:27:40 +0800, shumingf@realtek.com wrote:
> This patch will be the workaround to fix getting the wrong device ID on the rare chance.
> It seems like something unstable when the system resumes. e.g. the bus clock
> This patch tries to read the device ID to check several times.
> After the test, the driver will get the correct device ID the second time.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: rt5682: fix getting the wrong device id when the suspend_stress_test
      commit: 867f8d18df4f5ccd6c2daf4441a6adeca0b9725b

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
