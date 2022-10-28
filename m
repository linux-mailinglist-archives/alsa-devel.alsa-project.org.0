Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBD7611A4F
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 20:41:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3723857;
	Fri, 28 Oct 2022 20:41:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3723857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666982518;
	bh=J63xDN385WkYcttUjIeqnREI32txKyEasspmaUYdsLE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B+lQvlJmWFtyuNuTndXcIj7PKLcKz3ekAbMfx+soCbwXoC0ld/mYBVkXBXni0b7aT
	 Zrrik4p6axePGTdPRKlX7X4cNvnRr1gKKNL07suQ2TWEHZ3bbkIBDA83o998GGpoDy
	 oPoyV7ZsgQT7WsEgo0TumXUoUNXYpCHsAh7S3P24=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A18AF800E1;
	Fri, 28 Oct 2022 20:41:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7639F8025A; Fri, 28 Oct 2022 20:41:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D655F8016A
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 20:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D655F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p3SAEcPx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 576D3B82C75;
 Fri, 28 Oct 2022 18:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12E0C433B5;
 Fri, 28 Oct 2022 18:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666982458;
 bh=J63xDN385WkYcttUjIeqnREI32txKyEasspmaUYdsLE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=p3SAEcPxoYii2PMtDoxWHkXSmxMSQ42EndrIJ+V1qS7V3g+XgalhhtkRA8t+YUzN+
 zVp+7s8aX5Gm7Umru3MbNqmKEpwlPCJzumgA/KCVBuATMMoUoYk357IelsbXZm5ejc
 yhWAulR6D21cFOYk4sIPJJ2bXhbZXabilQeNsrCY3tGHzrLUB37ydCuoVl/2gtYHFo
 Ka0WSNpoQx2pK/EmlutLS2eu2jjhCPER0dl7VPuznOefX5h+DipU57BJ2JX7mNMxev
 ChrsfLJWz9W6xGe4XWBi/BLhxpRAsSyiHaUZh4/i1Z6R4rx+gXvwZ1DqpEqjxTp3Ft
 2pfA2DUDXUNxQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, 
 Maarten Zanders <maarten.zanders@mind.be>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
In-Reply-To: <20221028141129.100702-1-maarten.zanders@mind.be>
References: <20221028141129.100702-1-maarten.zanders@mind.be>
Subject: Re: [PATCH] ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
Message-Id: <166698245564.1295082.1282154196218067970.b4-ty@kernel.org>
Date: Fri, 28 Oct 2022 19:40:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
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

On Fri, 28 Oct 2022 16:11:28 +0200, Maarten Zanders wrote:
> When CONFIG_PM=N, pm_runtime_put_sync() returns -ENOSYS
> which breaks the probe function of these drivers.
> 
> Other users of pm_runtime_put_sync() typically don't check
> the return value. In order to keep the program flow as
> intended, check for -ENOSYS.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
      commit: 6a564338a23cefcfc29c4a535b98402d13efdda6

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
