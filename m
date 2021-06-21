Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE45F3AF5AE
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76E2B169F;
	Mon, 21 Jun 2021 20:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76E2B169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624301502;
	bh=SN+qrXMbE8Abb64kSFh88Ffj5fHdUzBtrTUgIubwrTA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DxoZ/n2gbHtBO4OWxdyPCU4M1xMXoUPnKzAWkYenXjQ22057hWaZcvPu+wpNQcXyq
	 wxifR0Q75M+rq3s4zyG9dLlpNK8thsxisA4Z6gYpDggzCluSNClLAVB5qFADYongjP
	 ym6aPNtVJv69BbiCHmnoCfrD6S4mAs8aQBXa88eo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B5F2F80518;
	Mon, 21 Jun 2021 20:47:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 491B4F804DA; Mon, 21 Jun 2021 20:47:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05C44F804DA
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:47:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05C44F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QAigzp5Q"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 213BA61353;
 Mon, 21 Jun 2021 18:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624301234;
 bh=SN+qrXMbE8Abb64kSFh88Ffj5fHdUzBtrTUgIubwrTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QAigzp5QiPP1G4RRjO6QuPsrgEiWx45SAn5QiE6kq/+LLsW54eR7NEeAZ/nA5DVPo
 4Gxei37y8aZfNz+TMGx6P9/1XRvIV1K194hrcPND9/O0e5s3FaGouj9bxsTib538pU
 aGSG3AeOdoXotl1lVgbRKGx+s3XC9Tg0qDUo5XF4CuIsBcUrqDcyuffBEFUnKQ+hK0
 p7RovdBPuqaANh5hX+XQh/id0pxAUa7tb2MD9LsiaxkN0X9/USqYsfb6kSlxwjvBqD
 VNeG/aGPUwqpsV4MutPyfmvpR1TsM70mXCcMc9KoGzRQ5bdhYsbVgL+wtiBQ8mdcQF
 pnYCR+TDIA1eA==
From: Mark Brown <broonie@kernel.org>
To: Xiubo.Lee@gmail.com, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] MAINTAINERS: remove Timur Tabi from Freescale SOC sound
 drivers
Date: Mon, 21 Jun 2021 19:46:05 +0100
Message-Id: <162430055264.9224.16409542437209758766.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210620160135.28651-1-timur@kernel.org>
References: <20210620160135.28651-1-timur@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>
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

On Sun, 20 Jun 2021 11:01:35 -0500, Timur Tabi wrote:
> I haven't touched these drivers in seven years, and none of the
> patches sent to me these days affect code that I wrote.  The
> other maintainers are doing a very good job without me.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: remove Timur Tabi from Freescale SOC sound drivers
      commit: 50b1ce617d66d04f1f9006e51793e6cffcdec6ea

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
