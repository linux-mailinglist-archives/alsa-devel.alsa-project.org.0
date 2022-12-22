Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF4A654440
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 16:25:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15AB549AE;
	Thu, 22 Dec 2022 16:24:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15AB549AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671722734;
	bh=L0BWYCZqJYOlBogaq8zX7/5U7AtBKqhd5IIeEPqQCmU=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JsCoJyFTQlzmIUmGFJ4iGiprwyfmavy2NVfLVVrkCfTY2Q9zp9lZkvLWpMPVqY5RU
	 XnoCdvjK1mq4hGiKSK1lKTjTKl6rRKo32T5UZufb2UcREGM8Tv1tlglyJoneqFEmHl
	 vf+ddnHnxv0IAtGcKyG9gqrpj+XnMd/f5TxNZwiA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93EBCF8025F;
	Thu, 22 Dec 2022 16:24:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17D6DF8028D; Thu, 22 Dec 2022 16:24:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.82])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F052F80022
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 16:24:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F052F80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gerhold.net header.i=@gerhold.net header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=ZdynYWx1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1671722665;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=SxW45KTnLVIUUtB58HOiMPr3gJUSP+a3USQoYmqm660=;
 b=ZdynYWx1d5lNzCF7wuaAEBEZhKVYdg/qTLCLWyN4nWAKVT8+A3bmtLvUZGpDBZ7SE7
 VS8BSTnGM24tKW/GFRvToNePN26aR8b2500LyR+v8D8hO186FmjwjVWiJNeS+I5bOYmN
 SMFNFqiGT+Xtnystihs4R7C151S8efhYS8YH1jJO9LX1sESDgMPFHzu8UdPdhHDFI2D3
 dlH2ROaZjI4fEfDFrPQx2Jep9Y9RrSfxCP3GDKFQigiSHOKYKRbyp/JRCnjnxorvhstg
 lL26aunMiQNOTi0Kmfq6GGkMtJp8fIRFJECMLURHRIe7LneY/xKWkSlsoOxNDAVuoK+p
 5Mpg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJAhdlWyvDI"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
 with ESMTPSA id Yce349yBMFONKEU
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 22 Dec 2022 16:24:23 +0100 (CET)
Date: Thu, 22 Dec 2022 16:24:15 +0100
From: Stephan Gerhold <stephan@gerhold.net>
To: wangweidong.a@awinic.com
Subject: Re: [PATCH V7 5/5] ASoC: dt-bindings: Add schema for "awinic, aw883xx"
Message-ID: <Y6R2nziLaN3OyEo6@gerhold.net>
References: <20221222123431.106425-1-wangweidong.a@awinic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221222123431.106425-1-wangweidong.a@awinic.com>
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
Cc: alsa-devel@alsa-project.org, tanureal@opensource.cirrus.com,
 lgirdwood@gmail.com, cezary.rojewski@intel.com, tiwai@suse.com,
 krzysztof.kozlowski+dt@linaro.org, pierre-louis.bossart@linux.intel.com,
 zhangjianming@awinic.com, povik+lin@cutebit.org, ryan.lee.analog@gmail.com,
 flatmax@flatmax.com, devicetree@vger.kernel.org, ckeepax@opensource.cirrus.com,
 zhaolei@awinic.com, liweilei@awinic.com, rf@opensource.cirrus.com,
 robh+dt@kernel.org, jonathan.albrieux@gmail.com, james.schulman@cirrus.com,
 peter.ujfalusi@linux.intel.com, duanyibo@awinic.com,
 linux-kernel@vger.kernel.org, yijiangtao@awinic.com, broonie@kernel.org,
 13691752556@139.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Dec 22, 2022 at 08:34:31PM +0800, wangweidong.a@awinic.com wrote:
> From: Weidong Wang <wangweidong.a@awinic.com>
> 
> Add a DT schema for describing Awinic AW883xx audio amplifiers. They are
> controlled using I2C.
> 
> Signed-off-by: Weidong Wang <wangweidong.a@awinic.com>
> ---
>  .../bindings/sound/awinic,aw883xx.yaml        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml b/Documentation/devicetree/bindings/sound/awinic,aw883xx.yaml
> new file mode 100644
> index 000000000000..af4e0e27f8f7
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

Please add yourself as maintainer, not other people you found in similar
DT schema files. I have no idea how this hardware works. :)

Thanks,
Stephan
