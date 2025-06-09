Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E5DAD284B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jun 2025 23:01:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1CDC601BE;
	Mon,  9 Jun 2025 23:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1CDC601BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749502859;
	bh=rb09KVoRgPYdj7QLHoMRO84NfQkj5PkMlvENQEQzbWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JZ0yEQSpUN+cRCUe34wSezMQ0DTx1Muv1Ky86qxqFq6LugeRd572qOD25V7FLDbkB
	 JW5mjY/h3nkcfyPPjv+Wh9xdUvMxxmxFeaysWLt2dv3I8hnL2PKcfUT0A5+pJn4HLD
	 j9fWufs9TKbqTYddKUdhESYM3WyLObDtHUvetXCM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 948C9F805BD; Mon,  9 Jun 2025 23:00:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 834F4F805C1;
	Mon,  9 Jun 2025 23:00:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E438EF8049C; Mon,  9 Jun 2025 23:00:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7048F800D2
	for <alsa-devel@alsa-project.org>; Mon,  9 Jun 2025 23:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7048F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mzdhq/p/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CAED42B7D;
	Mon,  9 Jun 2025 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E586FC4CEEB;
	Mon,  9 Jun 2025 21:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502829;
	bh=rb09KVoRgPYdj7QLHoMRO84NfQkj5PkMlvENQEQzbWI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mzdhq/p/RMyPKICk+fpJ9eilkpF/nrEslcUp1ALKCKkfXoYpS6KLl907F41xBMv6f
	 N1QepH13c/7A+qaST6XX9eekxghPv4vWMw8KJswYcBTDDxitumeFJdefSSzCgJJx6a
	 R0wPVE8vRsyekCgxSmbJbzB5qPVSMpyIDMLkH6hpVB1MhXoKKtv6sn+AFQ1od4ZrDQ
	 6j4Vc0fmoAGObXjw+fNvDfIKiYKAfSOJygYtBFw6mmGAijghElyqg6dd4yHrK4RXym
	 XkS3JdPCSx/g/gjmR72DVYyk4Sj80QQrDwACFymmg1RU12n03tDOFpL0oLOXYzCgx7
	 cg9vZIB5qRJxw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
References: <20250425-fp5-dp-sound-v3-0-7cb45180091b@fairphone.com>
Subject: Re: (subset) [PATCH v3 0/5] Add DisplayPort sound support for
 Fairphone 5 smartphone
Message-Id: <174950282564.277844.4634804513095204160.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
Message-ID-Hash: R6RPDYX6VDNGZLQPA2MYDEIS67CAOAAJ
X-Message-ID-Hash: R6RPDYX6VDNGZLQPA2MYDEIS67CAOAAJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R6RPDYX6VDNGZLQPA2MYDEIS67CAOAAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 25 Apr 2025 10:07:24 +0200, Luca Weiss wrote:
> Add the necessary sound card bits and some dts additions to enable sound
> over DisplayPort-over-USB-C, e.g. to a connected TV or monitor.
> 
> The UCM files can be found here:
> https://gitlab.postmarketos.org/postmarketOS/pmaports/-/tree/master/device/testing/device-fairphone-fp5/ucm
> 
> This series - in spirit - depends on the series enabling DisplayPort in
> the first place, but can land pretty independently, especially the ASoC
> bits:
> https://lore.kernel.org/linux-arm-msm/20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: dt-bindings: qcom,sm8250: Add Fairphone 5 sound card
      (no commit info)
[2/5] ASoC: qcom: sm8250: set card driver name from match data
      commit: c4b79a2fbfb28308e958e4ffdd988f3cf678fe2a
[3/5] ASoC: qcom: sm8250: add DisplayPort Jack support
      commit: ed82808c6a0f333e51fee4e97cbe8e0189b7f354
[4/5] ASoC: qcom: sm8250: Add Fairphone 5 soundcard compatible
      commit: e6e8897995a9e6028563ce36c27877e5478c8571

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

