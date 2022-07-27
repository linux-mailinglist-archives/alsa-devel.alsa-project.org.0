Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8824D583409
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Jul 2022 22:23:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF806165E;
	Wed, 27 Jul 2022 22:22:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF806165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658953392;
	bh=oD9V7VnPE00dz4yqUuVgqIQpVscpbOrU9NDfS7TeMag=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lu8AwAeSlU01CaJJOu/B65IydXGH5/yk7cvmnjSzZWnbbcMclIXsVFby9X5aOzGXh
	 OH4v3jp1Haz7ayn4ylBQTXJC9OFOO33p9CoeqrUaIXI5u2x5vr7NTJ3SWvQbEd5zXL
	 xIoJQzVYCWeeBP9pHoDfwpv+cl4oL1uZPbZAiOk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A331F80171;
	Wed, 27 Jul 2022 22:22:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F10F9F8015B; Wed, 27 Jul 2022 22:22:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5E5DF8014E
 for <alsa-devel@alsa-project.org>; Wed, 27 Jul 2022 22:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5E5DF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hy87mm+O"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1134C61AB6;
 Wed, 27 Jul 2022 20:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B224EC433C1;
 Wed, 27 Jul 2022 20:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658953319;
 bh=oD9V7VnPE00dz4yqUuVgqIQpVscpbOrU9NDfS7TeMag=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Hy87mm+OftQ8pTPkrMDnGEAp7fJZ3T7ICtQs3ZOKepiXumIUL0pd/COsz2+l/K/lU
 ZlLSw9nUR4potEC9J3baapNtpsPMh5KIXjNV31YkStKsmDwyT3/sPjzeacLOjdWLXm
 jOIHQcGLFu95zepELiAr1Fobg/CItHVDxv4l94vrlmRL0NepvsNW/ZRErwLpoTHN4v
 HRjTSCHi2ErRQlHH/hgXSNsZHXXx09LWf6DI2PN0kJW1tb4UCbXe3iB9//mixKPDA8
 Ignk1QoTrTP6muB7eak/PXTPQMNqzMNBVLsJ+vlufbxHgsaN8Dcxf2VYch2c7UDMCf
 7fSf1MmpcjvuQ==
From: Mark Brown <broonie@kernel.org>
To: angelogioacchino.delregno@collabora.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 dan.carpenter@oracle.com
In-Reply-To: <20220726154220.28141-1-jiaxin.yu@mediatek.com>
References: <20220726154220.28141-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: remove unnecessary judgments
Message-Id: <165895331742.3760230.5472631801057984251.b4-ty@kernel.org>
Date: Wed, 27 Jul 2022 21:21:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-d1cc2
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, aaronyu@google.com,
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

On Tue, 26 Jul 2022 23:42:20 +0800, Jiaxin Yu wrote:
> The afe_priv->dai_priv[] is allocated when platform driver probe(), if it
> failed, the ASoC platform driver probe() will return fail first.
> Therefore, this is excessive judgment, and the condition will never be
> established.
> 
> Bug report: https://www.spinics.net/lists/alsa-devel/msg145609.html
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: remove unnecessary judgments
      commit: d7bffbe9cbd3c96fe51a8482127cabf6fa1fd9b2

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
