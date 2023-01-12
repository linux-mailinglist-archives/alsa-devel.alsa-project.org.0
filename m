Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2E16678C1
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 16:13:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FCBE9144;
	Thu, 12 Jan 2023 16:12:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FCBE9144
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673536412;
	bh=NCeRjLCRTVAFJDaMjO99WvD53V2liIYYcYd9tkRKlhk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BQLZJJeRI2U3VFzBx7e5RgHSa+GwXEkuwGaZMdI3GDE2ZwEDWtshaVevzU1zfVMZ1
	 kOqlRuPwJTPQNySCsruolyUmodPoXI+3Hb4RGb9XP1O/C/6YhFyB/P5wLqiQOqoTda
	 P1tCK4VmRThPV6AlH+s+VCZqvVQmDbfPMGxh7Nmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB6F4F80542;
	Thu, 12 Jan 2023 16:12:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB8F6F8053D; Thu, 12 Jan 2023 16:12:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9EDF1F8016E
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 16:12:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EDF1F8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U6tAstGh
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E165462036;
 Thu, 12 Jan 2023 15:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC3AC433F0;
 Thu, 12 Jan 2023 15:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673536335;
 bh=NCeRjLCRTVAFJDaMjO99WvD53V2liIYYcYd9tkRKlhk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=U6tAstGh1mgNY5ujXJZ3OflQfR5zWC1tFRSjfPjND4uva9u0tNMWTISmBGdbP0cVd
 jMSnuutKVc7NQQi6a6DUY6sFt/SHAU5TXwgez9hQ33AwyeShL6xJs/JsVT91KEyDzj
 +UlBu2MW/KxKk3ULMsAMNP+1z7HwwJ2XrSxt9xEcumaRWZpm18NUimjxeHVjSpTQwR
 fanNkPyvw4vZIZo3NUoQovAUlAOJhhtQ5fBhj+rlSlEKCU/MzeDZFxqlqIZfPfiO/+
 bXkBnmk6kXf36avsCqpiu2O8uHliB3FsIiHGmDQHBPPCrW4cCQ2u1DGD1SIQF+dIRN
 1nm036WT9ciYQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
In-Reply-To: <20230109132104.1259479-1-venkataprasad.potturu@amd.com>
References: <20230109132104.1259479-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH v2 0/5] Add tdm support in acp machine driver
Message-Id: <167353633397.2136827.3282677778937629013.b4-ty@kernel.org>
Date: Thu, 12 Jan 2023 15:12:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: vsujithkumar.reddy@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, ssabakar@amd.com, Vijendar.Mukunda@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 09 Jan 2023 18:50:59 +0530, Venkata Prasad Potturu wrote:
> This patch set is to add new cpu dai, refactor dai format
> implementation and clock enable/disable and add tdm support
> in acp machine driver.
> 
> Changes since v1:
>     -- Fix compilation error.
>     -- Reorder patch series.
>     -- Modify commit message.
>     -- Refactor i2s clocks programming sequence.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: amd: acp: Add new cpu dai's in machine driver
      commit: 099b923fc15d8faa91c5fc1b46cbc483d034f5dc
[2/5] ASoC: amd: acp: Refactor dai format implementation
      commit: af830fc44a2d273b163e76b17f51b128ce694481
[3/5] ASoC: amd: acp: Refactor i2s clocks programming sequence
      commit: ca9d237994db63dca68f2b04e257a4738847deee
[4/5] ASoC: amd: acp: Add i2s tdm support in machine driver
      commit: 200553008e9f5b613aa9ea75a68210861bff511f
[5/5] ASoC: amd: acp: Enable i2s tdm support for skyrim platforms
      commit: d386a10c9cd887b53ff9da06d27a60da61b007c9

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
