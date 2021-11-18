Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0185945632B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 20:07:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 080DC183E;
	Thu, 18 Nov 2021 20:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 080DC183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637262457;
	bh=K0dhONGx5eh8ZXaYYjtDkxxtM9Z92WwRmibNsJcJ738=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l63x/BoeTIAII61CSIFi/KuJn5GpfsCVKpgwtFNEfrZY1yQ3JzmdWZvYWN+75VArG
	 Fqr/5V79TBavqwm0AopFSjMv2n8FttuNOUweHv4f0XT25Pquj7QEYkcQ0cV0mF6mSJ
	 qGTVsVql0PQlbd+gQUlHtc9rHocenO8NUYVzUkw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63585F8026D;
	Thu, 18 Nov 2021 20:06:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E744F80272; Thu, 18 Nov 2021 20:06:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B6C2F80115
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 20:06:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B6C2F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EKEu5Dzi"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1A19611C0;
 Thu, 18 Nov 2021 19:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637262363;
 bh=K0dhONGx5eh8ZXaYYjtDkxxtM9Z92WwRmibNsJcJ738=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EKEu5DziBC2A7SyJ4RLec0HqRTsc2ECO9INuaYkhiTobP7At82tUH12VdGzvsWcym
 ANtj9KMhL9xoAvioDuBoyMZ0Wq2AP+w0de6muBrT+3UJlxzwF8lZ/qpI1kZm5ty+Sy
 IhpNJJ9qqd9sdU2EqsuXxK/vRjONrsDXVlXgcsID7QJt6fCYrpr6XM1sYTv365fNuN
 mg8LiajK4q1KI7z+5ynVlO2yDARalaFXHwOR3fIbEWOIZVk2KU4se5ja15A2UEdvKd
 l74ebi6Z1uANA8KKEKa98/qtRiCIEkjmg/WQTFBvpqLgm6J+OVKLusAgkHozs2jDtP
 uJyiWXl8qwj/g==
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH v3 00/16] Kcontrol get/put cleanup in Tegra drivers
Message-Id: <163726236152.95988.1168935629731605987.b4-ty@kernel.org>
Date: Thu, 18 Nov 2021 19:06:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 thierry.reding@gmail.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

On Thu, 18 Nov 2021 12:36:55 +0530, Sameer Pujar wrote:
> There are two cleanups in the series:
>  1. Use correct value type for enum controls. This is suggested by
>     Takashi during review of v2.
> 
>  2. This series fixes kcontrol put callback in some of the Tegra drivers
>     which are used on platforms based on Tegra210 and later. The callback
>     is expected to return 1 whenever the HW update is done.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[01/16] ASoC: tegra: Fix wrong value type in ADMAIF
        commit: 884c6cb3b7030f75c46e55b9e625d2372708c306
[02/16] ASoC: tegra: Fix wrong value type in I2S
        commit: 8a2c2fa0c5331445c801e9241f2bb4e0e2a895a8
[03/16] ASoC: tegra: Fix wrong value type in DMIC
        commit: 559d234569a998a4004de1bd1f12da5487fb826e
[04/16] ASoC: tegra: Fix wrong value type in DSPK
        commit: 3aa0d5c8bb3f5ef622ec2764823f551a1f630711
[05/16] ASoC: tegra: Fix wrong value type in SFC
        commit: 42afca1a65661935cdd54d2e0c5d0cc2426db7af
[06/16] ASoC: tegra: Fix wrong value type in MVC
        commit: 6762965d0214df474e3a58e1d4d3ab004c5da0ea
[07/16] ASoC: tegra: Fix kcontrol put callback in ADMAIF
        commit: e2b87a18a60c02d0dcd1de801d669587e516cc4d
[08/16] ASoC: tegra: Fix kcontrol put callback in I2S
        commit: f21a9df3f7cb0005947679d7b9237c90574e229a
[09/16] ASoC: tegra: Fix kcontrol put callback in DMIC
        commit: a347dfa10262fa0a10e2b1970ea0194e3d4a3251
[10/16] ASoC: tegra: Fix kcontrol put callback in DSPK
        commit: d6202a57e79d102271d38c34481fedc9d4c79694
[11/16] ASoC: tegra: Fix kcontrol put callback in AHUB
        commit: a4e37950c9e9b126f9cbee79b8ab94a94646dcf1
[12/16] ASoC: tegra: Fix kcontrol put callback in MVC
        commit: c7b34b51bbac6ab64e873f6c9bd43564a7442e33
[13/16] ASoC: tegra: Fix kcontrol put callback in SFC
        commit: b31f8febd1850bbe74aba184779ec54552d92752
[14/16] ASoC: tegra: Fix kcontrol put callback in AMX
        commit: 8db78ace1ba897302131422ce15c5eb04510cef8
[15/16] ASoC: tegra: Fix kcontrol put callback in ADX
        commit: 3c97881b8c8a2aa8afd4d7a379b7ff03884c9e4a
[16/16] ASoC: tegra: Fix kcontrol put callback in Mixer
        commit: 8cf72c4e75a0265135d34a8e29224b4c1e92b51c

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
