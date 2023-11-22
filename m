Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0DA7F4E6D
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Nov 2023 18:32:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CB2DAE9;
	Wed, 22 Nov 2023 18:32:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CB2DAE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700674353;
	bh=b3bPrHVvEfkj5yHIcwFXP8t5jf2bdOaikqngl5P4eqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Av4g9f4FtiEMhVhPFs2qP+kfqfrJKE4qw7h3diBCky6L0ulXiSj70QDogWplQVCLJ
	 ouchAI6Bg+djiUIBmtMdmhi5sZwSxS5k4ljbtNx6hH8JqiLBvxksl2m8IZWq4M2fzr
	 Z8dGvD9YZ2Cobrc+PIucQBC2ozdYxQMF3u7rkN80=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C979F80587; Wed, 22 Nov 2023 18:32:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31741F80579;
	Wed, 22 Nov 2023 18:32:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2DDDF802E8; Wed, 22 Nov 2023 18:31:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAF06F80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Nov 2023 18:31:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAF06F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eIvJnsMS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5498CCE2534;
	Wed, 22 Nov 2023 17:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6AAC433CA;
	Wed, 22 Nov 2023 17:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700674301;
	bh=b3bPrHVvEfkj5yHIcwFXP8t5jf2bdOaikqngl5P4eqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eIvJnsMSKRo0Sxw8ALRT2YlbDfHrwaCl4YEAwMm986k4Dg9IwdqWMGtbGBHsKJKzZ
	 f6v1eyWxzKyoWRxoOlHO3W+boQ4GKyXb/fjK29H5IDuMwhkyYKykD7Bk8xISP1YIyP
	 O6riwcErC+giYU07cCtlZiU+hCJ8hMG1JldyNvUPl5Za7DGJrhRy+1ivpxDzpJ1CEw
	 SEApaVSTVEFhF3WswP7cG7HuOSHV0KvVUGsLtS/C/DTBK7C/uvDFut0UPmxifb6/hG
	 rf9FnGbbYI2mlAVDOIlZkA8lNN/k74pCRL5RJq4SJMLE5TLFh7fucTK4DGvIsNPKs+
	 bzfVfx0hiHHow==
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <1700617373-6472-1-git-send-email-shengjiu.wang@nxp.com>
References: <1700617373-6472-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: Enable 2 * TX bit clock for spdif only
 case
Message-Id: <170067429848.2197522.15067671352238530085.b4-ty@kernel.org>
Date: Wed, 22 Nov 2023 17:31:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: IAK2HT3Z4HENWAPZB3AOMFU3SFKT23XG
X-Message-ID-Hash: IAK2HT3Z4HENWAPZB3AOMFU3SFKT23XG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IAK2HT3Z4HENWAPZB3AOMFU3SFKT23XG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 22 Nov 2023 09:42:53 +0800, Shengjiu Wang wrote:
> The bit 10 in TX_DPTH_CTRL register controls the TX clock rate.
> If this bit is set, TX datapath clock should be = 2* TX bit rate.
> If this bit is not set, TX datapath clock should be 10* TX bit rate.
> 
> As the spdif only case, we always use 2 * TX bit clock, so
> this bit need to be set.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: Enable 2 * TX bit clock for spdif only case
      commit: c33fd110424dfcb544cf55a1b312f43fe1918235

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

