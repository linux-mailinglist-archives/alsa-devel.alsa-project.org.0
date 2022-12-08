Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 421386473AF
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Dec 2022 16:58:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB9C3191A;
	Thu,  8 Dec 2022 16:57:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB9C3191A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670515118;
	bh=Lu2ukRuwJQ5sD2B1Vt7v8/RFdBuigEu0Y3uzSBNJohU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H9cYMHyQCfjw+3Wi8iHVNEnBN9DemwV0bU9wZ73kq4T54fYjIbi2t3t71M4Vot7nc
	 dxP8zGrLga44eeV8R69oc/oWQZsM+6z1EwTGWduVWF3MdXzB4HBpgKKrtq1UUiYJqu
	 H1lNc1C87ehq4JepXKe7KRcPIr+HzmCXoOQKrlgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77CC9F80089;
	Thu,  8 Dec 2022 16:57:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4958F8024C; Thu,  8 Dec 2022 16:57:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D72C5F801D8
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 16:57:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D72C5F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D5L3qOqE"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2130BB822AF
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 15:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F35C433B5
 for <alsa-devel@alsa-project.org>; Thu,  8 Dec 2022 15:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670515051;
 bh=Lu2ukRuwJQ5sD2B1Vt7v8/RFdBuigEu0Y3uzSBNJohU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D5L3qOqEbM/owqy4PQggYUmTR8JbgrwviOoY4E4u8OBk93FkurGuoTuF8dWr6Lj0N
 PR7Ff+x91xvyz0UODDhCo/i2xATLSystqDN4ZKiAU/RhFm65kdZXf9xjxA89FJVAzL
 S9UDm7UPIJgpR4dyv//ilH1sZ7HpjRhvxMAL1hYwGFT0zMhPyCIX8UWqN2hzZ+QO9t
 J0Yo3g3Ylehj9M/u65pXw5dF22BgGN8Bo6UIOnJUP5AdgIOQM3xpIk54UAyKJl3+IS
 gYfvkunlsDuA2R/5gUDSNY5s4XHXX+qyJCqy1pWG94LrV4yyf+NHqrRuF7DZbmbuB/
 6/5igH3E1sj0Q==
Received: by mail-vs1-f44.google.com with SMTP id t5so1836998vsh.8
 for <alsa-devel@alsa-project.org>; Thu, 08 Dec 2022 07:57:31 -0800 (PST)
X-Gm-Message-State: ANoB5pmmEv1aKy07Le0+uvW/3ZiwMlVs5eZDsEojsycQoIxNfj5UgO4/
 RYt7kjE4R8i3R3tDSfEl4YnHzJ1tHGjnvs6xtw==
X-Google-Smtp-Source: AA0mqf4yuhDONNJsRFGAFHqxU8nxx3OP+EV2sEqtLI8yuo8fBJJfDtDFo/Rmxy0u05gAvo+gPcLGeh3ld6J4XGyGO6w=
X-Received: by 2002:a67:af07:0:b0:3b1:1713:ba12 with SMTP id
 v7-20020a67af07000000b003b11713ba12mr13069517vsl.6.1670515050721; Thu, 08 Dec
 2022 07:57:30 -0800 (PST)
MIME-Version: 1.0
References: <20221208122313.55118-1-wangweidong.a@awinic.com>
 <20221208122313.55118-6-wangweidong.a@awinic.com>
In-Reply-To: <20221208122313.55118-6-wangweidong.a@awinic.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 8 Dec 2022 09:57:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL8SScxB+TiML1joKKWQ_vZQ8+We+C-x84mYX0JsysSzA@mail.gmail.com>
Message-ID: <CAL_JsqL8SScxB+TiML1joKKWQ_vZQ8+We+C-x84mYX0JsysSzA@mail.gmail.com>
Subject: Re: [PATCH V6 5/5] ASoC: dt-bindings: Add schema for "awinic, aw883xx"
To: wangweidong.a@awinic.com
Content-Type: text/plain; charset="UTF-8"
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 ckeepax@opensource.cirrus.com, tanureal@opensource.cirrus.com,
 duanyibo@awinic.com, liweilei@awinic.com, tiwai@suse.com, zhaolei@awinic.com,
 cy_huang@richtek.com, yijiangtao@awinic.com, broonie@kernel.org,
 zhangjianming@awinic.com, krzysztof.kozlowski+dt@linaro.org,
 quic_potturu@quicinc.com
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

On Thu, Dec 8, 2022 at 6:28 AM <wangweidong.a@awinic.com> wrote:
>
> From: Weidong Wang <wangweidong.a@awinic.com>
>
> Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
> controlled using I2C.

blank line

Pretty sure I said this before, but resend to the DT list if you want
this reviewed.

> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  .../bindings/sound/awinic,aw883xx.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
>
> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> new file mode 100644
> index 000000000000..b72c9177ebb7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/awinic,aw883xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Awinic AW883xx Smart Audio Amplifier
> +
> +maintainers:
> +  - Stephan Gerhold <stephan@gerhold.net>
> +
> +description:
> +  The Awinic AW883XX is an I2S/TDM input, high efficiency
> +  digital Smart K audio amplifier with an integrated 10.25V
> +  smart boost convert.
> +
> +allOf:
> +  - $ref: name-prefix.yaml#

I think this file has now been renamed upstream.
