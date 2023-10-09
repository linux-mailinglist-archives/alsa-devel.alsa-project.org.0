Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E817BE634
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 18:20:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 87024EBE;
	Mon,  9 Oct 2023 18:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 87024EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696868444;
	bh=gkyeCucWHf0UPKQjtfcwMc3717M1vXRgjVqByo3d1Qo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WNE7lCdfS7Q1P/xNbIJ2BTm1ABeKOJr1Vengp89akLjhpOtrUREkUcc0eTX3FdMge
	 1cq6w3iNaIW9NAT5UkL3xM++UEtCSZbW8sr0Kap6XF/EBXclkLXSblF5iH8UNgO00x
	 /OU0lRbqydObiTuF3xoQP456KC8ik6lsiGwQZMdE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C615BF80568; Mon,  9 Oct 2023 18:19:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F349F8055C;
	Mon,  9 Oct 2023 18:19:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD3ACF80563; Mon,  9 Oct 2023 18:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E9B1F80553
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 18:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E9B1F80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aRZvLtrS
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C6FE5CE108C;
	Mon,  9 Oct 2023 16:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E8CC433C7;
	Mon,  9 Oct 2023 16:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696868333;
	bh=gkyeCucWHf0UPKQjtfcwMc3717M1vXRgjVqByo3d1Qo=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=aRZvLtrSEzexpMxcLbb9fEIj9PrqerwrngWL08mur9lvbJPmFJooNVKd7ExcXmp8Q
	 J20YXEqMxewDDKq2mmG4LWFM6DkaRteITbjhoHBJTIXokR5Z8F7SdTyCmKjB65Asvc
	 waTD6RJU7+85dAsS/wPbs5yeg3ubabhUtSlMNImBAJVuB5slOKDs+kRMxHdjkt/3pC
	 e80BudsNFRDICSa9TlPJctsI9qDimmR/R+gN0UcxEfFrdfZCOug9iPJMYJeY+CQLR+
	 JakzussiRfNylaUapSjF0lYt7izBV+XnJ2mCrBoD/sM6GHzVMTpemjuJk2+f2J6L+E
	 4263YhT0J3sQQ==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231005075250.88159-1-krzysztof.kozlowski@linaro.org>
References: <20231005075250.88159-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/2] ASoC: qcom: explicitly include binding headers
 when used
Message-Id: <169686833118.101967.4629707459259465678.b4-ty@kernel.org>
Date: Mon, 09 Oct 2023 17:18:51 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: MCYFKO24JMGISTA575LGTODHVP5BY3IR
X-Message-ID-Hash: MCYFKO24JMGISTA575LGTODHVP5BY3IR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MCYFKO24JMGISTA575LGTODHVP5BY3IR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 05 Oct 2023 09:52:49 +0200, Krzysztof Kozlowski wrote:
> Few units use qcom,lpass.h binding headers but they rely on them being
> included through a different header.  Make the usage explicit which
> allows easier to find the users of a header.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: explicitly include binding headers when used
      commit: 0f729a285b4ef7d0cd2497c22233c42037486a7e
[2/2] ASoC: qcom: reduce number of binding headers includes
      commit: 528a4a0bb010489abc3bb298c85c8ffb7ebe7735

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

