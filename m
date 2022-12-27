Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDCC656A4A
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 13:00:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A55D6739A;
	Tue, 27 Dec 2022 12:59:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A55D6739A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672142412;
	bh=bCAcB9VxW/LzWbP5DjX8js9d6sLw1besip2FONIFpYE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RMDHuE8mREEvd96g7zptPQanmA3ah1oaj8hYD1HSDKccEGgIkGjffvxf0OJce1nJ0
	 c7W0WUrVz10L1njakvjG+tzuGqMhjffA2LfCTQd+bXsw9yqN92thCLeo0rz05EdnBB
	 FSOG8Pvv7Cdpr6nUqY5s4ed3oslKiV6T/AOOdoho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6815BF8057B;
	Tue, 27 Dec 2022 12:57:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0CACF8055C; Tue, 27 Dec 2022 12:57:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 330BDF8055C
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 12:57:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 330BDF8055C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L5+FGEm8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78D23B80F9F;
 Tue, 27 Dec 2022 11:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF1BC433EF;
 Tue, 27 Dec 2022 11:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142233;
 bh=bCAcB9VxW/LzWbP5DjX8js9d6sLw1besip2FONIFpYE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=L5+FGEm8voYU29vY9fNgabZEJCVEFWuAVbyyadYJx/0C0ixtpvvUrDOuOIsGVD6n4
 ARG8MURgpIYGwC1fA+PXvBum+3XonMwKShNWTorz22KLDx6Fjb5+SnFuNVl9RCW6OX
 Ps35YyQbw4xIVyZku7WJ7CdNQq3Jf7zK+FRPaxAuAgBuVLfpVRLpC5F1Gd/VoOVkbL
 iCxt5w42d0LTW+lQTwATR6eFlst64hg9HLyVRtYj6DBUuALrFj7+w2lrHKOU1rnyGJ
 dtNfGXCM77vE9MteDh853qntWiaNmPXIS7ap6ee9UoQqutTpYIpiH9WdOGon4nwAEW
 olL8Lf5DjavGg==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, piotr.wojtaszczyk@timesys.com,
 David Rau <David.Rau.opensource@dm.renesas.com>
In-Reply-To: <20221214044058.6289-1-David.Rau.opensource@dm.renesas.com>
References: <20221214044058.6289-1-David.Rau.opensource@dm.renesas.com>
Subject: Re: [PATCH 2/2] ASoC: da7213: Add support for mono, set frame width
 to 32 when possible
Message-Id: <167214223069.82924.15530796438471486612.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:57:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-7ab1d
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
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 support.opensource@diasemi.com, lgirdwood@gmail.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 14 Dec 2022 04:40:58 +0000, David Rau wrote:
> This adds the DAI mono mode support and set the frame width to 32
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[2/2] ASoC: da7213: Add support for mono, set frame width to 32 when possible
      commit: c89e652e84f636354213aae42490c7f77a0eadde

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
