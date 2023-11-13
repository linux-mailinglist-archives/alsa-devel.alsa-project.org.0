Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 386167EA11A
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 17:16:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BCEDDEB;
	Mon, 13 Nov 2023 17:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BCEDDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699892201;
	bh=Wo5otqcyJKAOgLF2JvrplvCMcLhcQRTUClyysnN30PY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jzgad2PQ4d0URW5dbFaErixgqA4NYbsxbT9p3Sv6s7i47rlF1QH4G1Au9eZvMtKpb
	 MCphPh2Mn3OY5v5kEVqx9hpBvHcU1oEcQUuFBhoCirDzmoJeEJLxJq1pm+9MvN+0Tx
	 eb9fi5ajA3ySrIZ07bMUdAD6emOHQxbti4Z7t2ys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1FB3F805A0; Mon, 13 Nov 2023 17:15:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA28DF8057C;
	Mon, 13 Nov 2023 17:15:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C568AF80579; Mon, 13 Nov 2023 17:14:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C195F800ED
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 17:14:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C195F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QBCN6bHy
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E4C67CE1745;
	Mon, 13 Nov 2023 16:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0210C433C8;
	Mon, 13 Nov 2023 16:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699892089;
	bh=Wo5otqcyJKAOgLF2JvrplvCMcLhcQRTUClyysnN30PY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QBCN6bHyLufLzGNHunYTSxGt1yCYOhXVradn4REqoB/m4LPAo5evtxuAVuVLP3IOl
	 AlZfMPifjMuvPIqUpy5Z3hhsTL40P8CeNTwtsc48UpMWIMuWIn/djlHO780yWF/Qt2
	 f6cqFsw3EQaPLxytHq60PA8rgsH0MCEu6UWzG3ruQbZhUARlIYVQ4FGDIOj1YQabtW
	 +l0CxSTsG7knD9SUrZSgEylwrxixpKxyiN+dI2Tqt278dv5GkuK3H2qcN7bKTnnBez
	 DwSEt6x1dKrR5S9dXqPuk4a6iissCzdbRf0EhV3fB4hUyQckx1lNNSkmfkONVMN4ev
	 mVVSH53jO33IQ==
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
 KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
 scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com
In-Reply-To: <20231107035230.1241683-1-wtli@nuvoton.com>
References: <20231107035230.1241683-1-wtli@nuvoton.com>
Subject: Re: [PATCH v4 0/2] Add DMIC slew rate controls
Message-Id: <169989208519.3289099.6577549034579346529.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 16:14:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: KQWFXTPSLNTX3HJOTKZBYSSPPA2MOHWZ
X-Message-ID-Hash: KQWFXTPSLNTX3HJOTKZBYSSPPA2MOHWZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQWFXTPSLNTX3HJOTKZBYSSPPA2MOHWZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Nov 2023 11:52:28 +0800, Seven Lee wrote:
> Determine DMIC slew rate via property setup.
> 
> Change:
> V3 -> V4:
>  - add "maximum: 7" description.
> 
> V2 -> V3:
>  - Update description of DMIC slew rate and remove
>    "selection" key words from property name
>  - Corrected variable name of DMIC slew rate from c file
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: nau8821: Add DMIC slew rate.
      commit: 1fb1a7c4a6328aff97eeca513fe7239099c13016
[2/2] ASoC: nau8821: Add slew rate controls.
      commit: 91d1a18b6381abd7a0137449fe345924072e4a32

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

