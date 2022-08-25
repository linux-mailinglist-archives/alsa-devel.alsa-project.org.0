Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C945A10B7
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Aug 2022 14:39:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DF0D950;
	Thu, 25 Aug 2022 14:38:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DF0D950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661431181;
	bh=LgDF5Ox+bjDfNVdxCe2AZEmz1pOP9XOBZQajiIKH80Y=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THl3tX9cSLtXo0/k3QbWHlk+H6oWQUnzusx77M7A9H4baU25y/xz2RFzIMhMb6KPC
	 pumD9HTDwpc8tjCzc0pETsvE6spy+ccwQvfoirFBDff3J4auUPs13UkIcrTSTVwCrR
	 VtQ/UpIeQOuYKEhaD8Qs/ayxFvzx6gRd4BAiN1SI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94FE8F800BD;
	Thu, 25 Aug 2022 14:38:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E21D2F80245; Thu, 25 Aug 2022 14:38:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6B87F8014B
 for <alsa-devel@alsa-project.org>; Thu, 25 Aug 2022 14:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6B87F8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MgtYnyeR"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8624D61892;
 Thu, 25 Aug 2022 12:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A73C433C1;
 Thu, 25 Aug 2022 12:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661431110;
 bh=LgDF5Ox+bjDfNVdxCe2AZEmz1pOP9XOBZQajiIKH80Y=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MgtYnyeRFhEsP1zYUeNrVMqrlICIhJG92NLRD989jirXfF/alwMsyXEstwEPS8VMy
 QT1vLMosW8nNHRF8iaq+i7PqTJZyfVuDi0Qzuu8ZxH3CX0CK2oIQsaDemK5VxuNXP7
 6o1lzQm/+BEz11aEtp1QaW3oEsVcjSEqPEdnh8LqDDyGQ7bPiLLVLSJ/1BpFx34jY3
 deM2BdS5raEY6pfV8F0vGQa2lps5uA92HpGHJc0JoIl6dr3zCXoruMVPAYyFHkeimg
 feXhbZ+gq291hSBa5A5GOlauzzKbd3zaQ+GdF6b9FMWn/YeOO5BiZb4UDVa2pFjazf
 VvZUpVfAonogg==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Chunxu Li <chunxu.li@mediatek.com>, nfraprado@collabora.com
In-Reply-To: <20220824122319.23918-1-chunxu.li@mediatek.com>
References: <20220824122319.23918-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH v2 0/2] ASoC: mediatek: dt-bindings: modify machine
Message-Id: <166143110713.95415.18123711454744125570.b4-ty@kernel.org>
Date: Thu, 25 Aug 2022 13:38:27 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com, lgirdwood@gmail.com,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
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

On Wed, 24 Aug 2022 20:23:17 +0800, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> Changes since V1:
>   - remove unnecessary quotes
> 
> Add SOF related field.
> 1. Add a property "mediatek,adsp", Only when adsp phandle could be retrieved,
>  from DTS, the SOF related part of machine driver is executed.
> 2. Add a property "mediatek,dai-link" to support dai-links could be specified
>  from DTS
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: mediatek: dt-bindings: modify machine bindings for SOF
      commit: 1173107d7c129ff87224814fd38fce5db023aaa0
[2/2] ASoC: mediatek: dt-bindings: modify machine bindings for SOF
      commit: 1173107d7c129ff87224814fd38fce5db023aaa0

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
