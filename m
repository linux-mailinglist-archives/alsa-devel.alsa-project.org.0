Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC8273C4B5
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Jun 2023 01:12:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FBDB843;
	Sat, 24 Jun 2023 01:11:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FBDB843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687561931;
	bh=Mhd166EPkeVELtxz3wOL++HbLzHAs9D0tqBr4aCUI4A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jXbIjQnv/Mw93pCc6LlHdXX8k1g84tNLuGwHWlSNXj0lUK7d703bwk5jy+lXs3bk6
	 NYxyinXGiYHykPBWfb3sStOsAVMJ2SRWLSfF8DT8n7xxGdvquiGJml4M+IwXjBnHeA
	 0vrPKQyZawkLET8CO82lJ5MhL60IYBeG2Q/iZ7yQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E200F80557; Sat, 24 Jun 2023 01:10:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6E24F80548;
	Sat, 24 Jun 2023 01:10:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBF54F80141; Sat, 24 Jun 2023 01:10:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D3748F80132
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 01:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3748F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fFm65H5c
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B8E161077;
	Fri, 23 Jun 2023 23:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D69C433C8;
	Fri, 23 Jun 2023 23:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687561816;
	bh=Mhd166EPkeVELtxz3wOL++HbLzHAs9D0tqBr4aCUI4A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fFm65H5c1qSSW+fLp1P/xOXOUCNI3jK6nxEndmhpdXCd5joIDM60s1jJe0XAp/qYf
	 UkCSa0T5yMzsA03yiZbPkm1mN4CJNGdkNvFF/3zPSfMYbIi2Rc5VEbD6BPF0J4yVng
	 3FNBsE97EC8c6MkwipV7sB+GFPDRTujEmWC4ijgBiY3zPB/8vbmqTt6HYY15/wh866
	 qDIS6YBEM8Gy/nVbkeMrefji2FTHxG2WTGscoTSGlKMdxNomGgxCq/iE6ca1+k4XXF
	 wL2c4hH0VcbG7/Du1eR3ODOWa1shiStJH/DD/F2EwxIPN1djkWVD2ijSQ3JUqxotpH
	 PuPy8MMgxh8Ow==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230623-asoc-fix-meson-probe-v1-1-82b2c2ec5ca4@kernel.org>
References: <20230623-asoc-fix-meson-probe-v1-1-82b2c2ec5ca4@kernel.org>
Subject: Re: [PATCH] ASoC: core: Always store of_node when getting DAI link
 component
Message-Id: <168756181441.1144026.11961364462852265443.b4-ty@kernel.org>
Date: Sat, 24 Jun 2023 00:10:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: 54VGQGDEYVUX4GK3P5GFU35BVNDPVI3L
X-Message-ID-Hash: 54VGQGDEYVUX4GK3P5GFU35BVNDPVI3L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/54VGQGDEYVUX4GK3P5GFU35BVNDPVI3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Jun 2023 22:04:39 +0100, Mark Brown wrote:
> The generic snd_soc_dai_get_dlc() contains a default translation function
> for DAI names which has factored out common code in a number of card
> drivers, resolving the dai_name and of_node either using a driver provided
> translation function or with a generic implementation. Unfortunately the
> of_node can't be set by the translation function since it currently doesn't
> have an interface to do that but snd_soc_dai_get_dlc() only initialises the
> of_node in the case where there is no translation function.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: core: Always store of_node when getting DAI link component
      commit: 2d0cad0473bd1ffbc5842be0b9f2546265acb011

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

