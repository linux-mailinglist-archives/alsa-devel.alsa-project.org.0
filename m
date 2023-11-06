Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 749717E22D1
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Nov 2023 14:05:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD7C4BC0;
	Mon,  6 Nov 2023 14:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD7C4BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699275948;
	bh=UPMZ+xQmEGa91GQ0MSguOeCpnzIle8Ii2hBLfbabYwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NN2T84gkzSjewOAWi1hL88EEs3phVKoKiLUItCqx61iXhDmwWqV2dOwg6uSb4uPv7
	 AJVLwvpbgGFtpDzq5Wez/EMvEx0/wZTb+Tziwf6bHXi4iZK5be3CXkDaIx2IU30a7U
	 KV2jCG3oYp259Evh4wkFf/r+hO0rOW690NskSPQM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DA32F8059F; Mon,  6 Nov 2023 14:03:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FF20F80588;
	Mon,  6 Nov 2023 14:03:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F882F801F5; Mon,  6 Nov 2023 14:03:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F0D0F80100
	for <alsa-devel@alsa-project.org>; Mon,  6 Nov 2023 14:03:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F0D0F80100
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XPW14/pn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EDE46CE0B1A;
	Mon,  6 Nov 2023 13:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61037C433C7;
	Mon,  6 Nov 2023 13:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699275806;
	bh=UPMZ+xQmEGa91GQ0MSguOeCpnzIle8Ii2hBLfbabYwc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XPW14/pnY75zDigYeJwowboTAOW+s2t1lyx+BTS+i2jLbZ7xyG1aaUnL5QSrvM88J
	 fVLxQu51xDIuuwbLJzr8TQdhp3k+1Dg7cptmmU5Jo0xRI/q6pdR5D/TWV9oRjPVyd+
	 fAZhl6Doj6kjaW5c+aOlivbKIGm12F9oA80zaME10X6WxDsWph2F6VsoLtxUL7UcRx
	 xr1Hc6AILeia6/CJFri8ua/kJmcMxBwStZH2ERHiNkunfHM2jWuOIl1FUnSFKj7xkg
	 CKjUp+2hyJhfu3iVqra3LWz60/irIOf0MpgGCmo+Iu5ugROoFQW1Q3lIlI0Ahg3dPJ
	 t1nnL3/UQzziQ==
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
Message-Id: <169927580382.3037292.16293961497695340316.b4-ty@kernel.org>
Date: Mon, 06 Nov 2023 13:03:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: VVJKXJSW3G3A46HOTL6BHGMQET4WEEW5
X-Message-ID-Hash: VVJKXJSW3G3A46HOTL6BHGMQET4WEEW5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VVJKXJSW3G3A46HOTL6BHGMQET4WEEW5/>
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

