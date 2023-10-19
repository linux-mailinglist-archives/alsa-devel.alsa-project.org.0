Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1077D0351
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 22:48:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0F0483B;
	Thu, 19 Oct 2023 22:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0F0483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697748534;
	bh=Xb8ykcuVXNXGLau7z0fj9oajuN6SQh3G7Mj8m91Dv94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mz8U8kgjzod1mqbBFg2b5RyaO3xX/qQ/Jr1nuIqn6Ni/Tn4wPfiKRnWi0WZZRJacb
	 gBMRNeU6aH58tZ0XoeywIcsBOdNNOHHw134hvZpl5TvYrSMMjcFkHzdGnuH2a072NV
	 JpiRbO8jrtkvDrX0USnUncz4cXTpD/bEnxYvKtUU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89054F80553; Thu, 19 Oct 2023 22:48:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAA15F800C9;
	Thu, 19 Oct 2023 22:48:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 435C9F8027B; Thu, 19 Oct 2023 22:47:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 299D4F800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 22:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 299D4F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TWoVxoim
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CE4B2B82C3B;
	Thu, 19 Oct 2023 20:47:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B65C433C7;
	Thu, 19 Oct 2023 20:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697748469;
	bh=Xb8ykcuVXNXGLau7z0fj9oajuN6SQh3G7Mj8m91Dv94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TWoVxoim6NNp6OOszT+ei/DEY6Rvy554zghlaTs4UpksXTep31g/IWOc4vLSYi8ZE
	 1EaslWKC+Odf7Opuq1Jqq3LJf43BibPsEbaxVC11SFGbI9tN98CzzMBWr9loovTxbG
	 k53aaH1o7rEXQqlPBfa5CAKbbD2ZfA4/dSZfoSOQKHHn1W3JATpKYO8s6rAt1ECY9b
	 NEctmBdbuVut61apvmWjEQktpIvfzetJcdEgmpDNB9poYgZMyus64qAuZ/Wy5oowwt
	 l2sXqoY4JZJTExCkunb4pHPEyAxRBoW53Zaie9STZV7oAuoIrTKhKTruIsrN7n3iGD
	 aZvwLqSOABEuA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, robh+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 perex@perex.cz, trevor.wu@mediatek.com, jiaxin.yu@mediatek.com,
 xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: 
 <20231019100322.25425-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: 
 <20231019100322.25425-1-xiazhengqiao@huaqin.corp-partner.google.com>
Subject: Re: [v2 0/2] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add
 rt5650 support
Message-Id: <169774846545.93224.1171196773910297821.b4-ty@kernel.org>
Date: Thu, 19 Oct 2023 21:47:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: RV7EZ65PANN42O2S2RYS4NL7Q5RAU5IA
X-Message-ID-Hash: RV7EZ65PANN42O2S2RYS4NL7Q5RAU5IA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RV7EZ65PANN42O2S2RYS4NL7Q5RAU5IA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 19 Oct 2023 18:03:20 +0800, xiazhengqiao wrote:
> To use RT5650 as the codec and the amp, add a new
> sound card named mt8186_rt5650.
> 
> Changes in v2:
> - PATCH 2/2: Modify the code format in line 1058
> - Link to v1: https://lore.kernel.org/all/54ec6435-e69b-444a-a31a-c878a4b3564a@collabora.com/
>               https://lore.kernel.org/all/8de0772b-3145-44e3-8174-702c7dc729bb@collabora.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: mt8186-mt6366-rt1019-rt5682s: add RT5650 support
      commit: 8a79ff9e46beee03dfc2ce9cc80f7090f57d64cb
[2/2] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650 support
      commit: d88c433831015a4ad4597885cef8f048808cd94d

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

