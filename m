Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC9C60E848
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 21:06:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F007399C;
	Wed, 26 Oct 2022 21:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F007399C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666811179;
	bh=Rbn89WhWEbhJuX5225g1SZSIWz53Ni7UUmS8FPZYaIc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CwsFEHQdkTmvGTKAj0ssEZT/ZrDKqIMn6an6z0MDwxFN9KHEr7WRWrx7Ut2pWloaG
	 gIeH0ioMRgorZtggdxl621j1X2ZU1gCCcAPZbPceDerZ1PAe3KzvYxgsflFv28O9nm
	 m6YeMjjxC0WtvvCL3eRObb98ujDtsE4XiVA6J0Aw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E45DFF80566;
	Wed, 26 Oct 2022 21:04:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B979CF80559; Wed, 26 Oct 2022 21:04:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ACE0F800BB
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 21:04:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ACE0F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dbJTMmFV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 88A6EB8241D;
 Wed, 26 Oct 2022 19:04:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6D4C433C1;
 Wed, 26 Oct 2022 19:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666811073;
 bh=Rbn89WhWEbhJuX5225g1SZSIWz53Ni7UUmS8FPZYaIc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dbJTMmFVz+Q8+h9P3Lb5piXFPbmJcgqly3Af5Xv5f3adQnppBIY1iXmip9TUT4rdb
 we/EEY9LIqhI70r/A79oUeMrsI18AtXD+XGiIpVCK+Un0G/VafPsleEpXKlyyH8ZQw
 SEm6UmfJLJNbKh2WNHt/hQKdhqaeuGL0nxiwE4i4heYjcr+xFmboKHkI8KdYBkKKUY
 kLB59ARgoTt8pc+vuGmtoiHxGjxeaUPj/DD09Y6DfPZNDEWbXnxt+AUVtaavSvFB9U
 +bxKBLXxLqNyzBdzmmS5OWwnL/a5q2e15qMlaErZ26/Bq5PFQuXR6quhPF/DMijNpv
 BJh9iDn3KPnKA==
From: Mark Brown <broonie@kernel.org>
To: Nícolas F. R. A. Prado <nfraprado@collabora.com>
In-Reply-To: <20221024230658.1772907-1-nfraprado@collabora.com>
References: <20221024230658.1772907-1-nfraprado@collabora.com>
Subject: Re: [PATCH] ASoC: dt-bindings: mt8192-mt6359: Set maxItems, not type,
 for sound-dai
Message-Id: <166681107036.960840.8469668580584323500.b4-ty@kernel.org>
Date: Wed, 26 Oct 2022 20:04:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Shane Chien <shane.chien@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
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

On Mon, 24 Oct 2022 19:06:57 -0400, Nícolas F. R. A. Prado wrote:
> sound-dai is a standard property whose type is already set to
> phandle-array by sound-dai.yaml, so there's no need to set it (and
> wrongly so for headset-codec) in this binding. What should be set
> however is the maximum number of items, which for headset-codec should
> be 1.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: mt8192-mt6359: Set maxItems, not type, for sound-dai
      commit: 555e6f573a0a08b66b9543a0e098c5d6adf8e8af

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
