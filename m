Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70673AD2851
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jun 2025 23:01:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6EEB601E8;
	Mon,  9 Jun 2025 23:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6EEB601E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749502885;
	bh=zqrMe1sn7XHdZVE7LCOKTyfEo8TpwJkf0G8jdLXjznM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MV1QYCZp7ET3ACM+BBGFSDbLeQT17bo6yU03pHyeKn3TSajUTQXNDoTuHtckzmeUH
	 mXJDKknjEIgFomUcleMh5k3EGY6ldlAQW1SJTAE/XLcPolwFvOOZanDiIYu1EeGpQK
	 Yl2UV0AkoXiPV2yicJUj/HGxpWOA86F6K/+XBy60=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFA8AF805E9; Mon,  9 Jun 2025 23:00:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E205AF805E9;
	Mon,  9 Jun 2025 23:00:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D14FF805D4; Mon,  9 Jun 2025 23:00:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org
 [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4C22F805CB
	for <alsa-devel@alsa-project.org>; Mon,  9 Jun 2025 23:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4C22F805CB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KUPkIIyl
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 117404A7E5;
	Mon,  9 Jun 2025 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CCE7C4CEEF;
	Mon,  9 Jun 2025 21:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749502837;
	bh=zqrMe1sn7XHdZVE7LCOKTyfEo8TpwJkf0G8jdLXjznM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KUPkIIyla7GStsdPfBCxwIp7zBZcKRNwfODNlQP68t8IhkD9BJKZ/FiALoJXLptA6
	 +4cyStfaNISmp5STLNwFyfFhjYJH1rquAxXNX14e3H6tvnpAZFiABYqTQP8bSiS7MJ
	 rpWpypO876E76VkRrsw7JsYtTX6wdnKcNgufLrihS79RAdwlqR3JCmnsA8e5bUXTLL
	 azPyyEnaolGGbuJ/zdKLQXs6qnFq9uYe0R97005Wzen8+drUcMFB7JDwTuHh3Pb3bS
	 mHmrxFYWBE1I1wwPpKe1KksyymrYu/vxQflKfBGGN4M3yzTzaCvO3jA3/4TxcZY6gF
	 KXEXe/XveO+Ow==
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
In-Reply-To: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
References: <20250507-fp5-dp-sound-v4-0-4098e918a29e@fairphone.com>
Subject: Re: (subset) [PATCH v4 0/5] Add DisplayPort sound support for
 Fairphone 5 smartphone
Message-Id: <174950283411.277844.1603420608213566024.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 22:00:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
Message-ID-Hash: JRAQKFBKUHEGGUOHPD23YGLTCYWWPOHL
X-Message-ID-Hash: JRAQKFBKUHEGGUOHPD23YGLTCYWWPOHL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JRAQKFBKUHEGGUOHPD23YGLTCYWWPOHL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 May 2025 10:01:36 +0200, Luca Weiss wrote:
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

