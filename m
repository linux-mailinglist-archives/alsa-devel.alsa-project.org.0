Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0948091E846
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 21:08:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42B3DF52;
	Mon,  1 Jul 2024 21:07:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42B3DF52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719860882;
	bh=MOxxmRlmg/SZh0P5F1EfQwqNwAEyA+LTm2j/JaqyIPA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b2Xd9f9r+rV1suTYQTtbhBGbNfLGK/P1arqONXFmRrRzIZQNdXcCXZOBJxVt1Dhes
	 S2wAs2CkqNhKye2ACRs+dZBNelyEEGvj+u5G/xINo63OBDG7hV+dR83O04wDO3vO/d
	 zVU7zerLq9DeZboyOLTO6bA9DTZ+qcXIjfn6aWUU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 463F9F805AC; Mon,  1 Jul 2024 21:07:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66E7CF805AF;
	Mon,  1 Jul 2024 21:07:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 69EA8F8028B; Mon,  1 Jul 2024 21:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D080EF8013D
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 21:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D080EF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rChvuHha
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4898261508;
	Mon,  1 Jul 2024 19:07:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDC4C116B1;
	Mon,  1 Jul 2024 19:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719860837;
	bh=MOxxmRlmg/SZh0P5F1EfQwqNwAEyA+LTm2j/JaqyIPA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rChvuHhaHG3NIc3ImXLO/wxd7Tmuj2m0n2q/Jqx8hJxthew4FGw4jDS8hLlESPcSS
	 +1G5A5hWFyqpSmWEWRWleCItygEbW8UgkNELU6EE+OhPFwb5kumXnJqWwJ2OYIlIOS
	 Kh8wLkBklQCNh+drgAUqCAKIKJkxd2OQb7c5hsVJHxC4RybggVFRlZlUEnY0HiWvl0
	 bCbOB7OmA6PnMU9LAuOCFUutGVKKgzMQO3CV6v2t9OPMV9MYWCw5hkqs1vr9HpvUKM
	 /O+vmbUh53T8KIuvZ/pgKltLWc3l+NBD4mS1owDGl7VOgFkSNfokJmRaSlUNX7IIT8
	 aVp0s4pTNqAlQ==
From: Mark Brown <broonie@kernel.org>
To: "J.M.B. Downing" <jonathan.downing@nautel.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev
In-Reply-To: 
 <20240701-lpc32xx-asoc-fix-uninitialized-ret-v1-1-985d86189739@kernel.org>
References: 
 <20240701-lpc32xx-asoc-fix-uninitialized-ret-v1-1-985d86189739@kernel.org>
Subject: Re: [PATCH] ASoC: fsl: lpc3xxx-i2s: Avoid using ret uninitialized
 in lpc32xx_i2s_probe()
Message-Id: <171986083478.121161.16800838408013522320.b4-ty@kernel.org>
Date: Mon, 01 Jul 2024 20:07:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: DCVCQEXIAIUKCFNALUN36WDHO4GXIVIQ
X-Message-ID-Hash: DCVCQEXIAIUKCFNALUN36WDHO4GXIVIQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DCVCQEXIAIUKCFNALUN36WDHO4GXIVIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Jul 2024 09:24:16 -0700, Nathan Chancellor wrote:
> clang points out that ret may be used uninitialized in
> lpc32xx_i2s_probe() in an error pointer path (which becomes fatal with
> CONFIG_WERROR):
> 
>   sound/soc/fsl/lpc3xxx-i2s.c:326:47: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>     326 |                                      "failed to init register map: %d\n", ret);
>         |                                                                           ^~~
>   sound/soc/fsl/lpc3xxx-i2s.c:310:9: note: initialize the variable 'ret' to silence this warning
>     310 |         int ret;
>         |                ^
>         |                 = 0
>   1 error generated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl: lpc3xxx-i2s: Avoid using ret uninitialized in lpc32xx_i2s_probe()
      commit: f4662e6d51ffc0826f975429d3c1b6d1f1a295f1

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

