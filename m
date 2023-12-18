Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1898178BA
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Dec 2023 18:29:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FFE2DF8;
	Mon, 18 Dec 2023 18:29:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FFE2DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702920592;
	bh=ssje5mv7upVQ96o7uXeJAzq1j9BE6IUQtrK1PRZCG5Y=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Pm0dH8y0O8lswAnzYFeop6n5nzfXoPadQNsN3vJl+W7M5P3w09h8wZT9alYChT/VB
	 +RhV+BWcCxTiuLSB+gF3UcIzmyW+z44sj3JnwBD7+YUBLECzmzxYNWp+BdGPEmUDjt
	 VJ55OJyI/C2YdoV4uJZuxFjFhNkCSqv7VtaQg5Lg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD8A3F805FC; Mon, 18 Dec 2023 18:28:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABFBAF805F4;
	Mon, 18 Dec 2023 18:28:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 657D9F80431; Mon, 18 Dec 2023 18:28:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 994EAF80124
	for <alsa-devel@alsa-project.org>; Mon, 18 Dec 2023 18:28:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 994EAF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eGlPs1+k
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 587A9CE128D;
	Mon, 18 Dec 2023 17:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAABCC433C8;
	Mon, 18 Dec 2023 17:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702920500;
	bh=ssje5mv7upVQ96o7uXeJAzq1j9BE6IUQtrK1PRZCG5Y=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=eGlPs1+ktHN6oG9y0Np861Q4lICVrT9YkHXCludPwq+gBypEckXRTFyEiAnCXNe5V
	 UPfw3yGWiXkdQQy9/0v2367tm5Q7M4S0sYK/R1ovBIJgKMnNgvvgUMJPX1NvZQRI/a
	 en9QPpr53gQAnMYLZHO4uEoKNBpnED7F7Y67hi33eaIQ0CvXE7QcATtIR9d3rUuvrB
	 IPNY1Z+pLXdHZ3K1xd92X0lFZdnJ/mtJ+4yaRGh6bVFYdmWnQNeE9QY+I/WllUVorK
	 muFG7fubBi6LNM6z5kBHJt5oqDcEbc945In6g/9fjJGrfIeR/z2XMdovM7znikcLhN
	 t/1huMIp4COGg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231204100048.211800-1-krzysztof.kozlowski@linaro.org>
References: <20231204100048.211800-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: Fix trivial code style issues
Message-Id: <170292049849.89121.10011961339428732958.b4-ty@kernel.org>
Date: Mon, 18 Dec 2023 17:28:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: 37JX3Y27W5324CXRUSWJEG6RE6DNURIJ
X-Message-ID-Hash: 37JX3Y27W5324CXRUSWJEG6RE6DNURIJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37JX3Y27W5324CXRUSWJEG6RE6DNURIJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 04 Dec 2023 11:00:48 +0100, Krzysztof Kozlowski wrote:
> Fix few trivial code style issues, pointed out by checkpatch, so they do
> not get copied to new code (when old code is used as template):
> 
>   WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")
>   WARNING: function definition argument 'struct platform_device *' should also have an identifier name
>   ERROR: code indent should use tabs where possible
>   WARNING: please, no spaces at the start of a line
>   WARNING: Missing a blank line after declarations
>   WARNING: unnecessary whitespace before a quoted newline
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: Fix trivial code style issues
      commit: bb3392453d3ba44e60b85381e3bfa3c551a44e5d

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

