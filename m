Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CEA419D96
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:53:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50C7716A5;
	Mon, 27 Sep 2021 19:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50C7716A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765235;
	bh=MFzBCd7WIw8UFh7ciOOL3Lyu+G+BmRBAF7OXTVUAHP0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cl3u/oozq0C3U/jbi24U5muMqjmv50Y+qW65qPZqNpKKu/ZB2APtmiySUm/84+78N
	 mWjI5p4B5gNaTLlxR6Qv7G18XISPiM+Hp/ER5TDCfsMT3VGF9xhX0TGEiWFH4aw7xP
	 gr+ryxocbEKNmIUAsaKAa/UpgRz9ptCdRezneePE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CEF5F8055A;
	Mon, 27 Sep 2021 19:48:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64A88F80548; Mon, 27 Sep 2021 19:47:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DAEA8F80542
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAEA8F80542
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HzKHFJ9j"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 806336101A;
 Mon, 27 Sep 2021 17:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764867;
 bh=MFzBCd7WIw8UFh7ciOOL3Lyu+G+BmRBAF7OXTVUAHP0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HzKHFJ9jt2zOkZL+kfIerCdOyj8sU7pOVcVpbTNaLYk2N3Y3JOAELG2CKtX5VwGLQ
 gdckQvpfa8iGsM4gFZtqYqWIwJZJX+599idb06JOZGI/Lay+zEgE8UwawEemaszHAQ
 Gq9RU/JOzoJWiQOCiO0ZuC4m5f1KtyVVffbPCzMM/IMAlBVinJH7sO91qc4hue05hD
 Lx8Ag69IW1pe/aapLF+N9o7Wib2IRaP+pGo8MhD4IiURnz7HWD7fY5SMcFLm+d6Juy
 CVwbifiWfgzNSuoeju6UwghM3mNspJN/wP/b5KOul72XsJjntyOuaeDBfobXLg1GWd
 Wb4Djwx66vSrA==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v2] ASoC: cpcap: Use modern ASoC DAI format terminology
Date: Mon, 27 Sep 2021 18:45:40 +0100
Message-Id: <163276442023.18200.13119333110460590938.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213034.31427-1-broonie@kernel.org>
References: <20210921213034.31427-1-broonie@kernel.org>
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

On Tue, 21 Sep 2021 22:30:34 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the cpcap driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cpcap: Use modern ASoC DAI format terminology
      commit: 99a26f2416fc1fadcfb4519ae5de5265b109e268

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
