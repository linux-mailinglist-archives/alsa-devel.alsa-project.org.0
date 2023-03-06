Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDDD6AC144
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 14:34:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D95F9110F;
	Mon,  6 Mar 2023 14:33:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D95F9110F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678109654;
	bh=GGz/XSquEEkd/c1A8ozA7mQ9It/zjD2cp/cMY4WB4vA=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vPPE/FUMPQd3xIRnnMwic7fRqsNHt7byvwF0yuOoy3grwKshihQmy99OYR4xk0rka
	 fpuM4R3qoFXPxYVLtsnIA5++p5UEC97XQmnJyJSogEG59tGoGPkUE0B5b5lMtk44Pc
	 RUmmfb4U+YFP02WU9CqBEMC05ikoBDmrFfP6mwSw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3183FF80527;
	Mon,  6 Mar 2023 14:33:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10EFDF80520; Mon,  6 Mar 2023 14:32:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A9BCF80236
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 14:32:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A9BCF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iBaz7RSp
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E474060EB8;
	Mon,  6 Mar 2023 13:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B25C4339C;
	Mon,  6 Mar 2023 13:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678109519;
	bh=GGz/XSquEEkd/c1A8ozA7mQ9It/zjD2cp/cMY4WB4vA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iBaz7RSpiIHju+faTJoDDbYnqmTn2YoDyADXL2vTPaHobu59JQLQT7lk3IOORGJdB
	 0ike2irMWoLD0BnVbFfW4l4Vhd9zdBvaTqjmyqMrp30fQPZTk6z/SElweq1D/d2gO1
	 M0Rfe35aZMF/Z/lnJEVVioyP6WK6U1VSJjhfXR6RzqAlYFWwkGLlbCGxBTNGFRjljk
	 pd3D8BWREFA3wcQM8gLvC5JSxBhHzNCSw55xylUXpfeeEV6J3mp25lQ75K6wZXapTS
	 PZq/MV4+1/V9uUTYi79oYIab4NqqASTK7vAWyVgeMlsS/uDLxPKdkCCbAi06YgHS+I
	 fZNTLSfJsfAVw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Prabhakar <prabhakar.csengg@gmail.com>
In-Reply-To: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230217185225.43310-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: (subset) [PATCH 0/4] RZ/G2L SSI: Update interrupt numbers
Message-Id: <167810951612.75807.7701310254952965635.b4-ty@kernel.org>
Date: Mon, 06 Mar 2023 13:31:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: FTOUCCAN4SU4NZJRGFLK5EXCSZJ7WFXJ
X-Message-ID-Hash: FTOUCCAN4SU4NZJRGFLK5EXCSZJ7WFXJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FTOUCCAN4SU4NZJRGFLK5EXCSZJ7WFXJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 17 Feb 2023 18:52:21 +0000, Prabhakar wrote:
> This patch series aims to fix interrupt numbers for SSI channels and updates
> the DT binding and the driver accordingly.
> 
> Note, this patch series applies on top of [0].
> 
> [0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20230131223529.11905-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: dt-bindings: renesas,rz-ssi: Update interrupts and interrupt-names properties
      commit: 56a3840486ae22c42176828e25d4073712837bfd
[2/4] ASoC: sh: rz-ssi: Update interrupt handling for half duplex channels
      commit: 38c042b59af0248a8b13f01b1a09d890997c9f6e

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

