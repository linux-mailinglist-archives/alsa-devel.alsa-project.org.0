Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAB44D08AA
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 21:43:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A07C21785;
	Mon,  7 Mar 2022 21:42:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A07C21785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646685787;
	bh=PgNLGlvhfPV7rDinWlfM7rjW5xU/fveG5kKm6pxlizU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l+Wz1YF1QdjHz8NC3Pp3btt9swlO8/LvC5V5fDasCd/vnOOrC43/NMK2TZzk9hSyZ
	 e3ewnTgzVsRwJtCgSbzSMnJkh6lNpS0vlsL6XZp5YvDrlra25gcptWs+AHB6u28fKU
	 ZcDGbZqGSXfsArdmzc34RkB98TSE4O6jdkTqyUvM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03F6CF80548;
	Mon,  7 Mar 2022 21:39:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E7C2F80543; Mon,  7 Mar 2022 21:39:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 715D0F80534
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 21:39:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 715D0F80534
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i8SLRtFG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2D5B4614C1;
 Mon,  7 Mar 2022 20:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520DFC36AE2;
 Mon,  7 Mar 2022 20:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646685560;
 bh=PgNLGlvhfPV7rDinWlfM7rjW5xU/fveG5kKm6pxlizU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=i8SLRtFGjzRCDKkGrKwSku5p2JVXw5BczkH2J6M/8nCssqQClooWWlzhqIozGV5Me
 LOWviFDFS0c4LhCMBEoq8qAxUqZSrkHG2YcWHBVfSH6/ipdpWgfDFqbSz1OynvwP9f
 g8l7uBuvPtcE11VBawavCDMIahqNjYUNpfvvyYIK81BoPyzCOQOVhiMl3y4PCjAwDW
 WlF0kC6N0SRHjajUZOmR3MdxvTn4u2eGfpWfP4ackEbfOFhCKNaQnVwZEXhI6eN2Tt
 NN64ecEtC4ujaXQV/S49bKFklCyxY44BHd2SHsoClnAQqZbthKppcKXQw38KDLu2/5
 gkq31V2Z7M6mQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220304204532.54675-1-pierre-louis.bossart@linux.intel.com>
References: <20220304204532.54675-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/3] ASoC: Intel: boards: cleanups for 5.18
Message-Id: <164668555906.3137316.317655084656581414.b4-ty@kernel.org>
Date: Mon, 07 Mar 2022 20:39:19 +0000
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

On Fri, 4 Mar 2022 14:45:29 -0600, Pierre-Louis Bossart wrote:
> Updates to clean-up the GPIOLIB dependency and a quirk for HP
> SoundWire devices.
> 
> Anthony I Gilea (1):
>   ASoC: Intel: sof_sdw: fix quirks for 2022 HP Spectre x360 13"
> 
> Pierre-Louis Bossart (2):
>   ASoC: Intel: boards: remove explicit dependency on GPIOLIB when DMIC
>     is used"
>   ASoC: Intel: boards: add GPIOLIB dependency where missed
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: boards: remove explicit dependency on GPIOLIB when DMIC is used"
      commit: 32666b866f55a224d2f07f83594fcf37a922b6c9
[2/3] ASoC: Intel: boards: add GPIOLIB dependency where missed
      commit: bdfc385948bf8e73629b3580941c9d810711713b
[3/3] ASoC: Intel: sof_sdw: fix quirks for 2022 HP Spectre x360 13"
      commit: ce73ef6ec67104d1fcc4c5911d77ce83288a0998

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
