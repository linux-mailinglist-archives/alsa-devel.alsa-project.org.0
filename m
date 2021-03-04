Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA55E32C530
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Mar 2021 01:58:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A23B1AA1;
	Thu,  4 Mar 2021 01:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A23B1AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614819520;
	bh=L0OP+7WE67QJyKe867n6tBB39PeMXXr6mqmjqW7ik3I=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qAvwyBkz2J0B5jBxJ3x2I7Bo9ELuSSeoJbQqUGvCGXOOyYpRTM+ibUlG8ZHbAyGTl
	 JMxBS4tB6e34p5Aog37nFcbY9jNHBjyjc805P0lwJtqCNlS4RhB3l3jW6u7wKkpptz
	 GJMpfV/zw/XT+lMDA5jM/p9WSHFQBwXY6prZmhCc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51F8BF804AE;
	Thu,  4 Mar 2021 01:55:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13BF8F804AD; Thu,  4 Mar 2021 01:55:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 735C4F804A9
 for <alsa-devel@alsa-project.org>; Thu,  4 Mar 2021 01:55:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 735C4F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nRXBEoqe"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1170364EA4;
 Thu,  4 Mar 2021 00:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614819337;
 bh=L0OP+7WE67QJyKe867n6tBB39PeMXXr6mqmjqW7ik3I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nRXBEoqeFGZGQKz2Qvzza5DTGlhVW1KUlBrsXeeRSCZ0TTABYVu+ttVGatWYCt9Oq
 4Z4VIDyLBP9w8kKo1pGz2qKPZ6l9zFAbG4BbOW7HuEp0INFz3hPiY93Z4qKokDcSpY
 2CXAQACZimFjdk5rnEyAG5uOzwLao5LfVoXZJJWRObUAIx+6HeiLoH8xWYrUZyXKd+
 BUneCFg6fkLE0FsnqoTw6uIkrhnCwUs0vpPaGlb46aOaOM/cqmm7aJzzzR7z7yCYyS
 +IxZucAfYXe9thHzMtnEzuBFeXt+bHiJO8b1LCpCFDUURd7WwBjHXUXFz4DxUpagHD
 lcaFqkPXv2ETA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210301235637.1177525-1-pierre-louis.bossart@linux.intel.com>
References: <20210301235637.1177525-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: soc-acpi: remove unused TigerLake
 configurations
Message-Id: <161481924069.9553.424705069305614938.b4-ty@kernel.org>
Date: Thu, 04 Mar 2021 00:54:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Mon, 1 Mar 2021 17:56:35 -0600, Pierre-Louis Bossart wrote:
> Remove two machine descriptors which were added for development on
> Intel RVPs but are no longer used or productized. This will not have
> any impact on end-users. The corresponding cleanup was applied in the
> SOF topologies.
> 
> Pierre-Louis Bossart (2):
>   ASoC: Intel: soc-acpi: remove unused TGL table with rt5682 only
>   ASoC: Intel: soc-acpi: remove TGL RVP mixed SoundWire/TDM config
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: soc-acpi: remove unused TGL table with rt5682 only
      commit: 94e534632b1ba6066f7af976d2e3059050706c3d
[2/2] ASoC: Intel: soc-acpi: remove TGL RVP mixed SoundWire/TDM config
      commit: bec93283948a9edba21ca6689a28aec2b7df7ecb

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
