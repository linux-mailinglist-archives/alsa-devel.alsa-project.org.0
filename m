Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D756021D3
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 05:07:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 199EB9353;
	Tue, 18 Oct 2022 05:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 199EB9353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666062477;
	bh=JFNICyKeny+tINq324fO8epEvYuRC2wZJfQlwrtzGZ0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Tgbrc5SAqJN6h0wGDdNzrXExWskZ1+NRW/+VTfYeHEQJH+gpA4EWF487h5OcntE9t
	 xmKfUFQbmNHdzf1z1KwFmV49rkKfdF5RBfPmP809Jpdvhs06qAOGgc45/xtWGjdJ8G
	 eVJZA0sREbscOjlOzFl1A1M4dr5fyqBVXJdvFx2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92D1EF804BD;
	Tue, 18 Oct 2022 05:07:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F30CF8024C; Tue, 18 Oct 2022 05:07:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7543F800E5
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 05:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7543F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FwCLPkvJ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B16F761372;
 Tue, 18 Oct 2022 03:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D8BC433C1;
 Tue, 18 Oct 2022 03:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666062415;
 bh=JFNICyKeny+tINq324fO8epEvYuRC2wZJfQlwrtzGZ0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FwCLPkvJIo44h/z591PLBfx05Fm+YPRJIJVDwXb6iT7kQqOjlSUNCgPoBn9o1Yik7
 pqkxoWHbUyrn/NhraWMcPJ6UiC7MRKzjB/cJAC+x/CoaMPDMz5fvoHZvWj4rFXUz7A
 +cqk87fNeQcPcymq9Nr5AcGe+yhP6ejOm7pVXM0JZG3wnyClhjseybe6KC8cl+Uc9/
 I75yJNJf81sMLkEb7BvZTSF/R6pJYnFHp63Kd8nzwoJAC2LT4Vnes1X/+XW2EXHNWw
 48+EfkvO1ms7aHuf42uhIseYqYd/hAgvb8R++OiB/t3i2W/d9TBUcQMpfufDoa117r
 ksmFkjsaexh4g==
From: Bjorn Andersson <andersson@kernel.org>
To: alsa-devel@alsa-project.org, Bjorn Andersson <andersson@kernel.org>,
 devicetree@vger.kernel.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, agross@kernel.org,
 srinivas.kandagatla@linaro.org, broonie@kernel.org,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: (subset) [PATCH 00/12] ASoC/qcom/remoteproc/arm64: Qualcomm ADSP
 DTS and binding fixes
Date: Mon, 17 Oct 2022 22:05:29 -0500
Message-Id: <166606235836.3553294.657732618044727508.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 6 Sep 2022 14:16:43 +0200, Krzysztof Kozlowski wrote:
> Dependencies/merging
> ====================
> 1. The DTS patches are independent.
> 2. The binding patches should come together, because of context changes. Could
>    be one of: Qualcomm SoC, ASoC or DT tree.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied, thanks!

[01/12] arm64: dts: qcom: sdm630: align APR services node names with dtschema
        commit: aa27f316de7fbf3155ffde20a6daa4041d15ac5e
[02/12] arm64: dts: qcom: sdm845: align APR services node names with dtschema
        commit: a3692a5edc5681d47fede71efeeaa065ebcad8d9
[03/12] arm64: dts: qcom: sm8250: align APR services node names with dtschema
        commit: a22609bf9fee17f9045b5b1847f2585200cd1920
[04/12] arm64: dts: qcom: msm8996: fix APR services nodes
        commit: c05b95d3286734c83e384240eb41d9867ce11027
[05/12] arm64: dts: qcom: sdm845: align dai node names with dtschema
        commit: 074240974e08a50faf434fa61c8bb7859871c774
[06/12] arm64: dts: qcom: msm8996: align dai node names with dtschema
        commit: 6b401d49395c3fbb082e84c1df3ad77495876c18
[07/12] arm64: dts: qcom: qrb5165-rb5: align dai node names with dtschema
        commit: cf4a15e409ff1287506fac51c343821d846fc1bc
[08/12] arm64: dts: qcom: sm8250: use generic name for LPASS clock controller
        commit: e0b6c1ff512db643050e4a09020d7c0b69c82807

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
