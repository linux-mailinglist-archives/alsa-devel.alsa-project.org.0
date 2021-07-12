Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED343C543A
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jul 2021 12:53:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C390F16A6;
	Mon, 12 Jul 2021 12:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C390F16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626087202;
	bh=Q0LmCKQCfSGQOND5wXq1ayQltdByrVvEHp3u5Nb9hAo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f4cEH8OHwkBdI8/Kr/+RtKNTertVkqdgZE5Qx8vxJ1Zzf3DRB8n81lLNG2i0VOEc0
	 ROEylKeribKU+NLV9P0aAzW+f6a7g+DVVyUYcPeb6adVTuHE/hvlkgoaPwZTXkl9tc
	 63cDnAyuf+M+UZlZhBnPmuGUHvreJggVDoVvacvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51F32F80528;
	Mon, 12 Jul 2021 12:48:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7DD2F80515; Mon, 12 Jul 2021 12:48:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D9E2F8051B
 for <alsa-devel@alsa-project.org>; Mon, 12 Jul 2021 12:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D9E2F8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="OjzSBlw+"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 532BC61156;
 Mon, 12 Jul 2021 10:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626086890;
 bh=Q0LmCKQCfSGQOND5wXq1ayQltdByrVvEHp3u5Nb9hAo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OjzSBlw+Jag83c6fTsDidspwoNOir2H7BVY60natVm45ehitMnbfA9ZABVDFbMXpY
 XGsJfr/pUB31vykZ5C23N+q2TodcsoILwlrkDApoRPl7zFEt/S38c1ry1ClRzG8v6o
 8Oyr/1ZbW6z4c9K2x2jDbg3wEPAeRpfX9Mc5OoqY+/XNwV1mvPYHebYXnHFp1KCecR
 PT0VltXhuY585NBM1J5m6pWWkZoCMs0i4HIVKBYUmOl10Jq88YzlQkHYcFJrKOOsgP
 /zORv7l+m6RyZR+Qlt8+y2mdPohY5sHHO+hTyiPfE+6w7DksfsqM/4CeLOph6nXMRv
 arjYtGoWdIxdA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH RFC] ASoC: sh: rcar: dma: : use proper DMAENGINE API for
 termination
Date: Mon, 12 Jul 2021 11:46:09 +0100
Message-Id: <162608623151.3192.11307653106365626153.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623100545.3926-1-wsa+renesas@sang-engineering.com>
References: <20210623100545.3926-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
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

On Wed, 23 Jun 2021 12:05:45 +0200, Wolfram Sang wrote:
> dmaengine_terminate_all() is deprecated in favor of explicitly saying if
> it should be sync or async. Here, we want dmaengine_terminate_sync()
> because there is no other synchronization code in the driver to handle
> an async case.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sh: rcar: dma: : use proper DMAENGINE API for termination
      commit: d5bb69dc54ec1e09f3fd626fdb9c340c0511dbd5

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
