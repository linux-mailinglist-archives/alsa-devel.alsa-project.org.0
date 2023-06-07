Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 222A2725D86
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 13:46:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62F2083B;
	Wed,  7 Jun 2023 13:46:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62F2083B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686138415;
	bh=ydrWmbTO/ThtaAAuYfZDm4x6pvVAoBkIYdVbadi6JuU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qYtPDPM4WqQbF543NFxNMIHyWeV+nabmaD/8EweJmk9JaoeBhCGWxiqnayrrMgP5I
	 5lRd61m1bb+wp64Fy5MPJPOJ3bO/wgDBKxNorGWAARP6XQRfkeXIjeqRdknNre7Xwk
	 OqT/QJwFJQr21HLw0TfaymIuKOi7VMmDtCZHrC+4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7037F80549; Wed,  7 Jun 2023 13:45:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 21FC4F80551;
	Wed,  7 Jun 2023 13:45:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A1D9F80199; Wed,  7 Jun 2023 13:45:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86F0BF80290
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 13:45:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86F0BF80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Tq23gApB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3590361377;
	Wed,  7 Jun 2023 11:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD53C433D2;
	Wed,  7 Jun 2023 11:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686138334;
	bh=ydrWmbTO/ThtaAAuYfZDm4x6pvVAoBkIYdVbadi6JuU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Tq23gApB946BK2bEatrYfu6taSWvmXKtL9KhkrDjw0MFoRFD6mNXJMub+eZLgUGA1
	 vWkU63e6q/mxdfC3iLeRDGHUGbqpsKdppF63US/b0r5l+aYct+P5bMdNO25EsJ5s6u
	 KUkl1KX/zZCc5nddiQ7FOMGCvqFdqrcSu054EItEbqX6kPP6S801BT6bWhWxYVGUWs
	 L+SBZGij2qH+bjfDJyRVRqkgaqmxW86Gw306J3COWHath6osTSSRrtDD5YdUTbKze3
	 FEplS/0Y1C/97RbDtCAeqF6y8DeeznDJLt1KMRv92v2PfP7dZEykcAXD4fXNpf6BOC
	 WJqNOh2hd9nbQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87edmwj9m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87edmwj9m1.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] ASoC: soc.h: remove snd_soc_compr_ops :: trigger
Message-Id: <168613833383.21852.4252184046753254419.b4-ty@kernel.org>
Date: Wed, 07 Jun 2023 12:45:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: MMDMAQDPQMJLER6SCQOYCURP2JGTQFF2
X-Message-ID-Hash: MMDMAQDPQMJLER6SCQOYCURP2JGTQFF2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MMDMAQDPQMJLER6SCQOYCURP2JGTQFF2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 01 Jun 2023 00:43:02 +0000, Kuninori Morimoto wrote:
> ASoC framework is not using trigger call-back for snd_soc_compr_ops.
> This patch remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc.h: remove snd_soc_compr_ops :: trigger
      commit: b9aa53fbee1e55abfcdfcc081c242de3c0582be4

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

