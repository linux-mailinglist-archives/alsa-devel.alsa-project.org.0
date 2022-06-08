Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A42542E5C
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 12:50:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 225BE17C8;
	Wed,  8 Jun 2022 12:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 225BE17C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654685448;
	bh=At7LkIZF60eaGhhyV3inMxdmYaV4gVpBo7vXLeKPUXs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lCFcStoDPcsLomK/k1KfjeAwF3r8fexhtIefT0zLt+20I9qYXXZurgMTFDcBm0Hs+
	 /uYsgSYv+NSYeOh5vg1PqzDkmnbIaj53Ot1SDpKIeuXkdo3Yf1LqVsnyZ/c1+3GVnG
	 IVW8OZTJ4uyRQ0fgZpICKtsEkkkaRcIw5f724Ezc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C95DF800C7;
	Wed,  8 Jun 2022 12:49:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3AD85F8026A; Wed,  8 Jun 2022 12:49:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5A5BF800C7
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 12:49:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5A5BF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rPy54xSx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 45ED9612F2;
 Wed,  8 Jun 2022 10:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F34C341C0;
 Wed,  8 Jun 2022 10:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654685351;
 bh=At7LkIZF60eaGhhyV3inMxdmYaV4gVpBo7vXLeKPUXs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rPy54xSxG0hA2QIlRkHB7nR/9qWc/j8LRJchIcIivP2ljbjfs+n6mlSJM9adkXyQU
 YjpD6rYa9y2+b0qpBnDrlaQWZU5s6DYbKQt73iBjCtkXDiBnsn+/OpEuq58bhx8nZn
 ad7eyr9Puz2K1TVtjVMJKawIl2pefIG3UAhZU37br71tg3kM1V5Emtmv2vwUVnm1O4
 1CBz/wWrkGzS+18YJMLwBI8UC0Vk0cyr879FcmJB7TU1x+NV5aE9HEv79HrCFESHI2
 5MnmkWolvLL6j3Bri4NtTeoZWVNbNAuoNObK/S/Og7ku7qrGJtZuQC79ovm7zfMTWb
 voSpVp6TbOrhQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, broonie@kernel.org
In-Reply-To: <20220604105246.4055214-1-broonie@kernel.org>
References: <20220604105246.4055214-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: ops: Fix off by one in range control validation
Message-Id: <165468535074.140553.12195834385357917046.b4-ty@kernel.org>
Date: Wed, 08 Jun 2022 11:49:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Sat, 4 Jun 2022 11:52:46 +0100, Mark Brown wrote:
> We currently report that range controls accept a range of 0..(max-min) but
> accept writes in the range 0..(max-min+1). Remove that extra +1.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ops: Fix off by one in range control validation
      commit: 5871321fb4558c55bf9567052b618ff0be6b975e

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
