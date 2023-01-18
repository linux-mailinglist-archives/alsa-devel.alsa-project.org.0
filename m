Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A273671E18
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 14:38:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9781D21ED;
	Wed, 18 Jan 2023 14:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9781D21ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674049116;
	bh=ePgAPHOhTVOksHn0s2syMgYNYHXIHMPRSxnZp4wJ/38=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WHo3aL6cRv2WQhzCrexZBOAXfhlihyjgZv9IlZmohmQjKEtgPV/djb69C9bGlxSW/
	 MfeAQMVoQgXnpMrfKutQzcY58uDkUECntSMNxpOVDaHiPyZ5pEJUe3wQ4hGEcBCnRc
	 77a7D6aG1u7ZASM9SyUjEOboq+S7czDBsIloBDQ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D36E3F80587;
	Wed, 18 Jan 2023 14:19:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85BD4F80580; Wed, 18 Jan 2023 14:19:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AC88F8057C
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 14:19:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AC88F8057C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ia5UQJco
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A51E617E1
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 13:19:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9E0C433F1
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674047986;
 bh=ePgAPHOhTVOksHn0s2syMgYNYHXIHMPRSxnZp4wJ/38=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ia5UQJcongu0X+ElLOSAtjQ1h1Z4S8tC04z/rG10+8rBeyzSAG+V4BT6/5C0IPSe5
 AaeNqgUaa0LWvfxRH4MDg7CxNPUrjB5RvCqiKJzFlFnqtOwORYtqxveFLmv0JBcIfd
 /JJ3AgX+e0Rq8Pz2ob9MAnVqKiOg4UDw6YzMVaX0f500Dl+dowhGo+bL1FjyU6k2bH
 w6mVhx6OWVFU7z++pOiffB/9KSR20DlnpNNgHA3yrmPzA8LkznjS7LEA6ntUDAWHwt
 aBUg/YgXl7oVEWkCLy1QhaZMm8nANXwJrm0xJB3gvXRFQuU8pyXMS4Q8tyx0Qj5HZU
 7Wx4HcKaK8Hpg==
Received: by mail-vs1-f41.google.com with SMTP id k4so35635277vsc.4
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 05:19:46 -0800 (PST)
X-Gm-Message-State: AFqh2koC0s3N6/xPIXRF0dUxFLOwxepnGxroqifHQH3+8myJ/GEkRMJA
 ZSVGSbezgPsrsV7TvDMg6Nk3jYPgsLvkBDJWFA==
X-Google-Smtp-Source: AMrXdXux9aAlM451KGBma1Qs2rJpTOL4EbQDljgAz6sNK/elrsA2uBmlRu/x//wMYoC5wIXCvkWkR51ZCIzD8PoAZoA=
X-Received: by 2002:a67:f506:0:b0:3d3:c767:4570 with SMTP id
 u6-20020a67f506000000b003d3c7674570mr1026153vsn.85.1674047985721; Wed, 18 Jan
 2023 05:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20230113162214.117261-1-krzysztof.kozlowski@linaro.org>
 <20230113162214.117261-2-krzysztof.kozlowski@linaro.org>
 <20230117192724.GA3489389-robh@kernel.org>
 <331eed95-eaf7-5c5a-86c1-0ee7b5591b9a@linaro.org>
In-Reply-To: <331eed95-eaf7-5c5a-86c1-0ee7b5591b9a@linaro.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Jan 2023 07:19:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJUTFa24iZ2fovE_yJdBVcbkcUX8rBoPB12ptdAyxHW6g@mail.gmail.com>
Message-ID: <CAL_JsqJUTFa24iZ2fovE_yJdBVcbkcUX8rBoPB12ptdAyxHW6g@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: qcom,
 wcd934x: Describe slim-ifc-dev
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 18, 2023 at 5:25 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 17/01/2023 20:27, Rob Herring wrote:
> > On Fri, Jan 13, 2023 at 05:22:13PM +0100, Krzysztof Kozlowski wrote:
> >> The "slim-ifc-dev" property should not be just "true", because it allows
> >> any type.
> >
> > Yes, but it is common, so it should be in a common schema. Though
> > there's only one other binding using it (wcd9335.txt).
>
> This is still wcd9335 and wcd934x specific, not really common. Maybe
> next Qualcomm codec would also bring it so then we can define common
> schema for the codecs. But so far I think it is not really a common
> property.

By common, I only mean used by more than 1 binding. That's already the
case, there's just not a schema for the 2nd one. In any case, can
address that later.

Acked-by: Rob Herring <robh@kernel.org>
