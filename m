Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF056567118
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 16:32:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7729316E6;
	Tue,  5 Jul 2022 16:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7729316E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657031548;
	bh=moxeozGqxzjgJYhs6taKE8w7rDE6WbDoG4nA04zRYrU=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GSixwbDNNUcorRUKiXW5Qw/UENbLbr1hWNV+vmnCy2YhXj0WmXYMewLVnn1FWay3G
	 fU4TrIb3AXMZ6t0ouwpDzvihfzZGl5/bX3ZjoEa8QMnlls+rkp729TZtL70fwqGtdp
	 104NCU2c+m3CpTdaeti3AAEo7BL7FZaqcBICYLUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00200F8012A;
	Tue,  5 Jul 2022 16:31:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71C0DF8015B; Tue,  5 Jul 2022 16:31:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D7D1F800CB
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 16:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D7D1F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hJfLD/PO"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0D21B817E9;
 Tue,  5 Jul 2022 14:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18A8C341CA;
 Tue,  5 Jul 2022 14:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657031479;
 bh=moxeozGqxzjgJYhs6taKE8w7rDE6WbDoG4nA04zRYrU=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hJfLD/POTX6T35eLFnyuMFrPQgMxQ9Ai+/cS8V8gktHVgZS+65iYhuoDKZE9CHT/o
 7QBMZP6I1RltixMP9RcqXYvcMf1XPKaQ2fnRjGLSoeaq2UfPw3Q/N/4ewkQWyBuI5A
 jblAoDbYPBjgT7aCgjWKGoXSn1BRXnkHx3Zn+GlqY/IFA6403GLIPDOeHbvi/wYaUZ
 JhCQbxfyAt6h8TcH9O4Fa/XDbswQ5BgxrHq5Naq35vPcAaGJesiVlx51Ab5QHxkBUI
 jhLzPDgq4G0U3UlFo7qyQSCfJqbGZbTwp0EKo4CSdUgWku6XhBdYPMBpcSw+pOpIqr
 4ZAhmG+ew8jcw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, oder_chiou@realtek.com
In-Reply-To: <20220705101134.16792-1-oder_chiou@realtek.com>
References: <20220705101134.16792-1-oder_chiou@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt5640: Fix the wrong state of JD1 and JD2
Message-Id: <165703147742.3751734.1499861342987961247.b4-ty@kernel.org>
Date: Tue, 05 Jul 2022 15:31:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, spujar@nvidia.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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

On Tue, 5 Jul 2022 18:11:33 +0800, Oder Chiou wrote:
> The patch fixes the wrong state of JD1 and JD2 while the bst1 or bst2 is
> power on in the HDA JD using.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5640: Fix the wrong state of JD1 and JD2
      commit: ca687e8c7e1f5b6b07e84db592bfbef3670d8ead
[2/2] ASoC: rt5640: Add the MICBIAS1 to the dapm routing
      (no commit info)

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
