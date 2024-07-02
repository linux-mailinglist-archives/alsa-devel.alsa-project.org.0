Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 078A6923C75
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2024 13:32:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF6D6211D;
	Tue,  2 Jul 2024 13:32:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF6D6211D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719919949;
	bh=8VjB7u2o1X6Fkf4ljzLQulZ+iIR1INcOkKXgXFjoEP4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IFF/5VRmyqMNiw+vPn9TgXHX1dRTZPhlUS1mxmnbB8sEQvEMshdMmJvOetTSigpNC
	 g0bnjE16qcj9pGJBuqU14iqrGb4xboF4Fva8cgExp+HKXwNuacYESNRXaMI4eJTg/a
	 GCmw7DxYm289LGMDj4QDUj2LKAte71TZbofRCZ1A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 167FBF80508; Tue,  2 Jul 2024 13:31:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FEECF80272;
	Tue,  2 Jul 2024 13:31:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C698BF80272; Tue,  2 Jul 2024 13:30:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03CA1F8013D
	for <alsa-devel@alsa-project.org>; Tue,  2 Jul 2024 13:30:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03CA1F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MsFQzMwg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DD6D5CE1A68;
	Tue,  2 Jul 2024 11:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE852C116B1;
	Tue,  2 Jul 2024 11:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719919804;
	bh=8VjB7u2o1X6Fkf4ljzLQulZ+iIR1INcOkKXgXFjoEP4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=MsFQzMwgt8Dy9o13LHIHXMusSsQkTEC1XvOsyAP6RSb/rBFCn8lrmAFmMHdqrHed3
	 ycKjB0ZCtwaURxZt321m9Qsmp3TUFeIDgWWm3LQDC9+JuhpTv7n/t/mjmIE9G/D1q/
	 fQ0GVgEZDbHasKgk0wsfFOiC7KZ4S1eCPF9R01JuwvkdCIjh38zxlRCzIDK7ygCrlz
	 8F4eYxJ0gGcAmZc6DUoiUx0WWFMYpaNmuS17q/VsUcdUXnWwu1uffIdQNOxmg3NUmp
	 DeZeJcuwRuMJIB/kEUbSuFoD3UfGBOoeFQwKElhjX5DT7pUCjfKZYAIdotTAD1aVBW
	 cll11JNGiBC9Q==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
References: <20240628095831.207942-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-rx-macro: Fix using NULL
 pointer in probe() dev_err
Message-Id: <171991980162.18111.8940228821828803310.b4-ty@kernel.org>
Date: Tue, 02 Jul 2024 12:30:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 4CPDYU5SXRHSHFU6NEF5EY3BUJ4UQMBW
X-Message-ID-Hash: 4CPDYU5SXRHSHFU6NEF5EY3BUJ4UQMBW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CPDYU5SXRHSHFU6NEF5EY3BUJ4UQMBW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 28 Jun 2024 11:58:30 +0200, Krzysztof Kozlowski wrote:
> The 'rx->dev' is assigned closer to the end of the probe() function, so
> the dev_err() must not use it - it is still NULL at this point.  Instead
> there is already a local 'dev' variable.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: codecs: lpass-rx-macro: Fix using NULL pointer in probe() dev_err
      commit: 2e068fe01ecbf677d414d4c1b02eea1636dd614c
[2/2] ASoC: codecs: lpass-wsa-macro: Fix using NULL pointer in probe() dev_err
      commit: 765d3a2aa195882e231835f5d9ac4d99affc8c07

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

