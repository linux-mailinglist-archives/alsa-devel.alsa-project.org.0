Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DAA602B7A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:16:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C2039D04;
	Tue, 18 Oct 2022 14:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C2039D04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095362;
	bh=tngQ/VUv3GezrfKgSfe21fo9gVZuTqKNUb0EATjT+A0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XJvo9MXif+43hkHXhrtd2Xr2FoNmUouHJeAViZLkg4mE4vqXLnnhBWL9R8CYTgIC8
	 HeVvd7Hdgcz0SrLDJmG0MU16RdxDC7cEW6Uru1S6MuwbYwqUZSEAkaAA9X6rybScM1
	 z390sQZVFywKAVioUT/oUS7szFrZZIvOFb52Dzfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B28BCF8057A;
	Tue, 18 Oct 2022 14:13:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 159DFF80588; Tue, 18 Oct 2022 14:13:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDE48F8057F
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:13:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDE48F8057F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XHMepo22"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5379661070;
 Tue, 18 Oct 2022 12:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE7FC433C1;
 Tue, 18 Oct 2022 12:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666095215;
 bh=tngQ/VUv3GezrfKgSfe21fo9gVZuTqKNUb0EATjT+A0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XHMepo22TGTg1alpJqa0H4HK8OvI8DYAtCBu1R10H0O7BtAo0ekIM3xNEoZfIjHyr
 Ha9sh+Zj35PoY9kfWUrCw1IqS1zNQFcBcdVJjtVH0rMhZmCJL2ysxnNJU8Re4KDhXk
 0aA+54fbFiP7pAgAbVnm9EPuobWMq6v5x9sWCV1fKJ/XlVs1C7q6VZtQ+EL8qjl33h
 q4efc99xutXgiTjSmN9Eshafd4ZdLv3iK4pmmQ6Ltk1d7beomj2dttdWjHrabu++Eg
 D+ILnVwYV3ZfarUfKaPgNvFtt24BmLWRguVsRED1qs5rgWdvWstMuatAF32R+1QC3M
 x6pk5X61+IScg==
From: Mark Brown <broonie@kernel.org>
To: Doug Brown <doug@schmorgal.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20221003032414.248326-1-doug@schmorgal.com>
References: <20221003032414.248326-1-doug@schmorgal.com>
Subject: Re: [PATCH v2 0/3] ASoC: add devicetree support for WM8961 codec
Message-Id: <166609521366.371929.7498409301315120148.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 13:13:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On Sun, 2 Oct 2022 20:24:11 -0700, Doug Brown wrote:
> This series adds devicetree support for the Wolfson WM8961 codec. The
> first patch adds a schema, the second patch hooks it up in the code, and
> the third patch allows it to be selected in Kconfig.
> 
> Changes since v1:
> - Fix ordering of property lists and example in schema
> - Fix wording of commit message
> - Fix unused variable warning
> - Split Kconfig change to separate commit
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: add schema for WM8961
      commit: b9b0d88d87e5565e8d12bcf22ec601e8b4658dc6
[2/3] ASoC: wm8961: add support for devicetree
      commit: c96851ee8195c820b765c6a7effcec79c81eb9c6
[3/3] ASoC: codecs: allow WM8961 to be selected by the user
      commit: 74a6a948c8fc28c8937e24178739979b3cd2ce14

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
