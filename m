Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF6B560214
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 16:08:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B79E9167E;
	Wed, 29 Jun 2022 16:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B79E9167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656511695;
	bh=ZdjWjB54cbHRycxjLjITQrOn43M908WL8or1/9HBUP4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bkg0cTMO9+QUJCe7mGr3/NT3IjIL+1IMLwqPayshIAD70aZQr5WykIy4pIaY5bClq
	 ZXOCkoYaU6/H6aCRyZrrw65FplKpSE8I18YmA1lIDvYR+E0FLPPDYaQOwAuP1S7pZR
	 P2lf++32tR1mXT6NRPac+JHvERnsdlR2IXva7jNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0191EF8053E;
	Wed, 29 Jun 2022 16:06:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8EC9F80536; Wed, 29 Jun 2022 16:06:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A602FF8020D
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 16:06:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A602FF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fU2BuCn7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2F78CB824B3;
 Wed, 29 Jun 2022 14:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FBFC341CB;
 Wed, 29 Jun 2022 14:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656511559;
 bh=ZdjWjB54cbHRycxjLjITQrOn43M908WL8or1/9HBUP4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fU2BuCn79mheeDdDSP3MX6LYQ+5ckPhDuYaqjp8b1HSv4cqiAXAJNAeTOa9TyAs6K
 Q3iRARr/muciSSJsFU7N7vAOGSd/FgJB5CqSYLyV26WGaGpUJxPbz1L06vtQyqiCwv
 TVQ3NNbgZM84meUWk09BU+U+4oH39ksuPITo7PGRDqG//Dk6hw/3dUXx7S1RhBhjLk
 Mos9iiiXXADkMbS21xZIL3BCJyIRqkOeafCV6NfGDuC3kw4qzAyc7+hRq1ztBH9hEL
 nhlZeS3sWm1R+6U8JgJXlLy3x6ZqG9/ZsBHhKBsbbAJGf3dqH9pZ/czKHtNKl66bSy
 +ffyJlifgrTrw==
From: Mark Brown <broonie@kernel.org>
To: heiko@sntech.de, judyhsiao@chromium.org
In-Reply-To: <20220629080345.2427872-1-judyhsiao@chromium.org>
References: <20220629080345.2427872-1-judyhsiao@chromium.org>
Subject: Re: [PATCH v1] ASoC: rockchip: i2s: Fix the debug level on missing
 pinctrl
Message-Id: <165651155754.1437597.8598340692080624115.b4-ty@kernel.org>
Date: Wed, 29 Jun 2022 15:05:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 briannorris@chromium.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org
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

On Wed, 29 Jun 2022 08:03:45 +0000, Judy Hsiao wrote:
> Use dev_dbg on missing i2s->pinctrl as the pinctrl property is optional.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: i2s: Fix the debug level on missing pinctrl
      commit: 48620f17e071060092197a09663a1c1fe6207829

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
