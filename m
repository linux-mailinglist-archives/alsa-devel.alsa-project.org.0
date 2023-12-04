Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 847F38032E7
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Dec 2023 13:35:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 742F6DF1;
	Mon,  4 Dec 2023 13:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 742F6DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701693301;
	bh=+77X1yTHGoZ6/peS7Dk73aNb2pKF+nsPMu9+E5xI4yk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=vhieQwkaeYb7glRgmogLiMQChqM+DYVhE7nQXxZzJX8mrpL/BK1vQEBa8uI0q9UzM
	 3OgKdqfPnMXJyDR/WS92rqOiskDl5dr2dAQhP23XXsNmnoJkqKMqlS3SKq0Q4tCItS
	 3ymjBsFTH77r8DkPeco7jmFQ6zeyX5suNwnKnET8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E74CFF8059F; Mon,  4 Dec 2023 13:34:22 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83CCDF805C5;
	Mon,  4 Dec 2023 13:34:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6150DF80580; Mon,  4 Dec 2023 13:34:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 88B66F800AC
	for <alsa-devel@alsa-project.org>; Mon,  4 Dec 2023 13:33:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88B66F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aVwbO2l0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7EE0161049;
	Mon,  4 Dec 2023 12:33:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64251C433C9;
	Mon,  4 Dec 2023 12:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701693235;
	bh=+77X1yTHGoZ6/peS7Dk73aNb2pKF+nsPMu9+E5xI4yk=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=aVwbO2l02TYFwFd16DAOemiS5rQMaHLiWSSry78cuj4+e10bzPETUZTsYcvP2m9dE
	 HoHRQF8NX2PhpqEfN9pbFYDgSUpCsM1zK4IE85CoHXVSHpsb9T6L956yGaJC39I3KP
	 GNzp4vkkB2XtugeISJ0Lh8A64s0/fdBMFke+CI4+Crd5wdmhJPFueYx9/stYsHwEk7
	 /7FICdBFCCdCyy3x5TpUIDCsA1Y/jJMCwhIK4rvJNdm8j2RAQUzZg3BkdSzVZcxwOG
	 klxFbxOT19yvUbCikt6JFVt+rZyIupxDAzmEDZay32sor+S2Jyb+daIgbIEapF2Lph
	 EdxUjQlQoPUaA==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231201135332.154017-1-krzysztof.kozlowski@linaro.org>
References: <20231201135332.154017-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: qcom: sc8280xp: set card driver name from
 match data
Message-Id: <170169323312.40199.10496089708040196942.b4-ty@kernel.org>
Date: Mon, 04 Dec 2023 12:33:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: FJFPRGRZAE3AL525XKYWLWYDCKDA2TXC
X-Message-ID-Hash: FJFPRGRZAE3AL525XKYWLWYDCKDA2TXC
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FJFPRGRZAE3AL525XKYWLWYDCKDA2TXC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 01 Dec 2023 14:53:31 +0100, Krzysztof Kozlowski wrote:
> Sound machine drivers for all newer Qualcomm SoC platforms are the
> exactly same, therefore it makes sense to use same machine driver for
> newer platforms as well.  Choice of sound topology and user-space Alsa
> UCM files depends however on card driver name, which must be customized
> per each board.  Allow such customization by using driver match data as
> sound card driver name.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: sc8280xp: set card driver name from match data
      commit: 625ed9457de50d7726ccb3f2bc4e01e543ceb126
[2/2] ASoC: qcom: sc8280xp: Add support for SM8450 and SM8550
      commit: fdcaecfc71e2f4ab70ce9469f14dd64c23bf401a

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

