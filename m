Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76885759F33
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jul 2023 22:02:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7D21F0;
	Wed, 19 Jul 2023 22:02:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7D21F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689796974;
	bh=w2xExNL6EbofhaPL7HrdC2dQl+hHtjTWHi8Iv1ep0XM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m32XE/ZYfwKlFhli+hd2h19lM2snuZfWrmIWYfSw+u58qYqxOAXhLqY5rxVrVyG52
	 bJrJMK226ETGBFe4NLpl9aFPG5mmiQx74M8YTBNpYFYSDGP5OXqSuFbC3jwnJey4aT
	 UkeRyONe2dpE/41cg6WFWmkzkppPn0KubxL+IJ28=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 433E3F80544; Wed, 19 Jul 2023 22:02:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E03BAF8032D;
	Wed, 19 Jul 2023 22:02:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81FF2F8047D; Wed, 19 Jul 2023 22:01:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED29FF80153
	for <alsa-devel@alsa-project.org>; Wed, 19 Jul 2023 22:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED29FF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bcTlPpPY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66556617D6;
	Wed, 19 Jul 2023 20:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B31C433C8;
	Wed, 19 Jul 2023 20:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689796907;
	bh=w2xExNL6EbofhaPL7HrdC2dQl+hHtjTWHi8Iv1ep0XM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bcTlPpPYAYmB2sS5fUgqGZUU3FJICfaHN5WbE7TGHrxRYFbYb08wO2sohI7OddFUT
	 pwKL5HrnkJPeEpRx3gngzC63J27H+jVm1ZhEqqFCeZ4T7vR8Ea3fvm4/GOICqQ4mqK
	 NHLz6DQ2xvaokv+q7OVorcg5ORkWMbT0MU5y9TuLd9qt1G/8qQnmFEt5DWUiv/ULgg
	 l6nYmC5JAWfo3Tfl7wFAXkvaXvm7D4qXK2lE3S+VxFSRrMGB9omCjpsfDUZ5HgDhNn
	 BedXC2DS3xEVCLkKF8mEw7Xsh/XqC79MMe4Y+AbMWACLcGez8yBsTZlvGez+jUma+s
	 thMkIBC5WTkwA==
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matus Gajdos <matuszpd@gmail.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230719163154.19492-1-matuszpd@gmail.com>
References: <20230719163154.19492-1-matuszpd@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add support for 22.05 kHz sample rate
Message-Id: <168979690540.180044.4033002873442934544.b4-ty@kernel.org>
Date: Wed, 19 Jul 2023 21:01:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: CF5UZV4U4JFCDX5JPONDD7H2FIDDCJOT
X-Message-ID-Hash: CF5UZV4U4JFCDX5JPONDD7H2FIDDCJOT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CF5UZV4U4JFCDX5JPONDD7H2FIDDCJOT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 19 Jul 2023 18:31:53 +0200, Matus Gajdos wrote:
> Add support for 22.05 kHz sample rate for TX.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Add support for 22.05 kHz sample rate
      commit: 65bc25b8d0904e0aff66b1c3a9dd4c0dcb8efbf1

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

