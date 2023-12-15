Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D28A7814B27
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 16:06:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 755B1DF3;
	Fri, 15 Dec 2023 16:05:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 755B1DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702652765;
	bh=XOILv9Fmwwz3Rta+62IPEge55zNcBrrWIBM03rU+5UE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZVAJbNMCbPE/SfDD0BXBNGGGIhPbH8/2PTdHz+uv7t3M5AN9zE4q9X+vt4HkJsR9Z
	 WHPckmJK/nASRVt4UY4507HEKtaBUgNamayu+bpwbNbQyOPIq/Pkkic1WEL543f7AJ
	 b2uczqeqB4AWe1PTNz2mYylY39AucxGE8R10viws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DB1DF8016A; Fri, 15 Dec 2023 16:05:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6882BF80571;
	Fri, 15 Dec 2023 16:05:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62871F8016E; Fri, 15 Dec 2023 16:05:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C73EEF80114
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 16:05:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C73EEF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J82Ykm4F
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 98EE6B828F0;
	Fri, 15 Dec 2023 15:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77B90C433C7;
	Fri, 15 Dec 2023 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702652722;
	bh=XOILv9Fmwwz3Rta+62IPEge55zNcBrrWIBM03rU+5UE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J82Ykm4F3QSyWLSqa7ED/v/ozXselGaYeoF/WX6M4v0Tws+q+L/NnlN+b+c5XyPJJ
	 0oRLZ1Qo+ulD5PbpBqh8sBrlVEHI0/D9M7Sh0xCi9jYHXO66xjFcBJZKYgtmZ6hCF5
	 YtCmKKZEfvO3tFE2NNHZJtcU9fUBaQf2feOG0ItjoUlncJIO0R3SvVH+V2y51EGoBU
	 lMcDrDTQv/jaLvD1vE4E1sYXJxQ+MUFRPhWyE2Zh4pmyAUjkIwhLZSHxhBf1MGN9BW
	 mswU/V4Rey357AU7dMhKfKRj2NxsxEJ0GxL2k+SHZfq6Me39WaErEvLy1vhyrKq7nv
	 0MceiqvqXxTNg==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Wang Jinchao <wangjinchao@xfusion.com>
Cc: stone.xulei@xfusion.com
In-Reply-To: <202312151713+0800-wangjinchao@xfusion.com>
References: <202312151713+0800-wangjinchao@xfusion.com>
Subject: Re: [PATCH] ASoC: fsl_mqs: remove duplicated including
Message-Id: <170265271919.82974.8640827688447166639.b4-ty@kernel.org>
Date: Fri, 15 Dec 2023 15:05:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: AYDODSTFE4GB7D3C3YLGV3OFHNOQYSKD
X-Message-ID-Hash: AYDODSTFE4GB7D3C3YLGV3OFHNOQYSKD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYDODSTFE4GB7D3C3YLGV3OFHNOQYSKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 15 Dec 2023 17:13:51 +0800, Wang Jinchao wrote:
> rm the second \#include <linux/of.h>
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_mqs: remove duplicated including
      commit: e7a4a2fd9a4116286a1523ea1a5cbabd2c36f5b9

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

