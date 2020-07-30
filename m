Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5606233B6E
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 00:36:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A68016A0;
	Fri, 31 Jul 2020 00:35:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A68016A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596148591;
	bh=CO37PAhunBqjgO0OJf6XyiHTMf9GToTDYH/qSHwYFwk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eNaBBtAqO0+J72r4OvECRWYex2U1AaScDdbh0JyMm5TMLQVYi9J3KuT0tP5i8pyeK
	 TpZDflqoPUDuI/Ac2LFid730GXX4Zgx826xxM++sm2VqiGpZ/dfgEflP3ORxPJwFEt
	 HATMLhS8FHnlU3Gc2Koas5YRMX/koO3/ACXJCIgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BBA8F80315;
	Fri, 31 Jul 2020 00:30:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F898F80307; Fri, 31 Jul 2020 00:28:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A821DF80303
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 00:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A821DF80303
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="f+fyTg5m"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 61D9E20838;
 Thu, 30 Jul 2020 22:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596148130;
 bh=CO37PAhunBqjgO0OJf6XyiHTMf9GToTDYH/qSHwYFwk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=f+fyTg5mDxWEz242p14lrlNUDh5OdVbXRxadG2fVuX69OwiIlrntWdEga9eomeFKZ
 YkW5DVQiXbrWi+ZnY8ILqSepkXV8gFetevnFm3K3sMfjbEG4/QOxCmZLsH1zJxGZgG
 hqh4/QGoQzjoct8E6TD0QjUXC5K0Srk84lFRZx/s=
Date: Thu, 30 Jul 2020 23:28:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20200730120715.637-1-ckeepax@opensource.cirrus.com>
References: <20200730120715.637-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: soc-core: Fix regression causing sysfs entries to
 disappear
Message-Id: <159614804535.1473.17195718033105583063.b4-ty@kernel.org>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com
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

On Thu, 30 Jul 2020 13:07:14 +0100, Charles Keepax wrote:
> The allocation order of things in soc_new_pcm_runtime was changed to
> move the device_register before the allocation of the rtd structure.
> This was to allow the rtd allocation to be managed by devm. However
> currently the sysfs entries are added by device_register and their
> visibility depends on variables within the rtd structure, this causes
> the pmdown_time and dapm_widgets sysfs entries to be missing for all
> rtds.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: Fix regression causing sysfs entries to disappear
      commit: 5c74c9d34aec1ac756de6979dd5580096aba8643

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
