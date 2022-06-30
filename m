Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA98A561EE0
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 17:12:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C84A16F5;
	Thu, 30 Jun 2022 17:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C84A16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656601939;
	bh=zeFJ3+bVEU+Sxu4AmXvCkorfkIgB7pbCnM8thSAH86I=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mNirekUfdCd4vgAmbKMpz89svtIrmvvLjVHvnct/FQqauvRUYCptMV3x5cl7xXBKt
	 woN7RqOSHgc23OxSBd+uiTu8M4arxDZuZwXB0XGDQuQCl/zCec6FSe8GcTMnKNDDrk
	 sS4oEPEREc5stNTDZmcyE68Bdw9ARNXDAOPlUg3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3230DF8053B;
	Thu, 30 Jun 2022 17:10:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4B57F804FE; Thu, 30 Jun 2022 17:10:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CBC49F804EB
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 17:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBC49F804EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="O68hkQ3/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1BB5760E84;
 Thu, 30 Jun 2022 15:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77277C3411E;
 Thu, 30 Jun 2022 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656601819;
 bh=zeFJ3+bVEU+Sxu4AmXvCkorfkIgB7pbCnM8thSAH86I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=O68hkQ3/IxDKaXUH64kz8FlHdQ7+j4rTN+euMINPLKf0TAbcAkokA4jeih23NGMmd
 DF7DbKzDJxuTcqxQgHA7UCfe5yNk6YcvMpXunyZ+Bq3xVvxMowe8M7CRbr1xaMbmVN
 tFodIaM1RiORCOj62wDt+Uba/fa2bm8Eh/SHWWuhWllEM3gin8u6XwQfxnaNCfhBpd
 tpXcLRx50EvUO2Ab4pcwyjabWlu0Gq4vG1bP1J/RGL7jvZXIBiVdJ8rNrLUuDrK0kQ
 5cWdk3fvTqQBR41YdpFVEH5CCsOa3uZ9/YMwTNofWxqsr/zDLxTwHdOATb0j4hukTd
 fdIQPGM8tAQQQ==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com
In-Reply-To: <20220630101459.3442327-1-ckeepax@opensource.cirrus.com>
References: <20220630101459.3442327-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: Minor clean and redundant code removal
Message-Id: <165660181820.664251.9414397371469322240.b4-ty@kernel.org>
Date: Thu, 30 Jun 2022 16:10:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

On Thu, 30 Jun 2022 11:14:59 +0100, Charles Keepax wrote:
> The cs_dsp core will return an error if passed a NULL cs_dsp struct so
> there is no need for the wm_adsp_write|read_ctl functions to manually
> check that. The cs_dsp core will also check the data is within bounds of
> the control so the additional bounds check is redundant too. Simplify
> things a bit by removing said code.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: Minor clean and redundant code removal
      commit: e8010efc7b83038d1c18abe1b8d171e3c7d4ed92

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
