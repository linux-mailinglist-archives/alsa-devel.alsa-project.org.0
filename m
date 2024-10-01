Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F0998BABC
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 13:14:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B23E868;
	Tue,  1 Oct 2024 13:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B23E868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727781269;
	bh=uzylzzEuT8st5r1GDFGho8NGlqZCts0HU6U/XLuQMR8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=l052nhrNpX9NAnNxUSe8XAKJRGQuvidOhBjCrQeoVJFf03UoBfiRI6kCHiz3UoGwS
	 vyZGZ8QAZ+Cf7fTt3/w/vABkA52KCajMco8gdrVNNJw+zSlUp6t/9Ddszaa+gZM/k5
	 D8XGUqjPJJBx2BbSzIRie/i/OQx2rOwibfv+u9PE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47DB3F805AC; Tue,  1 Oct 2024 13:13:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F17CAF80580;
	Tue,  1 Oct 2024 13:13:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24B47F80517; Tue,  1 Oct 2024 13:13:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8F15F80107
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 13:13:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8F15F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jiCbGyoL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 860AF5C4769;
	Tue,  1 Oct 2024 11:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522D7C4CED2;
	Tue,  1 Oct 2024 11:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727781222;
	bh=uzylzzEuT8st5r1GDFGho8NGlqZCts0HU6U/XLuQMR8=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=jiCbGyoLA/AwlO5tcvz+hWeVL91xgjw+Jv5wABi6oRclBCAnwfxAm3gxrshOY2SJC
	 zK67yNlOoa3lu8gxuxL3d1QODvZjRAMTtz47vNNfXjY5T6ci9gRoDqoTcxK7WSeWDM
	 q831zSyCnXrw983Juyz9MLqlIO4xpNR9dGAeaOdnmaOE1VFSEjY/UHUkosDLqnFuC2
	 T+CSEuNZaIhzv3R6btsjP/rKge9TdCj2WH32Y9z98PKBZymkYeTKDfYQec0vQByJHF
	 HbxLYcz+bsciC2fUZjdjACem+C+23D3t/N/TigYeEl93gc33/fKvj/5VNXddMY6kI7
	 uNleuFTBa+fGg==
From: Mark Brown <broonie@kernel.org>
To: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1727676508-22830-1-git-send-email-shengjiu.wang@nxp.com>
References: <1727676508-22830-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable 'FIFO continue on error' FCONT
 bit
Message-Id: <172778121960.2280749.6663720660194136965.b4-ty@kernel.org>
Date: Tue, 01 Oct 2024 12:13:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: 6W72WODP6UIHWCLE6MX2IG2HTEJOU4RW
X-Message-ID-Hash: 6W72WODP6UIHWCLE6MX2IG2HTEJOU4RW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6W72WODP6UIHWCLE6MX2IG2HTEJOU4RW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 30 Sep 2024 14:08:28 +0800, Shengjiu Wang wrote:
> FCONT=1 means On FIFO error, the SAI will continue from the
> same word that caused the FIFO error to set after the FIFO
> warning flag has been cleared.
> 
> Set FCONT bit in control register to avoid the channel swap
> issue after SAI xrun.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_sai: Enable 'FIFO continue on error' FCONT bit
      commit: 72455e33173c1a00c0ce93d2b0198eb45d5f4195

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

