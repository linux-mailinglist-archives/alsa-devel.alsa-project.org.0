Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3B393C6B4
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2024 17:40:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62289E8E;
	Thu, 25 Jul 2024 17:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62289E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721922049;
	bh=b1xxyMOUKEHTM0fgA7cD5Ky7WM4hglICYTCKS++76WM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BY253h7vzGJpplHQ90/l4QpbGkhw5uLXpIZPTpNerrJbePeivMqvOJB89z9elhjBd
	 3mtrbIJPwuHXDWOY+q0VWrs+GkrFyjzzBqVA//oDlocuZNqzaezHUwJznaNpk0DuWE
	 15Zl4RDECcDVem17dKVIxbGtqy7NdRtL+8npD0Co=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5969CF805B3; Thu, 25 Jul 2024 17:40:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 155E9F805A0;
	Thu, 25 Jul 2024 17:40:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28B61F80482; Thu, 25 Jul 2024 17:40:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D8EDF801F5
	for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2024 17:40:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D8EDF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LGFaBFor
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1371CCE13A5;
	Thu, 25 Jul 2024 15:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7161AC4AF0B;
	Thu, 25 Jul 2024 15:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721922000;
	bh=b1xxyMOUKEHTM0fgA7cD5Ky7WM4hglICYTCKS++76WM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=LGFaBForeYM7v7INCmm8bGVhoycA1yBXjiM4EkajMOqGcSngGeisvOGul/VNRlRvV
	 X2+DZ3exNLic5d3hTcEPUV6JcJS2Y9nHCvuaRwxPyPHVRVKtFbczyE0YtKCnvvlV5K
	 MOtjzMAea32xMcAlHbw8z6wZmT2F0AO3wFJ9zo9WVtDiy+DVOvOpc30OeGhTL7gKIV
	 ZSKHKyiS7DrkkNIL1+ivKOf8b9BY3/v9eLwUSxPllsCQ2IoxM7gLRF834HeERh6ns7
	 gqX/sNYkALTRA3DXBUH2eHlEAGnadBA3hc6cy43mIqKarCkZGQ2bx8dWdRCFribHV4
	 LoNM5DdOCMRAg==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 elinor.montmasson@savoirfairelinux.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1721877773-5229-1-git-send-email-shengjiu.wang@nxp.com>
References: <1721877773-5229-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Dynamically allocate memory for
 snd_soc_dai_link_components
Message-Id: <172192199718.45693.5848047744878489432.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 16:39:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: VGCEUSXFENNTPEY64DS6TL5IQGPD6EOR
X-Message-ID-Hash: VGCEUSXFENNTPEY64DS6TL5IQGPD6EOR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VGCEUSXFENNTPEY64DS6TL5IQGPD6EOR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 25 Jul 2024 11:22:53 +0800, Shengjiu Wang wrote:
> The static snd_soc_dai_link_components cause conflict for multiple
> instances of this generic driver. For example, when there is
> wm8962 and SPDIF case enabled together, the contaminated
> snd_soc_dai_link_components will cause another device probe fail.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl-asoc-card: Dynamically allocate memory for snd_soc_dai_link_components
      commit: ab53dfdcdd1ec8df8729890aefa5b0e3c900afbb

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

