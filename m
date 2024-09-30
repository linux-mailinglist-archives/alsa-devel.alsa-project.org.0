Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3562098AF03
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 23:27:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87CD221B8;
	Mon, 30 Sep 2024 23:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87CD221B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727731671;
	bh=NkRqiuMzhon0316LV3Kd2sU6eM23gxXjReXGVuES79I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rQi8phkgXvnqAhhdbXlxbrvS9V0eYR1Q8fby4yNJ2yJMwY/LlZ39k/PmYBXPQvY+W
	 0C8AgUrCzsm3rgMxQf/BTH6YANYdhGAxBfE3I7wpcgknF9GSYuoHZ0qqWzxxP9yiA1
	 3x6Z20GOC7Qi7ABtHixo8fM+5MgSrHuVTvC4So/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98BC2F80606; Mon, 30 Sep 2024 23:26:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C9EEF805E6;
	Mon, 30 Sep 2024 23:26:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5CF2F805BB; Mon, 30 Sep 2024 23:26:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4081EF80527
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 23:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4081EF80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Qx9+ijmC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F8FFA416D9;
	Mon, 30 Sep 2024 21:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B21C4CEC7;
	Mon, 30 Sep 2024 21:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727731602;
	bh=NkRqiuMzhon0316LV3Kd2sU6eM23gxXjReXGVuES79I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Qx9+ijmCV0QWEi1Y3/I0BppzWyFZVGTnGK/kuxt4amCNYMWAAhex2Ojp/1Ipd9w6j
	 Zu1EdY6/lt9gWstfSbToWwF/U0xEqJL5FQNpw9tIQ1btd/ffNA1LphbiwBMaykzNQc
	 5W+JJWj9I/6Jt4IkmgZG2zLhZDJJ+Y8t9B/VyxzY8ied3nAfZqBqQO+k6Ej2I6Nl7Q
	 JZS08jHRK9gfNiigzZrtzKjMgApPH3zvwQwmArLAm+qnO6TjSNS2i9UzYTbDwFFXo1
	 n7DoD4qEZXHUktUmxCMz9EewyNE7yBHCrYyI4CeCzjQULmZxZuRg143ACLMmJdP4aM
	 1hs7qx0qdQn+g==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240924-asoc-imx-maple-v1-1-8b993901f71e@kernel.org>
References: <20240924-asoc-imx-maple-v1-1-8b993901f71e@kernel.org>
Subject: Re: [PATCH] ASoC: fsl: Use maple tree register cache
Message-Id: <172773160047.2197048.13783696550298838000.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 22:26:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: GYNJ3GBGLO4HX776KVIKP2FJ3XNSVRNT
X-Message-ID-Hash: GYNJ3GBGLO4HX776KVIKP2FJ3XNSVRNT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GYNJ3GBGLO4HX776KVIKP2FJ3XNSVRNT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 24 Sep 2024 15:58:42 +0200, Mark Brown wrote:
> Several of the NXP drivers use regmaps with a rbtree register cache. Since
> the maple tree cache is uisng a generally more modern data structure which
> makes implementation choices more suitable for modern systems let's convert
> these drivers to it. This should have no practical impact.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: Use maple tree register cache
      commit: bbeffdda5f26a56072cb8cf741f4c52bc2174838

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

