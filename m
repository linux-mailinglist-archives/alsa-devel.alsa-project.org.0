Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A06725E8032
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 18:55:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D7F4F3;
	Fri, 23 Sep 2022 18:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D7F4F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663952114;
	bh=6fvz9/AdNIA0WBYKHyi1B++6lfIv8ecU6mtCLQsc4sU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bc7cVRds6ilDmDrLu+YhW/ZNEQBUIId/AtBLiZ5PncsRlN1d8Zpjt0X/CS2tkDab+
	 zK0y+b+PiPDujPrEJRW/S2lMX2AmyNp66S5Bhir0DtFH0wq246ixHhSJJPiufy4l6a
	 zWG3rRMDXiDRPb4u1u1n4cKEzFytgtdyVtqyC/RY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46043F80107;
	Fri, 23 Sep 2022 18:54:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88AC2F80269; Fri, 23 Sep 2022 18:54:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC572F80124
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 18:54:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC572F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mygw9oCr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62C33B825A7;
 Fri, 23 Sep 2022 16:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D3BAC433D6;
 Fri, 23 Sep 2022 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663952048;
 bh=6fvz9/AdNIA0WBYKHyi1B++6lfIv8ecU6mtCLQsc4sU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Mygw9oCrJnVDNNMWfQ4lhSXK2s7bgqWuUsp6AoJX6+00hhChO9rPRBCvJaVKycoP3
 fTzCxv2trmf3tmlxMBME+JNmFkHpjxxRLGXkhH9EUmcIJIJlPCsi3bQiuXd0C3fQ+U
 fXHXimJwccSdCGwv72gX8MmHwXVLZEeyT5MH4/4JKernYHuuyVrckmdr7RXvB7j4+7
 nJYVzIesrIrQvnO5RunMNHnip9UF/DLKFLpj9nVD79kTEGJqmpHRk7fSi1zUHrMRiF
 ygWKsMRjvApkQySb6+SG370eC3o/usaOXjrh9VtRn3bhjL34gOaZ0ngx7MdSEaNgHS
 STyAynd/lwBLg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20220819125230.42731-1-rf@opensource.cirrus.com>
References: <20220819125230.42731-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 00/12] ASoC: cs42l42: Add Soundwire support
Message-Id: <166395204699.572881.13519496754042108228.b4-ty@kernel.org>
Date: Fri, 23 Sep 2022 17:54:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Fri, 19 Aug 2022 13:52:18 +0100, Richard Fitzgerald wrote:
> The CS42L42 has a Soundwire interface for control and audio. This
> chain of patches adds support for this.
> 
> Patches #1 .. #10 split out various changes to the existing code that
> are needed for adding Soundwire. These are mostly around clocking and
> supporting the separate probe and enumeration stages in Soundwire.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/12] ASoC: cs42l42: Add SOFT_RESET_REBOOT register
        (no commit info)
[02/12] ASoC: cs42l42: Add bitclock frequency argument to cs42l42_pll_config()
        commit: 7e178946c3e4e64cebda4e60d0b7e5c02a502d13
[03/12] ASoC: cs42l42: Ensure MCLKint is a multiple of the sample rate
        (no commit info)
[04/12] ASoC: cs42l42: Separate ASP config from PLL config
        (no commit info)
[05/12] ASoC: cs42l42: Use cs42l42->dev instead of &i2c_client->dev
        commit: 2feab7e7d8c01b67d9ffbfb902d1591c08e9d564
[06/12] ASoC: cs42l42: Split probe() and remove() into stages
        commit: 0285042feda799edca63b35cea0cda32ed0c47c2
[07/12] ASoC: cs42l42: Split cs42l42_resume into two functions
        commit: 56746683c2560ba5604bb212f73eb01f5edfd312
[08/12] ASoC: cs42l42: Pass component and dai defs into common probe
        commit: 52c2e370df07092437d1515e773d28a5f53fc810
[09/12] ASoC: cs42l42: Split I2C identity into separate module
        commit: ae9f5e607da47104bc3d02e5c0ed237749f5db51
[10/12] ASoC: cs42l42: Export some functions for Soundwire
        (no commit info)
[11/12] ASoC: cs42l42: Add Soundwire support
        (no commit info)
[12/12] ASoC: cs42l42: Add support for Soundwire interrupts
        (no commit info)

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
