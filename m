Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DD5696B86
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 18:29:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC4A4857;
	Tue, 14 Feb 2023 18:28:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC4A4857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676395762;
	bh=13vIi1ckUu3/aumbSCkzljgpO2EtfLful4/vNSEbxF8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b4ZvTJwsiLobDIHhp58JtbMm3L7faOaxsymDFdzEKMyUJXkke9ua+fTpmSSJT9v+y
	 nQrClnfQRA//551DcX3KUOe5Vjp81fggwyWlemeTRsjUTmqaD6pTCoNbBGepnJJkF9
	 0vsblDmxKMYuHwnyvf3u17XVHqVZoNqEdAGjaJBA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 236A2F800F0;
	Tue, 14 Feb 2023 18:28:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 775A5F801C0; Tue, 14 Feb 2023 18:28:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 927FFF800B6
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 18:28:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 927FFF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aT2Bl8Ny
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 238CA61782;
	Tue, 14 Feb 2023 17:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF507C433A0;
	Tue, 14 Feb 2023 17:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676395697;
	bh=13vIi1ckUu3/aumbSCkzljgpO2EtfLful4/vNSEbxF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aT2Bl8Ny5fS4v3KYPoPJxFW/YcawNoaYqRbr5Qp15/YcCzqFruiSGB2x4ZM9KCZRm
	 a1HKnFgKfY4wJF5PINp3cQFnSHlJmiKDNkpaHNyDa3LFl1lz2RyUIlwkQQkVDL+Li6
	 oACppWOj+5Gq64KivVEcKgD1WnUeyD0qihZzIw+zAL58Yi5gOKJhEYckpjYLKg5MPd
	 J+H4BbWAK63jhCJ/wp4uJv1b5eU3G1GsEKCZDvGn44CydakZKxH2A20695hvfzGgQi
	 G2cA/QkOd2JYS+HPLpK5sZkeT8W8tpwvGj2pcLIisQyM+7NI68AtwdV2zl85lM2NoY
	 jMbX33woNACWQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Banajit Goswami <bgoswami@quicinc.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Andy Gross <agross@kernel.org>
Subject: Re: (subset) [PATCH v2 1/7] arm64: dts: qcom: ipq6018: align RPM
 G-Link node with bindings
Date: Tue, 14 Feb 2023 09:30:15 -0800
Message-Id: <167639581474.996065.4144950480631659648.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZD43YF7QCVOS3EEHH6QAWYYVAAJJQDZI
X-Message-ID-Hash: ZD43YF7QCVOS3EEHH6QAWYYVAAJJQDZI
X-MailFrom: andersson@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZD43YF7QCVOS3EEHH6QAWYYVAAJJQDZI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 8 Feb 2023 11:15:39 +0100, Krzysztof Kozlowski wrote:
> Bindings expect (and most of DTS use) the RPM G-Link node name to be
> "rpm-requests".
> 
> 

Applied, thanks!

[6/7] dt-bindings: remoteproc: qcom,glink-rpm-edge: convert to DT schema
      commit: fdafdddf7b2f5cab8d233ef97f1fad8ec7d2e7a0
[7/7] dt-bindings: remoteproc: qcom,glink-edge: correct label description
      commit: 6f9c2f19a8743c880903a031c7f3f3c534d4b813

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
