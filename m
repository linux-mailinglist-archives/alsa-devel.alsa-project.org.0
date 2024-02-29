Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 055E786D410
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 21:20:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9886E828;
	Thu, 29 Feb 2024 21:20:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9886E828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709238012;
	bh=9zBP5txl3AY66w3vZ+AxPi39rTR3wOuo8SROxVv8IwU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W1thefpvcfiVejOzhDN22ZPvUidKINUZqOgsLuHd5FUdoH5dOHDN1IPtu+0oYhVOA
	 db9uAsV7sUnajTbyjIbFI3/sXXoFU6GWSkb66+s8QySuG/AIdD3NsKCaxXKA+q2hBE
	 ltZp8sPmdcIWJREvcxYRwaEyMj4+hX3dbyOWb3PQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC9D0F80588; Thu, 29 Feb 2024 21:19:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47FD0F805A0;
	Thu, 29 Feb 2024 21:19:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFD99F801C0; Thu, 29 Feb 2024 21:19:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A4C9F80088
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 21:19:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A4C9F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NqP4zofa
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1485D612F1;
	Thu, 29 Feb 2024 20:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D571C433F1;
	Thu, 29 Feb 2024 20:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709237966;
	bh=9zBP5txl3AY66w3vZ+AxPi39rTR3wOuo8SROxVv8IwU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NqP4zofaSs01VHe5+6/c50OhBWqXmqE+RMnB4VzuvHS5EpOJkmbZg7jlc3oyIXaef
	 jk7vK91t2UeB3TXEUi2QwZyanxTLOt0y2CHHMYrtUfEhveWaMZ5pYta9BBwDEjRO5w
	 tnS9PD4Dt1svD7aWmT8+fxG8aeNhqU/o75VNZyR/fF7Ay9U6j6GXOzOiDQt7N0fG9K
	 vcteoSZEejwuqA/cLXrrGMjPqqrsQLuBfhedN6h+o1T/yzhcSt2g2buttNkQlVB3L3
	 XnyWSbdsNUpjXquxTGCuKHLQBQrY7vJ98AFug5+7SjCirKF/vYNAwMpw2DbvAcsSs/
	 GKbgRg+Js7NnQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Stuart Henderson <stuarth@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org
In-Reply-To: <20240229114637.352098-1-stuarth@opensource.cirrus.com>
References: <20240229114637.352098-1-stuarth@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: madera: Fix typo in madera_set_fll_clks shift
 value
Message-Id: <170923796512.228603.8077233543350826441.b4-ty@kernel.org>
Date: Thu, 29 Feb 2024 20:19:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: LSXRMAUTLGCUZPYT4VTMUSAAB32ZNXB3
X-Message-ID-Hash: LSXRMAUTLGCUZPYT4VTMUSAAB32ZNXB3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSXRMAUTLGCUZPYT4VTMUSAAB32ZNXB3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 29 Feb 2024 11:46:37 +0000, Stuart Henderson wrote:
> Fix a typo in the shift value used in madera_set_fll_clks.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: madera: Fix typo in madera_set_fll_clks shift value
      commit: 231bf30c107aaf935cdd02b308757d0823ff1414

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

