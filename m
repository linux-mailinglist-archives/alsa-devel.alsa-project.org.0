Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1913B6184D0
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 17:36:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 868BF1671;
	Thu,  3 Nov 2022 17:35:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 868BF1671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667493384;
	bh=1bZ5ecY99o5UCyVe5TJENub+Nw0ProKQsUg0Kzu1JqE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DtnO+2PhMRHE79VASdxSCSzG8UtkgEBCqZDxBcWoZrFrPA+plRMBdZHn5aCOVPJad
	 G6U7i6Y95J7iIaERRjtlTAGzMMFEtM+zPHsjM+oWIVQPLHJpbcbbTquFlh5fI2WMKm
	 +GiUHd13q3/aovSoC7cmI3bd1j8u4QVGxkGhZX7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5153F8051C;
	Thu,  3 Nov 2022 17:35:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED955F8052F; Thu,  3 Nov 2022 17:35:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E16B9F801D5
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 17:35:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E16B9F801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pugZWxZ9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D9A161F76;
 Thu,  3 Nov 2022 16:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEE6C433C1;
 Thu,  3 Nov 2022 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667493298;
 bh=1bZ5ecY99o5UCyVe5TJENub+Nw0ProKQsUg0Kzu1JqE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pugZWxZ9sd4FvO2QFlxG9DmTHqxW4pdt/8PogD0nqELib+B3eDWJ9EODZMUR2gkPL
 KrlGbkb1P8WSQtMx/VTEAVT/OsN3wZHdq9oS4wTpmEESU3jvi0LNNtErqmoBdpR1az
 ULQ8shjm6AlB3aiF7at8TcfzDNQsYoz1ka3Fy85bV/g8cIaNCWf0+M55mK9amjXCkN
 N8G6/lQF7oaGbn7YigJBZpNssJdE6pvy9smhewO20ZosFHWSkfuoK5aeHGmT9e5KKG
 TpH+euxB27/8szBsd7idR6kly0fbnP1Rbjp1fNmNLXzG4rRXd2eThTGmWdUztwoKBo
 3H9nCFVoUSrsg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20221102125936.2176748-1-ajye_huang@compal.corp-partner.google.com>
References: <20221102125936.2176748-1-ajye_huang@compal.corp-partner.google.com>
Subject: Re: [PATCH v6 0/2] Modify documentation and machine driver for
 mt8186_rt1019_rt5682s sound card
Message-Id: <166749329508.480833.14513589396076855857.b4-ty@kernel.org>
Date: Thu, 03 Nov 2022 16:34:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, "chunxu . li" <chunxu.li@mediatek.com>, "Nícolas F . R . A . Prado" <nfraprado@collabora.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Wed, 2 Nov 2022 20:59:34 +0800, Ajye Huang wrote:
> v6:
> - dmic codec driver:
>   - Modify "FrontMic" to "Front Mic" and "RearMic" to "Rear Mic"
>     to consisit with commit 3cfbf07c6d27 mentioned in description.
> 
> v5:
> - Documentation:
>   - Add #include <dt-bindings/gpio/gpio.h> in order to use
>     GPIO_ACTIVE_HIGH.
>   - Remove the change-id in message.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: dt-bindings: modify machine bindings for two MICs case
      commit: f8639c385f7e8325b73c83a6ec0865f8c036e1ad
[2/2] ASoC: mediatek: mt8186-rt5682: Modify machine driver for two DMICs case
      commit: e14657c0f0022e02c8f25fa9c56afae3d3db9e77

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
