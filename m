Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1006C602A2E
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 13:31:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8A3E8DA1;
	Tue, 18 Oct 2022 13:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8A3E8DA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666092700;
	bh=E4EW/MQguhuWyRl3E5UwUZjot3sh0EapM2CZWbOuS8c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a5DGlMgSn/IqvEtGB6k8ObixW59vf1VsrPuvTipSU59yIyoTCTlrdo+tBXuokrAY3
	 hVzCRptn5VE+RdXyklGwUEa/fJbkn2nELlohbR3Tlzcibo8TfQ3bLl67reRcjwOrRQ
	 K22VSOEBh+7hiHVXTW79zpNFpjLfZsoFFSI8wz7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18E5CF8057E;
	Tue, 18 Oct 2022 13:28:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3082F8057B; Tue, 18 Oct 2022 13:28:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A940F80566
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 13:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A940F80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TDrlLcHq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73DC061529;
 Tue, 18 Oct 2022 11:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA191C433C1;
 Tue, 18 Oct 2022 11:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666092512;
 bh=E4EW/MQguhuWyRl3E5UwUZjot3sh0EapM2CZWbOuS8c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TDrlLcHqZwJ8iX/zRFMByB2R7YpU5JRFjC9D8DA/KnV3s2qJr6g1eVAOfVOJ+Uxka
 ieLYoQALxJtA6ifeEvLbr74ZBbdAQntPp70xpDaDspXA2cTx5oJgWzxyLjldL42P/8
 k7P9KVrLYDip7aoqFpyZd93SwvCo+1NwqNpkj7j/XugaoSuDTHqICJvZ9f3+G9YLuA
 fBqs5KXawCFVTofuzgIb2MKFdEh37lyTs5plc4nmhn+rA1qNbOh5V/j8Q1v0xRaj5C
 Gzl3Ij+HGtiowbN0G+LRJyUXPy7Kt1958ilvHaZRoSK5NT74ok7uHsVkPJ32aKcJEc
 7ikRFs3Oh4z6w==
From: Mark Brown <broonie@kernel.org>
To: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220930124538.354992-1-amadeuszx.slawinski@linux.intel.com>
References: <20220930124538.354992-1-amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: avs: Add support for max98927 codec
Message-Id: <166609251141.155136.8908728674966003398.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 12:28:31 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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

On Fri, 30 Sep 2022 14:45:36 +0200, Amadeusz Sławiński wrote:
> This series adds machine board for max98927 codec present on some
> Chromebook devices.
> 
> Amadeusz Sławiński (2):
>   ASoC: Intel: avs: Add max98927 machine board
>   ASoC: Intel: avs: Load max98927 on target platform
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: avs: Add max98927 machine board
      commit: 1c993300ab1cec9a0a6a3c417614a1d9f35b175b
[2/2] ASoC: Intel: avs: Load max98927 on target platform
      commit: 999ce9967a2f5a64c4bd04ae1edf0a979cf68833

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
