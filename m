Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 714A68A4CFD
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 12:53:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A363B14DC;
	Mon, 15 Apr 2024 12:53:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A363B14DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713178434;
	bh=rnyoSsMHQxr2FpuWYiyNFR/ZDGJBdTKFdNrtzd5MXvI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=E/TE7JmcOzrpKigRJUGewZ4goe+h00Ocd3ANNfp6I79tsQN+1sM7q3sqN+yrXG2Np
	 T+HQ9lpOG9WGE2rxjTOPXTEc7rgsIiqE5sdxeFQgsHd/gluqejxDYMzBL8Np3mjici
	 it9unt+N9QZx+Acecgef56fSw6IsLcvzFjXNVBQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D510FF80496; Mon, 15 Apr 2024 12:53:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BFB2F8059F;
	Mon, 15 Apr 2024 12:53:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BFDFF8025A; Mon, 15 Apr 2024 12:53:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3EE3F8013D
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 12:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3EE3F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f8H1GZdS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ED1B060C56;
	Mon, 15 Apr 2024 10:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2EDFC3277B;
	Mon, 15 Apr 2024 10:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713178402;
	bh=rnyoSsMHQxr2FpuWYiyNFR/ZDGJBdTKFdNrtzd5MXvI=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=f8H1GZdSXQsUopLuk7g5T7VRzyN2HLk8mfqZoMWBzWUN1CCl2JBGhgv4/zS8m4KF+
	 fLiNBJGSZoM3GMmgDUsl801iV0bkPFgCcBZ269I1wF9wuB1W43xK7muyg47/i6dJYE
	 5di4w8z+X2AjQ3yxV/ePFJFDrzpf5x1LkRrbEFBYhgP+fc18Te4lZ220I8evqejHSZ
	 fMbg2K7mCZPlLjUSVUvwM1FuLOEmtnA4WLjLp05qYs1v4WGz9FSv/RZU4XP0gnrD4x
	 htOtG6T51U9Jkya+Gnbv443xhpVqyL7Kxoeyu7xdortxcHQtzNFS/xbpAT7ZSDOQK6
	 hYXRbUxPvg6PQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20240414154839.126852-1-krzk@kernel.org>
References: <20240414154839.126852-1-krzk@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: wcd934x: Drop unneeded MODULE_ALIAS
Message-Id: <171317840045.1652048.10866553206625890591.b4-ty@kernel.org>
Date: Mon, 15 Apr 2024 19:53:20 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: Y623QJ5P6JSRSRTXMSUANSW3YVABCU6T
X-Message-ID-Hash: Y623QJ5P6JSRSRTXMSUANSW3YVABCU6T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y623QJ5P6JSRSRTXMSUANSW3YVABCU6T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 14 Apr 2024 17:48:38 +0200, Krzysztof Kozlowski wrote:
> The ID table already has respective entry and MODULE_DEVICE_TABLE and
> creates proper alias for platform driver.  Having another MODULE_ALIAS
> causes the alias to be duplicated.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: wcd934x: Drop unneeded MODULE_ALIAS
      commit: 615169c727b13ff4ec6c43b62501f73f9f88a11a
[2/2] ASoC: samsung: i2s: Drop unneeded MODULE_ALIAS
      commit: 9d85ec4e91e354ed2d8291e1ea3ba76e660205a0

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

