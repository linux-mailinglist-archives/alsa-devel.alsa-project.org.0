Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6424635E269
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Apr 2021 17:13:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F38841676;
	Tue, 13 Apr 2021 17:12:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F38841676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618326794;
	bh=2mrmh7KWeWnO3AgGPTiEPrsluOYYVwNB/gzeJ2AAmJc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZN65cQb9xe3yxF8eMFvJWs5qCS+eAR0p4CRI1v2ahn7tTbkaw2mFDOLfPVBfwYJio
	 PzQGHpNfHYmLf6vjgaPmT8EAmgq3iCEOstQlK2MhG477mIysH8IvKeUzC5sUcL8E37
	 oCK62YA+dnDlPOkg+TmpHvnoCG2xDYektpZFKJrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5E27F804AD;
	Tue, 13 Apr 2021 17:10:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B801F80475; Tue, 13 Apr 2021 17:10:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 676B0F800FF
 for <alsa-devel@alsa-project.org>; Tue, 13 Apr 2021 17:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 676B0F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bht0AWlK"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 417CF613B6;
 Tue, 13 Apr 2021 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618326560;
 bh=2mrmh7KWeWnO3AgGPTiEPrsluOYYVwNB/gzeJ2AAmJc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bht0AWlKxDnXY7xXGf9zBminX8JaUxZmolH/VsR+q7RN72k80Z6js0ybi135ERVrk
 XI3zkfLXZ1uoCCBDFBWkemj37ULTNeb2lqytJZqdoPYpQ8oiDAogk9Wkzjf/sHFvCR
 U/qhJUdY4I8fHe3T9AOWSmxMgx1AKZj868Veh6Il5T1euBsklGTxXGQqZ94rbsfyYS
 t4RzcicjkmiosXa9MA8G3UQ1OXSrGfqi2Wsx7lPTCatn5+tIeYdr950mj34Dd78N+s
 ehI5+QfOQXBsMnMysXUDFr4wKylXzXy+wKaJu84MrR/4b8OLw9EFZFDg0FSKfoUrw/
 kVFomZsah9Qbw==
From: Mark Brown <broonie@kernel.org>
To: david.rhodes@cirrus.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, james.schulman@cirrus.com
Subject: Re: [PATCH] ASoC: cs35l36: Fix an error handling path in
 'cs35l36_i2c_probe()'
Date: Tue, 13 Apr 2021 16:08:53 +0100
Message-Id: <161832446010.49152.18429371778012715101.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <9fec48e75bc1d3c92626e6f6aca2344bda223379.1618145790.git.christophe.jaillet@wanadoo.fr>
References: <9fec48e75bc1d3c92626e6f6aca2344bda223379.1618145790.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
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

On Sun, 11 Apr 2021 14:57:13 +0200, Christophe JAILLET wrote:
> If 'devm_regmap_init_i2c()' fails, there is no need to goto err. We should
> return directly as already done by the surrounding error handling paths.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l36: Fix an error handling path in 'cs35l36_i2c_probe()'
      commit: cdf20c3ef0e90b962e62ae7d835d7f46333285bc

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
