Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B387D756F91
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 00:01:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4F7DDE5;
	Tue, 18 Jul 2023 00:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4F7DDE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689631296;
	bh=MF2BkyFWl54rd0q27gv9WwRPLimYAj+ZoREQbH9d0Ew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=grcZAJOZo5XdzB2pJxg23pqJHy2iEwGQo86EQxF1xnf2BnHu4fr7sTO4jLC8swEJK
	 XRLWtUL0wRiQDrOkR4YWh6VHKEoDtkjcQhOWgkuKq+8vx66+6y20iK817DgnSYOlkR
	 D8O92kpFRsSnTI5184+ufYYWwdaistIoRID9L+iI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D3F3F80570; Mon, 17 Jul 2023 23:59:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 73F28F8055C;
	Mon, 17 Jul 2023 23:59:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9685AF8032D; Mon, 17 Jul 2023 23:59:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 723AAF8032D
	for <alsa-devel@alsa-project.org>; Mon, 17 Jul 2023 23:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 723AAF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=RRo1ob0g
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E8ACB612B4;
	Mon, 17 Jul 2023 21:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494F2C433C9;
	Mon, 17 Jul 2023 21:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689631176;
	bh=MF2BkyFWl54rd0q27gv9WwRPLimYAj+ZoREQbH9d0Ew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=RRo1ob0gBJ3IvyK0X5r5oJHQD0gXsvQWIM/kTFkyk3oMxlMmDIVnGNsmkTc8EX81s
	 YwFHyKN9IZBWECOGKyN4sIUZ4nua7RJA85KimrniJzkeGJVIo7UHdesYIYu/dyrRtO
	 XmNbeadl/dk7ZO3gugY1X1hNffvHx2qQWZmMHiRjKHerr5IBDEbb9mm8k5TXS9tApx
	 Es8M2xYn4qfP2J8v7G2FiSkOG+bNJTbEaWAz6Ny65oPkSWx6HWoJtHoFuqbbWVoK3s
	 cJ+rbYOTM0kZaUv6RDJOs2OTLB53kHbN0S6JkxPNDcNA6X9ulCXrdryI4e5ENR+rPQ
	 8Pf5jOnUcbskw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <20230712-asoc-qcom-maple-v1-0-15f8089664b9@kernel.org>
References: <20230712-asoc-qcom-maple-v1-0-15f8089664b9@kernel.org>
Subject: Re: [PATCH 0/4] ASoC: qcom: Use the maple tree register cache
Message-Id: <168963117501.522208.4963318993075097032.b4-ty@kernel.org>
Date: Mon, 17 Jul 2023 22:59:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: RPOCFDLZUWBAMNHBXGZWDTFB2NYGUGEO
X-Message-ID-Hash: RPOCFDLZUWBAMNHBXGZWDTFB2NYGUGEO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RPOCFDLZUWBAMNHBXGZWDTFB2NYGUGEO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 12 Jul 2023 19:29:31 +0100, Mark Brown wrote:
> The maple tree register cache should now be a good replacement for the
> rbtree cache in almost all situations, update the Qualcomm CODEC drivers
> to use the newer cache.
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: wcd9335: Update to use maple tree register cache
      commit: 272aedb250cff93c2c25d19db9f4691329238f98
[2/4] ASoC: wcd938x: Update to use maple tree register cache
      commit: 8caeeb54d8283601eab27f6d0ca727476cba7f1c
[3/4] ASoC: wsa881x: Update to use maple tree register cache
      commit: daf95b06a0615d8b2a6716d14a3b8605b90f1ed2
[4/4] ASoC: wsa883x: Update to use maple tree register cache
      commit: e1de05805133d2f2803001b4804d010b6812ca4a

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

