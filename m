Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB068221C5
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:09:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD57AE85;
	Tue,  2 Jan 2024 20:09:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD57AE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704222593;
	bh=b4JkRx9IW/2Mqis6Wxs8UBnV3+psqONjdD8/WLplL4o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mLxoiilFkrGKB3oq47phJIy6al1Dg4DgTeFpYvWdFQWC2tgTe+JIhmUs7fkPqKE8M
	 SiIAcVyHWZB9QLcn/lW5omyRtkbu918luorx9M+8dIUyU60mGq3R6YZjUFf1pLsmOA
	 YAPZ1YJ6kxYgciIIG1qlP+Y4SRyyqKfFPG2hzr+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B36CF8057E; Tue,  2 Jan 2024 20:07:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 131A1F8055B;
	Tue,  2 Jan 2024 20:07:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCDA3F8057D; Tue,  2 Jan 2024 20:07:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C07AF8055A
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:07:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C07AF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qbs7vhMY
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D56A0611B0;
	Fri, 29 Dec 2023 16:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B1FC433C7;
	Fri, 29 Dec 2023 16:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703869101;
	bh=b4JkRx9IW/2Mqis6Wxs8UBnV3+psqONjdD8/WLplL4o=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=qbs7vhMYcMb4ICsZXu39XriMqUaLOaVs4Lk/yGM4iXMzitHergVz/QOBScC8ykPv8
	 j9yb2b8Re7LqgxUgcSCdzPm2fR9HO87QOB6LuPXRMbOmcocqJH4sfwM6KvjKsexTmP
	 S0LqOlAtTh1USnt0kCcyzCka/EnFb/jhes7tXkPXftd8ruQtaPj1dxU6ND346Dnu1C
	 kp58fT/d63Xk6D/owpnFxB78dV/8y76W/+6qTs/6KCkqQbiPIHCNh1EfHBYrhHwhZ9
	 P29VMADrlu9B3W6t4/ONRs0aoTlrtMguEz1IZHeNzK8P/+apm71kiy85Xwmux2zxiz
	 cZrBO7XNHHNCQ==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
 Chancel Liu <chancel.liu@nxp.com>
In-Reply-To: <20231225080608.967953-1-chancel.liu@nxp.com>
References: <20231225080608.967953-1-chancel.liu@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_rpmsg: Fix error handler with
 pm_runtime_enable
Message-Id: <170386909836.3001741.632329944524813915.b4-ty@kernel.org>
Date: Fri, 29 Dec 2023 16:58:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: GFCDVC7L46ETNISZ4TKZGEKJSTEVSO2Z
X-Message-ID-Hash: GFCDVC7L46ETNISZ4TKZGEKJSTEVSO2Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GFCDVC7L46ETNISZ4TKZGEKJSTEVSO2Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 25 Dec 2023 17:06:08 +0900, Chancel Liu wrote:
> There is error message when defer probe happens:
> 
> fsl_rpmsg rpmsg_audio: Unbalanced pm_runtime_enable!
> 
> Fix the error handler with pm_runtime_enable.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_rpmsg: Fix error handler with pm_runtime_enable
      commit: f9d378fc68c43fd41b35133edec9cd902ec334ec

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

