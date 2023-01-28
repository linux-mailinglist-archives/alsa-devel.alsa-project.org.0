Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A68F667F9D0
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Jan 2023 18:20:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1A72E87;
	Sat, 28 Jan 2023 18:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1A72E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674926428;
	bh=tCEziaVs3JxdlO4hxGu5XvC3DMkiL9pb8Hf2+fJU9L0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Vh9ZVAwPVQy9zLZSrYbSSx3TtBnuTg0BbtG4YwEcr3GOY/bvK4Ue8RPKRtonu3PHE
	 cLPOSBr74AJ3GOMCdRhVORoJn646oLYGYlClZZhIXVJYmch/USSMipoNez4eUXp85R
	 bqcy7YiEHVCTul7BE9o6pS2YNwYpjsdl1xRe7UKc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCFA9F8007C;
	Sat, 28 Jan 2023 18:19:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12DADF80171; Sat, 28 Jan 2023 18:19:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE9C7F80171
 for <alsa-devel@alsa-project.org>; Sat, 28 Jan 2023 18:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE9C7F80171
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=BWs0dnRI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6F916B8068A;
 Sat, 28 Jan 2023 17:18:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5087CC4339B;
 Sat, 28 Jan 2023 17:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674926330;
 bh=tCEziaVs3JxdlO4hxGu5XvC3DMkiL9pb8Hf2+fJU9L0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=BWs0dnRI2lpt41AsPzgGB8HPTlzbqxytEMrqF0kd6PrMZDpi6R++U6GDzpErVfvWC
 mm3tCT+XkrEhLoZQVXHmT6IGY9rTEmdcUwJ4mP6RN+PQtD1kMiLFCVjN+I6oOAqb4R
 qim8jLHPsVAblNx3TUnnKrtgs+IIkGIF3Im9xc2delTS0b3C7H7155fNLd2kwG95Sx
 9CvnBMqZ6E3rGVTEo24nNMTJ3RtGf0rQembWxJVAEJMJewoRaU+qLtMo0motw5aAUh
 0Z+L+ylloIDwrG3TTiXX8ZjzVs2AapTT39xu3VajG2iRJyRED5Kg28BaLMyh3pQ17p
 4Ru/RsdRSVZlg==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20230126152412.959574-1-luca.ceresoli@bootlin.com>
References: <20230126152412.959574-1-luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: constify fsl_asoc_card_dai
Message-Id: <167492632615.2479102.10999900296434144172.b4-ty@kernel.org>
Date: Sat, 28 Jan 2023 17:18:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 26 Jan 2023 16:24:12 +0100, Luca Ceresoli wrote:
> This is never modified and can be made const.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: constify fsl_asoc_card_dai
      commit: 18e16350558ac42c8cc55c5df714fd28412452ad

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

