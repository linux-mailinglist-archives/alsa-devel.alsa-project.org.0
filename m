Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9094FE91E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 21:52:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D8551775;
	Tue, 12 Apr 2022 21:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D8551775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649793130;
	bh=YoI6Z5KYYwnoHCZZY4o7dhX5mC0b2rG6SYk2dpIb4Fg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Iq1vOj1zkwFO/7yxWOZyFLY//5vLSHx1ADvS11hYSNH4DDTXz9g+EJ3nOJuNiDD1C
	 2a7EPUCF0R8JYSoq2SCezIl+yjyaz6uS6rCEl+uLXII2XH6WqTgWXZUxAgniJix/OJ
	 5a/nJvuRZ/vA5qf4QJN8mXGkDlG1jWpuWsDh39+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91274F80249;
	Tue, 12 Apr 2022 21:50:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B60D3F80245; Tue, 12 Apr 2022 21:50:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F308EF80134
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 21:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F308EF80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XxqhmQXr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8A556CE1E2F;
 Tue, 12 Apr 2022 19:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98D09C385A5;
 Tue, 12 Apr 2022 19:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649793028;
 bh=YoI6Z5KYYwnoHCZZY4o7dhX5mC0b2rG6SYk2dpIb4Fg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XxqhmQXrk/9x6DgBLlGugkcJwpj2YoJgnNQ0yqC4v6dZvQOzLjqwxEeHFQv6d1ROF
 2r9j0/SH0IdoihWT4u20p8A4POJMErfEaxQ8UdKEQTt5epAlC96gx5rJQ+iE3ikqHg
 k0t+z2J2SFRXePaYNUFz1htRPRYSxigYYqoDoFbmeRHxM54Ln1Bkb8UdrWRSbC8HSP
 Lqf1pau7vD5kg07CNs0fW+eJL+k5z/u+F9m+i0V1zFL5uzwtwm9y40K/nMhM71LoTM
 djQ4twa/u4ixLm+yuDtfg7CNbMWkMVBo/Ou+ZuqGD+OVQt+c2hybMZTDF69nd5vE6o
 wJZzUQFSfn7wQ==
From: Mark Brown <broonie@kernel.org>
To: krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 clabbe@baylibre.com
In-Reply-To: <20220411194409.3390002-1-clabbe@baylibre.com>
References: <20220411194409.3390002-1-clabbe@baylibre.com>
Subject: Re: [PATCH] dt-bindings: ASoC: fix invalid yaml
Message-Id: <164979302635.449327.5683662423554298406.b4-ty@kernel.org>
Date: Tue, 12 Apr 2022 20:50:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 11 Apr 2022 19:44:09 +0000, Corentin Labbe wrote:
> The word "or" is useless and breaks yaml validation.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] dt-bindings: ASoC: fix invalid yaml
      commit: 506840600613027f139d30447a2c27ec8088c698

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
