Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF7C9124E5
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2024 14:16:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74DBD850;
	Fri, 21 Jun 2024 14:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74DBD850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718972198;
	bh=rE8ntxNIM5vaTaumZmp3qsqdX3oe1BdkEBjRraySjMw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rVoc9C5RaM7iEJ7vEFzDGj46ZyvbVeaz4+g/03EnEmGpak7+sr/erFBnOnxljDlX/
	 SOf2+DwJqdnsQ7TU4J5nMfxgJB+8dQ6QEMdO74DSYuB62r/Tr8HCN/IKC56U3NB1F/
	 oMSljmPBOomESfzICUOpecgeFhDwC4MDEush4rIo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14287F80236; Fri, 21 Jun 2024 14:16:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABB56F805AF;
	Fri, 21 Jun 2024 14:16:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 207C0F8023A; Fri, 21 Jun 2024 14:16:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B38DDF8010C
	for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2024 14:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B38DDF8010C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y3FRhXl8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 271E7625C8;
	Fri, 21 Jun 2024 12:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46864C2BBFC;
	Fri, 21 Jun 2024 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718972152;
	bh=rE8ntxNIM5vaTaumZmp3qsqdX3oe1BdkEBjRraySjMw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y3FRhXl8cs1YgSR5JVrW/YQdZKcFQQl0NXj8PkGQEOJi6s2eALFoiOOF2lNYis6mF
	 +us6FwSsxNyXwncLAPRmxTN5EE51/GIQ1OVmDLQAz/pNSaLCye16mSylO+xYNhJnrk
	 9aI8e4T5bm+9wgROQnktthu326NyAZSezjo12l6eNTVp4qdesDqnDo1d3CgaLxEXMG
	 yCbsm//WFIH2RVbX/e15v2tHA6Ko8n3CN5G7Gp0Sb/CycpFeYFEkJRHPeM7OFaUzYJ
	 RLo0t4bfryHFYpcDjq91Ad4MEhY1ZCPtfUXfPYJm+mOD1ZX+gdoB74/BHGkBvNl+lJ
	 PC/cmal4zBy7g==
From: Mark Brown <broonie@kernel.org>
To: Andrew Davis <afd@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Daniel Beer <daniel.beer@igorinstitute.com>,
 Fabio Estevam <festevam@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Kevin Lu <kevin-lu@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Shenghao Ding <shenghao-ding@ti.com>, Shi Fu <shifu0704@thundersoft.com>,
 Takashi Iwai <tiwai@suse.com>, Vincent Knecht <vincent.knecht@mailoo.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com
In-Reply-To: <87wmmkpi6w.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmmkpi6w.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: dt-bindings: add missing vender prefix on
 filename
Message-Id: <171897214898.79912.13208484267678405419.b4-ty@kernel.org>
Date: Fri, 21 Jun 2024 13:15:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 4IZGH2FFLOZCXV4K7D33JNHOUQUJCLMR
X-Message-ID-Hash: 4IZGH2FFLOZCXV4K7D33JNHOUQUJCLMR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4IZGH2FFLOZCXV4K7D33JNHOUQUJCLMR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Jun 2024 00:32:39 +0000, Kuninori Morimoto wrote:
> Many Sound yaml files doesn't have vender prefix on filename.
> Add missing vender prefix for these files.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: add missing vender prefix on filename
      commit: ae8fc2948b48f001514d4b73167fcef3b398a5fb

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

