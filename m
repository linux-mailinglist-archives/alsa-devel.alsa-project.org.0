Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A31310CC7
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 15:58:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D330D1676;
	Fri,  5 Feb 2021 15:58:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D330D1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612537131;
	bh=cJrWGIPEDR18sGq6V0Fet3bL4hSOKh1vjuj+mRBWZVk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iLDC7frg8eteDsD4u4bl0ZofvagrMElRK6bFfdfIJw0J069zw0EYWC6/830YJkfkv
	 VzoLE6WQpr/i77lCG+SdHUar+OntfYMb65rqlhwxTVAqW21hykRwVxKlFwIiikDDI0
	 UXb/+Dc3ctf3PkWm/6xaodHXaARrHCH1XNiC6zCg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F37CF800C0;
	Fri,  5 Feb 2021 15:57:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0A6CF8015A; Fri,  5 Feb 2021 15:57:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00674F80139
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 15:57:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00674F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SD6V1eIj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B861650DB;
 Fri,  5 Feb 2021 14:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612537028;
 bh=cJrWGIPEDR18sGq6V0Fet3bL4hSOKh1vjuj+mRBWZVk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SD6V1eIjYxfhNYxG4VbXPLBBvT9EgqHJzFwKh86ctDLr1Ed3yPVUyTrfMMnwh8kzG
 Fo698lKxTXGV+STnOLUFR8r5PTKiGK50LpxcMe3LTT650JvXO47wYxBGD+SW1cyigA
 iXQHwGZOfSA7hAf0sR+W0xfDh7O5AnovO4swyrobR56l/WLH6lP7/3WNbo5TaPD8Dh
 3ql8QlJh/CRW5iUMRxkNzBGckNSIQ2lqhbCbjgeoYJ1rIPbxx0a2d9mTxzg4mtqb0U
 oxXCctiNz6OEOC4v/lTqWCSTXrP3YKgt61iTTe6bpzFwOrwisHVAZXP/rszD1SoFRY
 Zkz/pnkHp5beQ==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Shuming Fan <shumingf@realtek.com>, alsa-devel@alsa-project.org
In-Reply-To: <20210204201739.25206-1-pierre-louis.bossart@linux.intel.com>
References: <20210204201739.25206-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/4] ASoC: codecs: Realtek/SoundWire: fix remove/suspend
 issues
Message-Id: <161253697740.30888.4767267182811316098.b4-ty@kernel.org>
Date: Fri, 05 Feb 2021 14:56:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 tiwai@suse.de, vkoul@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

On Thu, 4 Feb 2021 14:17:35 -0600, Pierre-Louis Bossart wrote:
> These issues and fixes were identified during our module load/unload
> and suspend/resume stress tests.
> 
> Bard Liao (1):
>   ASoC: rt5682: do nothing in rt5682_suspend/resume in sdw mode
> 
> Pierre-Louis Bossart (3):
>   ASoC: rt700-sdw: use cancel_work_sync() in .remove as well as .suspend
>   ASoC: rt711-sdw: use cancel_work_sync() for .remove
>   ASoC: rt5682-sdw: cancel_work_sync() in .remove and .suspend
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: rt700-sdw: use cancel_work_sync() in .remove as well as .suspend
      commit: 737ee8bdf682cedb3c42b713d20ffa5c899591fb
[2/4] ASoC: rt711-sdw: use cancel_work_sync() for .remove
      commit: 121871a75ae4032cf5e506ba5159761805709def
[3/4] ASoC: rt5682-sdw: cancel_work_sync() in .remove and .suspend
      commit: c792c3690b82c8d26c01494a51ebf66d9cae7e72
[4/4] ASoC: rt5682: do nothing in rt5682_suspend/resume in sdw mode
      commit: 30fd8f65af78d0ac0859cf436beed14834b39802

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
