Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACACB4F988F
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 16:48:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55B2618E4;
	Fri,  8 Apr 2022 16:47:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55B2618E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649429328;
	bh=IwyesdrCp1niEjDWDNUAqbKnkJMKAvXX2yXj5TkCb5U=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Id7k+WeIhnMMn/xxc9bLe7TQTgx8AtJIiElDGTPguyEnwFdac2dY4h2oJ+8OdLuak
	 0IFUNu1SsQBJ1/mKyV1vkeQss0lusnLfezWNMRtaN3gA4WgzbWamDhD5k2N1fUO3P4
	 KerjbuKcJdNbCBwxoJAXllm7KOviA0o85+XRc/l4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2236EF804CC;
	Fri,  8 Apr 2022 16:47:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C435F804CC; Fri,  8 Apr 2022 16:47:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25DE9F80128
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 16:47:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25DE9F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jBhtWnLc"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F30FDB82BA2;
 Fri,  8 Apr 2022 14:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70E6C385A3;
 Fri,  8 Apr 2022 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649429229;
 bh=IwyesdrCp1niEjDWDNUAqbKnkJMKAvXX2yXj5TkCb5U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jBhtWnLcFL+4IX3ZZTGAVNw1bNVCXHpqkx6yx54N4/PRy24zrnvvbtaiJbmRqfxXa
 RrmrOFf1HgmW1oWzxDGiGNyvp4W7TUH/DThIJOPV6uPcW7Y67gGHD9HokjcTn7Yqod
 s8oFqNiED6ufEOrvibZQYUTjooA/b178HSY/a0/r8pZrtrIzGrdLHB79Aivi59oJvh
 FPggIXpKFyvbzBE9aZb15rxhtzRqDgZuBJ61X50Ifl7/ZG2qRJgxbcymOp+bZH1pox
 iCgKBNgJ2dWymFacuT6u1MrWyYfb7/Y6UAJYdiDFSkxHuOrl9LRBJmxUAcptd3Dmfb
 TC9nJg6Unh+Ig==
From: Mark Brown <broonie@kernel.org>
To: tzungbi@google.com, robh+dt@kernel.org, jiaxin.yu@mediatek.com,
 nfraprado@collabora.com
In-Reply-To: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
References: <20220406100514.11269-1-jiaxin.yu@mediatek.com>
Subject: Re: [v9 0/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
Message-Id: <164942922666.1424253.184773384356622992.b4-ty@kernel.org>
Date: Fri, 08 Apr 2022 15:47:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com, linmq006@gmail.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
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

On Wed, 6 Apr 2022 18:05:10 +0800, Jiaxin Yu wrote:
> The series reuses mt8192-mt6359-rt1015-rt5682.c for supporting machine
> driver with rt1015p speaker amplifier and rt5682s headset codec.
> 
> Changes from v8:
>   - fix typos.
> 
> Changes from v7:
>   - "mediatek,hdmi-codec" is an optional property, the code and the
>     binding document should match.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible and new properties
      commit: 1efe7eca170d344c5101c69ac51df6982de764e4
[2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of speaker
      commit: e1e408e60e856b99782b26308a9dc3937b1ba8bf
[3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI links of headset
      commit: f8910fb4985a00c0a1e6932dc5bda6181c549b76
[4/4] ASoC: mediatek: mt8192: support rt1015p_rt5682s
      commit: 7a80167b08f52e7b5eaa18a9d515efdcff9085fc

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
