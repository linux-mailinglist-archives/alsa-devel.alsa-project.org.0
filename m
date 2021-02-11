Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B937A31918E
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 18:54:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F402172E;
	Thu, 11 Feb 2021 18:53:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F402172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613066082;
	bh=qmfAhfUdppttPQ6TXmzl6B/dCyPqvEMTkTpqjmkxJTw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jgVIakpDyNitRfcE5VLcr+7/wQ117K6KW4IEgGVug8UpqRcUWNfdvleQ98jN7zvAS
	 ttgLI/RFCQx4HrLAJOHSXaAdgYX3D3CwQrBv4SalMt0zNUe7qtzZuv8nHIBesQt8/v
	 hZseI+y2qQSJjm58RR64RlgkWx20KyajMsLh4X6A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3745AF8025F;
	Thu, 11 Feb 2021 18:53:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA0F1F80259; Thu, 11 Feb 2021 18:53:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0A84F801D5
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 18:52:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0A84F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cMZsyhyH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C727964E05;
 Thu, 11 Feb 2021 17:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613065978;
 bh=qmfAhfUdppttPQ6TXmzl6B/dCyPqvEMTkTpqjmkxJTw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cMZsyhyH8BWKNfC8HxZRuVQBnXT0Hav7DI+rirmiXuZQfmRC395IRtYdBtwtVEU9F
 MW/1begZfWBeeieD6ZRkmOlw8Zq/7XZySmbmlaiMlZZwJ3uJ9zFNdqtLI8j9ILrnz3
 jWrCluFJ4p96g8CFxUVPgx10wxG4DnlsuLpjouVva0MxH5JwExYRCF9BLvp2/aUu9h
 lGxHPY04PVbUPGomz9V1c360lIzWWWtjnjPdo+ITWIn7ehRUpAu2jkd+l4qYW07LtA
 Ajeq3IUu9gCRZg4WDLa1pTBwp88jwT2yOtlCprqRep3PoHG8wT4Kd6JgJW5vjqNF0j
 3DRDerlgDtxTw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20210211172440.2371447-1-kai.vehmanen@linux.intel.com>
References: <20210211172440.2371447-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: relax ABI checks and avoid unnecessary warnings
Message-Id: <161306591794.11031.14733808334234839700.b4-ty@kernel.org>
Date: Thu, 11 Feb 2021 17:51:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, pierre-louis.bossart@linux.intel.com,
 lgirdwood@gmail.com
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

On Thu, 11 Feb 2021 19:24:40 +0200, Kai Vehmanen wrote:
> With recent SOF 1.7 pre-releases, kernel has been emitting following
> warnings at probe:
> 
> [10006.645216] sof-audio-pci 0000:00:1f.3: warn: FW ABI is more recent than kernel
> [10006.652137] sof-audio-pci 0000:00:1f.3: warn: topology ABI is more recent than kernel
> 
> The warnings are emitted due to increase of the patch-level in firmware
> mainline (to 3.17.1). But the patch level should not be considered even
> in the strict ABI check, so modify the kernel side logic that makes the
> check and only consider the major.minor components.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: relax ABI checks and avoid unnecessary warnings
      commit: 53129e66e4b716ea7cffa4477a96ccb48f78e7ac

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
