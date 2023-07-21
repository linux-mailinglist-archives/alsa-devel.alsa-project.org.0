Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B22175D0CB
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 19:42:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6990C1FC;
	Fri, 21 Jul 2023 19:41:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6990C1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689961364;
	bh=NGOdNal+BzVgQX0raM+ChQ6+I6DzdcNqi1bvgMhIf4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QQI8XvXJkcQUTalJjL/tkr9lkPuhmRjFBAgpC849HJ+CnQTJt5Ua0L2uEBC/EGCYR
	 ujl8ar0VPpoG9NN8teC0wc1rkMWhCV5SimFHfAUlw9MpoeYhPNNy5qcQ/n6u9sh1vH
	 HW+MV0Uf8sQJZnFQbDw3yqZw9zFcxggk6ZKRyFf4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65488F8027B; Fri, 21 Jul 2023 19:41:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8294F8027B;
	Fri, 21 Jul 2023 19:41:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAD75F8047D; Fri, 21 Jul 2023 19:41:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E63E9F8027B
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 19:41:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E63E9F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g2Sqt0Ye
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3D8A961D6A;
	Fri, 21 Jul 2023 17:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB6BC433C7;
	Fri, 21 Jul 2023 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689961271;
	bh=NGOdNal+BzVgQX0raM+ChQ6+I6DzdcNqi1bvgMhIf4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g2Sqt0YeqnPSupYT1tWBXFQHYFVhsZ5Isk3iwch92TFbC9QZkEgN3XwJD5eyNcK2N
	 0RTGXp1mKLb4fl8NtFc6zta3A01JWltbd8EKc8Su7iTTojfTNk7xj/+ppiW1820Ywq
	 RG38BaORQ53XenmW/hX1FdLn3mHJADyd8rMnErxADv9srXicjWvq3qOchpq66jXO3u
	 CiQJht4NS8kKwxakP+03a+AwYL/BX9D0Es6Iz+il0TngB8Sn/mTzpUYgQKaJ9GIK6k
	 iyXexQYleLlhfiKYLhKZS7rfFujc4T+JCClt7bud8XHyXKzWeaxpAo64FbMIUKhVAh
	 iiAOIcTpJNISw==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Stephen Warren <swarren@nvidia.com>,
 Matus Gajdos <matuszpd@gmail.com>
Cc: Mark Brown <broonie@linaro.org>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230719164729.19969-1-matuszpd@gmail.com>
References: <20230719164729.19969-1-matuszpd@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Silence output on stop
Message-Id: <168996126891.147587.9119073399027050309.b4-ty@kernel.org>
Date: Fri, 21 Jul 2023 18:41:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: M4MUNXYVET7QPKTWRMHQICFAOJO5ZCXQ
X-Message-ID-Hash: M4MUNXYVET7QPKTWRMHQICFAOJO5ZCXQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4MUNXYVET7QPKTWRMHQICFAOJO5ZCXQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jul 2023 18:47:29 +0200, Matus Gajdos wrote:
> Clear TX registers on stop to prevent the SPDIF interface from sending
> last written word over and over again.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Silence output on stop
      commit: 0e4c2b6b0c4a4b4014d9424c27e5e79d185229c5

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

