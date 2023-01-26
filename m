Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB71B67C1AA
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 01:30:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DCB1820;
	Thu, 26 Jan 2023 01:29:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DCB1820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674693046;
	bh=ugZ8xqRzG/MXWFMK1A6CKCJ9dwczVVYsZvs+Zqi8Mhk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VpMTqaB0shrBCxgWKbK4jR2FTo9Orh8S0HQQ5POGwXGWLkokBfVRiaG1xL5ArqllD
	 qiTZvtiDFEdLTRw0+itY+x+BQQaPDd13wu1cNqDUIwNVDN8Xp6VHvjupOI7a5pod4c
	 +ANXdhhrSgnVq5pA7koVbVxNlu2JntEq2YrzLYyk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 421B4F802E8;
	Thu, 26 Jan 2023 01:29:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31442F804F3; Thu, 26 Jan 2023 01:29:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 933D5F800FB
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 01:28:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 933D5F800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jBrnHhCJ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D5F42B81C6D;
 Thu, 26 Jan 2023 00:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81687C433D2;
 Thu, 26 Jan 2023 00:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674692935;
 bh=ugZ8xqRzG/MXWFMK1A6CKCJ9dwczVVYsZvs+Zqi8Mhk=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=jBrnHhCJ6JpOpO89l4637NxJyAix4JxyQkDTe1qcS37nBu3QjluVV1fx8JjRs7o7e
 LAT9sNWMfbh22NXTnjohoTL8Yno8nS8tS6/QXI6qrwsFtTyKQQCylEfABcSu3inmmq
 zj+1P2zoRSFWHZu/aYhRgXBZ4JcfsZPAEUL9SsM2VSJcr5BZfRhCLg5rRmQd447ZXx
 fNCFc00KePZyWwG/RUlFzm1k2MaqVw0B1LO1BayW/hJ8nUY+OdO3bJTcRi9Afz2zEb
 KkPQHfVmLdCuyTf02sep6tRGKpq1ejQrrkqvq9YauPSs9VOV7hlum1YzLBWolK8DAn
 VVGQH89JWYdhg==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, alsa-devel@alsa-project.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124163953.345949-1-krzysztof.kozlowski@linaro.org>
References: <20230124163953.345949-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] ASoC: codecs: constify static sdw_slave_ops struct
Message-Id: <167469293316.2696228.10033245530806500019.b4-ty@kernel.org>
Date: Thu, 26 Jan 2023 00:28:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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

On Tue, 24 Jan 2023 17:39:51 +0100, Krzysztof Kozlowski wrote:
> The struct sdw_slave_ops is not modified and sdw_driver takes pointer to
> const, so make it a const for code safety.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/3] ASoC: codecs: constify static sdw_slave_ops struct
      commit: 65b7b869da9bd3bd0b9fa60e6fe557bfbc0a75e8
[2/3] ASoC: codecs: constify static sdw_port_config struct
      commit: 57dc05c4e6faaab5d8e7fb631f285120d7ed4b07
[3/3] ASoC: codecs: wsa88xx: remove unneeded includes
      commit: 27681129b089d9a5d597a05f6e1821eb6d82919b

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

