Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C591BA454
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 15:12:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B33BB168C;
	Mon, 27 Apr 2020 15:12:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B33BB168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587993177;
	bh=bV1PKM7KpCxCRZJEtuGqiJ04oyD1/g2gNseB/UP8fgI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s3zAd/WanwzZHpusd1VGi9HzqS6VPLEnVT2hBXtuU+Uy6e8rEPmsAMCsGIBRPf/7I
	 GPNrO9qUTsCrqLX4vsTW16xtlurtYOgpU1otqdxExwW2FapUupXbxNhnq/MY2KKzHd
	 RbvLoH6Am3PPbW+WBvs+5dlQqUpIKO3STSKJx6KQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38E55F8028C;
	Mon, 27 Apr 2020 15:10:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E83E1F80232; Mon, 27 Apr 2020 15:09:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D53F3F8010A
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 15:09:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D53F3F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CjJmlxt9"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD0B52064C;
 Mon, 27 Apr 2020 13:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587992942;
 bh=bV1PKM7KpCxCRZJEtuGqiJ04oyD1/g2gNseB/UP8fgI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=CjJmlxt9kCyLciLtehj1y6LsYtD7lEt182QGWIwd/60V5xjHrGMZAsfukZmihBSFA
 auMg1SAA7kev7CyJJclpfr2WF1wWU9qfEgz6PQKoCKZ2tPlRXp+Szv/TJaHiEtAHHc
 JCVJD2kv55UWmkiuNJLLDGIFI7XiuOy5tXQQgIH0=
Date: Mon, 27 Apr 2020 14:08:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>, s.hauer@pengutronix.de,
 shawnguo@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com
In-Reply-To: <20200420142509.9728-1-tangbin@cmss.chinamobile.com>
References: <20200420142509.9728-1-tangbin@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: mxs-saif: Avoid unnecessary check
Message-Id: <158799293954.30174.3525396439519252505.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org,
 Shengju Zhang <zhangshengju@cmss.chinamobile.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, 20 Apr 2020 22:25:09 +0800, Tang Bin wrote:
> The function mxs_saif_probe() is only called with an
> openfirmware platform device. Therefore there is no
> need to check that it has an openfirmware node.
> 
> Signed-off-by: Shengju Zhang <zhangshengju@cmss.chinamobile.com>
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: mxs-saif: Avoid unnecessary check
      commit: e66f385354b3bd29b713d8ab8556aa889723928f

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
