Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF8C233B61
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jul 2020 00:29:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D72FD1696;
	Fri, 31 Jul 2020 00:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D72FD1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596148184;
	bh=K4EIQkVucQIypGxjb3zMkbMkirLR/phA6rgBGD9rC/I=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V7szQs9/Oj6YuOvTCgw31ZfDRjtEwxi0EU1F20rz3HkZ/SF9IS3phuoVq90pIAssU
	 fvYGO3ZaB91w12O07Q4VsYmXqAT+oJlP1ImI0Qk908Ak0XgVODweCAImWONOlHfmK3
	 mw24gOFh1wsdMymU5H4amP1typehkiXpQVdHwJ64=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDA23F80227;
	Fri, 31 Jul 2020 00:27:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7704F8021E; Fri, 31 Jul 2020 00:27:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DBF0F80111
 for <alsa-devel@alsa-project.org>; Fri, 31 Jul 2020 00:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DBF0F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VX1BfAV6"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4563C20829;
 Thu, 30 Jul 2020 22:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596148065;
 bh=K4EIQkVucQIypGxjb3zMkbMkirLR/phA6rgBGD9rC/I=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=VX1BfAV6AV/R/d2DFWcv7Z9VgP2UdlzP9Fkl6MXsmjn9M9LcRvsme9CAL8EJIAbPY
 sdphS+Tlg+QMb//o+GKleCyGP6MEDgbvo4MXopGR/rH3+GmUir/ebz+zZ3veYaY/aZ
 u23PFRfJPHpO6F2w5lenAoUhVeNULhtbqbfJtXts=
Date: Thu, 30 Jul 2020 23:27:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>
In-Reply-To: <20200721182709.6895-1-alpernebiyasak@gmail.com>
References: <20200721182709.6895-1-alpernebiyasak@gmail.com>
Subject: Re: [PATCH] ASoC: rk3399_gru_sound: Add DAPM pins,
 kcontrols for jack detection
Message-Id: <159614804536.1473.678464665429263160.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 21 Jul 2020 21:27:10 +0300, Alper Nebi Yasak wrote:
> PulseAudio (and perhaps other userspace utilities) can not detect any
> jack for rk3399_gru_sound as the driver doesn't expose related Jack
> kcontrols.
> 
> This patch adds two DAPM pins to the headset jack, where the
> snd_soc_card_jack_new() call automatically creates "Headphones Jack" and
> "Headset Mic Jack" kcontrols from them.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rk3399_gru_sound: Add DAPM pins, kcontrols for jack detection
      commit: d0508b4f16049a658d68a7c276ba08296c5a76bc

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
