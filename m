Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3611E619D
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 15:04:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2104F17D6;
	Thu, 28 May 2020 15:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2104F17D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590671079;
	bh=F7jtwIuneGRzrzC8hmnOou8rcUKR1aHQAK/XGsUDTOM=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wmdq7PyWe1VXq670ret5MJ+/RFsyS6b4UWASj4oKcgbY3Txgeb9mB5OTYI4RUxmUT
	 747QHWHCaBg2j/mSDilXL766xs60tzbu+t8FjQSNO2tmgBXkFk8K46gfWfx6bYzE7A
	 17oqFDfGyMWwGaoUQRUb/VO63EuwallY7OrY8A4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3A22F80240;
	Thu, 28 May 2020 15:02:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6A4EF80161; Thu, 28 May 2020 15:02:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BF35F8015D
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 15:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BF35F8015D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ozGZ5r2Z"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 610DA206F1;
 Thu, 28 May 2020 13:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590670929;
 bh=F7jtwIuneGRzrzC8hmnOou8rcUKR1aHQAK/XGsUDTOM=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ozGZ5r2ZCATYyVZy+ziSJzRmfOFenTjiKn9Tf5mHyyCS8e7cnxp/h8jyVN7z0zdrT
 /jlKcYkmOmcpM95n6bMnLtZzkj+PTyIE2lDPgF5uvGTIwaLi2WZcT4h8rHWqoPw88A
 LJMryBYJ4b58HL+fl6vTce2f9lS+KmR4XvilPRjs=
Date: Thu, 28 May 2020 14:02:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20200523125455.12392-1-paul@crapouillou.net>
References: <20200523125455.12392-1-paul@crapouillou.net>
Subject: Re: [PATCH] ASoC: ingenic: Unconditionally depend on devicetree
Message-Id: <159067091851.53762.14414848344217836155.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, od@zcrc.me, linux-kernel@vger.kernel.org,
 kbuild test robot <lkp@intel.com>
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

On Sat, 23 May 2020 14:54:55 +0200, Paul Cercueil wrote:
> All boards with Ingenic SoCs probe with devicetree already, we have no
> use for a non-devicetree path.
> 
> This solves some compilation warnings that were caused by unused
> variables in the case where CONFIG_OF was disabled.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ingenic: Unconditionally depend on devicetree
      commit: e6825bae26812e981c4d6f93214f0259ca9a4977

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
