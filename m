Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C85055BC09
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Jun 2022 22:47:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95E72167B;
	Mon, 27 Jun 2022 22:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95E72167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656362859;
	bh=UiaAu/L1sfP4Mx0eMmE72X2gzOVHDTEcJcPI7zKKQ2g=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=irR9mxxkCK27i3Q6A+Ol6WqvGcmsO5j3c/NVNxeXPNd52DJEv+UR7+cK/5iKTgano
	 lt84Jwn4y+XauOjqJ70xDzyYM2GVxpjs5kmWwE927WIHORRd4/ffF1W7McRV1Emqeq
	 E3BkJnJSAXvBaEduvd/AykDMnbM/OKlRLnWkyMKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B841F804F1;
	Mon, 27 Jun 2022 22:46:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D32F6F8028B; Mon, 27 Jun 2022 22:46:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69F4FF80128
 for <alsa-devel@alsa-project.org>; Mon, 27 Jun 2022 22:46:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69F4FF80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CddB4nZT"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 88AC0B81B96;
 Mon, 27 Jun 2022 20:46:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EB0C34115;
 Mon, 27 Jun 2022 20:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656362793;
 bh=UiaAu/L1sfP4Mx0eMmE72X2gzOVHDTEcJcPI7zKKQ2g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=CddB4nZT6iM+fjCtSN4kqidyQKt3BmutS2erpTUnZvb76JkBD1onosNbSCWZ5jh8L
 Eq+pzHohiP7IUIwwKfAFBLTiERTPHB7fCtum7nUWUfOl/FwISL2th0E6MZUqRmyIRO
 ndejmvx4meRiHO9NKIZVktYTWaLD8Iy8sz1OjZDfUYe4LWn6JnqTB7Y7s45CzDQ6zj
 IFr6h/jxGNpZ6kXwUh3f7O94BLFDg/8POkGz6I3A4bfGTbRJx80VktD7zfcAkTri+C
 Bdny7eORXbwJx3obunku3cMN2YObFVglah1IDxiNuibajLfRvO+rh4r3IFCnIUKc/M
 SfIhtXS9wuwbg==
From: Mark Brown <broonie@kernel.org>
To: jernej.skrabec@gmail.com, lgirdwood@gmail.com, samuel@sholland.org,
 wens@csie.org
In-Reply-To: <20220621035452.60272-1-samuel@sholland.org>
References: <20220621035452.60272-1-samuel@sholland.org>
Subject: Re: (subset) [PATCH v2 0/3] ASoC: sun50i-codec-analog: Internal bias
 support
Message-Id: <165636279016.4185952.318954133536578049.b4-ty@kernel.org>
Date: Mon, 27 Jun 2022 21:46:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, arnaud.ferraris@collabora.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 mripard@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

On Mon, 20 Jun 2022 22:54:49 -0500, Samuel Holland wrote:
> This series adds support for enabling the codec's internal microphone
> bias, which is needed on at least some versions of the PinePhone.
> 
> Changes in v2:
>  - Move register update from component probe to device probe
> 
> Arnaud Ferraris (2):
>   ASoC: dt-bindings: sun50i-codec: Add binding for internal bias
>   ASoC: sun50i-codec-analog: Add support for internal bias
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: sun50i-codec: Add binding for internal bias
      commit: 24e0b04dd42be34ec4b18dc1a1e139d66eb572a3
[2/3] ASoC: sun50i-codec-analog: Add support for internal bias
      commit: 25ae1a04da0d32c22db0b018e5668129b91fa104

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
