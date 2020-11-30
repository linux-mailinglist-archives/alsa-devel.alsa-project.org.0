Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E546B2C8C7D
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 19:18:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 609E11701;
	Mon, 30 Nov 2020 19:18:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 609E11701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606760335;
	bh=8cqYTAO7zXCkg3dI7zmJ6MhmYQP/JvOs34PggWV2qmI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=atsKZKxOkm7Ai3/U8a3ElFnI7QSQiLv5kfPxBLJ4fkaaMgRx80nJnrs2BxW786ThV
	 82SJYttx08de87PHtqbH90shn2RBYP0WrT2ccyfqZ0cmMFlm+MaCjreDUrPZtZm2G3
	 31M8CY6d1kXbDT6fiEdiQE2opvee/mq4DiYMXaFk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE2EAF8025F;
	Mon, 30 Nov 2020 19:17:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96A5BF8025F; Mon, 30 Nov 2020 19:17:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C57B7F80247
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 19:17:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C57B7F80247
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZI2ngs16"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC863206F9;
 Mon, 30 Nov 2020 18:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606760223;
 bh=8cqYTAO7zXCkg3dI7zmJ6MhmYQP/JvOs34PggWV2qmI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ZI2ngs16wu09wXGbXH+s3TV32uqTQ8g5T4IFCl6mGVF8Au4h+nmvlWM5EP8u8RYIM
 eeL3EPceMXWpVoZE4pPV5SzN5h6YDVQWnJ894hXvjAP9VSlULnL05PqObiUGUWEF5O
 iimJWxtDnJyAEWhujx3W5u1v+1KEQ0KBkHPqu1m0=
Date: Mon, 30 Nov 2020 18:16:35 +0000
From: Mark Brown <broonie@kernel.org>
To: vkoul@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20201103172226.4278-1-yung-chuan.liao@linux.intel.com>
References: <20201103172226.4278-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 0/5] regmap/SoundWire/ASoC: Add SoundWire SDCA support
Message-Id: <160676019500.54241.11589384467836552465.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 hui.wang@canonical.com, srinivas.kandagatla@linaro.org,
 ranjani.sridharan@linux.intel.com, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On Wed, 4 Nov 2020 01:22:21 +0800, Bard Liao wrote:
> The MIPI SoundWire Device Class standard will define audio functionality
> beyond the scope of the existing SoundWire 1.2 standard, which is limited
> to the bus and interface.
> 
> The description is inspired by the USB Audio Class, with "functions",
> "entities", "control selectors", "audio clusters". The main difference
> with the USB Audio class is that the devices are typically on a motherboard
> and descriptors stored in platform firmware instead of being retrieved
> from the device.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/3] ASoC/SoundWire: rt715-sdca: First version of rt715 sdw sdca codec driver
      commit: 6f4a038b99677f4db737841b81b9d45ed4b54966
[2/3] ASoC/SoundWire: rt1316: Add RT1316 SDCA vendor-specific driver
      (no commit info)
[3/3] ASoC/SoundWire: rt711-sdca: Add RT711 SDCA vendor-specific driver
      (no commit info)

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
