Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6AC59FF6E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Aug 2022 18:25:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECCC242;
	Wed, 24 Aug 2022 18:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECCC242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661358334;
	bh=Y4eBdkGZIGqWLszQ5IONiL0dwf3AHaygY1nAw/brFPI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f6N1USosWukEo6zUz82O+rZLiq8bhqCL/MenVYNthxzm5jvej4N4Tu3t6nBNVAlPC
	 Aeh9gHWfqJFB6a8JiaUBEkSCfaKRqnvAFaERdZQ/kEWVcxB6b5IxGBXuYQSco3rh6V
	 NAgIL50DwHdH1Vu3QFIMfvOocb+Y7vlcVf3kmfEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EB03F800A7;
	Wed, 24 Aug 2022 18:24:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84D13F804C1; Wed, 24 Aug 2022 18:24:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76B86F800C8
 for <alsa-devel@alsa-project.org>; Wed, 24 Aug 2022 18:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76B86F800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RU2ONLK9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AEBB61A14;
 Wed, 24 Aug 2022 16:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D854C433C1;
 Wed, 24 Aug 2022 16:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661358263;
 bh=Y4eBdkGZIGqWLszQ5IONiL0dwf3AHaygY1nAw/brFPI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RU2ONLK9WOfTtDPX11OYiLJ72DJnnMM4Y0r91FKLDOBr+sTrgSkpwknaS2Cxdnc4D
 ro0B6Gvrvb91B5wBX49rJhAL2yRg+X/tblzBnIv9JRunK421naPc7yvEy16n8u4MGV
 EKvm6J9BfGWiayrPQlUofDwLCKJVY4hRVK9tTanC9+YuDxoSMNGyE2qbmTQ2scVi2d
 hepqZ0JdD/ItPatE9Svg3Xu4kpNPtm8yj/QeovDdlViNNJYS0jAFpOKM8UxsSV+k+n
 0+rV9XJJZtumbZOS3h5fOKe7xOSjYWdCgktKRM5cfHXkYzAJwVfCjQnYDgQWSsMF2l
 PgfkIHbh5Ea0A==
From: Mark Brown <broonie@kernel.org>
To: nfraprado@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, Chunxu Li <chunxu.li@mediatek.com>
In-Reply-To: <20220820075343.13993-1-chunxu.li@mediatek.com>
References: <20220820075343.13993-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH 0/2] dt-bindings: sound: Add SOF field for mt8186
Message-Id: <166135826016.480875.10489482967868732209.b4-ty@kernel.org>
Date: Wed, 24 Aug 2022 17:24:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, jiaxin.yu@mediatek.com, linux-kernel@vger.kernel.org,
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

On Sat, 20 Aug 2022 15:53:41 +0800, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> These patches add SOF field for mt8186 machine driver
> 
> chunxu.li (2):
>   ASoC: mediatek: dt-bindings: modify machine bindings for SOF
>   ASoC: mediatek: dt-bindings: modify machine bindings for SOF
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
