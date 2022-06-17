Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 454EE54FB18
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 18:31:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA0281EEE;
	Fri, 17 Jun 2022 18:30:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA0281EEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655483460;
	bh=6VId+EutToOC4ZceXtnrBXbOCSzBxkRrFdaIXIrtMAE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZunoxwM0Qe2TAKIYCfo2erMLmNFgnZzEQ3WOWGiEAPKIOJSJH/C9RLFC8tlc3DZHk
	 JeFIHv23Q0/z7XeNgDtdbA7d0JsCVW3LRUocrDi6WaOMv5CO7T8GZBd5bKQYv7PKxt
	 D2TKYBNdMjueT20RWgpGRUBAeZgBPDBPnHdwYYP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7267DF8052D;
	Fri, 17 Jun 2022 18:30:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2D4BF800B0; Fri, 17 Jun 2022 18:29:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27233F800B0
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 18:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27233F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cTBqv6dO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9B6B3B82B1B;
 Fri, 17 Jun 2022 16:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9732C3411E;
 Fri, 17 Jun 2022 16:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655483392;
 bh=6VId+EutToOC4ZceXtnrBXbOCSzBxkRrFdaIXIrtMAE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cTBqv6dOd/8KSH+sJDqARx90Ad1ybMMAhlxwLe+Qp9TACPUXnlHOKcJLysABJMT2j
 hiRURYeoB2CQT1aaTtBIInzhoCjoSTdCcNtll3O6IRIZ5a560hpwmJx0cd+aG48AVv
 Bv3uZKeAV5i0CNXX4zdsLFVdnVJZ0snnCh4dV8oYyeCL7VSW7V06kfY2Ucmrksv79x
 8DjqPx4ol/GWOKzgn/us3lzubwOUuAV8prn53Q6sAyoi8KdOp2EhSIGaTry9vp/rPc
 iXu0gTeHI6skDP1NRgZTC0h3iowSTvANLOACXo3afYTsdCesqy5pjIOvN/l2cJLgM3
 /skN2LUuh9uSg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220616220802.136282-1-pierre-louis.bossart@linux.intel.com>
References: <20220616220802.136282-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: minor kernel-doc corrections
Message-Id: <165548339142.901499.2738384775711530242.b4-ty@kernel.org>
Date: Fri, 17 Jun 2022 17:29:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Thu, 16 Jun 2022 17:08:00 -0500, Pierre-Louis Bossart wrote:
> Remove warnings with make W=1
> 
> Pierre-Louis Bossart (2):
>   ASoC: cs4270: update kernel-doc
>   ASoC: sunxi: sun4i-i2s: update kernel-doc
> 
> sound/soc/codecs/cs4270.c   | 1 -
>  sound/soc/sunxi/sun4i-i2s.c | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs4270: update kernel-doc
      commit: e1ab67be68e900a6585277ca442ca7f67dffb3bd
[2/2] ASoC: sunxi: sun4i-i2s: update kernel-doc
      commit: 7c619b306285588725573d975fd44607d13438cf

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
