Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5A84C78C0
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:24:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08F981934;
	Mon, 28 Feb 2022 20:23:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08F981934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646076243;
	bh=cMbSw8Fb7GWoqvCsagH+i3hAKkm+1SuWh32xT/umKsE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PYweMtx9pvD4wpKMC6QA6Qtyiycmv8RBRkjiqNLSUuibJ89fU42T7AoZBEbizCCpf
	 JbDVqyYaT33nyj+3mENp88h4hmC2HKCurnChlUs5ZOXyqmFzsCt9+F3t61At148qZo
	 6jqqBvkZvsvDKNjqdS7eEGUBsOXQTjFGBzZbFei0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BD28F805E8;
	Mon, 28 Feb 2022 20:16:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33D0CF8059F; Mon, 28 Feb 2022 20:15:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8809AF8058C
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8809AF8058C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CRk5bysD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32F716158C;
 Mon, 28 Feb 2022 19:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FECC340F3;
 Mon, 28 Feb 2022 19:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075752;
 bh=cMbSw8Fb7GWoqvCsagH+i3hAKkm+1SuWh32xT/umKsE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CRk5bysDvfwYe58YEv2XrSE90z6K9q1CUrz/HEhuuyFt06SWE1qsGMQanTOsfduEC
 nMsnpXddH6OdGlZwI8YvzGFfzkBXBodzgpWvJk0fhlVoS4hvhg/Nna+SMttc9bl7up
 1BgsnMWmhJltgaC0z81T5TX67WG+z1fivjxEnIqFGob6U4H5KwBxTNKt27X88+QxFq
 BRrFU3qdrWHI8Dwrni+tcCUIk97sMyg6hvaQyW91PVGNQ1qolk/vvRq9OdQsDKJPUQ
 BA5NAXgGC8PwW3iATE6kOU018u783WqebHDcpd2JttVY/qeYr2DS+VQFUMDvtXFFUc
 TC4ns6ICflyWQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To: <20220225193054.24916-1-Vijendar.Mukunda@amd.com>
References: <20220225193054.24916-1-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH V2 1/4] ASoC: amd: vg: fix for pm resume callback sequence
Message-Id: <164607575019.3538791.4372801541502826813.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Alexander.Deucher@amd.com, krisman@collabora.com, dan.carpenter@oracle.com
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

On Sat, 26 Feb 2022 01:00:22 +0530, Vijendar Mukunda wrote:
> The previous condition is used to cross check only the active
> stream status for I2S HS instance playback and capture use cases.
> 
> Modified logic to invoke sequence for two i2s controller instances.
> 
> This also fixes warnings reported by kernel robot:
> "warning: variable 'frmt_val' set but not used"
> "warning: variable 'reg_val' set but not used"
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: amd: vg: fix for pm resume callback sequence
      commit: 83b713619ee1b15e09eae11a92a7f3305534223d
[2/4] ASoC: amd: vg: update DAI link name
      commit: 5363d7304e31692f8f6da86ed7a49d3c28a2e32a
[3/4] ASoC: amd: vg: remove warnings and errors pointed out by checkpatch pl
      commit: 728a592619cfb9be8b66600d04ef9fee9237fe7e
[4/4] ASoC: amd: vangogh: fix uninitialized symbol warning in machine driver
      commit: 6f989800639a7a29ab9a02e165b04dc144dd4f2b

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
