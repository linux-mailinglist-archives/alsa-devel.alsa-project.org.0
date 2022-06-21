Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CF8553856
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 19:01:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 633402026;
	Tue, 21 Jun 2022 19:00:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 633402026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655830860;
	bh=lmiWAcqBGF009l5Gs571NJGOJ8UGNGQUNmtknNwqWDs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kStZpgeYI4tI2p7AlHZItUvoiu6E6AEF03XJ2Dx15uNBkKSFP19lJJqOAcZNprnnG
	 UsD53TPKHbJExALPR6aMI1lHll5xGoxnvS2LcShfyyNKdrvzxCWS5Q2S3hN14E/21k
	 LH0HWBFoFK3mTCUZArs8ulehl7fNriy9uBUUFKcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C312DF80536;
	Tue, 21 Jun 2022 18:59:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27480F80537; Tue, 21 Jun 2022 18:59:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4D84F80256
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 18:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4D84F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uLuwfksU"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51F2861569;
 Tue, 21 Jun 2022 16:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9054DC3411C;
 Tue, 21 Jun 2022 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655830771;
 bh=lmiWAcqBGF009l5Gs571NJGOJ8UGNGQUNmtknNwqWDs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uLuwfksU+hlYfMlUGekAGUfxxB6eErGQomsklnOQF2lMY9JMDlr9QnhZ5FdSKwRVQ
 +TVielA9x07BfwCcx+1rHL5v8ifn7eidBhCvimyWoBSXR7qn8DpHW+APIWB5i6t5K7
 f6Fi2Cd4BphilV6F86Ws8tw4vWWk7jxC3zgu73IXjRjfAcpNXdbLG30jn/fs5A1sE5
 WDyH7b9dF4/9PiQSvhG84rYFji4hbHTV2CrFEDa31RZbs/TfcSDT8URZpEq8BuJvy4
 apKjwdnqv/hYIPkn2ebIxPFO4m7GYT7JzyUdaj18UivmCGa1S03bTWY0DHPNT01tXb
 v2lR/rcJJbxpA==
From: Mark Brown <broonie@kernel.org>
To: judyhsiao@chromium.org, heiko@sntech.de
In-Reply-To: <20220619095324.492678-1-judyhsiao@chromium.org>
References: <20220619095324.492678-1-judyhsiao@chromium.org>
Subject: Re: (subset) [PATCH v4 0/3] ASoC: rockchip: i2s: switch BCLK to GPIO
Message-Id: <165583076931.271995.9857794745310978104.b4-ty@kernel.org>
Date: Tue, 21 Jun 2022 17:59:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, briannorris@chromium.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
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

On Sun, 19 Jun 2022 09:53:21 +0000, Judy Hsiao wrote:
> The patches series is to fix the unexpected large DC output
> voltage of Max98357a that burns the speakers on the rockchip
> platform when BCLK and SD_MODE are ON but LRCLK is OFF.
> 
> Changes Since V4:
>     -- Fix indentation in the driver. (Align parameters with the parenthesis
>        placement.)
>     -- Fix incorrect return type of rockchip_snd_rxctrl.
> Changes Since V3:
>     -- Fix indentation in the documentation.
>     -- Put pinctrl-1 right after pinctrl-0 in dtsi.
>     -- Fix indentation in the driver.
>     -- Remove unnecessary dev_dbg() in the driver.
> Changes Since V2:
>     -- Add documents of i2s pinctrl-names.
>     -- Fix dtsi syntax error.
>     -- Include the dtsi change and the driver change in the same series.
>     -- Ensure that driver gets both bclk_on and bclk_off states before using them.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: rockchip: i2s: switch BCLK to GPIO
      commit: 44f362c2cc6dd0c5e3cb499c4fb4ed45b63a6196
[3/3] ASoC: dt-bindings: rockchip: Document pinctrl-names for i2s
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
