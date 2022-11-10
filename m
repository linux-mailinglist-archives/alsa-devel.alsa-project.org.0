Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBF66248CD
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 18:57:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F164E168E;
	Thu, 10 Nov 2022 18:56:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F164E168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668103062;
	bh=neqdDSX64Qbj2B6Kkn0yH1vuj0ia+hcUcZXq68TGa3c=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bS9/ZKlJIwj0m+W600UOlrMFH9O4M1x9ZJJpK/dpNO9sFib7vbditEcD4fp5Mhik/
	 Gd3yobi6xQYzs9XqaPLBpvRZLi73uerIfSUyfzqnIx5SvyncC0EOwy6vqm1E4L22tD
	 5MC7dJTBz3TrhFSPqwjGLx6VvqBmyLEtoQRlBq/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82DF9F80566;
	Thu, 10 Nov 2022 18:55:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D85F6F8055B; Thu, 10 Nov 2022 18:55:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD66DF804FB
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 18:55:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD66DF804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jiE1zh5b"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 52E4561DC6;
 Thu, 10 Nov 2022 17:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805EEC433D7;
 Thu, 10 Nov 2022 17:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668102930;
 bh=neqdDSX64Qbj2B6Kkn0yH1vuj0ia+hcUcZXq68TGa3c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jiE1zh5bNBB486dsVCoWRSXG2ThRgvC0t2qOQ25PQeNQC7Rj3eaDh5mUSPbUnEGYY
 WaFJ4grYunvhj3YrIce4c0x8l7pB4QaSJaBsJdE1TGp9Ij03wPmrSOCdflOuYJRx5n
 LYZiJJXtYzgy1rbwZ/C1kpN7d3bTJ90ID+A9YZeu/Mw9OfxxLmbVSOZYqsm6hO+bal
 C/O+3sz6E5L1/4+dqBTjYME19xg0Uvh0oe5hqsQM5sBKOw4PRHI5A09AjIudJOh7fI
 lpaG73hw23PZYyHYqSO3jDIhNHFI+iJxhvXwTmrTG0N5BEjBzW+yjkahInChMWO+O6
 DHefXn9nLTkPw==
From: Mark Brown <broonie@kernel.org>
To: kai.vehmanen@linux.intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com
In-Reply-To: <20221107072621.28904-1-peter.ujfalusi@linux.intel.com>
References: <20221107072621.28904-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-loader: use small buffer for iccmax
 stream
Message-Id: <166810292924.959181.3904673576592325283.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 17:55:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

On Mon, 7 Nov 2022 09:26:21 +0200, Peter Ujfalusi wrote:
> From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> 
> The data received via iccmax stream is not used anywhere, so no need to
> allocate a big DMA buffer for it. This is especially important as the
> allocation is done even in cases where reload of the firmware is skipped
> and execution happens directly from the firmware stored in IMR.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: hda-loader: use small buffer for iccmax stream
      commit: 36c6cdc07b517e88ccde8ebcc87bb5c59f2a0f4b

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
