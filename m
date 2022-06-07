Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DE353FC88
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:57:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6D381ACC;
	Tue,  7 Jun 2022 12:56:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6D381ACC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599427;
	bh=4uZ5b18k3pFFxS83IjD+nhcvsufaXdEKIkA2VnKtLAA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dB18+C25wYHjeN+iy5oYpFAaRAwQ7PjNvbOpEvQt76nOzjQ59lY2vtU4fP6Ml9lkH
	 P52rh0sFAhKIw8yYtPlYCLjDOzswPK/mPJCYZKaV/BQmeqc9uQEhxR/LVsXcSdUBzs
	 k8IiW8Lv0TciTF6EdLfJbwfZkBzhYpeKtUV+Ye/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 078DAF80542;
	Tue,  7 Jun 2022 12:55:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0389CF8053E; Tue,  7 Jun 2022 12:55:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79F9FF80529
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:55:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79F9FF80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QRuza9pD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 80D87B81F0E;
 Tue,  7 Jun 2022 10:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B65EC34114;
 Tue,  7 Jun 2022 10:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654599302;
 bh=4uZ5b18k3pFFxS83IjD+nhcvsufaXdEKIkA2VnKtLAA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QRuza9pD3fDiOjik/OqefF/j1LeDNCch80SFvltgm2rb5ua6fShn81aThRoNah5gZ
 lWu0bD1XA6gReu8ch3Vju+xLjt4chYLCOgcDD6s2Pre67vfVRSMe/EyuuznR01ZvkI
 DgyBM9Nktbvgr0SPQ7UXKrILPxePtR+4RDpBMCCpCQJTuKwHxe7TGlUZsw8/FXDIqe
 QPk7JddeEhJz6TO61oPa79ExbEE8HFxxXqiaiutIelryGE/ZFoapt8oNhC5+GEQCYn
 CcdUkk99dFsTamCX5pJm5BQMyJyK/9m+t/vHAvXFYAnol2ajE4jdpXCzadOcqpbN7V
 bJXOHkNwC8suA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
References: <20220520211719.607543-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/16] ASoC: trivial changes for cppcheck warnings
Message-Id: <165459930129.399031.11385682538089570420.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:55:01 +0100
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

On Fri, 20 May 2022 16:17:03 -0500, Pierre-Louis Bossart wrote:
> This can probably wait for the next merge window, I found a number of
> cppcheck warnings that I didn't see in my last checks. The irony is
> that the only really important issue found by cppcheck was on one of
> my previous DPCM changes (submitted separately as a fix).
> 
> Pierre-Louis Bossart (16):
>   ASoC: cs35l45: typo in argument definition
>   ASoC: cs42l42: remove redundant test
>   ASoC: wcd-mbhc-v2: remove useless initialization
>   ASoC: wcd9335: remove redundant tests
>   ASoC: Intel: atom: sst: remove useless initialization
>   ASoC: Intel: atom: sst_ipc: remove redundant test
>   ASoC: Intel: atom: sst_ipc: remove useless initializations
>   ASoC: Intel: atom: controls: remove useless initializations
>   ASoC: Intel: boards: reset acpi_chan_package
>   ASoC: Intel: sof_pcm512x: remove unnecessary init
>   ASoC: mediatek: mt8195: simplify error handling
>   ASoC: qcom: q6dsp: q6adm: remove useless initializations
>   ASoC: qcom: q6dsp: remove spurious space
>   ASoC: rockchip: simplify error handling
>   ASoC: samsung: snow: simplify error handling
>   ASoC: meson: remove useless initialization
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/16] ASoC: cs35l45: typo in argument definition
        commit: 0511e2ac4e848ceac14b3ac4b476f0e26b48ddb2
[02/16] ASoC: cs42l42: remove redundant test
        commit: 94f8f2068ed0e3a5e367029f64ed76e6e65d5eb3
[03/16] ASoC: wcd-mbhc-v2: remove useless initialization
        commit: cac24a360a6b948ffb75c3d7ccc819064300454c
[04/16] ASoC: wcd9335: remove redundant tests
        commit: 0016361dfcc93a70850c6909fb76f15305dda5ae
[05/16] ASoC: Intel: atom: sst: remove useless initialization
        commit: fb6ed937aaa0703bcdacfe013897d583a6eba365
[06/16] ASoC: Intel: atom: sst_ipc: remove redundant test
        commit: d8af541139fa135a250c5ae743bfec3b49e97c3a
[07/16] ASoC: Intel: atom: sst_ipc: remove useless initializations
        commit: a140785b701d286374ea1b26762f333e4f5e9ee3
[08/16] ASoC: Intel: atom: controls: remove useless initializations
        commit: f6cd55a19f3f46e3d36b1121f844956128c60b6a
[09/16] ASoC: Intel: boards: reset acpi_chan_package
        commit: 9972773c26125242b467f0062c1fee874c87ae68
[10/16] ASoC: Intel: sof_pcm512x: remove unnecessary init
        commit: f057852fd351741d1efaadc48aa59ea49c79a087
[11/16] ASoC: mediatek: mt8195: simplify error handling
        commit: 9e9fb5d3f387788d50f5eae4c01ff60429691e71
[12/16] ASoC: qcom: q6dsp: q6adm: remove useless initializations
        commit: 015d9ab7805fb1b3766d1dc487ed34dbc03bd4da
[13/16] ASoC: qcom: q6dsp: remove spurious space
        commit: 7518be0cc120d7617a8985787196cd5776b93688
[14/16] ASoC: rockchip: simplify error handling
        commit: 59a6cc5c5d64ca20461fec46e450e0639b1e6410
[15/16] ASoC: samsung: snow: simplify error handling
        commit: 0c57064e3fdba9bb76086b9a6e318eb0cef24b69
[16/16] ASoC: meson: remove useless initialization
        commit: 7188b28f6686af0bc4aa1f96d720de782769a0a9

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
