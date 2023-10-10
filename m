Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E87F57C038E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 20:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E6BE1532;
	Tue, 10 Oct 2023 20:39:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E6BE1532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696963190;
	bh=FBG4dlajtykfzMX/8w9AtsLkDPUKg5hOUXTrm5l9Stg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JeBrsSibM4FTxB9Av173EQlA51rfflqy+jJh/aoItWqLgi+h6d0Yz4VcGNLwSlZEs
	 eqLh6UPXN+vjyLOQEO/azPtZzvOfHDKvoRDK4aSPnibMUgIJQSY0Zbd81iH2rh6c8W
	 RhOx4XN1e82Xw/7kFp9uP76CCyqAuRuhvUdWd+Z8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DBF0F80567; Tue, 10 Oct 2023 20:38:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81858F80571;
	Tue, 10 Oct 2023 20:38:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7233BF802BE; Tue, 10 Oct 2023 20:33:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91BC8F80310
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 20:33:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91BC8F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oxT26bVG
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 58769617C2;
	Tue, 10 Oct 2023 18:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09051C433C8;
	Tue, 10 Oct 2023 18:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696962816;
	bh=FBG4dlajtykfzMX/8w9AtsLkDPUKg5hOUXTrm5l9Stg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oxT26bVGbjXMrDDViObRjNSkFr37Xxq1pvX3bQMhdhM1FNNcyixTLWVGOm32AaatM
	 +RRzHoj/dIIKYxeS1c9QuIGPjWlp80sblxsemtbmrjBepLtcQGF1vVf/35pSj+uTha
	 jyzzq7ie+gTIXiarIlKHvn0XrP/7rtcw/Rsr4zYCC7HccmYvGyGz5ivOjLyM1Q86S4
	 efFGdjjVYKam3mQqb30fch8uqehQNmxQ8/mgKEt0ugYm1SubBhPYOiCohaopY5AW+x
	 OA08f/05wnO5iQMk1YWBBXKCjaf5S7j90MdDRndSHmzyA8dmKZ1SWaOXL3NE2aid1U
	 RUOl54lwq7HGA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, perex@perex.cz,
 trevor.wu@mediatek.com,
 xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
In-Reply-To: 
 <20231010023738.8241-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: 
 <20231010023738.8241-1-xiazhengqiao@huaqin.corp-partner.google.com>
Subject: Re: [v5 0/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Message-Id: <169696281374.221758.11961649530549486978.b4-ty@kernel.org>
Date: Tue, 10 Oct 2023 19:33:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: VQPH73FFWYEMHCKLFO2MB73CMTVIVZUH
X-Message-ID-Hash: VQPH73FFWYEMHCKLFO2MB73CMTVIVZUH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VQPH73FFWYEMHCKLFO2MB73CMTVIVZUH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 10 Oct 2023 10:37:36 +0800, xiazhengqiao wrote:
> To use RT5682S as the codec and MAX98390 as the amp, add a new
> sound card named mt8188_rt5682s.
> 
> Changes in v5:
> - PATCH 2/2: modify asoc_rtd_to_codec to snd_soc_rtd_to_codec and make it consistent with the latest revisions
>              remove common struct definitions like rt5682s_jack_pins,mt8188_rt5682s_widgets
>              and mt8188_rt5682s_controls.
> - Link to v4: https://lore.kernel.org/all/9c28b84e-2d4e-7bc2-88f3-ad5b30d2c727@collabora.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S support
      commit: 748d508e5b4cb537ed91e7bc5a664c526b6c64f6
[2/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
      commit: 163284402c42e9094b6aa8e4f69e43da1031efc6

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

