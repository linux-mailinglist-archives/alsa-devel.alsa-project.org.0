Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 880904CAB13
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 18:03:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DB8E1E7C;
	Wed,  2 Mar 2022 18:02:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DB8E1E7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646240607;
	bh=5tZBPMx5BMT71ax6op9U51BLeLidIvFCtNHBOzWsyM4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VR7ia07/FSv1jVTuDw7ffnNXnVlCmOXkXO2qDixMBzKosC4C+PmyHb3QnBxizRxZB
	 paTUzFYT7TucVApimx9W03ZoZYQaqnz8G7japfo8ujMCxQBCNsSxtatzzdacEgKkhx
	 2dqOauNp2gSHO/+r5JTOQOqMcsD/L+hDup5W4Wkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E2E2F80526;
	Wed,  2 Mar 2022 18:01:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7E5CF8051A; Wed,  2 Mar 2022 18:01:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C549F80508
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 18:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C549F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G2zrAx1W"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7E6ACCE2252;
 Wed,  2 Mar 2022 17:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43A5DC340F2;
 Wed,  2 Mar 2022 17:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646240456;
 bh=5tZBPMx5BMT71ax6op9U51BLeLidIvFCtNHBOzWsyM4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=G2zrAx1WltNmVJHM/cDy0B/Hce9rxkBhDWGeljawipdKHrkjLj1FJOmjeEHTU0Lts
 5p/MdSbdY/OqH40/y8O/WlcW5YelC1DDvyWFrN+Xu2bsXdBiTwfXQr74e38skMmuGw
 AxZFCzt0RAPzR1KnLA/CGWh+owGwFlvSwdKDQGqk58LfJEUASJ4c2It9BDpl3P1Koj
 NmKTq6Sk84vFo+MApyiqn8yE7dDlsL9V5QmS0uayTkvd4iUPArd9LIYM1e2gn9ErW+
 +SG/eldt2o9DZ68sNOwVXtQ6N1arcSIdoSUoT4dzPvea15RGGMTKyfQVlds2MenTtX
 aemk39rg+IKDA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz,
 yangyingliang@huawei.com, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 robin.murphy@arm.com
In-Reply-To: <20220301084742.3751939-1-jiasheng@iscas.ac.cn>
References: <20220301084742.3751939-1-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] ASoC: dwc-i2s: Handle errors for clk_enable
Message-Id: <164624045500.1145067.2482712182081585715.b4-ty@kernel.org>
Date: Wed, 02 Mar 2022 17:00:55 +0000
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

On Tue, 1 Mar 2022 16:47:42 +0800, Jiasheng Jiang wrote:
> As the potential failure of the clk_enable(),
> it should be better to check it, as same as clk_prepare_enable().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dwc-i2s: Handle errors for clk_enable
      commit: 45ea97d74313bae681328b0c36fa348036777644

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
