Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EDC567583
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 19:23:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 755E016EC;
	Tue,  5 Jul 2022 19:22:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 755E016EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657041827;
	bh=n34WtJdH1aD0+wLJG5QJCb9izo1xt3VZGBDRFhbgyQ8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EAf0mKmkwthGb7ASmrZBULO9Y4QjLC5HzIg5xmx+4Eg4wnqIyvMUfohDmjO+lvyO/
	 rJXemRAwrvbfGIivFHvRZs73KJNU7OCO8UkxfYH/Awt+SkbiuEWzKI3L+QowvAjdm+
	 C7/MjROnt8TLuPld1jIMsiJcSxzF8rJyUOaeLz/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6BCDF80212;
	Tue,  5 Jul 2022 19:22:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5187F8015B; Tue,  5 Jul 2022 19:22:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [81.169.146.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5639BF8012A
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 19:22:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5639BF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="RwfwTDgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1657041761;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=HFYLwNx1H8mjeDZMNkwynQXaKLcSPoHxU5fEPC/aXCs=;
 b=RwfwTDgJhnm3cucVgXUdFD6HkllRAJSb0TRzees0NoNV1aUDKowYOeFBGPOMzGjxuD
 uwgjWj0pTFoesUCzGIjFiUpONMvEwxpOu28CMTNUkp8KoUFX877OK8GzQ4u1A4JNTS9g
 wM3N8BnsZecYypOIooAhAUlwBpQRQKuEbTTZxIL7rVlTO1+9RcNHsaFrhgCNAHGYbuQ7
 bTX66XAAyBxwccZqpFnIopcujY+7ICZRiejuIMDtEdu/gtlG0ZD74qMCsvNv38h/VYAu
 fKbPcnxIlG5I2I+v/wyOB5G6fsEIJcFcmEG3ArdyxJAyTc/b/LZBEKa3llzPekS0X7dT
 57Wg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK85/aY="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 47.46.1 AUTH)
 with ESMTPSA id yfdd30y65HMfJ52
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 5 Jul 2022 19:22:41 +0200 (CEST)
Date: Tue, 5 Jul 2022 19:22:40 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ASoC: dt-bindings: qcom,sdm845: convert to dtschema
Message-ID: <YsRzYKAjA7LBVf86@gerhold.net>
References: <20220704153824.23226-1-krzysztof.kozlowski@linaro.org>
 <YsMaW6cO2fEfTGPz@gerhold.net>
 <61708384-6c29-6bb6-aef0-8bad061c1f7c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61708384-6c29-6bb6-aef0-8bad061c1f7c@linaro.org>
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

On Tue, Jul 05, 2022 at 09:32:07AM +0200, Krzysztof Kozlowski wrote:
> On 04/07/2022 18:50, Stephan Gerhold wrote:
> > Can you check if you can just add the compatibles to the existing
> > qcom,sm8250.yaml? It should be more or less identical given that the DT
> > parsing code in the driver is shared between all these SoCs.
> > I already added the MSM8916 compatibles there a while ago.
> > 
> > It also documents some additional properties ("pin-switches", "widgets")
> > that are supported for SDM845 through the common code but are missing
> > in its binding documentation.
> 
> I thought about merging these but then I would have to disallow these
> properties, as I assumed these are not valid for SDM845. Are you saying
> that pin-switches and widgets are actually valid for SDM845?
> 

Yes. I haven't tested it but it's implemented in the common DT parsing
code and I don't see why it wouldn't work. These are optional properties
that are only needed in certain special audio configurations. There
might be a SDM845 board out there that needs them. :)

Thanks,
Stephan
