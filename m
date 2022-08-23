Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CA559EB68
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 20:51:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3A2C168B;
	Tue, 23 Aug 2022 20:50:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3A2C168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661280663;
	bh=v2a8Ab0aNwJGMtkb8CZSGaqdXiDRPqmdyQ81ECzRFqI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HX2HXZLL2ilGybDyNeW72/21tagfQvYMa5yv3t1hBJv7yNyq+sWN8EkxFylSE8vEP
	 2edYF4ST1HwZLjw3+a6q71Jts/exuacbuQbrn8swNHs701e/bgE1NH4bSeFjdtAmRd
	 YXg18EnGCwYi7DDiVOUcu8KHi52SHdpR6sTp7ZXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6965AF8027B;
	Tue, 23 Aug 2022 20:50:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5F48F80152; Tue, 23 Aug 2022 20:50:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 594E6F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 20:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 594E6F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XxThZNV7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 78EEEB82024;
 Tue, 23 Aug 2022 18:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE5BC433D6;
 Tue, 23 Aug 2022 18:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661280597;
 bh=v2a8Ab0aNwJGMtkb8CZSGaqdXiDRPqmdyQ81ECzRFqI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XxThZNV7CNxQQ4gy14LjOHq7t/s/iALnFiqL9xctkg98k2uPtKgE7Bkz2spzwGOfq
 S19z/tm3liyJ9yhuGi2av3SccJ72F64Kch/fH12LmS1YKB2tkjZ/6bDJsWFL7OOqU8
 5eu9ToycKziVe08GHd5bI305SVDUte5nuvtmIWAuMG4j1LRXfag5vstTspsbIY2rxi
 KhaXhNKTPOie0omIGFDtDPx+y/M9WwUcd9EH0y/uoYJFYkcWqpTVKHlhkf5t4+aVC9
 QVu/9D1GR9yLqblpBXq+rX9hODHQMLLWvNltXbOKRjnVU8xZpxG/WFPIu9bPcbZux6
 QVjyvdoHQ5AxQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, shengjiu.wang@gmail.com, lgirdwood@gmail.com,
 Xiubo.Lee@gmail.com, perex@perex.cz, 
 alsa-devel@alsa-project.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 nicoleotsuka@gmail.com, festevam@gmail.com
In-Reply-To: <1660555546-24223-1-git-send-email-shengjiu.wang@nxp.com>
References: <1660555546-24223-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Add support multi fifo sdma script
Message-Id: <166128059487.1031684.18152206941376913913.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:49:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

On Mon, 15 Aug 2022 17:25:46 +0800, Shengjiu Wang wrote:
> With disabling combine mode, the multiple successive
> FIFO registers or non successive FIFO registers of SAI module
> can work with the sdma multi fifo script.
> 
> This patch is to configure the necessary information to
> the SDMA engine driver for support multi fifo script.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Add support multi fifo sdma script
      commit: 88630575406fdf2a7853545a884484bd55dab8a0

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
