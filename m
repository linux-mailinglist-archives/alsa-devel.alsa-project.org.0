Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A2D5124FE
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 00:05:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B0001616;
	Thu, 28 Apr 2022 00:04:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B0001616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651097101;
	bh=mLt9NKuZAqlcqGRyyPESfn75LHJme6gpyyHJSBS47+o=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QHduoxPxrHH9BYASLZeHM1ZWudJMwZPzf7MnLnFOVldOhUY6OkhyIyXwVZPKQ6Abh
	 +B+zIaFUPQkX1EySqr/SfxxrZchHTBRPW8pM0kVLSM/7ijBGEYXcXc4s/cu9OnB37c
	 IHc3yTaEmzDHsfhJrX6O9Opx3IGV6PTv9zrzu+yM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98160F80516;
	Thu, 28 Apr 2022 00:02:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70E51F8030F; Thu, 28 Apr 2022 00:02:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD2F9F80155
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 00:02:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD2F9F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WMEt+6St"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3FDCE61E0E;
 Wed, 27 Apr 2022 22:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC9CC385A9;
 Wed, 27 Apr 2022 22:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651096954;
 bh=mLt9NKuZAqlcqGRyyPESfn75LHJme6gpyyHJSBS47+o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WMEt+6St38+rmwtZDGN0ZpWm99lCVg/EoV8ywQIIff4aE3C3AODMQlq/EoDE/eD1m
 baCTDH4N7/OJLu7Sm89INA3uu97J75R1eXFSxalrSVCtGP9tj9z8M3vIAIH9S/BDuy
 IfapSgpYZsrL6dCUrn5PNnnj61mqZ5VTHRTRcueuXo/QWkw5AQF8Uj57C31y6LNfJr
 zbJw3/skonJEOKsPXe25R3vAxwZKCyrKLWbyThUZdIpGtBvuXC6kc7r91ykl001RU4
 olRUwzZ1g2366TgEXVzpCt48hMauc9OcR3TbQyNpmfJl4xPkhNBeahA3i0lq3EWL0E
 9GlnxmSC5v2WQ==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220426183459.102251-1-pierre-louis.bossart@linux.intel.com>
References: <20220426183459.102251-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8195 change ipc timeout as 1 second
Message-Id: <165109695284.498174.11670949836816525149.b4-ty@kernel.org>
Date: Wed, 27 Apr 2022 23:02:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, cujomalainey@chromium.org, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com, yc.hung@mediatek.com
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

On Tue, 26 Apr 2022 13:34:59 -0500, Pierre-Louis Bossart wrote:
> From: YC Hung <yc.hung@mediatek.com>
> 
> The IPC message sending can take longer than the default 500ms during
> system boot up due to the concurrent loading of different drivers.
> Increase the IPC timeout to 1 second to avoid timeout errors due to
> Linux load and scheduling.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: mt8195 change ipc timeout as 1 second
      commit: 5ab1679d6aab2e7855cd9241d4d832d1cda0ca46

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
