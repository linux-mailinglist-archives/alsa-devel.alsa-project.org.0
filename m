Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B77B89CB5D
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 19:59:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A10232408;
	Mon,  8 Apr 2024 19:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A10232408
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712599195;
	bh=DMDhTUddn0z/kT6115csMSz16dwSMlBikZA7r7PGvHc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OSp4PwmFiIcUCx2To2WiNjcXZSGa2gy2+j46lq5dq368ZAw94qkduKRiXKfCFwEEF
	 JNQL0KhiD5ad+OIwsHCA2T9fASyMyHitw3AXM7cD2V5ewR13LjTLL8sOlDYkYQoPYh
	 tgFNYKDW+YeFnE87vZjb6mkDfmx+cUlKf/uTb5D4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2E88F805A9; Mon,  8 Apr 2024 19:59:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E43EBF80587;
	Mon,  8 Apr 2024 19:59:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C19AF8026D; Mon,  8 Apr 2024 19:59:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1B59F8013D
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 19:59:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B59F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WVkqRQs+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6D3C26134A;
	Mon,  8 Apr 2024 17:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31482C433C7;
	Mon,  8 Apr 2024 17:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712599144;
	bh=DMDhTUddn0z/kT6115csMSz16dwSMlBikZA7r7PGvHc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WVkqRQs+vE4iD1ZVjoNt5CwtkG0CGRrhP0Hon1ObKqaA/c0aX+A0fRpnhk9wD2pto
	 LZsrjdJ2pgn8XVTzms+dHEuCBG4bBaTvx/JHdj++E2CBj+vOw2VCKjvsS6WhDypNoq
	 wFZk+gimyZFlScbJPL3AODFCVQ1gDAJSr1jNESSAC9nBf8us8t+HaEBGtfwhJN4ozy
	 wtnLCVgG2hiIGgOBUIC+l03/jBSYTXa7JCA36D6D+zgkB7zVvOJD6I4PpSfBafVMB0
	 8Q17gDfX6MGxzHj4N7BpwLFgjTFG/n/O/ZPv+R4A2C46n7IRHiNuoASeuXwEaQcddW
	 w3T7EJTuWE/7Q==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com
In-Reply-To: <20240408042331.403103-1-quic_mohs@quicinc.com>
References: <20240408042331.403103-1-quic_mohs@quicinc.com>
Subject: Re: [RESEND v3 0/2] Add support for QCM6490 and QCS6490
Message-Id: <171259914092.121643.12184524914448906569.b4-ty@kernel.org>
Date: Mon, 08 Apr 2024 18:59:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev
Message-ID-Hash: PF3IJ7NU5V3J7RVMCJVPCYBPBC3WHPPN
X-Message-ID-Hash: PF3IJ7NU5V3J7RVMCJVPCYBPBC3WHPPN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PF3IJ7NU5V3J7RVMCJVPCYBPBC3WHPPN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 08 Apr 2024 09:53:29 +0530, Mohammad Rafi Shaik wrote:
> This patchset adds support for sound card on Qualcomm QCM6490 IDP and
> QCS6490 RB3Gen2 boards.
> 
> Changes since v2:
> 	- Modify qcm6490 compatible name as qcm6490-idp. Suggested by Dmitry
> 
> Changes since v1:
> 	- Use existing sc8280xp machine driver instead of separate driver.
> 	- Modify qcs6490 compatible name as qcs6490-rb3gen2.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,sm8250: Add QCM6490 snd QCS6490 sound card
      commit: c64c4e3f789123e82ffae3404d108cf826c9599a
[2/2] ASoC: qcom: sc8280xp: Add support for QCM6490 and QCS6490
      commit: 5485c3fa96f78314207a30e81dbe270424d70ede

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

