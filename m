Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F174214BC
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 19:04:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3606C1692;
	Mon,  4 Oct 2021 19:03:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3606C1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633367051;
	bh=xVUEytVF7BvBMDCxicfBtcFoqUV/5ACnkfGUhbNZDAE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZtvaXY8E4IA6cnregOrXXuP9s/DTWsYQpktizVJC8dIMXO+up6TDUXOCK9kVvwJ23
	 OcrVmi7i9a9Yjf8SS2hKAisR5312Us8WN378CpAZjGAQfdu8I3xpEeTzPmCIZPQrEL
	 g5I3GJZH9TC4v7ODVgS/5zwhE0VxBGE3nVB+Ed/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B745F804E2;
	Mon,  4 Oct 2021 19:02:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DFE7F804E2; Mon,  4 Oct 2021 19:02:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BFD6F804E2
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 19:02:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BFD6F804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uCtY+8iO"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AC7C613AC;
 Mon,  4 Oct 2021 17:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633366965;
 bh=xVUEytVF7BvBMDCxicfBtcFoqUV/5ACnkfGUhbNZDAE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uCtY+8iOzbjH4OUA8eThzqQ0tncmCsESmjn+cMPV0GNkPLy9qjmbUYOvBgkLDZhBy
 XQdKrLq9dvIvdcfYDg/VRCU0ZdlAYASozCxC2qnafvTBcyvQ3RdXkdHol/BijyFq2D
 mUTksXoBCjZeunoRWtCKOf5a1wAmly6Sh9onZVt3ijVN85Pa+QM3Y2neCUfCr4oWpk
 sxeasra0vw0S6Q/QmfP8OZ26rxEGNgKNhbFRz9wpChwelb47hzQpdedOU7szykFrGt
 2xBiNVD9LxWrNfKb0FKqaxszpDqe0gpg3qZ0jaFCudRZpFL9D3zztiUye9pMYpxhgd
 ttzPUAQeiXmsA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/4] ASoC: nau8824: Fix NAU8824_JACK_LOGIC define
Date: Mon,  4 Oct 2021 18:02:32 +0100
Message-Id: <163336659969.3340210.10941611499751143840.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211002211459.110124-1-hdegoede@redhat.com>
References: <20211002211459.110124-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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

On Sat, 2 Oct 2021 23:14:56 +0200, Hans de Goede wrote:
> The NAU8824_JACK_LOGIC define was wrong, for active high jack-detect
> to work bit 1 needs to be set, rather then bit 0.
> 
> The correct bit was found in the Android kernel source dump for
> a Cyberbook T116 tablet; and this was also tested on that same tablet.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: nau8824: Fix NAU8824_JACK_LOGIC define
      commit: d316597c538abd110ff32761fc79f7adff8d619a
[2/4] ASoC: nau8824: Add DMI quirk mechanism for active-high jack-detect
      commit: 92d3360108f1839ca40451bad20ff67dd24a1964
[3/4] ASoC: nau8824: Add a nau8824_components() helper
      commit: efee0fca19cbc9a0946a2d7dab2d5546aee2098f
[4/4] ASoC: Intel: cht_bsw_nau8824: Set card.components string
      commit: 7924f1bc94041a3d512f2922065b196ca8e1210e

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
