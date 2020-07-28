Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A35A8230F7E
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 18:35:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DB0F1706;
	Tue, 28 Jul 2020 18:35:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DB0F1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595954150;
	bh=PYdkKnxxcQFMv3YJQCfo1uY3iy0vMXSKSgcJLUonuwA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qjRolSRDtIjnGbL1rX2jn8+q3f37+OEyb09Y+KY9IsFs4M+oedhhPwhD90K2PPSYh
	 qB+PPc554JTxOBvUB7GukWw8QMjlNWevIxq4QgU2v99Dtrqwu3tkiJCW3KkL2kpzJp
	 N/Ps8aXg5E+OFq2+oktX8ZInOFsoHiQ2eeuqpGvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A542F802EA;
	Tue, 28 Jul 2020 18:31:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31D03F802E9; Tue, 28 Jul 2020 18:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E944EF802E1
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 18:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E944EF802E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="yv/UdIWH"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFFC920825;
 Tue, 28 Jul 2020 16:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595953883;
 bh=PYdkKnxxcQFMv3YJQCfo1uY3iy0vMXSKSgcJLUonuwA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=yv/UdIWHabVmupxBbnxvN2V/4hviSAwkU0frmQc0+sBWuMreFl7R+3jQ2neFgXLsI
 ghQfM2OzTMLrgzTNmIKO39WIsHG2gLQ4vd35oVPnHcdpaI6x7QIQvdXXiAnmkVGtH2
 EcbhCqFDxiTdmEy5dppbKv2Iq8ICfyInr7ftgGmY=
Date: Tue, 28 Jul 2020 17:31:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20200724155933.1040501-1-katsuhiro@katsuster.net>
References: <20200724155933.1040501-1-katsuhiro@katsuster.net>
Subject: Re: [PATCH v2] dt-bindings: sound: convert Everest ES8316 binding to
 yaml
Message-Id: <159595383113.15027.17968086750577561184.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Sat, 25 Jul 2020 00:59:33 +0900, Katsuhiro Suzuki wrote:
> This patch converts Everest Semiconductor ES8316 low power audio
> CODEC binding to DT schema.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: convert Everest ES8316 binding to yaml
      commit: 92e67a9c4f206dc9c859c405e67448a8be59ac5d

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
