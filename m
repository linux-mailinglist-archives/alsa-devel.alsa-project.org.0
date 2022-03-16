Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC304DB993
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 21:39:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF929186C;
	Wed, 16 Mar 2022 21:39:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF929186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647463193;
	bh=77CmR3PRSwOpZa9z7OgyvODafo7b24EZUQZHs/ST0ng=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YEfBXf3Qr6S4BcF6VTTPAOrT/nKkIrED5vwlzrYqWRBBI6AnjtGeMY3AhxasnzQYK
	 kH32OH4IXY32jWtW59MftnBDmZcXqoO82TZP5pSYUsMEJ6Cg0urY6GUKDjPu/BAyAj
	 l0Tf452CmrnZxIyuN0p99mrlCuMDkgKQCsqNrCkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 994CFF8054A;
	Wed, 16 Mar 2022 21:36:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6AA87F8053C; Wed, 16 Mar 2022 21:36:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72418F8053B
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 21:36:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72418F8053B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UTtcv3eY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 597EE6141B;
 Wed, 16 Mar 2022 20:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D87C340E9;
 Wed, 16 Mar 2022 20:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647462964;
 bh=77CmR3PRSwOpZa9z7OgyvODafo7b24EZUQZHs/ST0ng=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=UTtcv3eY8E4C0fvZnR+ahydqPhx746oNIIajfmRyjKxWB6o1ntmXUEEnW5lQascjJ
 M/zUbqvteX9kodh6f08YNHCKyEqdmMTXszuE+b0ktl3EqDYuMtJQG1IcT66+fngLso
 rCfiI6QqkOMQqD0GZlgEtSt7BJ39QK5oWLaHUnaMpFBlztAapmY9mU92wfpdXWy30l
 bD6gf2Cvr1ejg9Iu+yYq8zJEpokFiA8rBefU32SZU7YKmo/vsOjRPmI3v72R9WmsJC
 D6eReQ1PaYAOfejFDR6yaN1gQNainZrXMnJp2b7NcPs33k2BRgqYW1d125pD0C6ORN
 cxYM+6w3RTDjQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, Vijendar.Mukunda@amd.com,
 lgirdwood@gmail.com, Meng Tang <tangmeng@uniontech.com>
In-Reply-To: <20220316091303.9745-1-tangmeng@uniontech.com>
References: <20220316091303.9745-1-tangmeng@uniontech.com>
Subject: Re: [PATCH] ASoC: amd: Fix reference to PCM buffer address
Message-Id: <164746296229.1220201.5798586348184991333.b4-ty@kernel.org>
Date: Wed, 16 Mar 2022 20:36:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Wed, 16 Mar 2022 17:13:03 +0800, Meng Tang wrote:
> PCM buffers might be allocated dynamically when the buffer
> preallocation failed or a larger buffer is requested, and it's not
> guaranteed that substream->dma_buffer points to the actually used
> buffer.  The driver needs to refer to substream->runtime->dma_addr
> instead for the buffer address.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: Fix reference to PCM buffer address
      commit: 54e1bf9f6177a3ffbd920474f4481a25361163aa

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
