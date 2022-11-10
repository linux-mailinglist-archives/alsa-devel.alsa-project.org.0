Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EA86248CF
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 18:58:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05AB61695;
	Thu, 10 Nov 2022 18:57:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05AB61695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668103091;
	bh=OF/rNzW3uy0FY7G78gH3ID0XYeWIhS7THAYoLZheu5w=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DFbiFuMIW2TLkUawkTX1zx7WSH5xCucNPunOmBDyo2TEgQOdQoCAsejT7mD1sokhr
	 h5w6dXDJNPHdK+qIVvMHIPp8f1rh2G/5BjMsmDBgNFEQxRS6u6oxolkzOe4PAu9YEB
	 M9mUWrE4Vp9sinPcip+xikNwCRTBD5mNhxUzKNaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A859EF80580;
	Thu, 10 Nov 2022 18:55:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 890B9F8057E; Thu, 10 Nov 2022 18:55:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C10A0F80567
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 18:55:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C10A0F80567
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C2KfC5ND"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1207261DDF;
 Thu, 10 Nov 2022 17:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678B7C433B5;
 Thu, 10 Nov 2022 17:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668102938;
 bh=OF/rNzW3uy0FY7G78gH3ID0XYeWIhS7THAYoLZheu5w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=C2KfC5NDfWjr0wYnh0nduUHYaTzSNOLpLGK+PiDgN3dMyQr2DAB+ntvI18rKP7bbp
 uMYWwKUl4lipX0I1LK9CnzN0ipuQPvmTBBa2fHGh/xg0WCkgM54LnQyDBvlulInipp
 78mDEIQoT5Tin0v6VMOgf7NPCnAb6ofeBW1sFfQsLbJQWzK2q+sk9lzIvKktXOKsl0
 dU34/Vdvy+b8FJq0hAEAOhnfrCxkZe/iDPH6M2Z13jQd+nr8ragOqpIyGBXhK10Kz7
 pk6XtoMkxAGwXo8LGSBV+TD/hjeOaZmIwr0oPVtNQpkOoKI4gBbgEMkupXrx+kdoMq
 t+fkEI1ITu/+Q==
From: Mark Brown <broonie@kernel.org>
To: Nícolas F. R. A. Prado <nfraprado@collabora.com>, Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20221102182002.255282-1-nfraprado@collabora.com>
References: <20221102182002.255282-1-nfraprado@collabora.com>
Subject: Re: (subset) [PATCH v2 0/8] Adjust usage of rt5682(s) power supply
 properties
Message-Id: <166810293513.959181.9070976838301733514.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 17:55:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Oder Chiou <oder_chiou@realtek.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Derek Fang <derek.fang@realtek.com>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Wed, 2 Nov 2022 14:19:54 -0400, Nícolas F. R. A. Prado wrote:
> This series sets straight the usage of power supply properties for the
> rt5682 and rt5682s audio codecs.
> 
> These properties were already being used by sc7180-trogdor.dtsi (and
> derived DTs like sc7180-trogdor-kingoftown.dtsi).
> 
> We start by documenting the power supplies that are already in use and
> then add few others that were missing to the bindings.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: dt-bindings: realtek,rt5682s: Add AVDD and MICVDD supplies
      commit: 163460262782b183a28d07255403fa72151fa20b
[2/8] ASoC: dt-bindings: realtek,rt5682s: Add DBVDD and LDO1-IN supplies
      commit: ed20a9bf3f16e413a41cd09db74fc7f8dcb1dcef
[3/8] ASoC: dt-bindings: rt5682: Add AVDD, MICVDD and VBAT supplies
      commit: 4d3c884ca7fb8ea25555c9a4b5ab1f9acad22587
[4/8] ASoC: dt-bindings: rt5682: Add DBVDD and LDO1-IN supplies
      commit: 9354fa7f6ee4ef721351c29316b59eb8f724ca49
[5/8] ASoC: rt5682s: Support DBVDD and LDO1-IN supplies
      commit: 5aab1a56b3dd031603a50ed7fd53e3c607a42a86
[6/8] ASoC: rt5682: Support DBVDD and LDO1-IN supplies
      commit: 318ff0693095defc683d00bb3fd7c482d10b03d7

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
