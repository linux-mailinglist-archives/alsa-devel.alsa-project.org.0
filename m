Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF1A67C1A9
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 01:30:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 416D820B;
	Thu, 26 Jan 2023 01:29:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 416D820B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674693029;
	bh=fbBRAdPn9UFXEiL+pTgBGg0Ie4LQZr2rftDpSDQY9mQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Sp4pN5HXtwlANB8hAg0XzhczHwRx2p45Se5SpLmM8/VxViQerXtqSHCzoLU535/GN
	 tqSqs36qJW12/3Os3R0t3BmmQEjaKfXKP3iGtPbKHOJ55+A4W7DGAyqZm6fOpwXN+u
	 U71uYvwxOVGSUS4xxC5piCrbG8TX9/5ZfTutbp9c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B6FBF804FD;
	Thu, 26 Jan 2023 01:29:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDA30F804C2; Thu, 26 Jan 2023 01:28:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2A89F80163
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 01:28:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2A89F80163
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=J2htSXXH
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BB07CB81C68;
 Thu, 26 Jan 2023 00:28:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65302C4339B;
 Thu, 26 Jan 2023 00:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674692930;
 bh=fbBRAdPn9UFXEiL+pTgBGg0Ie4LQZr2rftDpSDQY9mQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=J2htSXXHT0yD60LqM36NP78mUMK3vdQZPm3sPfBw0ylOPx8uAF5HuQiUSYi7hbzwH
 jdDNJLFsF/ezK4qmwcuVPdd/3LAnAxsba6JHrD2EzzbwBBLCqnWdrLcsFuX4Vnkh+N
 G6BL9SaoxeHbOnOEogTRcDQncFNaXHydmJcOCXKKFOQ4sXdtC9EnTPLLhcV71Fp/V5
 mDMOuKy1OobLePtLrMuzF9nf/DC+GtAHAKSu7snlPZnodGhOCUGi4zyfvVnGuBbTHc
 SYdCe7G0uTJSXQmaXF65Ku5S1FeGg9+cZ9gxmUP+VjXReWrp2JyS6s/l/IKTak/JXe
 XecrCqRjSSGTw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230124181746.19028-1-rdunlap@infradead.org>
References: <20230124181746.19028-1-rdunlap@infradead.org>
Subject: Re: [PATCH] ASoC: Kconfig: fix spelling of "up to"
Message-Id: <167469292812.2696228.156727580350360808.b4-ty@kernel.org>
Date: Thu, 26 Jan 2023 00:28:48 +0000
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
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 24 Jan 2023 10:17:46 -0800, Randy Dunlap wrote:
> Fix spelling in sound/soc/ Kconfig files:
> s/upto/up to/
> (reported by codespell)
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: Kconfig: fix spelling of "up to"
      commit: 636be128d659131739df62e08455bbf6678fc58b

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

