Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D270D40C846
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 17:25:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 686551845;
	Wed, 15 Sep 2021 17:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 686551845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631719551;
	bh=wfCrkPF9uiip+dMt9hQgVwVQGgywxVqYrYAQt4PemHc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vDdooFFQV8xHKZe2G0xGAKs42/uXBG64YzxdhlYeaiVec66ZJqC0VaeOUr0e1NaFU
	 BQW5pTeFCKw3iqxNfexBHndEz1Cox6CuAes4lTmABs4NujKSph7zFaH3a9g1KT0e6Z
	 HdA1q3Ltum4zuph34fXr66LWuworJhcUOZt1u15M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 899D7F80508;
	Wed, 15 Sep 2021 17:22:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2458F80508; Wed, 15 Sep 2021 17:22:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 415C7F804E7
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 17:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 415C7F804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uS+lULv9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3738611C6;
 Wed, 15 Sep 2021 15:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631719367;
 bh=wfCrkPF9uiip+dMt9hQgVwVQGgywxVqYrYAQt4PemHc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uS+lULv9jwBDnz23rHC++bq3uxzQPTAOTeaM7Hvgi2cgl/5P9k5vGozDCXPjHhLvF
 oIz+FfbTEOYlfUYzuXXYMDgcsAjpfUilNTPlG+MSHOoZZ+b1rtIbWFKOsVG1NNUd8Y
 gEOtXaFuEIIZf5MkKeo5BFSAHDFcrgIg5joODAAQrPlLrkFplB/4YysjMa2ZRHnhdM
 Fy1hIRyMsYXW0WH3sI9tLTVismpNYEDDU6+V45+XLoy3ebV9KsZwmjdcZS6kFzGgAF
 LXG3QnezUEE6r9R6YvVr20JIZNWznKObj2yiW7xQ9fYWz5Nz0a0AWTzdi2xNDSfe6e
 JiRsmbq6kp6NQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 alsa-devel@alsa-project.org, Colin King <colin.king@canonical.com>,
 linux-mediatek@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: mt8195: make array adda_dai_list static
 const
Date: Wed, 15 Sep 2021 16:21:47 +0100
Message-Id: <163171901943.9674.10990878164291138218.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210915105027.10805-1-colin.king@canonical.com>
References: <20210915105027.10805-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Wed, 15 Sep 2021 11:50:27 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the array adda_dai_list on the stack but instead it
> static const. Also makes the object code smaller by 33 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   28271	  11640	      0	  39911	   9be7	mt8195/mt8195-dai-adda.o
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: make array adda_dai_list static const
      commit: ce3f9357638720f4a78f6a6e481941c37f33bceb

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
