Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CB67FEDB8
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Nov 2023 12:24:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46A5F84A;
	Thu, 30 Nov 2023 12:23:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46A5F84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701343443;
	bh=xr5JNGOp0U++yPhoXYwejOX8hAi+ZFtXqD6om/BbAXs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=g8V3lsbZvgpl5R3LbGEH3O0rgP6hy64DZuEVrST/wCvjJEgXyc4psNGl/h0n8YwPx
	 vDk1Igt9FbFSVnC0xjeCGqVqKEVgFmuwTjjlnhWTVHOjtRdEmMCTqNupatWFfbOrhv
	 iMycKmnQ/mkSq0KG/YTYjTI6+oQdUUVrhJc7jUKc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2DAAF8055A; Thu, 30 Nov 2023 12:23:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 638A0F80567;
	Thu, 30 Nov 2023 12:23:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00F3EF8016E; Thu, 30 Nov 2023 12:23:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD246F8007E
	for <alsa-devel@alsa-project.org>; Thu, 30 Nov 2023 12:23:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD246F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QgBsYjC3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7639CCE22C2;
	Thu, 30 Nov 2023 11:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F456C433C7;
	Thu, 30 Nov 2023 11:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701343393;
	bh=xr5JNGOp0U++yPhoXYwejOX8hAi+ZFtXqD6om/BbAXs=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=QgBsYjC3gnQPs3AasGVAnvSuquHzgencfpclZocgw0PS5jw+ivTgpbCiZ/6k0aHK5
	 SUYpH3O6+JfQ3+JWxx/Qw6VZQXj0XNVbU2sioRKindebyQPYZvZqzIZpS9oh2EZmPf
	 7c+vG9IIRth7yCInARzG/G6l3Qu8YrhnIDJZq8kyFb45hegD9Fo+MJGAqr/b+LAO76
	 PTHAzxjqO34SjuN5zf8kLo3L40505MdJUuxnMYo9I8RP1q9ceL6w7X1cUknIIFpXwY
	 OSMxUIKe+E0+6CtR+CoKTVOMt0ZUuSagHvr9+v/WT12kL8FQ5PTaTH8o+MTuKC8RFU
	 ae0uSg1Sk8sCg==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
References: <20231128165638.757665-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: qcom: Add helper for allocating Soundwire
 stream runtime
Message-Id: <170134338891.9221.12703514760679769792.b4-ty@kernel.org>
Date: Thu, 30 Nov 2023 11:23:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: DPLCJ2XKJILJXH6IZJ3DH46OQW37MKBH
X-Message-ID-Hash: DPLCJ2XKJILJXH6IZJ3DH46OQW37MKBH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DPLCJ2XKJILJXH6IZJ3DH46OQW37MKBH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 28 Nov 2023 17:56:37 +0100, Krzysztof Kozlowski wrote:
> Newer Qualcomm SoC soundcards will need to allocate Soundwire stream
> runtime in their startup op.  The code will be exactly the same for all
> soundcards, so add a helper for that.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: qcom: Add helper for allocating Soundwire stream runtime
      commit: d32bac9cb09cce4dc3131ec5d0b6ba3c277502ac
[2/2] ASoC: qcom: Move Soundwire runtime stream alloc to soundcards
      commit: 15c7fab0e0477d7d7185eac574ca43c15b59b015

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

