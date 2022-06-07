Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA40540632
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 19:34:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB0D3190E;
	Tue,  7 Jun 2022 19:33:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB0D3190E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654623284;
	bh=jE+fTdTyGSQbmvonPusKjQ2on8qK3eNevvuTh1iXRHY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ctaqb/aHpBqRS6JCCV3AeAKna2sBI6PYFeE5ss6N8hF+fCj3iNJoYMqiOF7Mqzzh2
	 +eqGcKPPU+wL1a/r0BrqC+12LHYFmfvOmnTmt/vgcluL/8eoVxEZWIPG5SXds9vD/r
	 EQfqNUsJqVgElDy9b3AXRVtG+p+U656GkHv6x+3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54A5FF80248;
	Tue,  7 Jun 2022 19:33:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B9CAF80116; Tue,  7 Jun 2022 19:33:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4F8FF80116
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 19:33:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4F8FF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fIP0rg/o"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62FC6B822BE;
 Tue,  7 Jun 2022 17:33:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE3EC34119;
 Tue,  7 Jun 2022 17:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654623217;
 bh=jE+fTdTyGSQbmvonPusKjQ2on8qK3eNevvuTh1iXRHY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fIP0rg/oFWsqb87lByMhIKBEX/OTuJuLD6XKooujPKFlD7rweTSwbt0k2vu6lf3UW
 3KiliitW9RX+HSC6PyCbCB1dqfPt3e1vVUjW2HRvOWZK3p1eib3Jq77P63hWyFh0A0
 XW2eqkDF+bD/JTKCwCnuc1nxt1+1joTiBkpV5SKarHSM8WObPzQ9XtYVdzsIwW3VCU
 uv3kjq07d7W9o86F1MgmhEm8qS/2LqJqntFnDgpcYSP73x2AoYoTmLRuwlUsW1yzKZ
 HURfZF3gtsgHzfYpNTdwjpLY4ypZHyH7KhnmFwpdS6IlXZzEG7ho+ZVUDZN5q7TA4Z
 yDNAfSAx0YEVQ==
From: Mark Brown <broonie@kernel.org>
To: krzysztof.kozlowski+dt@linaro.org, biju.das.jz@bp.renesas.com,
 robh+dt@kernel.org
In-Reply-To: <20220607124231.3248-1-biju.das.jz@bp.renesas.com>
References: <20220607124231.3248-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: renesas,
 rz-ssi: Document RZ/G2UL SoC
Message-Id: <165462321448.3040195.10462732413429997703.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 18:33:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Chris.Paterson2@renesas.com,
 geert+renesas@glider.be, lgirdwood@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, alsa-devel@alsa-project.org,
 biju.das@bp.renesas.com
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

On Tue, 7 Jun 2022 13:42:31 +0100, Biju Das wrote:
> Document RZ/G2U2L SSI bindings. RZ/G2UL SSI is identical to one found
> on the RZ/G2L SoC. No driver changes are required as generic compatible
> string "renesas,rz-ssi" will be used as a fallback.
> 
> While at it add a '.' at the end of dmas description for the first cell.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G2UL SoC
      commit: 71ba950f3b1f1468afc2f793ec52644602ebaf9b

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
