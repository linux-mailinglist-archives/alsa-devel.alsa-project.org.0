Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AA66D2375
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Mar 2023 17:03:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04A051F7;
	Fri, 31 Mar 2023 17:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04A051F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680275032;
	bh=K+HZuqgB9rt/QMhwBweIcNwWvClGQr42KVcvQKa67U4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=hhP/5cO43KX8D1V0nltkHPquKSozsU4h7YwFG/oLvlxiPky0QT175u1XH1lls9rOS
	 kARGd7rSuufcMi31lMBOr/Z0KLY1yUBccpuy10DvChcseF+zXGA4lOWcCkl0ui25Ec
	 TIZ9OGN0uHf6F1OwsYKSsKocm80bhNLsGIjELWVE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 720B6F8024E;
	Fri, 31 Mar 2023 17:03:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AEC1F80272; Fri, 31 Mar 2023 17:02:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23A1AF8021D
	for <alsa-devel@alsa-project.org>; Fri, 31 Mar 2023 17:02:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23A1AF8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=C6swUh79
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6A954B82E26;
	Fri, 31 Mar 2023 15:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E50CC433D2;
	Fri, 31 Mar 2023 15:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680274966;
	bh=K+HZuqgB9rt/QMhwBweIcNwWvClGQr42KVcvQKa67U4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=C6swUh79DRO5QZSPpqIlQyIThpRfWCLZJqd6GgZq9zRIzg3OMSBxBlp2AKr3MLBHK
	 Ihpdq3hbeknoGuZwyDbcI7zBmla6N9FVUnfQl3PH2cNCo2z0XCNbwCm/qIS00Nebu2
	 RubHziuxniLGWPQ6hNVCBScMDVVFiajmCQrugBtb8ojyqbWmZi9VU/o/wcw0yfHDtN
	 hUUEsK54w9S6cCr4iCqAUD786C96DoYcmkGjmRtjYN5Oji+wDuyB8hO0Mfdou9rcU+
	 WaRAkhM4kpoTy5PSpK6DgKQAPMy4o5QoaJTNJ/T15c3Q5p4YSHO61+7vkb3WGvmsqO
	 pEDPycD6GW9SQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 krzysztof.kozlowski@linaro.org, rf@opensource.cirrus.com,
 ckeepax@opensource.cirrus.com, pierre-louis.bossart@linux.intel.com,
 herve.codina@bootlin.com, wangweidong.a@awinic.com,
 james.schulman@cirrus.com, ajye_huang@compal.corp-partner.google.com,
 shumingf@realtek.com, povik+lin@cutebit.org, flatmax@flatmax.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org, ryans.lee@analog.com,
 =?utf-8?q?=E2=80=9CRyan?= <ryan.lee.analog@gmail.com>
In-Reply-To: <20230330234319.6841-1-ryan.lee.analog@gmail.com>
References: <20230330234319.6841-1-ryan.lee.analog@gmail.com>
Subject: Re: [PATCH V4 1/2] ASoC: max98363: add soundwire amplifier driver
Message-Id: <168027496197.3365708.8821025322937971454.b4-ty@kernel.org>
Date: Fri, 31 Mar 2023 16:02:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-2eb1a
Message-ID-Hash: ZGFNEOFSIW3U7W4EJLESNZ4XN7ABEXPY
X-Message-ID-Hash: ZGFNEOFSIW3U7W4EJLESNZ4XN7ABEXPY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZGFNEOFSIW3U7W4EJLESNZ4XN7ABEXPY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 30 Mar 2023 16:43:18 -0700, “Ryan wrote:
> Added Analog Devices MAX98363 SoundWire Amplifier Driver.
> The MAX98363 is a SoundWire peripheral device that supports
> MIPI SoundWire v1.2-compatible digital interface for audio and
> control data.
> 
> 

Applied to

   broonie/sound.git for-next

Thanks!

[1/2] ASoC: max98363: add soundwire amplifier driver
      commit: 18c0af945fa35766730d3f729adcf417a3d1ad5d
[2/2] ASoC: dt-bindings: max98363: add soundwire amplifier
      commit: 276d8c08e82b9f6062f6febc7bc63913829bde27

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

