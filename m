Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 404133C8BFF
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 21:38:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0A19168B;
	Wed, 14 Jul 2021 21:37:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0A19168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626291485;
	bh=+iqpkm/0K4nuKXlZXVcZmdElgnXPYVY1LAS9lTfXG0w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tXhwhak9SrLZvA3m5zbm4Z321iiCpGg3XR/aV2e67Pplw48mxQzdeK22l4TF0LwSg
	 qGdt1PbDqfOOZhfBlh6aeSUt7oYrN7CJ3A9Bn0PU4LcLZM0XlkpVHOczy5SqpPaA03
	 FlYhUSOstkKh2EyNMjcSWfDsY9/WkiW0DiWD1/fo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03531F8025B;
	Wed, 14 Jul 2021 21:36:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9DFBF80254; Wed, 14 Jul 2021 21:36:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DD6BF800D3
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 21:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DD6BF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Kearmtzo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9465D613D1;
 Wed, 14 Jul 2021 19:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626291393;
 bh=+iqpkm/0K4nuKXlZXVcZmdElgnXPYVY1LAS9lTfXG0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kearmtzoruo05Xf6AEoBNGVIXH5167+Cbnq9jreTvWfAzPjnKzDT3yWCXlf9Kcadp
 a5zEgnsudbJHEJlL7sppLPjUrRcnCekYqxrIVQ5VAbOe/mpfu7EhhY53kcfs+/GrAn
 GWU7BMNzb01XontcUuZ/dgnHrQUrjajZd3VQt95+LT7xAn535vdXUCg0ZKva9UfLA1
 q83HISJQKo7AwwtGBnKn+C4BEcq52OIoM0xjiamzLB0JEDY8vYeiD4KHJZsVyuKgGp
 l/hoiyslf1CiZ6UxLncTLyOeRDgnqYK23zljzhPCT5SBqE0X9xwOpiw0EVtYmKv4T3
 uRBdliHweLPmA==
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: (subset) [PATCH 00/10] soundwire/ASoC: add mockup codec support
Date: Wed, 14 Jul 2021 20:35:56 +0100
Message-Id: <162629086374.53311.4247206766252361294.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
References: <20210714032209.11284-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 Mark Brown <broonie@kernel.org>, sanyog.r.kale@intel.com, bard.liao@intel.com
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

On Wed, 14 Jul 2021 11:21:59 +0800, Bard Liao wrote:
> Adding mockup SoundWire codec is useful to debug driver/topology changes
> without having any actual device connected.
> 
> Bard Liao (2):
>   soundwire: stream: don't abort bank switch on Command_Ignored/-ENODATA
>   soundwire: stream: don't program mockup device ports
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: codecs: add SoundWire mockup device support
        commit: 81d3d3d0bf09e606dbc1e3daad1c7cef3976fca2
[02/10] ASoC: soc-acpi: cnl: add table for SoundWire mockup devices
        commit: 2694cda7a4393fbd436e28474832a053e70e0733
[03/10] ASoC: soc-acpi: tgl: add table for SoundWire mockup devices
        commit: 3025d398c436d313f9b6b5c1f53918efeafcf5dc
[04/10] ASoC: Intel: boards: sof_sdw: add SoundWire mockup codecs for tests
        commit: 0ccac3bcf3564cbcba483dec20c7550939873f59

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
