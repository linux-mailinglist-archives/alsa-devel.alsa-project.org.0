Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC387D85C4
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 17:14:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3723684B;
	Thu, 26 Oct 2023 17:13:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3723684B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698333255;
	bh=89zofsyGqaKGHkukw8q1uMvzNeWPZxdaR/ZVsXLlHds=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YpV7YOGkyb6M/hTk4BKbEPKI38HsrejDhc7oJjmgdv6b/VOg+ajuhNe5uJVyhBVWf
	 6pwuJQcmr4p3r3hG4mCqRSF3paM9HKCK9CkasIdIw2SE2EqWEzD7vcXsR4tvVtU8H1
	 +HUr7608k3bWDj2Lybei6SVGcir8qrdZrbFw9yTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EF32F8059F; Thu, 26 Oct 2023 17:12:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A245FF8057F;
	Thu, 26 Oct 2023 17:12:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DA6CF8056F; Thu, 26 Oct 2023 17:12:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EFFEF80571
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 17:12:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EFFEF80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=okgt+qV8
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3DE80CE40B5;
	Thu, 26 Oct 2023 15:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B38C433C7;
	Thu, 26 Oct 2023 15:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698333137;
	bh=89zofsyGqaKGHkukw8q1uMvzNeWPZxdaR/ZVsXLlHds=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=okgt+qV890hd9IJu1o6LWqEtz5sJM6zuthGM8IFw02a+MC0aw2TUwfDeZYkHY1uoV
	 3lfCAdR460MxaNYFKp3CsBXkdmU3A7EIRtgEYYIaP1I4/tqeRnL8LcGHWR/MGNHw3o
	 ue83Z6Q1WAnfzNebj+cPquJoOJcRbWVNPwANvaAqv5tw8QTwWJH47dKfm4tLW23Whw
	 LCUP3bg1UB/EDQxqgcDVV6ad1+AlS9dS0S5ZhB8EvcBY0ycttOzC8zJmmvQYpThOcf
	 ShKQssP1gRVzgXPiOW9rXt9jNTBmefirG5VW7LkbFdXYIZo55/CvfCoMKYgcx+jHbP
	 hM5yy+8nMdVgg==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231017161429.431663-1-krzysztof.kozlowski@linaro.org>
References: <20231017161429.431663-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: qcom: q6apm-lpass-dais: pass max number of
 channels to Audioreach
Message-Id: <169833313494.133649.12373491407224846679.b4-ty@kernel.org>
Date: Thu, 26 Oct 2023 16:12:14 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: ZHYQQPXMM72I3PKLFIIESAOLHYP2M5AP
X-Message-ID-Hash: ZHYQQPXMM72I3PKLFIIESAOLHYP2M5AP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZHYQQPXMM72I3PKLFIIESAOLHYP2M5AP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 17 Oct 2023 18:14:29 +0200, Krzysztof Kozlowski wrote:
> Using the params_channels() helper when setting hw_params, results in
> passing to Audioreach minimum number of channels valid for given
> hardware.  This is not valid for any hardware which sets minimum
> channels to two and maximum to something bigger, like four channels.
> 
> Instead pass the maximum number of supported channels to allow playback
> of multi-channel formats.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: q6apm-lpass-dais: pass max number of channels to Audioreach
      commit: e29de7abdaf56f58141b01f74862b320191c9203

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

