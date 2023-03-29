Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FA16CEFDD
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Mar 2023 18:52:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87BEB208;
	Wed, 29 Mar 2023 18:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87BEB208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680108752;
	bh=n3UbnkUVFSQ4Q0HVTYwtuIs/I4cn+sbwqdlpfV5F9FQ=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qfun9M62r+28S4WXueICnN2Jf87ASXL67QTa1gPRDLHt4pQaw9L57aQ0PDmDHkbUd
	 +r7KqJ5dMBeebtZLfyM73fBt1JLLeqQ5N6/Ri8Z/9Wna4gXtw8qU7I0rZg/Z7OwhcU
	 lt5Ye2yYpxySyJi0G6nLpkUSzeQ1Vy9jwo8ymAWk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C73F4F80290;
	Wed, 29 Mar 2023 18:50:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA6E5F80272; Wed, 29 Mar 2023 18:50:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 139CBF8024E
	for <alsa-devel@alsa-project.org>; Wed, 29 Mar 2023 18:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 139CBF8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PXG8Y8PY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F57561DC5;
	Wed, 29 Mar 2023 16:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF07C433D2;
	Wed, 29 Mar 2023 16:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680108641;
	bh=n3UbnkUVFSQ4Q0HVTYwtuIs/I4cn+sbwqdlpfV5F9FQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PXG8Y8PYY2cBZH/oWyz5HPZGQSd0qlXK8FP+oPgfk+XtLSsNNRXYP2eVd4C302Vl9
	 3Wlo9AyfThXdIw7r5iY3jh0bjPHAT158ghursmG0aUjb3MCU44af8QuMzS/i4RGBBT
	 q23b10dYoVQx3O++rUW/og2tCaGAaVtr98Q5F5thETUR7ZXmZlTCZcFaDoFXCcK8kT
	 NqAqylBWqy7KI/kpqHi819Vq2kldnZpvUdSiYS4n0nc6qY616/9xgGxC2Hcb14rFmt
	 SIFggsitdNfhUTlCG9FklfFOx+JEwucCdAupot2xhNxaoQv0e5d4pnl4ubwXAkjjQz
	 utQj09BLsHgZw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87v8ikcsr5.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8ikcsr5.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc-topology.c: dai_link->platform again
Message-Id: <168010864022.3244592.16855327449834755638.b4-ty@kernel.org>
Date: Wed, 29 Mar 2023 17:50:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: 3A4J4KI7GZXBU2GZSVKTA4GRB62PVDTJ
X-Message-ID-Hash: 3A4J4KI7GZXBU2GZSVKTA4GRB62PVDTJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3A4J4KI7GZXBU2GZSVKTA4GRB62PVDTJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 29 Mar 2023 00:21:03 +0000, Kuninori Morimoto wrote:
> On SOF, many topology is assuming dai_link->platform exists, and is
> allowed to be overwritten on each link_load().
> This patch restore the removed dai_link->platform for SOF, and add
> the comment.
> 
> 

Applied to

   broonie/sound.git for-6.4

Thanks!

[1/1] ASoC: soc-topology.c: dai_link->platform again
      commit: 6a7c51b4d91b5d73aae2647356990573643b2ae4

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

