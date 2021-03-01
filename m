Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BBC32953F
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:38:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2586B1668;
	Tue,  2 Mar 2021 00:37:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2586B1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614641909;
	bh=X3zQMo928GW1qVxc5UjuLGk4bT1FV3lRMqtNQ5gZEHQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=joMFyjw9AA1pBXfw/9/X+zQkqjSk9ue2ppFmkTkQvN2TjXrf5WF9aZqlr2XnhyDrA
	 wBmRCCKANdPjnWiNo3ZYNmKvvky154KzLN6UQEUXsA+Ll2ygUXfp25ilJVqXI50Vh/
	 MpH+FIg5HG2uoSRc3BspVDWUphC+V/H0bII83hKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46930F8032D;
	Tue,  2 Mar 2021 00:36:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFE1BF8032C; Tue,  2 Mar 2021 00:36:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64D1BF802E0
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:36:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64D1BF802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="s1P7a/mj"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BE5060240;
 Mon,  1 Mar 2021 23:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641763;
 bh=X3zQMo928GW1qVxc5UjuLGk4bT1FV3lRMqtNQ5gZEHQ=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=s1P7a/mjPGC7cZDiw1TfVmHhV0R72JCZggtix7XvoqHKtV3+2Fwj7gNdwveotxJSo
 Ns08mHLd6d4I0ATAfU5c7q+CHXFWUg8Mp1eFs6Y5mQrIPuxn3goxofVqAziZQTkcZF
 HOTb8a6fnL61+In1rc16SLanz4mCK4shbNUmoGBPnWObU8K5exmkrDivVHtT6g1YBI
 aNfRNtO77UHIwhR/FeqXzrJ5i9smW5lMqmZ/+5LSrpX0LfjT/hNvF/nMEQzBvXAj7a
 CA+FMKRSYJuJyWVDppqtP1eWAxmJrTuUAHCqXzKUsH3TGbk5/2IzgbknebgTdJ85lX
 vohvxTS4hHU/Q==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-amlogic@lists.infradead.org,
 Liam Girdwood <lgirdwood@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Banajit Goswami <bgoswami@codeaurora.org>, Jaroslav Kysela <perex@perex.cz>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org
In-Reply-To: <20210221153024.453583-1-krzk@kernel.org>
References: <20210221153024.453583-1-krzk@kernel.org>
Subject: Re: [PATCH] ASoC: constify of_phandle_args in snd_soc_get_dai_name()
Message-Id: <161464168095.31144.11030304529781910068.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sun, 21 Feb 2021 16:30:24 +0100, Krzysztof Kozlowski wrote:
> The pointer to of_phandle_args passed to snd_soc_get_dai_name() and
> of_xlate_dai_name() implementations is not modified.  Since it is being
> used only to translate passed OF node to a DAI name, it should not be
> modified, so mark it as const for correctness and safer code.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: constify of_phandle_args in snd_soc_get_dai_name()
      commit: 54928c5c63c83afd5a1c2a91802a9c37e9a4ff88

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
