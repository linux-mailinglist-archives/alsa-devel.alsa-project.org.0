Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EF452F139
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 19:00:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A5C21757;
	Fri, 20 May 2022 18:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A5C21757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653066039;
	bh=gCn6MbY4/KVXMX30aPGTFXOtFXjbGRQ1q6L9baXlwQM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q6zA3Wm+q+Jq5FcPXOFXeymezCUvjOZuB8oINFZe8SjeeDKYaj19VVLWPVyTDvSOL
	 VdWQdmhtww2hjn4aZCQEGDGE8B00t31sGal6deZ6hL0ec+ZtnUfoDeWeNAWGFUQHm5
	 wlbwv4RdRHm08ta0Lj6efmoGSkTAS4gCWh0Mw2MI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F1C7F8051C;
	Fri, 20 May 2022 18:59:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F724F8051B; Fri, 20 May 2022 18:59:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2547F801F5
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 18:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2547F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HqqrloOU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 908AEB82CCA;
 Fri, 20 May 2022 16:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB40C385A9;
 Fri, 20 May 2022 16:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653065933;
 bh=gCn6MbY4/KVXMX30aPGTFXOtFXjbGRQ1q6L9baXlwQM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HqqrloOUg0BSmFjbmdTMi58NOw+U5joCBXA5kUnJ+nx1n6sbs44TmQZL1vXk71MOL
 f+pbRhhcydOmCTSajKoHw7TP5HrVdUDBgcdpEfcn+KtoOylHen7aaqZiTRaUcbdWVN
 m7XzuKgB7JG9J5YMoI6HuPaYNrq3OuvIX76vm4IKuQ2VavXP5n4ZW0g1gpuvnc2FNr
 Jxbf+i1SARBsu3PFOUuHEAW9+IHgq0eXPCUgtyTzhF2sxAwLan5ydgtSOZKOi6VptG
 /i/99r/Frtb+EaECjbDnKkdHXUUBrEfOFWHCNgSA9Gb0MJHMJpeQK/dHiaCYSVgm5J
 T5AHaE7IjyH1w==
From: Mark Brown <broonie@kernel.org>
To: shumingf@realtek.com, lgirdwood@gmail.com
In-Reply-To: <20220520090205.25857-1-shumingf@realtek.com>
References: <20220520090205.25857-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt1308-sdw: add the default value of register 0xc320
Message-Id: <165306593116.462688.8020360195712648118.b4-ty@kernel.org>
Date: Fri, 20 May 2022 17:58:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, derek.fang@realtek.com, bard.liao@intel.com,
 flove@realtek.com, pierre-louis.bossart@intel.com
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

On Fri, 20 May 2022 17:02:05 +0800, shumingf@realtek.com wrote:
> From: Shuming Fan <shumingf@realtek.com>
> 
> The driver missed the default value of register 0xc320.
> This patch adds that default value to avoid the error messages
> when the driver went to suspend mode already.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1308-sdw: add the default value of register 0xc320
      commit: affa9983e7cbac8cbe2596975efacdbdf0eb18e9

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
