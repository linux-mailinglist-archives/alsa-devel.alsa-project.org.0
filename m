Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB82340D33
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 19:38:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79E31169C;
	Thu, 18 Mar 2021 19:37:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79E31169C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616092680;
	bh=QedH5/j//TRciaij8fXppON3yxltmyCSzvxab49lE+s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IE16Dxrnx/17Pu4rKNCtfpCTtMS6EV6DUSfA+Apivqy1Go9Bm/X0JIaYkZ/4vm5Eh
	 19sYBv/tL5Wd8JalraQDYzg30AWNxyuQPB2DT1Z5vdxU/46gS/ezjwYYLnYx1wD6sX
	 KguuBrWDq8AOwflt4PtjWnm/vH+FcNNi7wOS/vQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D93A1F80218;
	Thu, 18 Mar 2021 19:36:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 964D1F8025E; Thu, 18 Mar 2021 19:36:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16F59F800E0
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 19:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16F59F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B5A2uB8V"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 019FE6023B;
 Thu, 18 Mar 2021 18:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616092577;
 bh=QedH5/j//TRciaij8fXppON3yxltmyCSzvxab49lE+s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B5A2uB8VE4b8YTllZ94dXpImx5LnExRGSv8hrqv5NXvozZNqUETPsOGDO5VNuGtLw
 13Y6MUyQ04n0HahMf59BPwvxA0bQcNV60Vq0brj1ndSIhUHyrr/alW3CdI7v3oYxLr
 foyPiMxK11YlfCIa6ihwUDXRkDXpf5xSqyJCCZZsRzWdqCM/KbJaQwFS+hGiEG/Mun
 mp23ZkO+ZlwBSoEXeBoxO/jpdfriAzHxcu9joEZtKPYSDoFWG0U8zlouFPrwd8jsYP
 sEzSpVqvpJI3DTmSouTZb9Ox93iI2wm+wHHP31fvIFw/bEVGFBohkH6r+oG1zFBRcZ
 Y7wCfRSN4/S9Q==
From: Mark Brown <broonie@kernel.org>
To: jack.yu@realtek.com,
	lgirdwood@gmail.com
Subject: Re: [PATCH v2] ASoC: rt1019: add rt1019 amplifier driver
Date: Thu, 18 Mar 2021 18:36:03 +0000
Message-Id: <161609213720.41838.6156226368545011492.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210311025809.31852-1-jack.yu@realtek.com>
References: <20210311025809.31852-1-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, Mark Brown <broonie@kernel.org>,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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

On Thu, 11 Mar 2021 10:58:09 +0800, jack.yu@realtek.com wrote:
> This is initial amplifier driver for rt1019.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1019: add rt1019 amplifier driver
      commit: 7ec79d3850d0cb6dc52e6aa472886ab3adf15863

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
