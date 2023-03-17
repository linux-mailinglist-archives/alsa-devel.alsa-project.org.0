Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 388096BEEA9
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Mar 2023 17:42:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0706FF12;
	Fri, 17 Mar 2023 17:41:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0706FF12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679071328;
	bh=Pfx1OfplKXtSZ7oy2GQi8FZJpWIVZujUx3snzJWO+HY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=H7I2h4M6G0TG4pSfy5HxQcmu8pBh7JVD0lLzndP7+a2NMOB5HOXVaIXKs4DqN6PkY
	 lxTyanvWawFP56NLYHC2aOQV4+Tn9qR1np9dIvpgQ2w6DOaEg+bEfWqW7EI/XIw7Cf
	 +am79OSUCAtW9DLn72d9ixcsM4g4QMd+DN7LZYl4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB72FF80093;
	Fri, 17 Mar 2023 17:40:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EF42F80533; Fri, 17 Mar 2023 17:40:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 99D1EF80272
	for <alsa-devel@alsa-project.org>; Fri, 17 Mar 2023 17:40:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99D1EF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SwqzyT+9
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C9280B8264E;
	Fri, 17 Mar 2023 16:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9820C4339C;
	Fri, 17 Mar 2023 16:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679071244;
	bh=Pfx1OfplKXtSZ7oy2GQi8FZJpWIVZujUx3snzJWO+HY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SwqzyT+9mL3loVh0nPKiufOKPHJmshnp7tQL45K8kmh7/R6YgmTaLKHKi5+Qlf1QS
	 R/QDHJSbOmdco385Q6LnNYcxwA6sFTmOygDSiXBKUPnZmewMtGB8VlQHgnaWRD5jj2
	 60ECubpEaNIDt/nCqLtzrbcIkt6aeJwqseaHeHUrrHCJatDJtd7weW7lAzstMs3KeA
	 wFTJ6YmqWc+4Y0e2IFsfHK2E9JFwaaPvp4CK5sNkKI4x7VJNRnj09fNeCMazaTtFFa
	 e+t31ZgW61kvLfdObkR0EA+N283ZEKZzOlpup6qR8Nh6lBkcLvj2E7tzX7DKB/nOC2
	 j6oMWP2KrM8og==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Vijaya Anand <sunrockers8@gmail.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317092900.16770-1-krzysztof.kozlowski@linaro.org>
References: <20230317092900.16770-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: adi,adau17x1: fix indentation
 and example
Message-Id: <167907124254.46507.14257812881099935258.b4-ty@kernel.org>
Date: Fri, 17 Mar 2023 16:40:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: 2V3FTGL4RKG6OXWBQ4C3LQKCQICQGS33
X-Message-ID-Hash: 2V3FTGL4RKG6OXWBQ4C3LQKCQICQGS33
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2V3FTGL4RKG6OXWBQ4C3LQKCQICQGS33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 17 Mar 2023 10:29:00 +0100, Krzysztof Kozlowski wrote:
> Fix errors in binding indentation and example:
> 
>   adi,adau17x1.yaml:8:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
>   adi,adau17x1.example.dts:29.3-30.1 syntax error
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: adi,adau17x1: fix indentation and example
      commit: b36bf721578bfe8229c1d7f2fcd0bd021cc8b2f4

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

