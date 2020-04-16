Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CFA1ACA72
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Apr 2020 17:36:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B0451665;
	Thu, 16 Apr 2020 17:35:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B0451665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587051371;
	bh=uDzDRO2ytFQpd/vpRcyE5E3H4we81F4KkMdHp4892QQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NyKnr9bnYIIokGltCI6R47XcMNjp6mDA5+PaZoq6Fp0g8L0kGGXu43CM4HT7WT/uI
	 8JAstMaYTSfixCuvh8u7PVuRxhjV8OAp5SgjHoEaZVXmewuTsVdTGJS1AJkT7KL6Ir
	 MtjnVuOoW6WzugJF7VZeh3oZqG9aO5pLaXbf9+Hk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 234A0F8016F;
	Thu, 16 Apr 2020 17:34:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9371EF80115; Thu, 16 Apr 2020 17:34:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84463F80115
 for <alsa-devel@alsa-project.org>; Thu, 16 Apr 2020 17:34:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84463F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0jVthHTM"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66B0521927;
 Thu, 16 Apr 2020 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587051256;
 bh=uDzDRO2ytFQpd/vpRcyE5E3H4we81F4KkMdHp4892QQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=0jVthHTM4Q1PC0DLm4/7zyTFyXkXqQ9oURTeu65LFK32h6apzQp5OQe8r6spQYx7D
 exZpNA3pKIzfLh7hh8kejYoTzVqXPDKsYcg29n6M2YxH+7RRMC3sWtLlJAyWAISZo2
 htCo+NO3nQTw1x39+HMbBBGG53gyiwWUjlaVmdNU=
Date: Thu, 16 Apr 2020 16:34:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Daniel Vetter <daniel@ffwll.ch>, Michael Hennerich <Michael.Hennerich@analog.com>, Stefan Popa <stefan.popa@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Nuno Sá <nuno.sa@analog.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Jiri Kosina <trivial@kernel.org>
In-Reply-To: <20200416103058.15269-1-geert+renesas@glider.be>
References: <20200416103058.15269-1-geert+renesas@glider.be>
Subject: Re: [PATCH trivial 0/6] Fix misspellings of "Analog Devices"
Message-Id: <158705078452.48712.14851203073650565435.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
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

On Thu, 16 Apr 2020 12:30:52 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> In several files the company also known as ADI is spelled as "Analog
> Device".  However, according to https://www.analog.com/, the company
> name is spelled "Analog Devices".
> 
> Hence this patch series, one per subsystem, fixes these misspellings.
> 
> [...]

Applied, thanks!

[1/6] dt-bindings: Fix misspellings of "Analog Devices"
      (not applied)
[2/6] dma: Fix misspelling of "Analog Devices"
      (not applied)
[3/6] drm: Fix misspellings of "Analog Devices"
      (not applied)
[4/6] iio: Fix misspellings of "Analog Devices"
      (not applied)
[5/6] ALSA: Fix misspellings of "Analog Devices"
      (not applied)
[6/6] ASoC: Fix misspellings of "Analog Devices"
      commit: b938b25f49cdb47397b0215b69cdd5251b4b2f8b

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
