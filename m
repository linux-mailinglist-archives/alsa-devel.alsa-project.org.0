Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 974B42CD8D4
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 15:20:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320DD1810;
	Thu,  3 Dec 2020 15:19:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320DD1810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607005231;
	bh=3IVYALfz898u+1ITSWtG34Qy/Gp1zyHzbIG85qs7Olo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fBsmOR2/1BVy9RzU5gN2d5w25WrAjI35jnLunVgECFYaqMIirfzogYt9N4zVcupo6
	 QmCmuTJ8fKvCqKOkdD8p1noZJz6ZdmlBk3zAGvrWDA4HhX7M1sjE3zRWZhtnyHvLb6
	 geckh6gHjDVl4m3jhqdrcGhxTkg3j9b9+go1EpH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 629E6F80254;
	Thu,  3 Dec 2020 15:18:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D932EF80254; Thu,  3 Dec 2020 15:18:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09F5FF80082
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 15:18:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09F5FF80082
From: Mark Brown <broonie@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20201203013439.10617-1-festevam@gmail.com>
References: <20201203013439.10617-1-festevam@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_audmix: Remove unneeded data field
Message-Id: <160700512198.44361.16621664381682378712.b4-ty@kernel.org>
Date: Thu, 03 Dec 2020 14:18:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: nicoleotsuka@gmail.com, alsa-devel@alsa-project.org,
 shengjiu.wang@gmail.com, viorel.suman@nxp.com
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

On Wed, 2 Dec 2020 22:34:39 -0300, Fabio Estevam wrote:
> The .data field is only used to pass the string name to
> platform_device_register_data().
> 
> Pass the string name directly to make the code simpler.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_audmix: Remove unneeded data field
      commit: 5057d108d69a55f97f3e436aefbabb9c4064d9d6

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
