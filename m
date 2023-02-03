Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEA4689C5F
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 15:57:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A44E0832;
	Fri,  3 Feb 2023 15:56:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A44E0832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675436264;
	bh=bHTwdQUfTMFSZm5VtpOoEQH5hZ/O5gwP6aGVUcpUMpI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=q/E3Ni6dyTF7k0vfaOhYxH19M6TFBX6qFLkKV1JMRNwo3dz67sNu+lt3pCjBaQ7gl
	 hiS4f2iBucR46fN4qgUx782mKlKPVH6slzlUVLDX4ppOR3alkWASC1zlmiQQqrfM3g
	 YrdeLWP6KeNWkCpCjic8oYDGZrsJPm0kReYlEe58=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C892EF800E3;
	Fri,  3 Feb 2023 15:56:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91E81F8045D; Fri,  3 Feb 2023 15:56:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C72AAF800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 15:56:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C72AAF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=T2KVSpJU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E313AB82ADD;
 Fri,  3 Feb 2023 14:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9D1CC4339B;
 Fri,  3 Feb 2023 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675436163;
 bh=bHTwdQUfTMFSZm5VtpOoEQH5hZ/O5gwP6aGVUcpUMpI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=T2KVSpJUj9K690EgAN5EuTtJGGxDCTHELFkwiKcrgx8WIw8ACPr0OdzILjMcuGVHH
 w/nwhMDgvMyG5luAYTt/Atp0Fkwe02Dc2ezLQseA0dVRCUXnlpJ+9ea6glnCUfRbmh
 yKKRudgzhFJoKR2Z9gb8CWEql9vGIAS7FC1Z/ViFNF5dkvryXoelnQPi9nP9nc+sUK
 VUma/CzQzhj+1cbiU0aTddu23R3ZpzjCOmFiPUlxgrQDbNDzVXXRmic06VuWh7O0i8
 ezt45RNs1R4ZaOpniUVkHtYwS4gS/5/+mfY97oIpNvzPGJ8OGED9v6CjOuPbDIlOG1
 nARdhXFeG2IwQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20230202183653.486216-1-jbrunet@baylibre.com>
References: <20230202183653.486216-1-jbrunet@baylibre.com>
Subject: Re: (subset) [PATCH 0/9] ASoC: dt-bindings: meson: covert axg
 audio to schema
Message-Id: <167543616131.928818.17902040818579023398.b4-ty@kernel.org>
Date: Fri, 03 Feb 2023 14:56:01 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, 02 Feb 2023 19:36:44 +0100, Jerome Brunet wrote:
> Convert AXG audio dt-binding documentation to schema
> 
> Jerome Brunet (9):
>   ASoC: dt-bindings: create component common schema
>   ASoC: dt-bindings: meson: fix gx-card codec node regex
>   ASoC: dt-bindings: meson: convert axg tdm interface to schema
>   ASoC: dt-bindings: meson: convert axg tdm formatters to schema
>   ASoC: dt-bindings: meson: convert axg pdm to schema
>   ASoC: dt-bindings: meson: convert axg fifo to schema
>   ASoC: dt-bindings: meson: convert axg spdif input to schema
>   ASoC: dt-bindings: meson: convert axg spdif output to schema
>   ASoC: dt-bindings: meson: convert axg sound card control to schema
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/9] ASoC: dt-bindings: create component common schema
      commit: e398bbb9834a2f6cbe27cbd72956159ecc92055f
[2/9] ASoC: dt-bindings: meson: fix gx-card codec node regex
      commit: 480b26226873c88e482575ceb0d0a38d76e1be57

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

