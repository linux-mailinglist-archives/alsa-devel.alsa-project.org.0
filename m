Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF63F89FA
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 16:18:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C842516C3;
	Thu, 26 Aug 2021 16:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C842516C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629987488;
	bh=7pq1u4/Atbx0cmAC/gh6HFySRRvxLwwcOzRTNjLv0PE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oPKb4xAxpDLW1dQ6uu2NsAv/rh1Er5TfA9HMPJyiqBoUOfOdqT11LXbr7tbfLtrHX
	 fvCHvasphkLsrodxwbk2dJHVBwqw6LcSatG/QV/iLtB4jD1JjAiPkIwsucA2Yw+JTj
	 PoasQw/lj1FQBwEiiT8nb5p7yLwOw8T7iXTBewow=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B663BF804B4;
	Thu, 26 Aug 2021 16:16:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9BFEF801D8; Thu, 26 Aug 2021 16:16:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2AE0CF800FD
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 16:16:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AE0CF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VkOpy1kK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4CAF560E90;
 Thu, 26 Aug 2021 14:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629987379;
 bh=7pq1u4/Atbx0cmAC/gh6HFySRRvxLwwcOzRTNjLv0PE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VkOpy1kKEPF/UBvPPeB+yv01g2UJY/wDAVuji11aEf7mpMt8W6UDJRoT7rxwuVHaM
 /t38hFwkjrxE62uhQRV/x7wxTzW9hZT5hinC6LHJ/rDX/nU7h1weK17+DovH9pGcBn
 L8HohFabGcJIOCqzNlCyiUdyYQQzKFOTHunwIFWc5CQdbtZSM5zGf5V86nkEMMWmZk
 vujYdzln/ialJhvXIaxQDWBE8bEBEXir8zUlXzPHWsSXR0wPYE31LHAtABL1UEeu1X
 gc5AH8Mjl55ML3WOqrM8OmOe4vBnQMKbPRGevWIBITBlkOX900Hlib4/ozK5Wv3YGj
 uCs2FdSdZ7QdA==
From: Mark Brown <broonie@kernel.org>
To: heiko@sntech.de,
	Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: Re: (subset) [PATCH v3 0/14] Patches to update for rockchip i2s
Date: Thu, 26 Aug 2021 15:15:44 +0100
Message-Id: <162998707937.5647.16412877707086770642.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1629950441-14118-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1629950441-14118-1-git-send-email-sugar.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org
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

On Thu, 26 Aug 2021 12:00:41 +0800, Sugar Zhang wrote:
> These patches fixup or update for rockchip i2s.
> 
> Changes in v3:
> - Drop property 'rockchip,playback-only', 'rockchip,capture-only'.
>   Implement it by 'dma-names' of DT instead.
> 
> Changes in v2:
> - split property trcm into single 'trcm-sync-tx-only' and
>   'trcm-sync-rx-only' suggested by Nicolas.
> - split property trcm into single 'trcm-sync-tx-only' and
>   'trcm-sync-rx-only' suggested by Nicolas.
> - drop change-id
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/14] ASoC: rockchip: i2s: Add support for set bclk ratio
        commit: ebfea67125767a779af63ae6de176709713c8826
[02/14] ASoC: rockchip: i2s: Fixup clk div error
        commit: 6b76bcc004b046ea3c8eb66bbc6954f1d23cc2af
[03/14] ASoC: rockchip: i2s: Improve dma data transfer efficiency
        commit: 7a2df53bc090a161713da057df7455b39f6cd00d
[04/14] ASoC: rockchip: i2s: Fix regmap_ops hang
        commit: 53ca9b9777b95cdd689181d7c547e38dc79adad0
[06/14] ASoC: rockchip: i2s: Reset the controller if soft reset failed
        (no commit info)
[07/14] ASoC: dt-bindings: rockchip: Document reset property for i2s
        commit: 296713a3609deaf4ad2c460ffe196c09084792e0
[08/14] ASoC: rockchip: i2s: Fixup config for DAIFMT_DSP_A/B
        commit: 1bf56843e664eef2525bdbfae6a561e98910f676
[09/14] ASoC: rockchip: i2s: Make playback/capture optional
        commit: 4455f26a551c86e31c7d27495903a11c3d660034
[10/14] ASoC: rockchip: i2s: Add compatible for more SoCs
        commit: f005dc6db136a477166dd86e983351fec9129cce
[11/14] ASoC: dt-bindings: rockchip: Add compatible strings for more SoCs
        commit: d5ceed036f7cde29bf17173e9a9c8bbde0a70389
[12/14] ASoC: rockchip: i2s: Add support for frame inversion
        commit: 917f07719b133093680ed57dd7b5bc30b6a5b45d

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
