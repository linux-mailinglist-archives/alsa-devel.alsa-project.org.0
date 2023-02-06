Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C797C68C8D7
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 22:38:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8E3E1E9;
	Mon,  6 Feb 2023 22:37:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8E3E1E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675719523;
	bh=QwaT+uJL/hJru5ZOlxoiZKTJPcnsFBXbvupQfgZvSkQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YPJxB17VM14EI0BrANymSmrFlncPGSijYXzSz7gmA2Qs2NNeNZk/YA1jcs/KkSpfS
	 BSZfdb4pmbsnYiJP78mRDmW9g/lUtvTgnuNK52KFdiz1toOOEZ5ysfWIC07S0NkBwC
	 a2Z90OfGYvj7FeUVhNWMV93fek76EPUVug2BksRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13FE1F8014B;
	Mon,  6 Feb 2023 22:37:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A594F804FB; Mon,  6 Feb 2023 22:37:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D2E3F8014B
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 22:37:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D2E3F8014B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ix0IJHSI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ACAC0B81617;
 Mon,  6 Feb 2023 21:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F28C433EF;
 Mon,  6 Feb 2023 21:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675719452;
 bh=QwaT+uJL/hJru5ZOlxoiZKTJPcnsFBXbvupQfgZvSkQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Ix0IJHSIFXQySAea5+p1zqW+CUM4NQuaLh4P2Ij+y39Qmgg41vavbV43EbATOAMfU
 UhR+wZOi905vysyAewh2ktpU9RFFnFdey7rVehmEbka53rGioCxLdryXeQFDw+SG20
 9r+ycXj+G51hKwuLCH2IphLm4pmm1QYJv6OsTqkzWmiBCEMSAHa5Y1rV9tmkE1uKRY
 YVlFq/UvHnBYT+qZA1xeLy/hsECV8d3P1L1lGlwBvoYyq93kEw/xeddtsms6XTD+lH
 FXY8pXOND9RQ9UxzABVzUg9F9+k8Od8vvdtD7onP24yFb404db2h+cSYHtMFcm9sqf
 rH8wjVnGGrUhg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Alexey Firago <a.firago@yadro.com>
In-Reply-To: <20230204195106.46539-1-a.firago@yadro.com>
References: <20230204195106.46539-1-a.firago@yadro.com>
Subject: Re: [PATCH] ASoC: codecs: es8326: Fix DTS properties reading
Message-Id: <167571945073.1296981.607333949793064897.b4-ty@kernel.org>
Date: Mon, 06 Feb 2023 21:37:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, zhuning0077@gmail.com,
 yangxiaohua@everest-semi.com, yangyingliang@huawei.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Sat, 04 Feb 2023 22:51:06 +0300, Alexey Firago wrote:
> Seems like properties parsing and reading was copy-pasted,
> so "everest,interrupt-src" and "everest,interrupt-clk" are saved into
> the es8326->jack_pol variable. This might lead to wrong settings
> being saved into the reg 57 (ES8326_HP_DET).
> 
> Fix this by using proper variables while reading properties.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: es8326: Fix DTS properties reading
      commit: fe1e7e8ce2c47bd8fd9885eab63fca0a522e94c9

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

