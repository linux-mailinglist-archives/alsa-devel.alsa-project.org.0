Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F495B429C
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 00:47:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 780CF169D;
	Sat, 10 Sep 2022 00:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 780CF169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662763623;
	bh=RCTi+9mtpSaq7q1v+5QZetecuQ2vgM2DG0dznXZ0s44=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XP0rH5kA2XJv058QErJ+lIZeDemd1EClAJsJ0yFXYsoJoWPMXoL63yvy37tN7I64X
	 fv0cmEX+Kz5zPfaMlVbeXRxWTvoXlOrQVzF4V2OHrvNLhZOkWzzHk7DctUzYJj54Wd
	 tSdDmiR7aS0YK84MdPOWLCgKF/AsQT2l0AWpOIuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7F3BF80105;
	Sat, 10 Sep 2022 00:46:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 550E5F8032B; Sat, 10 Sep 2022 00:46:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43CCAF8016C
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 00:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43CCAF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WX1XLdz0"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 512AF620C0;
 Fri,  9 Sep 2022 22:45:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AC1C433D6;
 Fri,  9 Sep 2022 22:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662763554;
 bh=RCTi+9mtpSaq7q1v+5QZetecuQ2vgM2DG0dznXZ0s44=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WX1XLdz0E4Z8g+ZqTpgb/fnJLigeXFowXDbZIyRDEWBujZ9khF1l4CKgnxD9TZLge
 9AVwAKjOZWOYir7F/zmoJ3EAmWsymTjdeCjcGu6QcNCDIaYnBRUvnXa3K/PjBbUIjP
 cW+T0zZJzp02sLhNC8QU7nbE7xq6pm28+/adTHWHmgV0YVm8FSa0OANQLtYL9QDsl5
 916GU/iMMHBkJLzLhK4hdGpzI45QoUqbcwpfpwLgKzHZpdYR1p+PKPyVyGNc7l6esT
 OwCrzpDBkq/1CJZmj7uHjXfwNHGx9tIu/yMoxwKkQVyTsJdibg5M5qr9aOM11T5gtC
 BFVgJVUhJoPxA==
From: Mark Brown <broonie@kernel.org>
To: Nícolas F. R. A. Prado <nfraprado@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220908161154.648557-1-nfraprado@collabora.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
Subject: Re: [PATCH 00/10] ASoC: mediatek: Set i2s clock sharing from machine
 drivers
Message-Id: <166276355052.332114.1969052042106279493.b4-ty@kernel.org>
Date: Fri, 09 Sep 2022 23:45:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Chunxu Li <chunxu.li@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Miaoqian Lin <linmq006@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 kernel@collabora.com, Dan Carpenter <dan.carpenter@oracle.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

On Thu, 8 Sep 2022 12:11:44 -0400, Nícolas F. R. A. Prado wrote:
> The i2s ports on MediaTek SoCs only support a single data lane. In order
> to achieve full-duplex operation thus two i2s ports, one for input and
> one for output, need to be used together and sharing a single clock from
> one of the ports.
> 
> This clock sharing setting was previously read by the sound platform
> driver from the devicetree, but given that the input/output pairing is
> closely related to which codecs are connected to which ports, the
> machine sound driver can infer and set it, so that no DT property is
> required.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: mediatek: mt8192: Allow setting shared clocks from machine driver
        commit: 8ae4fcfd5b11b5c33154732fcad99ad0f5843ce2
[02/10] ASoC: mediatek: mt8192-mt6359: Make i2s9 share the clock from i2s8
        commit: 3ffb9fa3963964a730c34f48e502ac0625efc145
[03/10] ASoC: mediatek: mt8192: Remove clock share parsing from DT
        commit: 9ccd51ce396a46d9d4d0c87aa6a82dd26a2f281a
[04/10] ASoC: mediatek: mt8183: Allow setting shared clocks from machine driver
        commit: fea84890e5c1fb65ae8e25b2f9b86363af1f45f2
[05/10] ASoC: mediatek: mt8183: Configure shared clocks
        commit: 4583392a135cc30409f5a6ceebb8374e550b03e0
[06/10] ASoC: mediatek: mt8183: Remove clock share parsing from DT
        commit: cbebe67859a0e8d51e578fdd9f927f8ef2504ba4
[07/10] arm64: dts: mediatek: kukui: Remove i2s-share properties
        commit: b3821f7839c2ec322926d16557aff29f4be1f4dc
[08/10] ASoC: mediatek: mt8186: Allow setting shared clocks from machine driver
        commit: 4132a778e806f77c2bd01a9a34b07edc9dd99d76
[09/10] ASoC: mediatek: mt8186: Configure shared clocks
        commit: 9986bdaee4776c5d595933cace9d54c6bc084e91
[10/10] ASoC: mediatek: mt8186: Remove clock share parsing from DT
        commit: 62da80c6a124dd68b12c4d2197ecc74b79823571

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
