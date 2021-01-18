Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0D82FA59A
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Jan 2021 17:06:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC143186A;
	Mon, 18 Jan 2021 17:06:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC143186A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610986013;
	bh=NKrF/BuuFHZqAKAf2snGOmWzdSW1uEQY3u9jkJEsYVs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sZ+uIFJIDife7H5bXHIurbJlNd4AfZjCota7CkACAdJKNfE2ur6isYLLdFXmDwOfG
	 PpMfcCqBRz+mo4BhqeOpLOr3/2nTAD1rKsPy87JTrugTmQGIcQjoKJcBmXuZ86Ip6V
	 3dtFcGn/ftNKdQA/zoL5S07wImwKu9CRdmhkbCXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D857F804D6;
	Mon, 18 Jan 2021 17:03:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E88FAF804E3; Mon, 18 Jan 2021 17:03:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9653DF804D6
 for <alsa-devel@alsa-project.org>; Mon, 18 Jan 2021 17:03:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9653DF804D6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mn/rLgmI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6A08222C9C;
 Mon, 18 Jan 2021 16:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610985826;
 bh=NKrF/BuuFHZqAKAf2snGOmWzdSW1uEQY3u9jkJEsYVs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Mn/rLgmIIN+/LUttAg2HehHlQxLm1u4r2/ZN9ACDbFsvYD410t9vVJ5lH+SOgjU+6
 hEKneBn/C0+lflnJcCIn10+vA61qS0tqYKo1xT7ZcKcsvS6Ivd/oNfV5qKc2u3237I
 ynUrkpwBEm3wyU+LJVvCIiGSeYHH7D3aCTAc1GZ/N7mPVCzFbdM4hLs5jET0XSw36k
 kecXtQA5Kk7Xg9YnESWHu0vowjh+xzMgUOl6D+9QxABRXCWwPXL6E17XLou6k/RgvI
 Woj9zXM2p2QqEomH98ligrRAOS/90twSJX9MqaYMlYs6Ksq7UuX0ZYBZ+I4Zuyz5qp
 UbBfmiIQRNnMA==
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20210114115558.52699-1-kai.vehmanen@linux.intel.com>
References: <20210114115558.52699-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH v2] ASoC: SOF: Intel: initial support to AlderLake-P
Message-Id: <161098576158.26872.13121036654198792015.b4-ty@kernel.org>
Date: Mon, 18 Jan 2021 16:02:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: daniel.baluta@nxp.com,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
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

On Thu, 14 Jan 2021 13:55:58 +0200, Kai Vehmanen wrote:
> Add PCI id for the AlderLake-P.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: initial support to AlderLake-P
      commit: 39860fe070c97e62ae9e80addce40ce0b3c2b082

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
