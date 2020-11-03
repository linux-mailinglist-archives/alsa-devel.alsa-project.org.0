Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4512A4E1D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 19:16:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC9F516A5;
	Tue,  3 Nov 2020 19:15:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC9F516A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604427377;
	bh=oBr6/A8lCcfHcLffpfnmhk9cxSSf3L6F0Tt4SgemAnY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SjXn3MXIvRETnH2T5hsEtA6IgJhl4FZZNeVRvq5wbpFNbR7ehLSfwlMRLEGLc/Kt7
	 736Y0dJ89ifrZIr8XWLxPgXqoiQIZlYl+JeMDv85X4qzqNDXzp+H8kywWhHMK3EgfN
	 UOP9QgAQJJwSnHAf1HVlKnoRZ6Vl+pq9rRgN8hrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3156EF80083;
	Tue,  3 Nov 2020 19:14:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7777EF80171; Tue,  3 Nov 2020 19:14:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FA1BF8015A
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 19:14:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FA1BF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="BFwtZSU1"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 569A620757;
 Tue,  3 Nov 2020 18:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604427278;
 bh=oBr6/A8lCcfHcLffpfnmhk9cxSSf3L6F0Tt4SgemAnY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=BFwtZSU19nnkFwZf+hTTx8yDwYdxRjYpPB7E8n5jhdCqN9Nc9kpMVLAdM91dXrkDM
 V1BMNQO7WEDegw2WsGFPZc6Om3XaRll7L4wLYQ9bZvXbOANbILZgN7IIa2hTNxElD5
 O6tcf7f94nxMge8pNBlrSbdcvjUpI3c27RYUTUTQ=
Date: Tue, 03 Nov 2020 18:14:29 +0000
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20201103100554.1307190-1-codrin.ciubotariu@microchip.com>
References: <20201103100554.1307190-1-codrin.ciubotariu@microchip.com>
Subject: Re: [PATCH] ASoC: atmel-i2s: do not warn if muxclk is missing
Message-Id: <160442726962.14840.2168034632835702647.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: ludovic.desroches@microchip.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, lgirdwood@gmail.com
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

On Tue, 3 Nov 2020 12:05:54 +0200, Codrin Ciubotariu wrote:
> Besides the fact that muxclk is optional, muxclk can be set using
> assigned-clocks, removing the need to set it in driver. The warning is
> thus unneeded, so we can transform it in a debug print, eventually to just
> reflect that muxclk was not set by the driver.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel-i2s: do not warn if muxclk is missing
      commit: f4bf1f4d1385b7cb61a3fc811bb4912d49aa394a

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
