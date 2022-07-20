Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E117457C0B4
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jul 2022 01:13:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8520D175A;
	Thu, 21 Jul 2022 01:13:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8520D175A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658358834;
	bh=aOLwg6/EISYMyb84RQNgohTNXRsQHE5/pdLsiinq944=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W2VJ3j9wa7F2JlagZ0jVkSMI11JEpu2GErrAJRNSRO7iiKIfrGsjaM6pvamCfVXpm
	 JgoIxEEfPrKxLvV7C390jYBogO9uthipv0ZchCF//4+cVcvyzPEaXqNZ6N7ZM+p9qk
	 Vnhtg/odzvDUcaIXa8E9TEy5rUqeKrZw2MeZ6K/I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89070F8028B;
	Thu, 21 Jul 2022 01:12:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BAE7F8028B; Thu, 21 Jul 2022 01:12:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C896F800BA
 for <alsa-devel@alsa-project.org>; Thu, 21 Jul 2022 01:12:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C896F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g3dcb437"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B87161DE6;
 Wed, 20 Jul 2022 23:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECBAC3411E;
 Wed, 20 Jul 2022 23:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658358740;
 bh=aOLwg6/EISYMyb84RQNgohTNXRsQHE5/pdLsiinq944=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=g3dcb437XYFf4PzH68vCmRlXnNdvzvZEvE/Bp7DI3beYSjS9yXZzMcVlVt7gW1Qja
 pAzR67tUFuZt0bmB+LnNEhiNyxKO8jA+jWHs8I3Wge0rsUMrHkQ2pQSURuq7Mt68Cf
 1nzG2+VTUYk7lfzP+xe9Ja88+XgqAf+PrQBFwxrRtbwL7A/hC8+TQXcwgGEvYRDvvX
 Yj7CkvaTtFxNJG4Ns/9BJ6n2T0V2Lq5w4KrydwuBbzdd9JQTRl2vDgcTYZseeJ/jqO
 qweTTsAkaq89uLLpzXyC5v2gXm/Nae9oQwVE0PcJ+JCYMu7wAttbzLthQkpUA07me9
 BbwSjOAtCTl3w==
From: Mark Brown <broonie@kernel.org>
To: jiaxin.yu@mediatek.com, angelogioacchino.delregno@collabora.com,
 robh+dt@kernel.org
In-Reply-To: <20220718162204.26238-1-jiaxin.yu@mediatek.com>
References: <20220718162204.26238-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v10 0/8] ASoC: mediatek: Add support for MT8186 SoC
Message-Id: <165835873701.1007579.13802197177165168890.b4-ty@kernel.org>
Date: Thu, 21 Jul 2022 00:12:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
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

On Tue, 19 Jul 2022 00:21:56 +0800, Jiaxin Yu wrote:
> This series of patches adds support for Mediatek AFE of MT8186 Soc.
> Patches are based on broonie tree "for-next" branch.
> 
> Changes since v9:
>   - Drop the definitions that unused in mt8186-afe-common.h.
>   - Use device_get_match_data() instead of of_device_get_match_data().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] dt-bindings: mediatek: mt6358: add new compatible for using mt6366
      commit: 8f57d8b149b1e46b4ffa707634fe76532ec89e83
[2/8] ASoC: mediatek: mt8186: add platform driver
      commit: 097e874ad3fc69601e2b142ff3b638893c355b41
[3/8] ASoC: mediatek: mt8186: add mt8186-mt6366 common driver
      commit: a809ded89d1d982ac05d8a3c6c943b49ff1b94fa
[4/8] dt-bindings: mediatek: mt8186: add audio afe document
      commit: 344afef6b980be569f4e9325778ca6869fed82cd
[5/8] ASoC: mediatek: mt8186: add machine driver with mt6366, da7219 and max98357
      commit: 3c6e24b65b53ce22c30492b9f239853b01d2d5b2
[6/8] dt-bindings: mediatek: mt8186: add mt8186-mt6366-da7219-max98357 document
      commit: 8a8da1e6af18f51b719a142fde92e5db56a129a0
[7/8] ASoC: mediatek: mt8186: add machine driver with mt6366, rt1019 and rt5682s
      commit: 0da16e370dd7a17b33b6fa2769ad9536389a0e12
[8/8] dt-bindings: mediatek: mt8186: add mt8186-mt6366-rt1019-rt5682s document
      commit: 1bcca73ee596e46e84782514621062c0ddf9d24f

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
