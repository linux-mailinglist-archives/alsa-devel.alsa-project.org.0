Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD51644B57
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Dec 2022 19:21:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F31FF17BF;
	Tue,  6 Dec 2022 19:20:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F31FF17BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670350875;
	bh=K7svBsNTuBhFucxOsO+b5wqi3+zBS24vo4ReVXgk9c4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Akxeonn9nMYU+FExpcCt8V52A0lJe4mBZ7khSlXe7tEm4SmS+3GnOBZOqq4pK3vE+
	 bTCQZyX/qMWSiLLFj3KuAPrDhSmO1RyiGRmo6jb/trQXho78EkkA2JSxO6rJxEqF2t
	 Bc4CdJViKRV2D/mbXI1OxhUigVmYbboVx3fD3B10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2FEBF80155;
	Tue,  6 Dec 2022 19:20:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 749A9F80290; Tue,  6 Dec 2022 19:20:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 525E1F80121
 for <alsa-devel@alsa-project.org>; Tue,  6 Dec 2022 19:20:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 525E1F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VhJDp/T8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F287ECE1AFF;
 Tue,  6 Dec 2022 18:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A4E6C43470;
 Tue,  6 Dec 2022 18:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670350810;
 bh=K7svBsNTuBhFucxOsO+b5wqi3+zBS24vo4ReVXgk9c4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VhJDp/T8ofFPGMhfOP3GACjubFAb5WA4pXgDoojbje8E12WPpXlQhaLGq7RbglcwO
 ZpT2ximHWsmDWJthVSfM3A/Rh2SZ/y+2kVYQgXklSljphVWVP3dnC4mxe09VDQumQG
 T8RUUeF/nbXjqmbAR2NA5Ol/15rYBPjP25waS0WyAgRSZLyvEFgUhc2XtabwlC8Y00
 xy+zAmNeS3kXzkmSTbx0C5ZOYQT9BO2QiNFiybCm9DfSLbjhsjhsNVD4tN09HpzRjM
 0HgFSW/dMrWiVt3Uo9AkTPqbLHR0BD7xvqPFQl+Lyd5WueKAgc+nUEhvq4IVanOZP+
 ZL16bfdE8YHOg==
From: Bjorn Andersson <andersson@kernel.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 konrad.dybcio@linaro.org, bgoswami@quicinc.com, alsa-devel@alsa-project.org
Subject: Re: [PATCH] dt-bindings: soc: qcom: apr: document generic qcom,
 apr compatible
Date: Tue,  6 Dec 2022 12:19:16 -0600
Message-Id: <167035076353.3155086.4461257223662824256.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221201133637.46146-1-krzysztof.kozlowski@linaro.org>
References: <20221201133637.46146-1-krzysztof.kozlowski@linaro.org>
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

On Thu, 1 Dec 2022 14:36:37 +0100, Krzysztof Kozlowski wrote:
> Document the qcom,apr compatible, used by Qualcomm Asynchronous Packet
> Router driver.  There are no upstream DTSes using this compatible -
> instead we have ones with APRv2 (qcom,apr-v2).  The driver does not make
> distinction between both compatibles, which raises the question whether
> the compatible is really needed.  Document it (as compatible with v2)
> for completeness.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: soc: qcom: apr: document generic qcom,apr compatible
      commit: 9ed8503114ccbfd116f18143a3604b9f1155ee9e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
