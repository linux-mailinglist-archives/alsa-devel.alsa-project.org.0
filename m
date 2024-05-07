Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B2D8BD90A
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 03:38:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFF2C207;
	Tue,  7 May 2024 03:38:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFF2C207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715045900;
	bh=7T6mbhT6vl3m4fgPrZ7Q4EESsIvLkdSI1gi4g130v+A=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hKdkdfQO0dCe+hfE5M5qJAN5h2rJFsIdKI4a3G5+5HiXgkZGRTaGv8l+wL3/GTRou
	 Rt//PrHZug5vAaGa2BEyxI/5xTYaZNnVulFZeC/MEAHuoy/6MruquJThgR2DKmUipI
	 0bHgCBggK3frlimVaIEeuLA4SH2j2vLAjq8QZpQ0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4ED7F80589; Tue,  7 May 2024 03:37:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46255F8057A;
	Tue,  7 May 2024 03:37:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22051F8049C; Tue,  7 May 2024 03:37:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D76BF8003A
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 03:37:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D76BF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=vBz7L4vP
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45950614BA;
	Tue,  7 May 2024 01:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C72FBC116B1;
	Tue,  7 May 2024 01:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715045861;
	bh=7T6mbhT6vl3m4fgPrZ7Q4EESsIvLkdSI1gi4g130v+A=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=vBz7L4vP2Lq9kPOax3KC896V0R5+hpIpSoTkR3mAHMguXMEnuOoeq+5jq64VcKFu5
	 edcgLaJzuZOzmYGFNEL/oZFCkK2aA6iPnuBRizwZVMlB36FiWrSONg6n+571nUOAoC
	 xMv00XnGPzSoIBq/O5w6wJPf0s34K2Xh/Z5gHt2XyfzG0zK8DB5dGxwZj1YRYJJD+j
	 i+pEw6MCyiyiN+v5kxCSUr5pazs99ogdtqvunH/jUzsUNKHSBKTr2pW351cauOwoFb
	 aVH/k8S3TVhAc/pii7VtGW1UUVsdDYNiFFfmSANbV3xz5n1ZpAnj4VwsufKTE5MA5a
	 ihw1K14PpI8lQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240430140954.328127-1-krzysztof.kozlowski@linaro.org>
References: <20240430140954.328127-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: q6apm-dai: drop unused 'q6apm_dai_rtd'
 fields
Message-Id: <171504585856.1982545.5694703211311117079.b4-ty@kernel.org>
Date: Tue, 07 May 2024 10:37:38 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: WSUODDNCFK6BZY42HR7LQCJTM723YGAX
X-Message-ID-Hash: WSUODDNCFK6BZY42HR7LQCJTM723YGAX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WSUODDNCFK6BZY42HR7LQCJTM723YGAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Apr 2024 16:09:54 +0200, Krzysztof Kozlowski wrote:
> Remove few unused fields from 'struct q6apm_dai_rtd'.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: q6apm-dai: drop unused 'q6apm_dai_rtd' fields
      commit: bd381c9d151467e784988bbacf22bd7ca02455d6

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

