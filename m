Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABCE3E484C
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 17:04:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0789165D;
	Mon,  9 Aug 2021 17:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0789165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628521491;
	bh=URrzTKRqKr1FjkmSe/5lJq47ELEjLlRBnPCZMoJirNE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sIb+rPK4dbEo8U8m+iAttJ8yyW5KTwlRQyR+8R8AAckIYIl2n58yUBxlP9ospPJci
	 qeggG0tI7Ifp11KaW2fbP8SLPeTVdEvJ6XiPLgzFh5bgAg+tUJU4LEA9tmlUbbJAcp
	 48k/Jo/xZJ0u/2Ny37JsN1Qjz7esAgJOWXfFB5go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07250F80105;
	Mon,  9 Aug 2021 17:03:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C099F802D2; Mon,  9 Aug 2021 17:03:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AD8BF800FD
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 17:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AD8BF800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jZx/8Ckb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CFBD60F8F;
 Mon,  9 Aug 2021 15:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628521396;
 bh=URrzTKRqKr1FjkmSe/5lJq47ELEjLlRBnPCZMoJirNE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jZx/8CkbtjmOy/zSc0UbzIiblWkdBc4qNJGlC8WbWDORtsxuOIB6vrr79e1g2vF+V
 UO0eCF8NbtuD+iARFv7x2oRK8rbSZQ6mQIfjc8OkfdN7HimY8W4pS6a1ZMwfZzone4
 OHcfQPyYd7QQ3Gq24tUC7DjVJbXy8FTQDr5MH7VGBMMFr1xm3Xs/ME0Lly4ORc28AR
 r/BStO0gtBE2rlX5CL07RRQ4rvcdp2swyo/tIimYqaQsgCNhenixBrjC5HQAkFaigH
 hMQ0B2LmFsCiWHHFsPdCANgf3GPP4V4lX9LDRUTBZich6lZBMKNVc6VrYwE3xlLKAq
 DCQkQ9cWUamvA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 0/2] ASoC: qdsp6: cppcheck warnings
Date: Mon,  9 Aug 2021 16:02:55 +0100
Message-Id: <162852092935.45967.5254005779519097775.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210809123137.14456-1-srinivas.kandagatla@linaro.org>
References: <20210809123137.14456-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, bgoswami@codeaurora.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 9 Aug 2021 13:31:35 +0100, Srinivas Kandagatla wrote:
> cppcheck throws below two warnings in qdsp6 code due to unnecessary initialization
> of variables
> 
> q6asm.c:1631: (style) Variable 'port' is reassigned a value before the
>     old one has been used.
> 
> q6adm.c:475]: (style) Variable 'matrix_map' is reassigned a value before the
>     old one has been used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qdsp6: q6asm: fix cppcheck warnings for unnecessary initialization
      commit: e05f9ee5eabf4b88f9b9b264c8594ee6984b2131
[2/2] ASoC: qdsp6: q6adm: fix cppcheck warnings for unnecessary initialization
      commit: 455ecc808e99f154bd80541219f207f752a61c16

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
