Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6080337CD1C
	for <lists+alsa-devel@lfdr.de>; Wed, 12 May 2021 19:09:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED98D182B;
	Wed, 12 May 2021 19:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED98D182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620839350;
	bh=VzxBT94nToLkx0ahHMWShZ90PbCWTBEmjUklc4r41LI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qmAPKn7B8Idxwg6jrakkahsIgBv0/Y8uSp+r+HT55DUbt/zxcveotqkc1iLiGGksQ
	 6Vu1/gyh+g6nHUie5cbiJjVTt2HCBUW8E8Yc3J2SngAH4hlNukp/zkqLGSHu5p13ms
	 tmbyTOcv0NNjYJV20x+rvjz08OU/FUU6UnCHXTdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1B58F804B0;
	Wed, 12 May 2021 19:06:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22E5BF804BD; Wed, 12 May 2021 19:06:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EC59F804B0
 for <alsa-devel@alsa-project.org>; Wed, 12 May 2021 19:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EC59F804B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WycaM/cI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C8F6613A9;
 Wed, 12 May 2021 17:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620839155;
 bh=VzxBT94nToLkx0ahHMWShZ90PbCWTBEmjUklc4r41LI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WycaM/cIP85Uy61AfmmjNsmzgyhD94oL9G6r+1jJFOsa5EEazWYFhNjxbbBWBNYK3
 5h/C4TGPbUogJ6FYDs6UsYkag7JQd44DoUApGzkCUTdDTKg72mUke4ebgGlpCyETM2
 Nwhm51WtWt3+F4NsyC8TeVrucFYyXUwP0ZLdkQ6thM6NwrZqTOxpz3KuYMhaiF1F+1
 OuBO+px9lfC+N7H0uvb+sKbTtpsfkDCIaVTtuTD4ygovtSSpjS8ImXBEapxAbP/XSC
 FmPoZ//144UZ9YwWlxmylFHZIoEmd5Gspenfp/SKqKezC2Nx/ny0mGLM8k/lB7H2gM
 Y0l7xGOof5m2w==
From: Mark Brown <broonie@kernel.org>
To: Simon Trimmer <simont@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: wm_adsp: mark more data structures with the const
 qualifier
Date: Wed, 12 May 2021 18:04:47 +0100
Message-Id: <162083892846.44734.3319712782666419395.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210511171459.270169-1-simont@opensource.cirrus.com>
References: <20210511171459.270169-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Tue, 11 May 2021 18:14:59 +0100, Simon Trimmer wrote:
> The callback structures and memory region type table can be marked as
> const as they will not change during use.
> 
> Fix checkpatch warning against wm_adsp_find_region function by moving
> const keyword to form the 'static const struct' pattern.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm_adsp: mark more data structures with the const qualifier
      commit: 130dbe04d42817b62577a48346837122a00e794f

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
