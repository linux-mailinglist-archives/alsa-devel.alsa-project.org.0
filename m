Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 070CA6B8172
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 20:09:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B30FD1443;
	Mon, 13 Mar 2023 20:08:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B30FD1443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678734581;
	bh=mixkviXkrTQKP4glJUkMivKz0/es3ZvvcLqTmvgYhWQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=tz5I1A9Z2YO3CdE+3hJI+smhJh7QNlwhQieHXrm1bXBml19yH7zb7j3euAGmkcq9U
	 7C7BgxA9aH3y9Wxz1WUjLlSt11I+WqgxbNMQLkznk0L62dphIqeHJuCWyhCQeI76jk
	 04CzUKi/DThG2Rk5SH7erCvGMU3MW419CibqBfhM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4410FF80527;
	Mon, 13 Mar 2023 20:08:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77E31F8032D; Mon, 13 Mar 2023 20:07:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B870EF8032D
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 20:07:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B870EF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gMPEuJOW
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8163C6148E;
	Mon, 13 Mar 2023 19:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B23CAC4339C;
	Mon, 13 Mar 2023 19:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678734469;
	bh=mixkviXkrTQKP4glJUkMivKz0/es3ZvvcLqTmvgYhWQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=gMPEuJOWVffTQXdCaxYCQVCoYfBtXQ+/emqhw9/rBwO340K0nrNHThlQ+JuSc7JO1
	 o1RaJ5azj9+AIAmhoHqRamzIA1F+D3cRWGeG47J533OnytjJ2xYEItFr6s95t46qwr
	 zoSp3ejYiUUGbvkDgD5ahMgeBF5+yiowztsNutT345Oi/Q2+cqZjaYU1HLNoUacAEp
	 nh7NkZ4y1jD95dJl+veq4EzY0RBJqHcptAYFLQC5BwhbvPIxYDWqcmG16YBp/TVhyY
	 8Qa2oD4/lTIB19Y/uHQIf2eia3vlbfeFfgwS4ytVu6y1KZiXbNdSSzQ0nMBZa0Ct/l
	 oC3/Db4klimqA==
From: Mark Brown <broonie@kernel.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sebastian Reichel <sre@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Oder Chiou <oder_chiou@realtek.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
References: <20230310214333.274903-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/9] ASoC: qcom: lpass-sc7280: Drop
 of_match_ptr for ID table
Message-Id: <167873446544.106067.10586777003172589901.b4-ty@kernel.org>
Date: Mon, 13 Mar 2023 19:07:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 34UXXM3WUQUW5HGUIHHWG6KXM36L7SOT
X-Message-ID-Hash: 34UXXM3WUQUW5HGUIHHWG6KXM36L7SOT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/34UXXM3WUQUW5HGUIHHWG6KXM36L7SOT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 10 Mar 2023 22:43:24 +0100, Krzysztof Kozlowski wrote:
> The driver is specific to ARCH_QCOM which depends on OF thus the driver
> is OF-only.  Its of_device_id table is built unconditionally, thus
> of_match_ptr() for ID table does not make sense.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[5/9] ASoC: codecs: adau1977-spi: Mark OF related data as maybe unused
      commit: a9048d64fb9605eb68c9912724e4a1346db8ba1a
[6/9] ASoC: codecs: pcm179x-spi: Mark OF related data as maybe unused
      commit: 413beba1a336e6068119f31a4441c51a7aeb1b55
[7/9] ASoC: codecs: rt1019: Mark OF related data as maybe unused
      commit: 0e8599a35823f05e90513918ff1201f8d210e315
[8/9] ASoC: codecs: src4xxx-i2c: Mark OF related data as maybe unused
      commit: 075a430db402eed0907b80493f1432d47a5120a7
[9/9] ASoC: codecs: zl38060: Mark OF related data as maybe unused
      commit: da1f22825b4fec7e25431fa5238252452f3dce46

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

