Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2554B42CA9B
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 22:03:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B75D41694;
	Wed, 13 Oct 2021 22:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B75D41694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634155424;
	bh=4N3yvgen75fiUMMp1UQ7bl6qpKiJf1k2V3H+eS/i6oA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HDM42NjAOalFamct8eNFLRfii0ZXfHPx5iCvHDsBOyQrHvh3lDvGNi1zfvdqhmH3J
	 43a0+DokPwzAIualO647M2a8tgWCqi9I1bx6yK+Z3dqrzpVZNXh/zkPDCNZp5a0gvB
	 WkbOoKU6XtmESoG/0VkSSFCc1JshwzVjdhcuzxT8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DA93F804ED;
	Wed, 13 Oct 2021 22:00:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E1BBF80506; Wed, 13 Oct 2021 22:00:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29E69F804ED
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 22:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29E69F804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FGPOsxMV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA93E611CA;
 Wed, 13 Oct 2021 20:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634155226;
 bh=4N3yvgen75fiUMMp1UQ7bl6qpKiJf1k2V3H+eS/i6oA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FGPOsxMVdZpNwrDFMRRm3Tq/gevH/3BTBM7lTJv0PHHFl2l6pIQq+O6mp3LPO7B6H
 XElxQsRr9Gggdst2UnDfY+SvCsBxh+It6KWthsUFkTWxq/yownRRKr9djlNgKq1rCY
 rSCEURcOtaTPYSJR3/X+oMmmSLEX1TNEE3SnxS9y8VG3WDxNEN4AYe5qIv+QRp03pm
 FVvJbOCt1i7unVbx1kIquDSJslOYV0Oq3Pw2g9iAf4U3J1OpFJE12B7OMLnnbOo6qj
 1JRW2nfq3iYx/mzncRtScyYeQZuThCncrhsvH7ndrT7aSNrKgWpo1zQHUcSFWWRwZH
 /e0aOwTnONBrQ==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] ASoC: dt-bindings: rockchip: i2s-tdm: Fix rockchip,
 i2s-[rt]x-route
Date: Wed, 13 Oct 2021 20:59:54 +0100
Message-Id: <163415517074.1358186.8845455508599261985.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <606809e10db02f92b1e7f90c491cc72dd8e16f79.1634132907.git.geert+renesas@glider.be>
References: <606809e10db02f92b1e7f90c491cc72dd8e16f79.1634132907.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
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

On Wed, 13 Oct 2021 15:49:42 +0200, Geert Uytterhoeven wrote:
> make dt_binding_check:
> 
>     Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml: properties:rockchip,i2s-rx-route: {'required': ['maxItems']} is not allowed for {'$ref': '/schemas/types.yaml#/definitions/uint32-array', 'description': 'Defines the mapping of I2S RX sdis to I2S data bus lines. By default, they are mapped one-to-one. rockchip,i2s-rx-route = <3> would mean sdi3 is receiving from data0.', 'maxItems': 4, 'items': [{'enum': [0, 1, 2, 3]}]}
> 	    hint: "maxItems" is not needed with an "items" list
> 	    from schema $id: http://devicetree.org/meta-schemas/items.yaml#
>     Documentation/devicetree/bindings/sound/rockchip,i2s-tdm.yaml: properties:rockchip,i2s-tx-route: {'required': ['maxItems']} is not allowed for {'$ref': '/schemas/types.yaml#/definitions/uint32-array', 'description': 'Defines the mapping of I2S TX sdos to I2S data bus lines. By default, they are mapped one-to-one. rockchip,i2s-tx-route = <3> would mean sdo3 is sending to data0.', 'maxItems': 4, 'items': [{'enum': [0, 1, 2, 3]}]}
> 	    hint: "maxItems" is not needed with an "items" list
> 	    from schema $id: http://devicetree.org/meta-schemas/items.yaml#
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: rockchip: i2s-tdm: Fix rockchip,i2s-[rt]x-route
      commit: 51a67d6e28c6e1f10c8ef95b4f5fbf204ebbeb24

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
