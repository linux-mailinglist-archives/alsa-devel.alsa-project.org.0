Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0CB5BA9BA
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 11:55:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F5AB1AA1;
	Fri, 16 Sep 2022 11:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F5AB1AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663322148;
	bh=DQdYvm4gHQ2HiNeRIU1kRsiNIz8EjW/A285YWUqULzs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ds5vXOilwZj5ydGqYxz1n19bJq7tJoRyryKiop7E94CtLuEPLwJuNsSzFZEEyV2OC
	 Y3m1ET8rcClT7TUyQFvZMGZeNU5NYpZgaZVZaqHSPZoI+bD9buCHHqU2BugpF4d0PX
	 5A72wLCVrbbELqHctbhZYxq5nQVWPKDiCN1wOkUU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7470CF80549;
	Fri, 16 Sep 2022 11:53:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2A52F80238; Thu, 15 Sep 2022 04:25:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CF0EF800FE
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 04:25:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CF0EF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UN3olh1Q"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDF126203D;
 Thu, 15 Sep 2022 02:25:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C034C433D6;
 Thu, 15 Sep 2022 02:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663208723;
 bh=DQdYvm4gHQ2HiNeRIU1kRsiNIz8EjW/A285YWUqULzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UN3olh1QPPRsS7euylq9wdzIceFii8blDsKxgfyURpEP5ck4MaGaaCy4rtXEY9pJR
 URqToh3uurq5cEpATX9dotdWcoAvrY3JasMLYNU/N+/LoARagns8YJIIOFCBQ3AjL+
 EtvubqlEgvgujyo+SpxmHOTgFRU5P+0C2v9Sn+jF78y7XhMD4dPQ40vMIQCeeUyfP9
 Puk/frVo8tqBmbohHRN8LOT9MDbEOQ+NMHqrHAb+gHQWZxF+OR0FamP9RJTAYE+S8K
 UrGmaXFMOwxFivhb5F5qX3pqQD993TbH+CDZnj0ukdyr8+ILy+J4sr3xK7GOUsmXjF
 vjQJp04bRX3Mg==
Date: Wed, 14 Sep 2022 21:25:20 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: MAINTAINERS: add bindings and APR to Qualcomm
 Audio entry
Message-ID: <20220915022520.kke2t6sylo27jmgd@builder.lan>
References: <20220907102311.38428-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907102311.38428-1-krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Fri, 16 Sep 2022 11:53:36 +0200
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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

On Wed, Sep 07, 2022 at 12:23:11PM +0200, Krzysztof Kozlowski wrote:
> Extend the Qualcomm Audio maintainer entry to include sound related
> bindings and the Qualcomm APR/GPR (Asynchronous/Generic Packet Router)
> IPC driver, which is tightly related to the Audio DSP.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Bjorn Andersson <andersson@kernel.org>

> ---
>  MAINTAINERS | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0350effebe8f..453dc6fd0b80 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16710,6 +16710,9 @@ M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>  M:	Banajit Goswami <bgoswami@quicinc.com>
>  L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
>  S:	Supported
> +F:	Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
> +F:	Documentation/devicetree/bindings/sound/qcom,*
> +F:	drivers/soc/qcom/apr.c
>  F:	include/dt-bindings/sound/qcom,wcd9335.h
>  F:	sound/soc/codecs/lpass-rx-macro.*
>  F:	sound/soc/codecs/lpass-tx-macro.*
> -- 
> 2.34.1
> 
