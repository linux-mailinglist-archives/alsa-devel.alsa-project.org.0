Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7563AB6D7
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 17:03:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDC4A1799;
	Thu, 17 Jun 2021 17:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDC4A1799
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623942218;
	bh=NK0hn3vw5IKcdns+8rADQfTxpAK7UdjTsHCh/B4bILA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XMFUCf6T5xT/VSWj4atMLhSld3Li3wjLBuVyTvWbqaylGCtkfMKWOwv25aJwUSnaW
	 6ayRFWwd/tR0AvCq4Kqz5Ni9FRMtWi37W/bWzCyonm5WKV/6OYd+5AQzUSzd9uiVP6
	 YuSVtTO4ZEz2uzxfc9cEuEAzoJbOFNxOy+Jk8QWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13DD7F804BC;
	Thu, 17 Jun 2021 17:01:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94D51F8025E; Thu, 17 Jun 2021 17:01:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F927F80088
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 17:01:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F927F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hHuMLbzU"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C01AE60C3E;
 Thu, 17 Jun 2021 15:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623942104;
 bh=NK0hn3vw5IKcdns+8rADQfTxpAK7UdjTsHCh/B4bILA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hHuMLbzUhQZbegtkzsLAxghPUBYwDlNPx/Mgbujp25Pc9qfz6uf4XHbFgCBbBaEsY
 IAQGUcoR3E8nzCvgJRUeCegbuIrjgctFpf/baqOQM/nwG/n9M96LAFDwWt2RERH2Ve
 oeI1RUL/3MEZA7otr+8zMIY1kVTaVtIerXdnG2jbQbTImvPPiHDaYpyjcNHc0z2cri
 YqbzqE4Z36kbPArEE6sVpKQPmqPHPoODh44aWp8oL8d+W1etwZVyuiJW/avmFX60X+
 D9xS3b5euA7e0IlSsVSnShxYSKYi4dGbnR7j4Cy1dxOEsMK8S9m2ywMZkm8FlqfWyS
 p612Q6qWPQfTg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH -next] ASoC: sprd: Use
 devm_platform_get_and_ioremap_resource()
Date: Thu, 17 Jun 2021 16:01:14 +0100
Message-Id: <162394075659.19104.18167768597198191135.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617033237.605808-1-yangyingliang@huawei.com>
References: <20210617033237.605808-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
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

On Thu, 17 Jun 2021 11:32:37 +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sprd: Use devm_platform_get_and_ioremap_resource()
      commit: 19b71456f3684f8dba078619a31afab05ee47c3a

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
