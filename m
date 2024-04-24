Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D41B8AFD8D
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Apr 2024 03:04:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D43951909;
	Wed, 24 Apr 2024 03:04:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D43951909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713920668;
	bh=FCgxI9hRZbqu0+iAf2lCbUV0+8hj7ctLbKQ6/k8LXak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SjEqoVceSUAd+jei/YMIGnYBx2sbgBjozFaPDY1jUAexbFu3z4a2RtyTLj+EC19YN
	 AjTzNgUXcbd9/KCkjOUG7mEpxJuv6tH+ZYmRArmDx12gaDdaQN138pEJ5QQ8RHRu1y
	 R/4er9DlEnI0u3EOayN0MXAJFIfeCuIh+oklGYSU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 149D2F805AB; Wed, 24 Apr 2024 03:03:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 882F1F805A1;
	Wed, 24 Apr 2024 03:03:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33177F80423; Wed, 24 Apr 2024 03:03:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 48B85F800B5
	for <alsa-devel@alsa-project.org>; Wed, 24 Apr 2024 03:03:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48B85F800B5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=EyJGO1H3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8280ECE1072;
	Wed, 24 Apr 2024 01:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF98BC116B1;
	Wed, 24 Apr 2024 01:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713920605;
	bh=FCgxI9hRZbqu0+iAf2lCbUV0+8hj7ctLbKQ6/k8LXak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EyJGO1H3UiCDxrVt+fTv5npZByP4+CC1qF/PEGz86qgf4A1ythwY1vAHUgMnQh9N3
	 5ZCJDsxhBWe0VgFKV6AwxnwUo3q269Ipmqvn7XtfIRDQGDlNWnY55pfjSgwkKkILO6
	 UWi+YlGwksjaUWxKM7cZOBo38XkAgmVaOsrPMNhorA4xgCRCF0j2UlV1YSLvc6nE+X
	 /sWiQNFASvZ2ISdRA4scjH4JkA3n3XW6GPL27VDWp7K4+vuZsnxVOp7haNukSoTZac
	 TLJiIFL0qsH+g3ftqzYMCRiw6iU02SNGO9h8tEbgZGidERrvj9fWCUh1Bx65MsTElA
	 cUhSlHRH/pgtA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Jack Yu <jack.yu@realtek.com>
Cc: alsa-devel@alsa-project.org, lars@metafoo.de,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?utf-8?q?Shuming_=5B=E8=8C=83=E6=9B=B8=E9=8A=98=5D?= <shumingf@realtek.com>,
 =?utf-8?q?Derek_=5B=E6=96=B9=E5=BE=B7=E7=BE=A9=5D?= <derek.fang@realtek.com>
In-Reply-To: <b1f546ad16dc4c7abb7daa7396e8345c@realtek.com>
References: <b1f546ad16dc4c7abb7daa7396e8345c@realtek.com>
Subject: Re: [PATCH] ASoC: rt715-sdca: volume step modification
Message-Id: <171392060325.1783869.17838876674703834561.b4-ty@kernel.org>
Date: Wed, 24 Apr 2024 10:03:23 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: 45YOLRL3B6R5JMKKW7SKWFHKD4HQBSYM
X-Message-ID-Hash: 45YOLRL3B6R5JMKKW7SKWFHKD4HQBSYM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/45YOLRL3B6R5JMKKW7SKWFHKD4HQBSYM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 23 Apr 2024 06:59:35 +0000, Jack Yu wrote:
> Volume step (dB/step) modification to fix format error
> which shown in amixer control.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt715-sdca: volume step modification
      commit: bda16500dd0b05e2e047093b36cbe0873c95aeae

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

