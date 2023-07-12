Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A97750701
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 13:50:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D97385D;
	Wed, 12 Jul 2023 13:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D97385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689162606;
	bh=QhVaK0LsU7eehMipwwCOTnQKn7A7QZ/0f5Q1VZIwGuA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dbuoMknWqN0A/+gXrdgYzUHVVyc7lhP+6aI6uIa5fHyq0u3vh69ctTqI+t66BYO6P
	 R5M2YJvIZcyxE4nanUmaswJhCwDqRXFaTQojuMBvKw61smsxA4iTSSV8WOgHSrTTBQ
	 GCoIllP9NHz9rFDohWphwwF79kzwzcKtNaCeTfx4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2234CF805D8; Wed, 12 Jul 2023 13:47:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5703EF80153;
	Wed, 12 Jul 2023 13:47:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 548E4F805D6; Wed, 12 Jul 2023 13:47:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66C4BF805CA
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 13:47:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66C4BF805CA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GUdoi12+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E222617AA;
	Wed, 12 Jul 2023 11:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14254C433C8;
	Wed, 12 Jul 2023 11:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689162422;
	bh=QhVaK0LsU7eehMipwwCOTnQKn7A7QZ/0f5Q1VZIwGuA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GUdoi12+nwBnrPTbxYZ2a9geyEqe0U28by0VFwg6tqYv117M3vJeo7W/c3Pf+4e79
	 r2F0W5C/3UO3uWWhtMs/W70+WVAtPg6XXuuAqOhcLxR9qj9zDMgABk3t4NgHH+Dk/B
	 BxY/P+ZUcLNmE5YBLA+Dtu+huFUqYJwg75B5MHnv4mR/QPOc8U81qsaUeEj81gMPvu
	 /Bu9qNp5H337C4v2CNQhCHMPKOlb4szHXTtmmNdzjicIAk24uoczmt7db7QUR/dBbG
	 p9wmn7CIh20RMyzN0MbM2MyCNcUQhjq/s5IV+/jEfsnU0L2X0zrAXnrgbGzuiRNMiy
	 wFPmrWQk+3Plg==
From: Mark Brown <broonie@kernel.org>
To: cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Benjamin Li <benl@squareup.com>, James Willcox <jwillcox@squareup.com>,
 Joseph Gates <jgates@squareup.com>, Stephan Gerhold <stephan@gerhold.net>,
 Zac Crosby <zac@squareup.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>, Jun Nie <jun.nie@linaro.org>,
 Max Chen <mchen@squareup.com>, Shawn Guo <shawn.guo@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Vincent Knecht <vincent.knecht@mailoo.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, alsa-devel@alsa-project.org,
 iommu@lists.linux.dev, linux-usb@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, Rob Herring <robh@kernel.org>,
 Andy Gross <andy.gross@linaro.org>
In-Reply-To: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
Subject: Re: (subset) [PATCH 00/11] Even more msm bindings fixes
Message-Id: <168916241380.46574.15546639128394124503.b4-ty@kernel.org>
Date: Wed, 12 Jul 2023 12:46:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: PT3BAUD67YBCNDWSNM5AWP23T2Z32R2T
X-Message-ID-Hash: PT3BAUD67YBCNDWSNM5AWP23T2Z32R2T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PT3BAUD67YBCNDWSNM5AWP23T2Z32R2T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 27 Jun 2023 18:24:16 +0200, Konrad Dybcio wrote:
> This series contains couple more random dt schema warning fixes, centered
> around linux-msm.
> 
> All of the patches (except) the last two are pretty much independent.
> Patch 1 is not only a bindings fix, but also a functional one.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[05/11] dt-bindings: sound: Convert pm8916-wcd-analog-codec to YAML
        commit: e125891c2ed6f6d3f59375caf04d76802c86efae

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

