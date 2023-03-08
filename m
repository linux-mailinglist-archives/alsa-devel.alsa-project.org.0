Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 422536B0A1A
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 14:55:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 219391813;
	Wed,  8 Mar 2023 14:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 219391813
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678283745;
	bh=ovmrCZYjobE2EteubnOR0JjnRCCLurMB4XoIql9ZcLk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FpUYBDMEkD/raqD4vuONURaHi1Vy5uFC8wDHLEb3Q8VOWRjson3SxObc2KW4PsJGq
	 XzZEpsoYoupTMQFWPLMYl1mfw51an6LqAPVmLv8/2FsfV4m6+/h5Kd+Eq1nhsLjq7D
	 D/Wa4zYz7l6QvzB/CkVWXhKatiejYdt1K6amr6/w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21810F80570;
	Wed,  8 Mar 2023 14:53:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60D66F8053B; Wed,  8 Mar 2023 14:52:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51E28F80520
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 14:52:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51E28F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=niVYoU+m
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B3E77B81CD1;
	Wed,  8 Mar 2023 13:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0A9C433D2;
	Wed,  8 Mar 2023 13:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678283560;
	bh=ovmrCZYjobE2EteubnOR0JjnRCCLurMB4XoIql9ZcLk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=niVYoU+mCnmgmk7jv1kJxwaI2+sEGRUA3XIi6ref0UdjzchC8B0OorL4O/ScjKrVi
	 9LSE8Vo9pBEJK8oht9R+HCrAfbiKb9yGE5qTBWAGef3NPSWgi7jYmFfp9A5m0Q0jVi
	 GE8q7zBQgctRXmLPKuDvAFtQV9fPwMQ+x6z2+ARyJtjHbg0JuMCOr3CIsplj1UuXRq
	 YbAdRDAa/EdirLI8SF8oDLqFgIrCKpQd6I38Ixno5LNh7jRzLhslaxHT1B+LvudQfd
	 UWzbkOcrl0km20R/GbXGSCGklAi9C43oaA7nd9Bj5TIYIAn8VCgBDonZ9CdtZixJu2
	 kM3hQ9s8NzwpQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20230307095412.3416-1-peter.ujfalusi@linux.intel.com>
References: <20230307095412.3416-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-ctrl: re-add sleep after
 entering and exiting reset
Message-Id: <167828355861.31859.9681661622409196866.b4-ty@kernel.org>
Date: Wed, 08 Mar 2023 13:52:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: JZH3XQXG7KDXS4D5ORW3OYSESSQ6MNEI
X-Message-ID-Hash: JZH3XQXG7KDXS4D5ORW3OYSESSQ6MNEI
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZH3XQXG7KDXS4D5ORW3OYSESSQ6MNEI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Mar 2023 11:54:12 +0200, Peter Ujfalusi wrote:
> This reverts commit a09d82ce0a867 ("ASoC: SOF: Intel: hda-ctrl: remove
> useless sleep")
> 
> It was a mistake to remove those delays, in light of comments in the
> HDaudio spec captured in snd_hdac_bus_reset_link() that the codec
> needs time for its initialization and PLL lock.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-ctrl: re-add sleep after entering and exiting reset
      commit: 8bac40b8ed17ab1be9133e9620f65fae80262b7e

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

