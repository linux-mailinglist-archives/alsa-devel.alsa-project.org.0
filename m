Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A0E465595
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 19:35:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 800132693;
	Wed,  1 Dec 2021 19:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 800132693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638383712;
	bh=V6YRKpSIrVHzwm9o+oYBP5E3FknqANMjKoHFfd/iP20=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SMlZPcQeyjbTGzlnhGs34fSkcUF0Vyt9As6gQcQRPc+EQUIgJc5w996xoA3eIsDBT
	 KOLnJMy1/sAsOF+IYt/8vkTcDqNMXvvykXlK1wW8HP161xJIxPch0BwIihDvDCKkjE
	 ZvOB8FmUATy5qbomZFsdOrHKKQuvOJN5Kh0TPRDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B6A4F80516;
	Wed,  1 Dec 2021 19:32:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53DE2F8028D; Wed,  1 Dec 2021 19:32:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71F52F80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 19:32:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71F52F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G2mspX2G"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 527D1B820FA;
 Wed,  1 Dec 2021 18:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D32C53FCF;
 Wed,  1 Dec 2021 18:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638383527;
 bh=V6YRKpSIrVHzwm9o+oYBP5E3FknqANMjKoHFfd/iP20=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=G2mspX2Gj2RAB2bqOT1DEejPw0xs/OrOFnx3DVvosKwwXTk0jNTs4Lv7L0qanmOKN
 de7zfozXCy8KiCvrXdtokZVjU4qeFD/dSXjEUUJ+UQX0cb9sHLDn4Iu9eIoBSOucTl
 B/V4uP52tDEVmvp2zxbZhGi60GIjVne18x7PBwxLdJXvCXiy5FPQ0Y5kOlWetdNcpt
 9HMUamr2qMV4t9a1Iw8kdno5lc5owAAEhp8YwBqGtyDppNgykHYTaqhIwSHjKD+F0Q
 8JS1czRTsYFKqYbZsikJ21zFL65w70mj4oFtm7nNF/klQgxv17zXu/W4bgELeHaSpN
 q+dWJxt6STRog==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20211130163110.5628-1-srinivas.kandagatla@linaro.org>
References: <20211130163110.5628-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2] ASoC: qdsp6: q6routing: Fix return value from
 msm_routing_put_audio_mixer
Message-Id: <163838352534.2179725.3915150186055501532.b4-ty@kernel.org>
Date: Wed, 01 Dec 2021 18:32:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, tiwai@suse.com
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

On Tue, 30 Nov 2021 16:31:10 +0000, Srinivas Kandagatla wrote:
> msm_routing_put_audio_mixer() can return incorrect value in various scenarios.
> 
> scenario 1:
> amixer cset iface=MIXER,name='SLIMBUS_0_RX Audio Mixer MultiMedia1' 1
> amixer cset iface=MIXER,name='SLIMBUS_0_RX Audio Mixer MultiMedia1' 0
> 
> return value is 0 instead of 1 eventhough value was changed
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: qdsp6: q6routing: Fix return value from msm_routing_put_audio_mixer
      commit: 4739d88ad8e1900f809f8a5c98f3c1b65bf76220

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
