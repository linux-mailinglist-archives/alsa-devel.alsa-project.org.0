Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7191F69845E
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Feb 2023 20:20:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84934AE8;
	Wed, 15 Feb 2023 20:19:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84934AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676488803;
	bh=8GWjqreOHv2W/xsRv67Y//DXKDgBWI0OWSUAjgSvAVQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=or4Oz5o7Ciq5mg8gex5GopZQ6V0xb/iQLLFTaMzPvYy0Fl4pVu9HXmdqNnqQMzPCw
	 FYVVodb4kvhuIsZ7YQw8a/++cZaNk21+FJfUXuTydiVNB3smbD4L7y4pntgbwXRuMd
	 FadunpcKapqbd8s3zUU7BplLx2cq904o/mC7es8w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DDE8F800E3;
	Wed, 15 Feb 2023 20:19:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5EFF7F800E4; Wed, 15 Feb 2023 20:19:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6ED83F80083
	for <alsa-devel@alsa-project.org>; Wed, 15 Feb 2023 20:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ED83F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hnQg+Ob1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DE05761BD5;
	Wed, 15 Feb 2023 19:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22671C433D2;
	Wed, 15 Feb 2023 19:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676488739;
	bh=8GWjqreOHv2W/xsRv67Y//DXKDgBWI0OWSUAjgSvAVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hnQg+Ob1o4x1ag1phNPXzCCPePM7FpcHoMw2E2NvCAKiZD8lJLVz8piHK+EUzctPG
	 9Z/veiyEXLSYwlG6xGUEuADeQiwaQWQyG6ZTDxAqYQ3C8dTZ+Y8UZPCvChRiA1kTpc
	 QVbkSBzS+FgL6gfGYpMOd8y3+Pd7BwMX+3IrsvdE7l0bOeftmZ+cW2LBfDoSkzhDP9
	 EC74qv/UIWtObUNzeEqMugqxSwAPmqlD3cc4nLq1Kwm9XoUxPJTmSH+7QbFln1z37W
	 PLIcEC0wh8SWJiX+P4hMnxdiPejTz7OUhFxNEbfcJHeLvNWNhjoqVgLtvCf85SZRjo
	 sNk4xeDcfOK4g==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: (subset) [PATCH v2 1/7] arm64: dts: qcom: ipq6018: align RPM
 G-Link node with bindings
Date: Wed, 15 Feb 2023 11:21:01 -0800
Message-Id: <167648885791.1615253.5210458428567341276.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
References: <20230208101545.45711-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WMYLTFCDT5CNHZ2JIHN47JOJUZTDCNML
X-Message-ID-Hash: WMYLTFCDT5CNHZ2JIHN47JOJUZTDCNML
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WMYLTFCDT5CNHZ2JIHN47JOJUZTDCNML/>
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

[4/7] dt-bindings: mailbox: qcom,apcs-kpss-global: drop mbox-names from example
      commit: 7c855ef7137a67bcff0e039691b969428dd8ef6a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
