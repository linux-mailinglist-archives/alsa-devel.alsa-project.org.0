Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C17007861F6
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 23:10:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70CD0839;
	Wed, 23 Aug 2023 23:09:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70CD0839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692825012;
	bh=OF5HJLG5FzsNNhmPY/VyYpOOUEVm3L9+q1JsGFn1ulc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b9GfrueMIzWDsBelCW6DM47B8TfjE/y2JSDOxjoB0DZyC5nPT3ttrVi2UaVxqmFll
	 T2KzA+b0wWBlo6FzE49BOXLYRTynleJbP6kuo3Y2lOROr8F8JeF0ke3x9BVmVxYI1+
	 4/mjYKVbfkLImhS4hpIRhPvYCsFN2i3vSGYwoUuw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C3E95F800F5; Wed, 23 Aug 2023 23:09:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51E24F800F5;
	Wed, 23 Aug 2023 23:09:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5E43F80158; Wed, 23 Aug 2023 23:09:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96404F80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 23:09:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96404F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OlF1Si3r
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 857596335A;
	Wed, 23 Aug 2023 21:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B352C433C7;
	Wed, 23 Aug 2023 21:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692824944;
	bh=OF5HJLG5FzsNNhmPY/VyYpOOUEVm3L9+q1JsGFn1ulc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OlF1Si3rIqIafTdto8/wWcEkfcJW3vMy6f1dXKj8rC8vDSkwCRZARXc8pFOpHcGAX
	 J5EUQvKgGyA2fRcpDucTMc4/V3k604hVLHApj3UeaI/eGyIU00RlhyaJBSz6TT4MLt
	 EvY2XwnGU/GoLcbz5Iy/VrJPyWH17b2TZGWyV1FMaKg8SywCUy2HlB2oIt0t5QcEnb
	 txsYqO9AJad/5by7hrKs0sFTxNqg5giCqJK1hUx5mrpzBoCKpwsXCyCDCvIhPlLp78
	 Wovg8OZsbvZ1lR8Fy8fopf8zMJtuQtgIHgybFhnGJHyUpE8zmWX3oZ+89/D38Kj8wW
	 ylsxKr7FnWYVQ==
From: Mark Brown <broonie@kernel.org>
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 rf@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 Nathan Chancellor <nathan@kernel.org>
Cc: lgirdwood@gmail.com, ndesaulniers@google.com, trix@redhat.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 patches@lists.linux.dev, llvm@lists.linux.dev
In-Reply-To: <20230823-cs42l43_pll_ev-init-ret-v1-1-5836f1ad5dad@kernel.org>
References: <20230823-cs42l43_pll_ev-init-ret-v1-1-5836f1ad5dad@kernel.org>
Subject: Re: [PATCH] ASoC: cs42l43: Initialize ret in default case in
 cs42l43_pll_ev()
Message-Id: <169282494202.183189.5510150432042109830.b4-ty@kernel.org>
Date: Wed, 23 Aug 2023 22:09:02 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: O4R44Y3FWXMEZU7YFJMGCJLQ7J3PUH2C
X-Message-ID-Hash: O4R44Y3FWXMEZU7YFJMGCJLQ7J3PUH2C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O4R44Y3FWXMEZU7YFJMGCJLQ7J3PUH2C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 23 Aug 2023 09:32:50 -0700, Nathan Chancellor wrote:
> clang warns (or errors with CONFIG_WERROR=y):
> 
>   sound/soc/codecs/cs42l43.c:1371:2: error: variable 'ret' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>    1371 |         default:
>         |         ^~~~~~~
>   sound/soc/codecs/cs42l43.c:1377:9: note: uninitialized use occurs here
>    1377 |         return ret;
>         |                ^~~
>   sound/soc/codecs/cs42l43.c:1349:9: note: initialize the variable 'ret' to silence this warning
>    1349 |         int ret;
>         |                ^
>         |                 = 0
>   1 error generated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l43: Initialize ret in default case in cs42l43_pll_ev()
      commit: a74048432fbb30e7a574747f6e1f47aef17010b0

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

