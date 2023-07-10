Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7564E74CBB6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 07:05:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C381201;
	Mon, 10 Jul 2023 07:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C381201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688965545;
	bh=Pn51inwL0+VVRq9VNt7wQuq0UyK+Y8GDVGVvxdrJGiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mBHa5yiVzxuAYieAS+KyBMpd92adtdLGJOvwZpbt1WGmZrbs/+OHIykwvShZ8aYFp
	 8eRFCyIBtQ3qTNo5MGqoFwbUmF6Oi2Bh4bCnxXoWYMkaPxGL1wlzdaUEO71hByqZDC
	 ezBegwdZddkMMDd5StY6cq5KA7veKh7S8OPQw3U8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22CB8F8024E; Mon, 10 Jul 2023 07:04:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 545EDF80153;
	Mon, 10 Jul 2023 07:04:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A4C0F80249; Mon, 10 Jul 2023 07:04:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59DB1F800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 07:04:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59DB1F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XX6v8aPx
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9C8EE60DE8;
	Mon, 10 Jul 2023 05:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E560EC433CA;
	Mon, 10 Jul 2023 05:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688965469;
	bh=Pn51inwL0+VVRq9VNt7wQuq0UyK+Y8GDVGVvxdrJGiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XX6v8aPxzpMoqCl9HMyBP50yVhvMwDKz11kZmcjLutRgatJnLREb4GGpH8l3rygB5
	 azm16jn3XVfOwqZHBuk7t7NeKW+JNUHdaxm7teLwMGKNMNQb7rjJAntX03wfXbcg4X
	 e38Kxtoh7rKi140So9jviJSLik2NhGLXj+Hq0ujQrsegEBVuzaeNxvXBnNIDDytsMz
	 BZH5zzFZevrCykC9rElK7cAJ31aHvjLSH4YBctz3KMqYt8bIeu5bJBErpejjNfANJe
	 sb28fuMJGqT/cLWfSmr5TxmiczzsTZIfgvcz7V9huTxLSLmOvc8tbiUvLKSPXx5Mcm
	 Sd+/ycIZUBkzA==
From: Bjorn Andersson <andersson@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Andy Gross <agross@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Benjamin Li <benl@squareup.com>,
	James Willcox <jwillcox@squareup.com>,
	Joseph Gates <jgates@squareup.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Zac Crosby <zac@squareup.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Jun Nie <jun.nie@linaro.org>,
	Max Chen <mchen@squareup.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	Vivek Gautam <vivek.gautam@codeaurora.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	alsa-devel@alsa-project.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Leo Yan <leo.yan@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Andy Gross <andy.gross@linaro.org>
Subject: Re: (subset) [PATCH 00/11] Even more msm bindings fixes
Date: Sun,  9 Jul 2023 22:07:10 -0700
Message-ID: <168896565982.1376307.13166434967387866925.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
References: <20230627-topic-more_bindings-v1-0-6b4b6cd081e5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AWFHSMVTLSAOEKIDQ2D2BW6RVCKUDMJQ
X-Message-ID-Hash: AWFHSMVTLSAOEKIDQ2D2BW6RVCKUDMJQ
X-MailFrom: andersson@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AWFHSMVTLSAOEKIDQ2D2BW6RVCKUDMJQ/>
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

Applied, thanks!

[01/11] arm64: dts: qcom: sc7180: Fix DSI0_PHY reg-names
        commit: afc19e3716c3bc32c31baac54e3a9057661979ad
[02/11] arm64: dts: qcom: msm8939: Drop "qcom,idle-state-spc" compatible
        commit: 982f810fc196002808b6d4230ba8f431c993d264
[03/11] arm64: dts: qcom: msm8939: Add missing 'cache-unified' to L2
        commit: 68a59251f1c590ad567ff7fd799f6634fbab6e16
[04/11] arm64: dts: qcom: apq8039-t2: Drop inexistent property
        commit: 9cc6dee9b3a8aea0af836d365793ffce47bc7a11
[11/11] arm64: dts: qcom: msm8996: Add missing interrupt to the USB2 controller
        commit: 36541089c4733355ed844c67eebd0c3936953454

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
