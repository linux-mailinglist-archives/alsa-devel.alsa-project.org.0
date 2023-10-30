Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C427DC055
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Oct 2023 20:22:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A69FC86F;
	Mon, 30 Oct 2023 20:21:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A69FC86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698693762;
	bh=UPMZ+xQmEGa91GQ0MSguOeCpnzIle8Ii2hBLfbabYwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XAIcjEHoVyJSLSKI1MYqHxvnjYsjbbpemrJzD5gaBSc5BstqGAkInpupsVK8WyTkM
	 TlBtxIkiSKaoZlRnzLVqXjs7isRfP9rqe8R7U5+KULHqiQ9n5qwW3nprh4sMjJU7oM
	 sO8UwFIIcIKXLAb0Fgd2f7060usux+pSgCh3ojCQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46DBFF80570; Mon, 30 Oct 2023 20:20:46 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BC44FF80571;
	Mon, 30 Oct 2023 20:20:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 860A3F8055B; Mon, 30 Oct 2023 20:20:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA99AF8014B
	for <alsa-devel@alsa-project.org>; Mon, 30 Oct 2023 20:20:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA99AF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JL3pNNQr
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EDFB360B08;
	Mon, 30 Oct 2023 19:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCDDBC433CB;
	Mon, 30 Oct 2023 19:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698693635;
	bh=UPMZ+xQmEGa91GQ0MSguOeCpnzIle8Ii2hBLfbabYwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JL3pNNQrc2OhpvM+XF6vsbnBt/hiTjKLPv8fx+D3+eoy9c9Ooso1S6RLqoTZj6Rz/
	 ll6bDQG+rdmW32KLO5rltjz8BHc8nskbp4Ftcop3aL0HfptxW55IQ2oqo3I1ObJflv
	 EozGF9A2FuU+9VcvPEJWNoEkpfIMwB+bUGgas2O9syaQEuoHPqXMDZNW89LsqsXRd6
	 Tr6+zMm7o1Qakx/cBa/r2J4Pj4PdW29t0Yq07F8O/YwMnKKQdyNaUuOLSj1IlflgB2
	 Xtt1JiBr5751pVEbYK8hmEzD1X1vdOYR/8Ch/zq+FVy5XdZKocUW2s/ZRGGt3qIjm/
	 mRkUEh+PkryHw==
From: Mark Brown <broonie@kernel.org>
To: wangweidong.a@awinic.com, Nathan Chancellor <nathan@kernel.org>
Cc: lgirdwood@gmail.com, ndesaulniers@google.com, trix@redhat.com,
 alsa-devel@alsa-project.org, llvm@lists.linux.dev, patches@lists.linux.dev
In-Reply-To: 
 <20231027-asoc-aw88399-fix-wuninitialized-v1-1-b1044493e4cd@kernel.org>
References: 
 <20231027-asoc-aw88399-fix-wuninitialized-v1-1-b1044493e4cd@kernel.org>
Subject: Re: [PATCH] ASoC: codecs: aw88399: Fix -Wuninitialized in
 aw_dev_set_vcalb()
Message-Id: <169869363339.44249.15683316983953713532.b4-ty@kernel.org>
Date: Mon, 30 Oct 2023 19:20:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: MJCSHG2SVIS2ONMB4CYTJGLZ2H2HVICI
X-Message-ID-Hash: MJCSHG2SVIS2ONMB4CYTJGLZ2H2HVICI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJCSHG2SVIS2ONMB4CYTJGLZ2H2HVICI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 27 Oct 2023 09:54:25 -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y):
> 
>   sound/soc/codecs/aw88399.c:441:18: error: variable 'vsense_select' is uninitialized when used here [-Werror,-Wuninitialized]
>     441 |         vsense_select = vsense_select & (~AW88399_VDSEL_MASK);
>         |                         ^~~~~~~~~~~~~
>   sound/soc/codecs/aw88399.c:431:28: note: initialize the variable 'vsense_select' to silence this warning
>     431 |         unsigned int vsense_select, vsense_value;
>         |                                   ^
>         |                                    = 0
>   1 error generated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: aw88399: Fix -Wuninitialized in aw_dev_set_vcalb()
      commit: cba4590036855f4e3110d43c14385d2401080dbb

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

