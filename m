Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 924AD4C7D3E
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 23:25:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E8E518BB;
	Mon, 28 Feb 2022 23:24:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E8E518BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646087143;
	bh=TE+Rt0fIAbSZ+4U5Y9r3PdSJRY6MPGXc12FuKcxtb6E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AcIgjR8kGfZMeBtUF2jD2kyhx1JZ6+fljKyaYLQfvpTzK+BEOkQMwJP2zZ/NXRYyt
	 ZOPf9HEAWDMrTUck+roFKEhvOcjLsZr5Jwjiegs4odjmfPo5Ke/fmoqITuBYDtysyo
	 m1c5dwz26iKfKrWD9vPmoSCFn1hjvIZKVAcIM5rg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D974AF80054;
	Mon, 28 Feb 2022 23:24:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F8F5F80125; Mon, 28 Feb 2022 23:24:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E512F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 23:23:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E512F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qazoUsG6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB77B61299;
 Mon, 28 Feb 2022 22:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD289C340F1;
 Mon, 28 Feb 2022 22:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646087036;
 bh=TE+Rt0fIAbSZ+4U5Y9r3PdSJRY6MPGXc12FuKcxtb6E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=qazoUsG6WZM5lo2vUSbvOUqnvQ9hzxrPkVTEwSqrn7QEnoV9eTi9O6q6otat6lwqa
 q4LVw1wObT8OlR4bgSWiZOHZrSX6nX0D+TPqLQt5e1YswLGbeagtM+sAgNx3/Kc54a
 5rYNEy7wRpI62Oh4lT0rBrNe7nvRikqfyxMOkaayBjQx2qIHMysjXrWeHvRk5zy9NF
 wxBldyZ0LDEeTE/97yMVkfLrJr5HpziBIEBlruu1/5eAHdO8EKvZIcygbtcG+8al1X
 Deb/cQpEC89SfpqVlAfzqnXqV1P4U9S4YtgHYeyd5SNMB6POpTyCwRYhJF/ZmUYfNv
 I+4TTMQF7qa3w==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220228144235.24208-1-srinivas.kandagatla@linaro.org>
References: <20220228144235.24208-1-srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v4] ASoC: codecs: wsa881x: add runtime pm support
Message-Id: <164608703449.3143764.5366445148621158953.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 22:23:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com, linux-kernel@vger.kernel.org,
 quic_srivasam@quicinc.com
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

On Mon, 28 Feb 2022 14:42:35 +0000, Srinivas Kandagatla wrote:
> WSA SoundWire Controller does not support Clock stop and performs a soft reset
> on suspend  resume path. Its recommended that WSA881x codecs connected to this
> are also reset using a hard reset during suspend resume.
> 
> So this codec driver performs a hard reset during suspend resume cycle.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: wsa881x: add runtime pm support
      commit: 8dd55245836119ee3636543b6c2597efd78e643d

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
