Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 814D5735FE2
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 00:32:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10E0EA4B;
	Tue, 20 Jun 2023 00:31:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10E0EA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687213916;
	bh=VTOn8TZIRkr5hcTwCFN624AmM4XHhsXL5EFuVLuRufE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nGzoYu2ReGEANjjUjlPIeqJ93jLYASjmGscx4LUAOrrzxrQtOOx0Y5Eu1Frxf/t17
	 or1h9EVqN9vmS4Zzcb4ej/WYyMcuNnJUh00QfLn+ovYptk5ZsK3btlZGI9f6EAaQzh
	 fYtC/PDIVxg7tDeq75aJLFqmy+AJ5HCXB6bnN23c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A31DF80563; Tue, 20 Jun 2023 00:30:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7397F80093;
	Tue, 20 Jun 2023 00:30:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFB09F80163; Tue, 20 Jun 2023 00:30:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60E0AF80093
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 00:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60E0AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=L2HS91AR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E68160F23;
	Mon, 19 Jun 2023 22:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F40C433C0;
	Mon, 19 Jun 2023 22:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687213753;
	bh=VTOn8TZIRkr5hcTwCFN624AmM4XHhsXL5EFuVLuRufE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L2HS91ARE+lTOqsWF6lhYxQkY5E2QL8FpAC2QPjiBfDM2u9/emMwksPxNp2Lh+2im
	 ubiOCJ9ujrU3iX1uwh6wbQvX+NN0HLrQ3sJg0mrv5Hn5nc0wpCoQTGBa/Di1ZphcPB
	 siAiVrvsTuVEshRM9TydI6oDE4sVHNAP5qAdvSn2WOUuSRb5VuV4RjlG6vBTijjb80
	 Q2zEpLIWgEs0tnHS7wc1s+ll0DV9tmE8suHJTfbZG4Z7/1/JD1A/tQIyoXnsGUwV9s
	 v6gvGVQor3MbStL7BgJjP+7JpTXsQuudJ0kr4g0zaE3YKMycbIOOv1xJ9U9r/uFJTi
	 xBK8RFTDU9bhw==
From: Mark Brown <broonie@kernel.org>
To: Ryan Lee <ryans.lee@analog.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org
In-Reply-To: <d44c8388-b12b-4045-95de-0d4bc7b428ac@moroto.mountain>
References: <d44c8388-b12b-4045-95de-0d4bc7b428ac@moroto.mountain>
Subject: Re: [PATCH] ASoC: max98388: fix error code in probe()
Message-Id: <168721375195.200161.4552209882264201706.b4-ty@kernel.org>
Date: Mon, 19 Jun 2023 23:29:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: QZGAWHNX7QOVGNWKOQLLDMPLNQECAN7Z
X-Message-ID-Hash: QZGAWHNX7QOVGNWKOQLLDMPLNQECAN7Z
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZGAWHNX7QOVGNWKOQLLDMPLNQECAN7Z/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 19 Jun 2023 12:46:48 +0300, Dan Carpenter wrote:
> This seems like a copy and paste bug.  Return the correct variable.
> It should be "ret" instead of PTR_ERR(max98388->regmap).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98388: fix error code in probe()
      commit: 02474880e8fdd8533f21da4264a7ebfce8196be7

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

