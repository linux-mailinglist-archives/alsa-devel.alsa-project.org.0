Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7306ACF3E
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 21:32:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C02BE11BB;
	Mon,  6 Mar 2023 21:31:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C02BE11BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678134766;
	bh=0Y3hS3Cfs4s/uu6Fy2viIS/tETJBQ++rIOnmwjOI4Zg=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jISfRmqcB5COgYWaFLDHV/hcSRLbK1jbLvy9FDxGRW9s85P98NiLOtwoJynDaQpDv
	 gSMZj3M8HIlcH/RxnsljWBkslnf/Umq93dkmY0mj+OZJ8tfIKsZ+soWnjrJ0FjJj/6
	 K6nxycxGpHeKY1sS+qoukIjwApTEQ/q+pyAhTStQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3246DF804B1;
	Mon,  6 Mar 2023 21:31:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6DE9F8042F; Mon,  6 Mar 2023 21:31:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9D1EF800C9
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 21:30:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9D1EF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=k1jx7PQe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CF7ACB81107;
	Mon,  6 Mar 2023 20:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05DFEC4339C;
	Mon,  6 Mar 2023 20:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678134651;
	bh=0Y3hS3Cfs4s/uu6Fy2viIS/tETJBQ++rIOnmwjOI4Zg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k1jx7PQecphoVLKQT3sIQtmIAqBKZMnN95Fx7FS7Z7g7eXt2Lz88ggH582v6kewBN
	 9yxW+jj2V0X4W1rjG9G3Voocj4ay++uvUXDTyUtNKSamUObK3sBhev3tUE+E4XX7i5
	 3EjhZlbjGFYg+IeeheT5ZKrhSTMeNz2LxENkGOErOlNI8LtreyFeYmhWvgd3v5OuTF
	 cyiF0yhbl1Ca6Kmyyqipuyo3JlDM/uZHOa+PnN8t6+XAdshDbtswrtEWZBzAtR9e03
	 g2EVDROJwQql82vBvUhTZQr6zruq3Hy5H5Y8TUivlLfIaeqM/vmesaJ2OrCCOP+ZsN
	 LzxsJNymuR+Rg==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ttyy64cy.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttyy64cy.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-core.c: remove useless dev_dbg()
Message-Id: <167813465074.226962.17316257109345317969.b4-ty@kernel.org>
Date: Mon, 06 Mar 2023 20:30:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: H6XRGI6ASTEGU7KJBVYGEQEKZVGQXCI7
X-Message-ID-Hash: H6XRGI6ASTEGU7KJBVYGEQEKZVGQXCI7
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H6XRGI6ASTEGU7KJBVYGEQEKZVGQXCI7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 06 Mar 2023 01:44:13 +0000, Kuninori Morimoto wrote:
> soc-core.c is using dev_dbg(), but some of them are useless.
> It indicates many dev_dbg() at snd_soc_runtime_get_dai_fmt(),
> but all of them are just noise, almost no meanings.
> 
> dev_dbg() on soc_probe_link_dais() indicates dai link and its
> loop order, but it is just noise, no information.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core.c: remove useless dev_dbg()
      commit: 6a534cfcfdbbd69eaac6656eb8c28a8fa27bb12e

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

