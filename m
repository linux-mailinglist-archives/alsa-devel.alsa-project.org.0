Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDE14D1F11
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 18:27:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6109A18C0;
	Tue,  8 Mar 2022 18:26:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6109A18C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646760428;
	bh=YzDVRHHe4KzIf6sXoA5Jjdffip2Zv92DuhYkKW62tqo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CaDhyMFZ3aPTXbU+/7PQXF0gmSBRcNn4aygtHU/IOKZBTcLW2scONDYeDmHzREqv+
	 +bsqfGGXrymXb/RxwvWjaWySps9ws6N+w47MZF60xRC/gxdK9yJjEadctEjSm+3Z8C
	 f7BFryv0qNslNpmle3SRsjk1aXTGykGpJVWXXPfE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ECCBF805C0;
	Tue,  8 Mar 2022 18:21:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44127F805B5; Tue,  8 Mar 2022 18:21:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FBD0F80553
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 18:21:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FBD0F80553
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EvLSWYVI"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8375EB81BB1;
 Tue,  8 Mar 2022 17:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F08C340EB;
 Tue,  8 Mar 2022 17:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646760074;
 bh=YzDVRHHe4KzIf6sXoA5Jjdffip2Zv92DuhYkKW62tqo=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=EvLSWYVIL9zy84zHJXvJHR6qwowDJYxdmUl1KmGK8Zl+1Ve1KT11oG6GYDPPD+YZ3
 CPgSdPx2EGvltyY6moIgaWk1gj7GSBAjVi/eFlPXTN52ec2wTKfjWutVsMNPD5kDe1
 1Xf0eDyS5dQG3ALvR6VLhciHatZPRUf6LTaWgPhKBg+1eyJqBwyat7c55d2A0l7iUG
 wtgNwE5psvgV9Xfz3sFCrsT4iPTYqg5vpz3+J5qweW86JR8q+XlLufld5CrD5Gka1x
 kgr4NC7xLVOoTOQMYvcRXjixWJJ4vvM22r9jOFHXUSteeAPnr6UX6cs5xkq1GhwnaS
 YfFzsx0/VG5cQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 Miaoqian Lin <linmq006@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20220308020146.26496-1-linmq006@gmail.com>
References: <20220308020146.26496-1-linmq006@gmail.com>
Subject: Re: [PATCH] ASoC: mxs: Fix error handling in mxs_sgtl5000_probe
Message-Id: <164676007157.54315.10226994232050384296.b4-ty@kernel.org>
Date: Tue, 08 Mar 2022 17:21:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 8 Mar 2022 02:01:44 +0000, Miaoqian Lin wrote:
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error paths.
> For example, when codec_np is NULL, saif_np[0] and saif_np[1]
> are not NULL, it will cause leaks.
> 
> of_node_put() will check if the node pointer is NULL, so we can
> call it directly to release the refcount of regular pointers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mxs: Fix error handling in mxs_sgtl5000_probe
      commit: 6ae0a4d8fec551ec581d620f0eb1fe31f755551c

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
