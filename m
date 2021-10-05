Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDEB422CB3
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 17:39:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 709661670;
	Tue,  5 Oct 2021 17:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 709661670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633448362;
	bh=wxM1HrBUbOxR+oaxUvV3jC2PlWYDCKxsf6JVk9cGtEs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fJCyGZgNSH/HMkP19i767lowFdLqBRjdC+GQDZJTmk/WOQWyV0vMjx1MFhKpTbyR2
	 qyeAb5yPhxUc5w0zirCWlkTxtYSiYGhGAEm4WE3L4THyapIbhPO726T5rRzsPO0AkW
	 P9EU5+dW+TBRMWKpzxncjoEYHT74PjFGqSwOtehs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5317F8010B;
	Tue,  5 Oct 2021 17:38:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75BE1F80259; Tue,  5 Oct 2021 17:38:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 87579F80259
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 17:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87579F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t6Imz5ry"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53A3961159;
 Tue,  5 Oct 2021 15:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633448278;
 bh=wxM1HrBUbOxR+oaxUvV3jC2PlWYDCKxsf6JVk9cGtEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t6Imz5ryJAmygEWOKxwmRxasiIqJhrdnM0FEj9SajcEHSL7BGF+7CXKhADp1CEtEs
 fNW7x9Jox7i0o8sB8r4PhcjAkjXpKkN+J3uLOixWiUKQHgMUQIddOisML8oOf8h6BK
 nYi8Ehl7aj19GijisB9L4qfbqfa9XaAeDjr0pzsScAMh0WCC3GEyjWI8ifquyYHc6o
 uyh2AX+YsnS38lwXxJ1FNXMRo3YhMhtCWtsd53m6HcgR140ZGg/y8Eoqd4y8NpL0PW
 QBgiv/cuTgYGMfTt9/HaBPg3Q5bDutDfO/g8/5nbmuhjz3FXUR1VOJLAi3QWBzbUV1
 o8QhtmasmIGDQ==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/5] ASoC: Intel: machine driver updates for 5.16
Date: Tue,  5 Oct 2021 16:37:43 +0100
Message-Id: <163344779742.1075058.1024866148378739407.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211004213512.220836-1-pierre-louis.bossart@linux.intel.com>
References: <20211004213512.220836-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Mark Brown <broonie@kernel.org>
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

On Mon, 4 Oct 2021 16:35:07 -0500, Pierre-Louis Bossart wrote:
> One quirk for a Dell TigerLake/SoundWire device, and initial support
> for platforms based on the ES8336 codec (aka ES8316). For full
> functionality, an update of the codec driver will be needed.
> 
> Pierre-Louis Bossart (5):
>   ASoC: Intel: soc-acpi: apl/glk/tgl: add entry for devices based on
>     ES8336 codec
>   ALSA: intel-dsp-config: add quirk for APL/GLK/TGL devices based on
>     ES8336 codec
>   ASoC: Intel: add machine driver for SOF+ES8336
>   ASoC: Intel: soc-acpi: add missing quirk for TGL SDCA single amp
>   ASoC: Intel: sof_sdw: add missing quirk for Dell SKU 0A45
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: Intel: soc-acpi: apl/glk/tgl: add entry for devices based on ES8336 codec
      commit: 790049fb6623af8bc25d63b1c5103bbd51f95d89
[2/5] ALSA: intel-dsp-config: add quirk for APL/GLK/TGL devices based on ES8336 codec
      commit: 9d36ceab94151f07cf3fcb067213ac87937adf12
[3/5] ASoC: Intel: add machine driver for SOF+ES8336
      commit: a164137ce91a95a1a5e2f2ca381741aa5ba14b63
[4/5] ASoC: Intel: soc-acpi: add missing quirk for TGL SDCA single amp
      commit: f2470679b070a77ea22f8b791fae7084c2340c7d
[5/5] ASoC: Intel: sof_sdw: add missing quirk for Dell SKU 0A45
      commit: 64ba6d2ce72ffde70dc5a1794917bf1573203716

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
