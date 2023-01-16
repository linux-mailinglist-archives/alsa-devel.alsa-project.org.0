Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C38CF66C2A9
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jan 2023 15:50:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D87F3576B;
	Mon, 16 Jan 2023 15:49:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D87F3576B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673880629;
	bh=5y8EjuuWrUtRSX+nP9yTf8cYciNolM1/Qlkwjk/PDFA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CicErc7wlpJ5aaS43oakS5FQ9h+tEODHQBC2zaJ9pdMyPjdSQGSGi916TvHxg564R
	 D1hpRyksbG/AmgVGryvbivEu59MwMshRD61I9YDaHmQxDvu8uir5sYZPovGNi1Lfxu
	 EN2TdYq6XQwkqoYUc3rGob8eUvYzzK8qIp3i62Ds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22262F8023A;
	Mon, 16 Jan 2023 15:49:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEDFFF80482; Mon, 16 Jan 2023 15:49:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5331F8023B
 for <alsa-devel@alsa-project.org>; Mon, 16 Jan 2023 15:49:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5331F8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=P/FlmRyx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E1B2D60FA4;
 Mon, 16 Jan 2023 14:48:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 144B1C433D2;
 Mon, 16 Jan 2023 14:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673880538;
 bh=5y8EjuuWrUtRSX+nP9yTf8cYciNolM1/Qlkwjk/PDFA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=P/FlmRyxl1UZ2yu8AoKG/xAC1RGS9xsiQyg3XPn1KLrVgT4shshAXH62pTfP2nQ8w
 mB7gLBsdOQ9F//nOUmtNaorUrXyo6JXXYXyFduWgUP9vfY0sKfoV0WJou4p3GhPI8W
 XntGzAkA5Xk4SLRc6XT8NVEP0G7kff3DDtIOaSf5saPfLi3/1sX9CQbNpZ16TyrikU
 zLPhnYQP4r7kCstDVTs/zITNir4TpwcIxVy7ja6nqepv1gU1+R/TKLYbhNXvlblN/J
 xauurGGII/tMDWsjvBW4GMN1dRwf5W5KLkVvzDvYr8Z/pP2Vi77cb+KBSWB5Rj0y9l
 knxQ64PU9Xl7w==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20230111161144.3275546-1-alexander.stein@ew.tq-group.com>
References: <20230111161144.3275546-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_sai: Use dev_err_probe
Message-Id: <167388053477.388539.10455579881880286809.b4-ty@kernel.org>
Date: Mon, 16 Jan 2023 14:48:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-69c4d
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 11 Jan 2023 17:11:44 +0100, Alexander Stein wrote:
> This helps figuring out why the device probe is deferred, e.g. missing
> FSL_EDMA driver.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Use dev_err_probe
      commit: aea11bcddcafc7f548c4fa574cb6019e7690008d

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
