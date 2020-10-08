Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAAE287E84
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 00:05:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A2B9168C;
	Fri,  9 Oct 2020 00:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A2B9168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602194741;
	bh=EVyvVTNpmJa/UPKAvAjxfvZgDTbHQqPP7CHorPAJG0I=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E6fFVi0EpIuwi1qS9O9dILqSMT9/zIw9uEiXRZfRdwcuYrEwyK9ojgt2ZJhac/aA7
	 Vxo80zmf+2ukDAjRDNvjmnzzt/rsjiiXvG+Zj7FGANIEkThBJeEqDHx6EuW1ZkywaP
	 dr/ht8kWMdziZdYcXqxXUf85HCS4NoEM0+5wNTS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1645F8026B;
	Fri,  9 Oct 2020 00:01:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ADAFF8026A; Fri,  9 Oct 2020 00:01:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33E50F80260
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 00:01:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33E50F80260
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="vM5VX/ca"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 074C622242;
 Thu,  8 Oct 2020 22:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602194513;
 bh=EVyvVTNpmJa/UPKAvAjxfvZgDTbHQqPP7CHorPAJG0I=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=vM5VX/caeJccko8pxOGsWKe4Js0eh0gUIKEymMMKDGBRUXqSrImM9VaLkRZaIwfPq
 9chkJ5QP6EzfHj13YfOQgIi9y+9AKBt2Cj926eqxYyiRTcn2vNuU5/6z930B1WGKEL
 anzYLTkemExf4Y2rvv8NLnMX9js6x1fZNX5uqHoo=
Date: Thu, 08 Oct 2020 23:01:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@st.com>, lgirdwood@gmail.com,
 arnaud.pouliquen@st.com, tiwai@suse.com, perex@perex.cz,
 alexandre.torgue@st.com
In-Reply-To: <20201007153459.22155-1-olivier.moysan@st.com>
References: <20201007153459.22155-1-olivier.moysan@st.com>
Subject: Re: [PATCH 0/2] ASoC: stm32: dfsdm: change rate limits
Message-Id: <160219448332.29664.10143559083895905802.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
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

On Wed, 7 Oct 2020 17:34:57 +0200, Olivier Moysan wrote:
> Widening of the supported rate range in the STM32 DFSDM driver.
> The rates were previously limited to 8kHz, 16kHz and 32kHz.
> Allow rate capture in the whole range 8kHz-48kHz as there is no hardware
> limitation to support it.
> Actual sample resolution is dependent on audio rate and DFSDM configuration.
> Add a trace to allow simple check of sample resolution.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: stm32: dfsdm: change rate limits
      commit: 6101bf71192f543799a796274e160f7dfc10f2d2
[2/2] ASoC: stm32: dfsdm: add actual resolution trace
      commit: 41bceb1272164ee2a6fd1ac3bed97043c94b6636

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
