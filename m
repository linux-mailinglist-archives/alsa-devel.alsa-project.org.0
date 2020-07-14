Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3878121F780
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 18:41:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 967401612;
	Tue, 14 Jul 2020 18:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 967401612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594744888;
	bh=VXBDgTJLVKWPVuRwGZc/xyeARiY3XELOkWmvVP1dLgw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VRfCjoXztjAzMxLqp9rgYXSAXrc1vLW1Z/dldk95e8are/ahIR6KwWhMOvap31VQS
	 EFaJKwDPe308ZLsRheO4ciYELbWuqKaAy6myr9qPIYy/DJkxOxHMY8KMuxUyIrWk4K
	 azN6cNMwRvnc+68T3K637SU9ny3bQgJEMeYb9RPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3345F8014E;
	Tue, 14 Jul 2020 18:39:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F5D0F8019B; Tue, 14 Jul 2020 18:39:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEAD8F8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 18:39:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEAD8F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0DE1cZNs"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A501922475;
 Tue, 14 Jul 2020 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594744781;
 bh=VXBDgTJLVKWPVuRwGZc/xyeARiY3XELOkWmvVP1dLgw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=0DE1cZNs4i1Blxp5k1J4/D1Qca6QXL8nIgyyo5l/CQNesPqvFOquXf/Mhxd5T92iK
 YvKEKsmr4E5Isdg5UuWo5sRnRFAiX0OhUOWq0xK15h+le7tHVwU4+Lfg0sGi5eqfCD
 gR9s4bzH5q6X7pL80M4wavbK0v3o+H19pRKyHGMA=
Date: Tue, 14 Jul 2020 17:39:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20200623113915.791386-1-yamada.masahiro@socionext.com>
References: <20200623113915.791386-1-yamada.masahiro@socionext.com>
Subject: Re: [PATCH v2] dt-bindings: ASoC: Convert UniPhier AIO audio system
 to json-schema
Message-Id: <159474477218.998.6916116867302380188.b4-ty@kernel.org>
Cc: Katsuhiro Suzuki <katsuhiro@katsuster.net>, - <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org,
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

On Tue, 23 Jun 2020 20:39:15 +0900, Masahiro Yamada wrote:
> Convert the UniPhier AIO audio system binding to DT schema format.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Convert UniPhier AIO audio system to json-schema
      commit: 3d04d1cc48838f9ae6617a97bbb2c16f06f01144

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
