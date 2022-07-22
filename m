Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C76D57E1A1
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jul 2022 14:50:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDCB718CD;
	Fri, 22 Jul 2022 14:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDCB718CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658494236;
	bh=A3PD/iBpdUVc6XMGatL8EReF7qKXiMvSVxBYCt3N/IQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QcU2FLMS3SBaT/v11m0QU9sPy1rFZwG1Sy+zwkKw8FUEgaHs72xVQuI5QH+bDMNqc
	 Dem59NXUlY3jvvi2k4O9ucztoroqeEfuyd9V393pbivFJfV1jocpuWiKbybSaHz9XO
	 3U2cq5gQ86t+uev44bmBjGfzTw1ujyk5gk8E0me0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FFA6F80557;
	Fri, 22 Jul 2022 14:48:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72AECF80553; Fri, 22 Jul 2022 14:48:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 036EBF80246
 for <alsa-devel@alsa-project.org>; Fri, 22 Jul 2022 14:48:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 036EBF80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WNXXEhny"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 56C04B828E2;
 Fri, 22 Jul 2022 12:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49D4C341C6;
 Fri, 22 Jul 2022 12:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658494101;
 bh=A3PD/iBpdUVc6XMGatL8EReF7qKXiMvSVxBYCt3N/IQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WNXXEhny9JV3eScg/Pmy2l/tXCbGqDYAPW1nz2h14NzN7eMlNrw2Og7z7oqwKtcUb
 RIksLa2sljIzaD/RqBbd8wuDvt1ogo+UYJEy9ImtFInc0TsNH838fcennlfrMZ5HhR
 tLIPltZIqyvGWrZN0z27s13vtg+7GKzLOX99E8FLISiZ8jaDareXDZ/uzwqdJUOBVX
 VmsJvTmz5uc/UnqJnu2WNQx0L6OhemJGcoWY0ga4gxfadicqDN//IAtSpB4uN9QCcy
 ueZLUDqEipKBnytIxnaUF8OEnDR2Gol6vxjPiFxrFq5rRD7rorrBoT+Zh57lnUIgak
 dx2LsBuhy56EQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, syed sabakareem <Syed.SabaKareem@amd.com>
In-Reply-To: <20220721061035.91139-1-Syed.SabaKareem@amd.com>
References: <20220721061035.91139-1-Syed.SabaKareem@amd.com>
Subject: Re: [PATCH 1/5] ASoC: amd: add RPL Platform acp header file
Message-Id: <165849409858.139149.7568411438322284849.b4-ty@kernel.org>
Date: Fri, 22 Jul 2022 13:48:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d952f
Cc: Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Basavaraj.Hiregoudar@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com
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

On Thu, 21 Jul 2022 11:39:58 +0530, syed sabakareem wrote:
> From: Syed Saba Kareem <Syed.SabaKareem@amd.com>
> 
> Add ACP register header file for RPL platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: amd: add RPL Platform acp header file
      commit: d6a2cc9a80c2fdc10f7fde3f5f57c72e99f3bd5e
[2/5] ASoC: amd: add ACP PCI driver for RPL platform
      commit: 003b9a96f27635e534452b174733c5f1ceec0b56
[3/5] ASoC: amd: add RPL Platform init/de-init functions
      commit: 10599205417ee3b1d29093c85bc210c9040a6bd4
[4/5] ASoC: amd: add RPL Platform pci driver pm-ops
      commit: bc1100f29d1d0bfcd36ba3690a945235ffe149c8
[5/5] ASoC: amd: enable RPL Platform acp drivers build
      commit: 4fb35936a374758d5065b0a015c565436685c378

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
