Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 579CC568507
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 12:18:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E15791636;
	Wed,  6 Jul 2022 12:17:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E15791636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657102689;
	bh=7bPjA96rRPT+DGytlEDSgU0khPF5mhmCE+N6Sj/+pX0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=okLPjkKwG0+H/uUfLa99oXBufI97Shq1vE4ibNBl3pcg2H9FTdfNp3Lg3JTG+kNG4
	 6m8NCdRlcycva0l6XJWOIPxtEJLl+IqZtvQAqvRz73CnSgjIp4608rVWnZd62saK+Z
	 1mG3ZK0i49in95BYDoV2x8tkpKSW9vF0q4+KrUxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A1D5F8012A;
	Wed,  6 Jul 2022 12:17:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A597BF8023A; Wed,  6 Jul 2022 12:17:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09F1EF8012A
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 12:17:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09F1EF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MUgKma1P"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65EB661DCD;
 Wed,  6 Jul 2022 10:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CCBAC3411C;
 Wed,  6 Jul 2022 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657102620;
 bh=7bPjA96rRPT+DGytlEDSgU0khPF5mhmCE+N6Sj/+pX0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MUgKma1PWpnpMDghIZQh8EtTZFc0uHhnnLOGcO4WLW01/ALctT9T0mGXb/UZ4ycFh
 FMnFOYEkGiLfFj53DHKhkmZqjEKcBr9BxqV2o7jxVnT2uY+bXlwxzw9Z35ZE07Ic6W
 btPm953snmkTQJQRCqWwJrTp4aLbTApep3TD3Kg7XVYV5lMTi/vbUZIOJwtVgc732L
 TdFTQqLAv3XrPECQEJ2JEX4Kg608uTSesLozNmO574Le+Wedby0DBstl4sXSIocraG
 H5s4M2KwmpYNRXJsTwV7FKPCRfI3tbOoLeMUrirVvdK8KMnez0rZ9SXorZxYH5GhBk
 VDayWLkrOc9yg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, cezary.rojewski@intel.com
In-Reply-To: <20220630065638.11183-1-peter.ujfalusi@linux.intel.com>
References: <20220630065638.11183-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 0/2] ASoC: Intel: Skylake: Fixes for skl_get_ssp_clks()
Message-Id: <165710261895.218646.13648148801407891657.b4-ty@kernel.org>
Date: Wed, 06 Jul 2022 11:16:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
 tiwai@suse.com, kai.vehmanen@linux.intel.com
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

On Thu, 30 Jun 2022 09:56:36 +0300, Peter Ujfalusi wrote:
> Changes since v1:
> - drop reference to a might never happening patch from the commit message of
>   patch 2.
> 
> Cover letter:
> while looking at long standing sparse reports regarding to arrays of flexible
> structures (arrays of flexible arrays of flexible structures, really).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: Skylake: Correct the ssp rate discovery in skl_get_ssp_clks()
      commit: 35981d51fe5a3310a8c895cf0daf1809f143b8ac
[2/2] ASoC: Intel: Skylake: Correct the handling of fmt_config flexible array
      commit: 564025b9fe472a7a62895c55a66edd2abeea88a1

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
