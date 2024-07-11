Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 791A592DDDB
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2024 03:19:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C20183E;
	Thu, 11 Jul 2024 03:19:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C20183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720660771;
	bh=4adTuxbDi35JH0mF6nibIf+rZaUnp1ZHEwRyH+5+8PI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bFJC+6JiyqLgm3Qpnho0fPlM9mowzh9KREeD805IbfVpOUpQuqpj71l8kADUhjja3
	 7I0Ikw33WwX5spczOklNNyIxQBs5wweryl4IyH4NfvrK71DXBdfTRXSTmNqqgj/KUf
	 UWt1l1l8GLfwXq3QMz3f9SXwtL0W2+NetOjNyFEw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B2A8F805AD; Thu, 11 Jul 2024 03:19:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C2EE2F805AD;
	Thu, 11 Jul 2024 03:18:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 947A8F8020D; Thu, 11 Jul 2024 03:12:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA5CAF800FE
	for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2024 03:10:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA5CAF800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=CnITX3Ag
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B47C761A81;
	Thu, 11 Jul 2024 01:10:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F76C4AF07;
	Thu, 11 Jul 2024 01:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720660245;
	bh=4adTuxbDi35JH0mF6nibIf+rZaUnp1ZHEwRyH+5+8PI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CnITX3AgLGKOxCjH5CBLtEW5HAngIKzDD9FF+XtS46V2CsusfOu98wN2mxuDbg87U
	 RCDyDUcGDG+Du0JpTyAo4VgKe/DDEAe/lSMRQ4c0+U13DSCwuHkLVWQo2xMthg3ObN
	 uf0lmxAAnoFM1j8IYOHa3desJnc35uWDFzPwbTYXVx6G6gl7GcUkuJh+sgNQaypWE0
	 rhF1vDWEoumZGnP/jOufzNTdQqa/akzJSTyAHtNI1a2SLx7ecw5z1yH+mtHz2q0zyi
	 ZTg2K1wnyZc14smU0qqpXKO1VLJZoDJTPkhWDjshaod3t8LjmWXjiaOHAh8n8PjY6/
	 /CywQyV+yxlTg==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240710113833.39859-1-rayyan.ansari@linaro.org>
References: <20240710113833.39859-1-rayyan.ansari@linaro.org>
Subject: Re: [PATCH v2 0/2] ASoC: dt-bindings: convert qcom sound bindings
 to yaml
Message-Id: <172066024227.393700.11903720765661169490.b4-ty@kernel.org>
Date: Thu, 11 Jul 2024 02:10:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-0bd45
Message-ID-Hash: K4ROTXYCQ2WGSJXPAZCKYQAGQBC54AZS
X-Message-ID-Hash: K4ROTXYCQ2WGSJXPAZCKYQAGQBC54AZS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K4ROTXYCQ2WGSJXPAZCKYQAGQBC54AZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 10 Jul 2024 12:36:05 +0100, Rayyan Ansari wrote:
> These patches convert the remaining plain text bindings for Qualcomm
> sound drivers to dt schema, so device trees can be validated against
> them.
> 
> v1: https://lore.kernel.org/all/20240709152808.155405-1-rayyan.ansari@linaro.org/
> 
> Thanks,
> Rayyan
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,msm8916-wcd-digital-codec: convert to dtschema
      commit: 054ac9c97c7d9eb55f471fc6f019b654d17332a7
[2/2] ASoC: dt-bindings: qcom,apq8096-sndcard: use dtschema
      commit: 3cbda25e2db28b4352c73d4167f0dab10049ea54

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

