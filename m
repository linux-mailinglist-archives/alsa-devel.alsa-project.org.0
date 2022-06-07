Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D35653FC61
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:53:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FDEA1A9F;
	Tue,  7 Jun 2022 12:52:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FDEA1A9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599193;
	bh=aG9ovN6guKRQSvZdWZO5Xr00Umv+n1SAAe5wFZIzgsQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RLQducVabXI7aBPe0LyK1LqNKRrMhy89HSct0tOTvm2YDvjtVyxZ9BEIE9B8aK6ye
	 NGzgQt0+lw0Fiuj6Ss/MCMy2CBBEecUzKDxo26Pl16o7TFK8hUj8n7sIJnguTjz6ww
	 8pxVNc7hvOChTWUknhW7Y4XGfRI0IsxwLNlrpbyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92A95F805F0;
	Tue,  7 Jun 2022 12:46:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C85A2F805ED; Tue,  7 Jun 2022 12:46:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 675A3F80159
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:46:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 675A3F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gWeuZElk"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0DB30B81F02;
 Tue,  7 Jun 2022 10:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB98C3411E;
 Tue,  7 Jun 2022 10:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598773;
 bh=aG9ovN6guKRQSvZdWZO5Xr00Umv+n1SAAe5wFZIzgsQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gWeuZElkb0dkbDC+RT5NbKzPN52MZIV1arnMMYpXZ8wGrRg3N3T6vEQ3mIJeC+DNY
 F7yhLeoUEcvz/5EO4xKF/2dn+CBtbzxLsqC9GnT4aXw4RjPMA3WTgtdAWzcLOdgaL3
 H71Yj56XsZllAODCFzxuAY1T6s15fe0m2OVwhPolS/lZCnE8Yptv+JOplb0sKKkvWz
 LJxPj4WSaWLPMkqy8UtTwqLySqll9+NjvUvs1oXCe7ODW2aJijeDG9rrBOxA7VJWBs
 gKMOswu/apRM1uxpAGXyT6BCbvR0cRxYlf1Z0SztU/NeiUz7icaiNjXma8eyPY/oiI
 7Od4yj4g3f3fg==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 m.felsch@pengutronix.de, lgirdwood@gmail.com, shengjiu.wang@gmail.com
In-Reply-To: <20220601092342.3328644-1-m.felsch@pengutronix.de>
References: <20220601092342.3328644-1-m.felsch@pengutronix.de>
Subject: Re: (subset) [PATCH 1/3] ASoC: fsl_sai: use local device pointer
Message-Id: <165459877177.301808.17694507316184674663.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 kernel@pengutronix.de
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

On Wed, 1 Jun 2022 11:23:40 +0200, Marco Felsch wrote:
> Use a local variable to dereference the device pointer once and use the
> local variable in further calls. No functional changes.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: fsl_sai: use local device pointer
      commit: f53f50ee21d46094a8c48970e95e38a4deaa128e
[3/3] ASoC: fsl_sai: add error message in case of missing imx-pcm-dma support
      commit: 22205521770ee740f64a3ec90301f50e34738cfd

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
