Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7094159EB29
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 20:38:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ABD9169B;
	Tue, 23 Aug 2022 20:38:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ABD9169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661279933;
	bh=l2nHu3gveFD2gonWT9Uf2SbvswRg2/zPnfi/nmWcZOo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fXfBKC+aCydlNzGXqZR6vRwTRuFgzs07TaWr7J9rLGJhN+84MdjM9PIkmYdg6K9OD
	 9CVMHqk53SGZnXyW4pgQxRVSnOdomt9/Zt4I5zoXHdNONbmWytkyk1/o+tCZlSAajj
	 kMArjVCMcAfmrGTAhHUU4aMYloeBtOez0AbgTcTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D1D3F800A7;
	Tue, 23 Aug 2022 20:37:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA7F2F8027B; Tue, 23 Aug 2022 20:37:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AB212F8020D
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 20:37:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB212F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kIj6HHZq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8D7F616D8;
 Tue, 23 Aug 2022 18:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5670C433C1;
 Tue, 23 Aug 2022 18:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661279836;
 bh=l2nHu3gveFD2gonWT9Uf2SbvswRg2/zPnfi/nmWcZOo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kIj6HHZqPvcPIYxV9ZxsZE95/W/AvUwwdj4lY8BrXGJBDh4aIwgfHnEmzDURBt3Bo
 Qzm8rCPPX/E4OA+RUwuR14anv+tb9XPXFU19AFMoVHiGalAb8wSIaHyY7C9CKFi+FF
 MG7ucrsA6qrLcLE1u5nI6QGk6xw0xOQACjGpHzJPSi9K0k4kA6Vp59kmUFy/tQIpPn
 Gcd2iCalwNOrzHIrSFpaZNoLeF69SjD8W2XeLO8IdUbNaZAxPqjsx+m5pI0f6PmXVB
 jzuURks0hDwpLf1QfPHn9ErK2lX7GieZw37JWOCxl4yizTzhJeVT2czvj60mPLKbZw
 zKKE3aHHnK+Ng==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com
In-Reply-To: <20220823121554.4255-1-peter.ujfalusi@linux.intel.com>
References: <20220823121554.4255-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: SOF: Kconfig: Fix the dependency for client
 modules
Message-Id: <166127983458.711152.668539616548226774.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:37:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

On Tue, 23 Aug 2022 15:15:52 +0300, Peter Ujfalusi wrote:
> There is still a chance to end up with a client driver selected as built in
> while the core SOF is as module.
> 
> Fix this by making the client drivers depend on SND_SOC_SOF.
> 
> Regards,
> Peter
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Kconfig: Make IPC_FLOOD_TEST depend on SND_SOC_SOF
      commit: 3942499fba11de048c3ac1390b808e9e6ae88de5
[2/2] ASoC: SOF: Kconfig: Make IPC_MESSAGE_INJECTOR depend on SND_SOC_SOF
      commit: 2cf520ffbcbd55c0f2b4276065444d7526d9d197

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
