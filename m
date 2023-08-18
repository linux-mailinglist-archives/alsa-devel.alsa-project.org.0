Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9290A781260
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 19:52:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95792EC4;
	Fri, 18 Aug 2023 19:51:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95792EC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692381168;
	bh=YUfZpjex5Jf2OeOEtyGtdCbFAvj6VJB5L0xNXxOdcd0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iIheim5uHSancdMa3GgoKrWB9PWyyp1V6rmdYNF7XuxIHhAzunWpon7nmjZIb9fvK
	 3thi04ZCTb7DLAX2/Li640Q9k+3SDIZPvJBbYHXgkfz8D3k+FfX/n8+AyyJgarl7Di
	 k7y9T1a6bzEGxy3GYsN8Q5VbNQHg1l23/mI/fiiA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF717F80027; Fri, 18 Aug 2023 19:51:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79341F8016D;
	Fri, 18 Aug 2023 19:51:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40A50F80254; Fri, 18 Aug 2023 19:51:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E29B3F80027
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 19:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E29B3F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a0IEi1hW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 90C8662AE8;
	Fri, 18 Aug 2023 17:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65481C433C7;
	Fri, 18 Aug 2023 17:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692381104;
	bh=YUfZpjex5Jf2OeOEtyGtdCbFAvj6VJB5L0xNXxOdcd0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=a0IEi1hWhfKi9mpGL7tu1jvBlOF1Qw+voiSXc9F2UaJKL7ScnoI69/mNUCSuncfFX
	 crjSRpSkdedyh+fnqckKNqnPlAFYPQEG6IMwcvy2oZofMl8nUh8ukB1EC2UksjZHmu
	 ri4nraS6+PyUFMWIRCkHpky3LSaLZM3ccsiMtRuPWf2Vtv3Zo76+9nbxp1wg6Kseb1
	 2MsQzQ+1rLQrXTvubJUiQYizWheqraeCabHAjR5EiVH2uOBjwpQRsE2+kmccHxFSVu
	 W+09pHWpchGebbVNqkw8mrw92TpHSrI00wtN5bNbhdBVY7q/EDoFz+j9cOk2LiVUZU
	 /ETKFHcjaoirw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, shumingf@realtek.com
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
 oder_chiou@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
In-Reply-To: <20230818023732.2153170-1-shumingf@realtek.com>
References: <20230818023732.2153170-1-shumingf@realtek.com>
Subject: Re: [PATCH] ASoC: rt5645: improve the depop sequences of CBJ
 detection
Message-Id: <169238110211.55727.6839300042021267722.b4-ty@kernel.org>
Date: Fri, 18 Aug 2023 18:51:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: AC6P2O7POV3JHGUQGXAU5TSZGIS675LU
X-Message-ID-Hash: AC6P2O7POV3JHGUQGXAU5TSZGIS675LU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AC6P2O7POV3JHGUQGXAU5TSZGIS675LU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 18 Aug 2023 02:37:32 +0000, shumingf@realtek.com wrote:
> This patch will improve the depop function of CBJ detection before the headphone playback
> when the system resumes.
> We also want to complete the CBJ detection in the system-level resume function.
> It could avoid triggering the detection at the playing state of headphones.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5645: improve the depop sequences of CBJ detection
      commit: aa98697c7dbd8dcb30841ca48456e7d534209d6d

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

