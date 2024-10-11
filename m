Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BEF99A518
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2024 15:31:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DADC852;
	Fri, 11 Oct 2024 15:31:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DADC852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728653511;
	bh=axgDJJd0Yci/0Oz/SEuK3Q+Z9vXkPa5HPiC8NPVOvCE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MbKtkc5ML9m5lmdDdOOCINWzEfTE9z0aYXwdy0aOld6obaW1FjG7F1fE+trvTMra6
	 3Sy6sZhiUxmtDg3QgTJYtqB/tkKcdZYt0bCueRajLnw2NkAIi23ByyWgTTwM8HT4kl
	 3oLHmN6YfgVnGFe+cGBnl57RE57NJh5EXrdxG0Cc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7169EF805AD; Fri, 11 Oct 2024 15:31:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86B9EF8059F;
	Fri, 11 Oct 2024 15:31:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFA81F80528; Fri, 11 Oct 2024 15:31:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6538BF80496
	for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2024 15:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6538BF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NPqs1Bpc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8671F5C5E83;
	Fri, 11 Oct 2024 13:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4B3C4CEC3;
	Fri, 11 Oct 2024 13:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728653479;
	bh=axgDJJd0Yci/0Oz/SEuK3Q+Z9vXkPa5HPiC8NPVOvCE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=NPqs1BpcLzfSPkyANaoRtIQtuBTavtjxHEfX1aKGu3aJEs05CTp/25tDozWGoyMAC
	 n0Qp0O24/CJFN7fX8wEZGEj1HABa5mQ8ZBbXm1nfSz+Y5CDY3kgeQ2jIuxTPq9fdNa
	 sYOYq/ESC+2XNiHopx4g0+wnvaTq3djNI1eXa9NIANAOQJBNoZth+QLEyqsBeTon1N
	 WFbefM+N9QzMTbwfdzr8PfXekEqffkdZmFtn+qF2sIiPYOBjFxOrNIcpayvCprmIgf
	 8kHNnoN8fFT34wXBHHWbq3pkhHazo6eZ6TWPS7Mu1PaJ/Xn/9SAGuSBR1p4mpyT2uJ
	 X0kNpm9IxqBLw==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1728622433-2873-1-git-send-email-shengjiu.wang@nxp.com>
References: <1728622433-2873-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_esai: change dev_warn to dev_dbg in irq
 handler
Message-Id: <172865347670.3898502.17710275321530341071.b4-ty@kernel.org>
Date: Fri, 11 Oct 2024 14:31:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: EMCTDIJR2RZIDZA5XDDESSKZSID73T3D
X-Message-ID-Hash: EMCTDIJR2RZIDZA5XDDESSKZSID73T3D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EMCTDIJR2RZIDZA5XDDESSKZSID73T3D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 11 Oct 2024 12:53:53 +0800, Shengjiu Wang wrote:
> Irq handler need to be executed as fast as possible, so
> the log in irq handler is better to use dev_dbg which needs
> to be enabled when debugging.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_esai: change dev_warn to dev_dbg in irq handler
      commit: 54c805c1eb264c839fa3027d0073bb7f323b0722

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

