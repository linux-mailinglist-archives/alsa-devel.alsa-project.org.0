Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA3143E173
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Oct 2021 15:00:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C054616A5;
	Thu, 28 Oct 2021 14:59:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C054616A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635426039;
	bh=GvK75DH60GBTMF2oKEW8i6qrOQxPMn6ekQ4+MJmZ6rQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U0Gu/WUCZe9d4w+u7d3D4UCdNiOfdvY/PN6/M/YBxoCy/BPB9cZax7VAWlTzlFXNJ
	 QLQL7dsx1W2hW1017vBjxRwDAmgkwzfpQ76TZbfflFgAUiHBTq5mINvnoWlc9OSX1Q
	 rjRBRSiI76do/GMuWKhyeLHJJref9Qe6U8lR/PuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ACBAF80300;
	Thu, 28 Oct 2021 14:59:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E269FF802E7; Thu, 28 Oct 2021 14:59:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09ED8F8010A
 for <alsa-devel@alsa-project.org>; Thu, 28 Oct 2021 14:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09ED8F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jryR/6km"
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB746610C8;
 Thu, 28 Oct 2021 12:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635425949;
 bh=GvK75DH60GBTMF2oKEW8i6qrOQxPMn6ekQ4+MJmZ6rQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jryR/6kmEOc/UVWIyCd9yFf/i7ocGgBx9sI3KtCpt7b1HQnic1yGImQ7QIU6g5dOa
 uSfLFjDzArFHaKAeMz+MdikYOVmFDLW4hoHO8u7AND9R4Xu6edn/2upW49z2RXgxCR
 FmYq13061g1dc2Hruvs1uyVd5jLI9GUJOU/qpJxRGU326P1yHO+bnXYKhld3uTBhxj
 c8LaZfkPD7WwhwQ3MvGMjqn13Cr+8YtJxdL8fKn49oUpfW8ivSc34AH6gpdM2q6o8f
 TrjpI25S26SLxPcb92Ll6wFm+uxVw12rPp9/ua5y6b1P+0VTSAzyg8d2WANbvz/iqD
 8jyYZyRrXPQ/A==
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20211027190823.4057382-1-nathan@kernel.org>
References: <20211027190823.4057382-1-nathan@kernel.org>
Subject: Re: [PATCH] ASoC: qdsp6: audioreach: Fix clang -Wimplicit-fallthrough
Message-Id: <163542594755.950250.9661229895167446444.b4-ty@kernel.org>
Date: Thu, 28 Oct 2021 13:59:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org
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

On Wed, 27 Oct 2021 12:08:23 -0700, Nathan Chancellor wrote:
> Clang warns:
> 
> sound/soc/qcom/qdsp6/topology.c:465:3: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
>                 default:
>                 ^
> sound/soc/qcom/qdsp6/topology.c:465:3: note: insert 'break;' to avoid fall-through
>                 default:
>                 ^
>                 break;
> 1 warning generated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qdsp6: audioreach: Fix clang -Wimplicit-fallthrough
      commit: c6c203bc4dfed6812cf77e7737074b9cff8dd78d

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
