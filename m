Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 182ED68E479
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:34:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A21D73E7;
	Wed,  8 Feb 2023 00:33:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A21D73E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675812876;
	bh=h6Asegb3UosZ64SLaFl7xxcR07djTQ+PvmszvRBil6w=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U42sc7TLAtjw6xL5+nGBiQmLfuWeNjkRHU0IlGo/qtPbyl/oVFkHIfigfF2GTAM2r
	 l+ujs5YcsrHXMHngCabOI6eYvId2QrnZKWKQgAX+DihqCPx19vpsTkolQIGvTDFSvC
	 RFoG/6Xw9Xt4cYjaZTbcZ0QlZgXfuozof9pInOJI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5808FF8010B;
	Wed,  8 Feb 2023 00:33:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32DCCF80152; Wed,  8 Feb 2023 00:33:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97DF3F80095
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:33:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97DF3F80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p93Ap3nu
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AAE82B816D4;
	Tue,  7 Feb 2023 14:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBEAC433EF;
	Tue,  7 Feb 2023 14:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675778784;
	bh=h6Asegb3UosZ64SLaFl7xxcR07djTQ+PvmszvRBil6w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=p93Ap3nummMzTCFrhTuIZj/pRJupCaGKWU2886vJi7VYMArbOWawjy7df6+SgP6ar
	 fmjWTVRM+c7pgNSFVvFCOFnmSjnxgWEXrcqX8H2zpEkPl0Lgu7ThM+wLFGO8dW0WYv
	 6CrKIqz1fGb2Or7NvZdHzkI1rLD9ZvD4EUbMNmIqxf5wAQsV5tQqrAs5EbUyZAAjKh
	 pqvu1AmoB37Z+S5Jg6UCdUSBLz3dbXY88k1ub18XXWClIekN8tSOpusycWYxTcGykR
	 8ldPt5g+CdT1PdhbfQD2HiY8xHTQGPsgukFWx6ahPE0MURRHv5p9EOT2M+rUl/86f4
	 QYXoHwKWQT03w==
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1675760664-25193-1-git-send-email-shengjiu.wang@nxp.com>
References: <1675760664-25193-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: fix getting version from VERID
Message-Id: <167577878194.133259.5914289862792868772.b4-ty@kernel.org>
Date: Tue, 07 Feb 2023 14:06:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: TOY43YLBWR66V4LURSIOTGI2GEWZPACB
X-Message-ID-Hash: TOY43YLBWR66V4LURSIOTGI2GEWZPACB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TOY43YLBWR66V4LURSIOTGI2GEWZPACB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 07 Feb 2023 17:04:24 +0800, Shengjiu Wang wrote:
> The version information is at the bit31 ~ bit16 in the VERID
> register, so need to right shift 16bit to get it, otherwise
> the result of comparison "sai->verid.version >= 0x0301" is
> wrong.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: fix getting version from VERID
      commit: 29aab38823b61e482995c24644bd2d8acfe56185

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

