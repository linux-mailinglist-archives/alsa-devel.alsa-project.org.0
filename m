Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 820118536EB
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Feb 2024 18:13:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0285AF52;
	Tue, 13 Feb 2024 18:13:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0285AF52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707844415;
	bh=4a+evY0mZO8wIOkZmZjF8xeTorrvG9xu5R33q/440cc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O/ypCG36VX9g2mgPuLIiurFfY+PuFIQPJsgc/bafyle7XwHMK5RI66733w6eYzY3y
	 KN00Im2qMQUqBcvC7V7QvXzj/jnBol1qOJ8fUNxT3PN3YAuPYlMyoSU1POd/GhYlQ9
	 t9bpKqV0wuNYuvvqHLP3qKG8Mq1PAnmoWSNQn++w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 488FBF8057D; Tue, 13 Feb 2024 18:12:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EDFEF804CC;
	Tue, 13 Feb 2024 18:12:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A5FD6F80238; Tue, 13 Feb 2024 18:12:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B24AF800BF
	for <alsa-devel@alsa-project.org>; Tue, 13 Feb 2024 18:12:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B24AF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O5gbgqNn
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D315B615DA;
	Tue, 13 Feb 2024 17:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86985C433C7;
	Tue, 13 Feb 2024 17:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707844357;
	bh=4a+evY0mZO8wIOkZmZjF8xeTorrvG9xu5R33q/440cc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=O5gbgqNnELJoOwNQZXjLj0clNFzyt8oKYwWxMOmLctax6JAVNisqhgXmz2FTX/G5T
	 C2e2OGYqhOrhPHZTACDV+/AdiwkDH98NvVTHqrIy+G6ZZyKBrvxHrrnhudlfCS1grv
	 v4Gsb1EUoS801fCJn3I5Vmjpke7CYey/j8AFFLmqilW/ioTEaqLxGd5NsNSL+8GGSd
	 NRAHgdt/xArWE9qiw+ezxKWwlv3tOCuZGuS9H+Z86vmwFDHB87CrTgUlrHm1DN0j1P
	 SFnFBbFPknXr6lqyU1TfmQNYNQVaZGEwMA8ABm/TMDj1CTsByX8m1yhKi+gJ18zMLn
	 M9pubAtLB5IGA==
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
In-Reply-To: <20240213101105.459402-1-arnd@kernel.org>
References: <20240213101105.459402-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: q6dsp: fix event handler prototype
Message-Id: <170784435426.387832.9390509804321653971.b4-ty@kernel.org>
Date: Tue, 13 Feb 2024 17:12:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
Message-ID-Hash: R7D2G2MZ2TATZIS6YVQPU3IZ75O6DZSS
X-Message-ID-Hash: R7D2G2MZ2TATZIS6YVQPU3IZ75O6DZSS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R7D2G2MZ2TATZIS6YVQPU3IZ75O6DZSS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 13 Feb 2024 11:10:46 +0100, Arnd Bergmann wrote:
> clang-16 points out a mismatch in function types that was hidden
> by a typecast:
> 
> sound/soc/qcom/qdsp6/q6apm-dai.c:355:38: error: cast from 'void (*)(uint32_t, uint32_t, uint32_t *, void *)' (aka 'void (*)(unsigned int, unsigned int, unsigned int *, void *)') to 'q6apm_cb' (aka 'void (*)(unsigned int, unsigned int, void *, void *)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>   355 |         prtd->graph = q6apm_graph_open(dev, (q6apm_cb)event_handler, prtd, graph_id);
> sound/soc/qcom/qdsp6/q6apm-dai.c:499:38: error: cast from 'void (*)(uint32_t, uint32_t, uint32_t *, void *)' (aka 'void (*)(unsigned int, unsigned int, unsigned int *, void *)') to 'q6apm_cb' (aka 'void (*)(unsigned int, unsigned int, void *, void *)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>   499 |         prtd->graph = q6apm_graph_open(dev, (q6apm_cb)event_handler_compr, prtd, graph_id);
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: q6dsp: fix event handler prototype
      commit: 5b5089e2a1e753ffe9ee2bf101a9e06784ec5e1a

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

