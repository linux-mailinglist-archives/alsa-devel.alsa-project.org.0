Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A847565C74
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 18:52:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A37F016FB;
	Mon,  4 Jul 2022 18:51:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A37F016FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656953523;
	bh=5DG91bFJ/lqACKXAtXtn0edrSOnOM0AZRWBDwdDB9ek=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A3suKe/fbHKbTFJgypgbfjHh/h1gpo87FNeb0hDlMH3aK0NoKikmcSn8ts3jN7xZ3
	 Z28DDFfbU0qvJUGjJ/SoKg1tslFZPs5KiPF+pOUFHmnBKCEorIziic7/pzhbE1bo6b
	 nQZ3/7H9P2m5DODlt5fAXJkkpyca1eDuIOw5BYMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FDDFF80165;
	Mon,  4 Jul 2022 18:51:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2970FF8014E; Mon,  4 Jul 2022 18:51:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 067C6F8012A
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 18:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 067C6F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="ZQl/wzmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1656953449;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=wQVtKPYuwCaa3kdZ17v1bdxFoy6uTm+y21q5yvZvN+U=;
 b=ZQl/wzmRSNEcf/AzLuHJSGsl5vQn1L35jKYXO1A9sPiQtiUGXq1DCu0l4eILZq1cUA
 3DWmOx0/c6j1yRLkrLlnEbycnxXzEhszVLSPsOBQ3H5qJ9zddCNGdHGGdw2ySQzSuNOB
 1Cyc03UHxuLDV4f0fogSZVWQNLe2ugLlEvvbllAY/PbYVH6mx7Jff4Reg/A0n8YefbQK
 upancp8aEM6AWuSYwJcKqrhy1CALdQA4UB2CE1M86QkgJQ2JWK0MTBsfyc6vsgoup/iO
 ppzumFv/6LgrPy7RS3wcPTLFq53RuKkRf2usR0ZwP/I8qBicUtWbazK2Zb8ip8Y177LR
 2AxA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrKw5+aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.46.1 SBL|AUTH)
 with ESMTPSA id yfdd30y64GomFAU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 4 Jul 2022 18:50:48 +0200 (CEST)
Date: Mon, 4 Jul 2022 18:50:35 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,sdm845: convert to dtschema
Message-ID: <YsMaW6cO2fEfTGPz@gerhold.net>
References: <20220704153824.23226-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704153824.23226-1-krzysztof.kozlowski@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-kernel@vger.kernel.org
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

On Mon, Jul 04, 2022 at 05:38:24PM +0200, Krzysztof Kozlowski wrote:
> Convert the Samsung SDM845 sound card bindings to DT schema.
> 

Nitpick: s/Samsung/Qualcomm

> Changes during conversion: do not require 'codec' under dai-links - not
> present in all nodes of examples and DTS; not required by the driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,sdm845.txt |  91 ----------
>  .../bindings/sound/qcom,sdm845.yaml           | 166 ++++++++++++++++++
>  2 files changed, 166 insertions(+), 91 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/qcom,sdm845.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sdm845.yaml
> 

Can you check if you can just add the compatibles to the existing
qcom,sm8250.yaml? It should be more or less identical given that the DT
parsing code in the driver is shared between all these SoCs.
I already added the MSM8916 compatibles there a while ago.

It also documents some additional properties ("pin-switches", "widgets")
that are supported for SDM845 through the common code but are missing
in its binding documentation.

Thanks,
Stephan
