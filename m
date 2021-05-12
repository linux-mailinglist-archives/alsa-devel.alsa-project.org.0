Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ED537CD18
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 19:08:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F0FA189B;
	Wed, 12 May 2021 19:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F0FA189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620839287;
	bh=YaoevDFjIY17vi4buq0/qeIINbcaxR8hvpNDDt/Y8Dc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iqJH1i/bDCAef733AdH8yx04xbE2Mal6YufE3ZI2phYD2xndKTiSivIwOjDFLsgoq
	 vMzQT+7oPVeRa6LZbND/Nf1PtgG4SppO4mlBJZospfQIzy1zK3IvvKFcKETY/YxMdQ
	 2XgiQ7ZFSX3wNQerrKHsiDOdAo/NvupbpBwntZIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 824A2F8042F;
	Wed, 12 May 2021 19:05:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCF23F8013A; Wed, 12 May 2021 19:05:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DF03F8013A
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 19:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DF03F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cbz+PqaB"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28001613AA;
 Wed, 12 May 2021 17:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620839138;
 bh=YaoevDFjIY17vi4buq0/qeIINbcaxR8hvpNDDt/Y8Dc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cbz+PqaBWaFpLm9myFUoqe64Z8wyRkdgRvG8sHMKSrz/ZLna0a70Ve83f7iWuI9Rp
 yr4sVbDJG8RpVv9MzWvsVAul3Ibf1DMA3HbkURzgnPfUa5HBg4VdZ1TYlFXuIDzWA7
 EfLjl6IENXZ2cF+aQ2TzonAPJM8QQkxYVsFvfHHxVvtBKLQrGArNBi+mi4bzT7kpPP
 Dvyw9kiQa6GDVhQ0YVLUZaUFzfm7lAz3fCbRO6q3oPK9euDIuXCshqMDGhcrZnzLJR
 r4q35SIrOd+0p7whlE6wHo4lMb3NNhDEeuRiUIMHrcffmLDFdSBnCoSI6dLrBbg/uI
 NZxkRePE6tsBQ==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm2200: remove include of wmfw.h
Date: Wed, 12 May 2021 18:04:41 +0100
Message-Id: <162083892846.44734.12299613001191386332.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210511171514.270219-1-simont@opensource.cirrus.com>
References: <20210511171514.270219-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Tue, 11 May 2021 18:15:14 +0100, Simon Trimmer wrote:
> We want all wm_adsp clients to use the wm_adsp.h header as they
> shouldn't need to include internal sub-headers.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm2200: remove include of wmfw.h
      commit: 7fe0b0981a1764d665877fa5febc5e8e0e64d2ea

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
