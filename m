Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11358322BF9
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Feb 2021 15:12:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C541167F;
	Tue, 23 Feb 2021 15:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C541167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614089558;
	bh=puBLat2+/u0sGt/SiTHihQEGsxBIKu1IZGtjwfm6pz4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DDcCB5hgUbGMNm3BD33JTeO6mjFn0B3yVw0LHkLVymoTtLa8uzUgAPwO7tozhlqcE
	 4u3s9RH55dTzJtcVdlShQXme6lncUyrsZJpYlrEUH2dxWUDnvbjd05L6AZOtqzU8c9
	 +xaU9WYVjHJDkwtbM93zTE2EkxW+pMDXtBH6cTzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ACBBF80167;
	Tue, 23 Feb 2021 15:11:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47888F801F5; Tue, 23 Feb 2021 15:11:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB922F80129
 for <alsa-devel@alsa-project.org>; Tue, 23 Feb 2021 15:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB922F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gc5jXeXT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9BB9F64DE7;
 Tue, 23 Feb 2021 14:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614089500;
 bh=puBLat2+/u0sGt/SiTHihQEGsxBIKu1IZGtjwfm6pz4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gc5jXeXTLoCX1zluZazUaiC6bpOYbe9rdWqqbwTwoP0Lmkh9BqAia8Ty139ZeHXTF
 Q9VLW/HVqx3+x/jvoqyuD2ZdRWOk7DYRWMFwCDa0kwD3PYhPYTkUG944mo/W2wtx6B
 ABNpw+/P85cvOIq+22D8qyRaT7JQWV9LgvmeqfN7kbicgkgPupnt14VVWs3Yo0v6rx
 NdHhxtPvs2q6k7nEocgluOSAkxpptRl/cFJD4CK3Mg0pPsA/0PSPRdOpxY1avRGIl/
 8lt4RBkqeODJMdH6tuk+yb8/kFRkl2l8d7PwPCl/mkxy4S++vMmtM/PnN1LDRI5971
 uDqLXX0c3+oNQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Alexander Shiyan <shc_work@mail.ru>
In-Reply-To: <20210216114221.26635-1-shc_work@mail.ru>
References: <20210216114221.26635-1-shc_work@mail.ru>
Subject: Re: [PATCH] ASoC: fsl_ssi: Fix TDM slot setup for I2S mode
Message-Id: <161408943852.48131.12844364039905090162.b4-ty@kernel.org>
Date: Tue, 23 Feb 2021 14:10:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>
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

On Tue, 16 Feb 2021 14:42:21 +0300, Alexander Shiyan wrote:
> When using the driver in I2S TDM mode, the _fsl_ssi_set_dai_fmt()
> function rewrites the number of slots previously set by the
> fsl_ssi_set_dai_tdm_slot() function to 2 by default.
> To fix this, let's use the saved slot count value or, if TDM
> is not used and the slot count is not set, proceed as before.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_ssi: Fix TDM slot setup for I2S mode
      commit: 9fd914d917da05641b42cab7d40bdf8ab06dac3b

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
