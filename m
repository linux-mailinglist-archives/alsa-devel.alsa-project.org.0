Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBDF55BBF9
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 22:21:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8058B16A4;
	Mon, 27 Jun 2022 22:21:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8058B16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656361310;
	bh=WuhLwVReyPIuFiHnuKnYYLH+rlvl1fOWMReZYjq2KMA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZSbt5Wf2hRcEBla7gBQGDml2dS+HvFF9Axu6Yv4K7lUHAqZLPOXmHXiz7U4fwJaAu
	 Gb16qq59OA5OjtqkBhZz1dN4Fk6vjW7n6d16SJ6yUmONDA31t103BV0U5ZKpwrPpRH
	 hLV6pUWNg6YMcCTUO5omTCTNmtGwZ/175h8qMt+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BE93F804FC;
	Mon, 27 Jun 2022 22:19:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A0A8F80553; Mon, 27 Jun 2022 22:19:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24C2BF804FC
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 22:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24C2BF804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EzvLipb/"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 710256174E;
 Mon, 27 Jun 2022 20:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ACA9C385A2;
 Mon, 27 Jun 2022 20:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656361153;
 bh=WuhLwVReyPIuFiHnuKnYYLH+rlvl1fOWMReZYjq2KMA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EzvLipb/md2jDxG97HKhkbVnANDIcXdB9kf1WhKt5pJMqo31/DRMReHEF/yPd0NHq
 lAokPdTX87zAbGK1wokDszHYzYkOgO234P616ZZPoLk+6AfycMhWmdhNC2fauIeoNL
 HLAocQYD/+epH+VC2NbaqYnAkgE+x/rwTVCvMOIqETvkDvPf1ZYSI7p2ASxeLY7wYy
 fPVJUMtPkVpAKYmw8OlVjjSE9PoH9uBYEdH6FLTkPbM9V3AxfUrAEgxRKceaTV2V6y
 7NVCI4a+raTe9wQ0/6dgRWWghZXfAr2//NBeffs6+g9XXMmwzXS7vPiP+l0LC2F56D
 zGX3ZvEa3nNmQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, srinivas.kandagatla@linaro.org, perex@perex.cz,
 bgoswami@quicinc.com, lgirdwood@gmail.com, yassine.oudjana@gmail.com
In-Reply-To: <20220622061745.35399-1-y.oudjana@protonmail.com>
References: <20220622061745.35399-1-y.oudjana@protonmail.com>
Subject: Re: [PATCH] ASoC: wcd9335: Use int array instead of bitmask for TX
 mixers
Message-Id: <165636115088.3997797.3429241707337810347.b4-ty@kernel.org>
Date: Mon, 27 Jun 2022 21:19:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, y.oudjana@protonmail.com
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

On Wed, 22 Jun 2022 10:17:45 +0400, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Currently slim_tx_mixer_get reports all TX mixers as enabled when
> at least one is, due to it reading the entire tx_port_value bitmask
> without testing the specific bit corresponding to a TX port.
> Furthermore, using the same bitmask for all capture DAIs makes
> setting one mixer affect them all. To prevent this, and since
> the SLIM TX muxes effectively only connect to one of the mixers
> at a time, turn tx_port_value into an int array storing the DAI
> index each of the ports is connected to.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wcd9335: Use int array instead of bitmask for TX mixers
      commit: 4b07ef55d1d4178dbec584195be148685ea25c59

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
