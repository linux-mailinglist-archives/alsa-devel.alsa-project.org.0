Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5965F0FA7
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 18:13:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7469116D3;
	Fri, 30 Sep 2022 18:12:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7469116D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664554409;
	bh=QEzJU0VS5kHZoLyV5Mc+p7c1jZc4wJxU/synCGYTbtg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p/NY+R9vXcwmENmuWA9z74vXkUsuYQ1NuARslxB47EXr9jJnTKnqf+D044oWhV+v0
	 EhRlgyrtqG3/Bweg7O1lnG0D3TjOjGHW9+UZtkL9F89LwTn4RcyZw0L6+dSm1oW4KK
	 Agmdb8Jakrm42yoAXhQIdXaPWY1oXWps711s3DX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1670F801D5;
	Fri, 30 Sep 2022 18:12:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05EB0F80155; Fri, 30 Sep 2022 18:12:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8379AF800E8
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 18:12:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8379AF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bhwMItzH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A29C3623A0;
 Fri, 30 Sep 2022 16:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97458C433C1;
 Fri, 30 Sep 2022 16:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664554345;
 bh=QEzJU0VS5kHZoLyV5Mc+p7c1jZc4wJxU/synCGYTbtg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bhwMItzH/LRgiLHZnJkpbEt20PHg13JMCiwnXQ62ROrEMTcsTN4HW+B+YGpSdsGil
 5sShuZXm24UTWROjR+yisDWSa2WgKYfpe5kMUJ4j24k8bOichYgbOmoc/m+xF/6ccP
 hyEJsdVIDPFAH7/4Scd9bKqZQdEeRLccD0UxmFQVrxRH6AeDWTn7O40m/uD43spAei
 NP6jGC1Z6IRw7NGKD+JsXDNwlfYmwtdxN8vW568aV1evlW0CXMJUCD+3M33xgW6tBn
 GnRZEnIXigV2MgA/cS3Zv9CA1ESwM4EeWn6NwHeTug7nrAsDabHS+iuqIB/rhPubQ3
 BYY052k9UZ7Qg==
From: Mark Brown <broonie@kernel.org>
To: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>
In-Reply-To: <20220927185359.294322-1-marex@denx.de>
References: <20220927185359.294322-1-marex@denx.de>
Subject: Re: [PATCH v2] ASoC: dt-bindings: Document audio OF graph
 dai-tdm-slot-num dai-tdm-slot-width props
Message-Id: <166455434333.614892.7791049768510643889.b4-ty@kernel.org>
Date: Fri, 30 Sep 2022 17:12:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org
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

On Tue, 27 Sep 2022 20:53:59 +0200, Marek Vasut wrote:
> Document dai-tdm-slot-num and dai-tdm-slot-width props as those are
> parsed by simple graph card and may therefore appear in audio OF graph
> node.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Document audio OF graph dai-tdm-slot-num dai-tdm-slot-width props
      commit: 853110992cfefec433ca58cf7d69df4f639abe18

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
