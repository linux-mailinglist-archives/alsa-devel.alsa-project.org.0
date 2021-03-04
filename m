Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F053432C4D4
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 01:57:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7800D1A9D;
	Thu,  4 Mar 2021 01:56:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7800D1A9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614819422;
	bh=CrZ0LDgVarSQYHBMvLY+6qReNahMDrXe3e1rU8uL/Ig=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DnGrkVEjtVLfW9Tc7VGrQXDhi6WZUXjI9zR6Q+0ka46eCmunau4BhxL7LcUuXR6xA
	 D/+4vduZOVy8vtZH3XpWyaesQOHlfx9CgYWrOjT1EhIKNPTOBD+H+3zvoicglrYiBn
	 QcMRMAqYKzVbHqBIhsbL1z6XOlSZN5yPlHm2g1OE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA8F6F8012D;
	Thu,  4 Mar 2021 01:55:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E3E2F8027D; Thu,  4 Mar 2021 01:55:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 553FFF800B2
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 01:55:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 553FFF800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HMFRWOfD"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9EEDB64EBB;
 Thu,  4 Mar 2021 00:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614819314;
 bh=CrZ0LDgVarSQYHBMvLY+6qReNahMDrXe3e1rU8uL/Ig=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HMFRWOfDclSs8FrbyU1RN/2lbPp4xkyNj20DJGWDpPXL4eu5faNFoq07sOhXOQOUp
 3t4WpR3X9ikdW0+qPkzy6K9SQ5urNkdx0yKSCM8w3COVIyu9oafxLJ81yXIl2SShM8
 1jbC6wctxXcXsouiSJrR0sDwuNzAKIW0yJ3NESc+WeFB63XUkAbsQJoHEU3jxDNcO0
 HeLSHnfgIrFByRFpIYhhjB9yiKHy5ro0y9H1hhuYD2LodvwO/p6syY/oeIhEd9yF82
 BDfdBaqWy2Ft66X82cVKdpFdizNZ138PZZWFDsM4gHxOwdJO6JcuTcVc2vFv1pYHUs
 sxWtzF/Nre1yA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Wei Yongjun <weiyongjun1@huawei.com>,
 Hulk Robot <hulkci@huawei.com>, Shuming Fan <shumingf@realtek.com>,
 Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20210303064041.898281-1-weiyongjun1@huawei.com>
References: <20210303064041.898281-1-weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] ASoC: rt1316: Fix return value check in
 rt1316_sdw_probe()
Message-Id: <161481924070.9553.12740264453488013918.b4-ty@kernel.org>
Date: Thu, 04 Mar 2021 00:54:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org,
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

On Wed, 3 Mar 2021 06:40:41 +0000, Wei Yongjun wrote:
> In case of error, the function devm_regmap_init_sdw() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1316: Fix return value check in rt1316_sdw_probe()
      commit: f87aec4585c3cf0853ba20637bb8c6bdd2689c46

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
