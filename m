Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BD198E1BA
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2024 19:38:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DF5B4E;
	Wed,  2 Oct 2024 19:38:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DF5B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727890729;
	bh=OBn5yP54AlTvji1PFd+Pv+H+fK5TkunSpH5FKH2FX/k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=P3iNzHAS6zHGkhPiDAA09JsGaTiQ49H2Ymbl16rosIWl/UV4Xtzulc2nIZRlOGS/s
	 e1FSvmfme+jaD/sca2nWIy88elvh8iPA0i8c5nVxzjQGjWHFonqb0saQPggN7SmJhM
	 5UacF7ANKy11Rn6Wr4A4PG++NNaMnzCJqmjohyBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86DD2F805E7; Wed,  2 Oct 2024 19:38:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11174F805DF;
	Wed,  2 Oct 2024 19:38:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48925F80517; Wed,  2 Oct 2024 19:37:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CBC0F800C9
	for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2024 19:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CBC0F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hAc8tCP1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E106A427A0;
	Wed,  2 Oct 2024 17:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD3FC4CED2;
	Wed,  2 Oct 2024 17:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727890675;
	bh=OBn5yP54AlTvji1PFd+Pv+H+fK5TkunSpH5FKH2FX/k=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=hAc8tCP1WsmZk4CpusYQV+XMhrkcMyfC4JWUgNv91F7xV6MTmkkHKCDH9FyBRibW7
	 axYzsyAvTWfhWFQ0Oy34Chr2YWjFxMMdgyAdnGQv8tLvDV6sXuYFlB+QyJsIgLPime
	 g1Gz0NTUjD8kNZ2BQpoP6Q96To3O/xxWjIRAMIIPDUCEkA0fBLU/Rayx0vR/emtmhN
	 3FOU7DmmOjrlk02O7dZscjoYFXgL/TFdSy+djnzNqtz56quavxr9gybW26spqtFjih
	 g2fgT0phEd1uaR0lZ+SRliUVF1OYZeOInzM/ROuyeNRO9LO7B8g9FRS9yAXfdGG5R8
	 PJy5dGGO1LD7g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, shengjiu.wang@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
 lgirdwood@gmail.com, Hui Wang <hui.wang@canonical.com>
In-Reply-To: <20241002025659.723544-1-hui.wang@canonical.com>
References: <20241002025659.723544-1-hui.wang@canonical.com>
Subject: Re: [PATCH] ASoC: imx-card: Set card.owner to avoid a warning
 calltrace if SND=m
Message-Id: <172789067363.163279.2553946457613238347.b4-ty@kernel.org>
Date: Wed, 02 Oct 2024 18:37:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8
Message-ID-Hash: XZNEMXYU32QBHE45PMCUISZ3DWVHAWFQ
X-Message-ID-Hash: XZNEMXYU32QBHE45PMCUISZ3DWVHAWFQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZNEMXYU32QBHE45PMCUISZ3DWVHAWFQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 02 Oct 2024 10:56:59 +0800, Hui Wang wrote:
> In most Linux distribution kernels, the SND is set to m, in such a
> case, when booting the kernel on i.MX8MP EVK board, there is a
> warning calltrace like below:
>  Call trace:
>  snd_card_init+0x484/0x4cc [snd]
>  snd_card_new+0x70/0xa8 [snd]
>  snd_soc_bind_card+0x310/0xbd0 [snd_soc_core]
>  snd_soc_register_card+0xf0/0x108 [snd_soc_core]
>  devm_snd_soc_register_card+0x4c/0xa4 [snd_soc_core]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: imx-card: Set card.owner to avoid a warning calltrace if SND=m
      commit: 47d7d3fd72afc7dcd548806291793ee6f3848215

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

