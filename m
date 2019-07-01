Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFF65B57B
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2019 09:04:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 387D51685;
	Mon,  1 Jul 2019 09:04:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 387D51685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561964695;
	bh=Fl/jIwrEysXxs1PHdwuvX/ZaCJcN12q6twTmz4H/XZU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WLWzBb45l7LdHuUk4nlwQdpUsyrNdlVBlfqM7yFFzKfWrwo8BYvhCZqEv0Yji8VDY
	 GE6HMqdGDLBMDQ9b+owqv4A5IsarIYa9EBMYz1y2s1MLqjgTP6f7i2IA4XG3ioekv/
	 cgqa5MKKk/drex9/2PVvMCoBvBkmfoGWtjnjBVU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B866F896EC;
	Mon,  1 Jul 2019 09:03:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EED6F896EC; Mon,  1 Jul 2019 09:03:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96BD8F89670
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 09:03:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96BD8F89670
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZIPCW9Z+"
Received: from localhost (unknown [122.167.76.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D294208E4;
 Mon,  1 Jul 2019 06:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561962378;
 bh=Z6vFclLDtr2AoU8Vp/xJdqBe4Z3jocZDSO6y16utDDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZIPCW9Z+lUgyeWItAJlvT0JsYrb1wgnMKoM3MFZTwidBNPr9O3AOh9rzBzlEfGeBG
 cg6N8LltVJu42futYsOGC9duSKK01q1ykbjoAyN6zy06EJ/jUz/KEn6ejCE5TYvEg3
 u7BesR045CuWo20adDyD1Mih+wylLxE+JpTKU9y8=
Date: Mon, 1 Jul 2019 11:53:04 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <20190701062304.GL2911@vkoul-mobl>
References: <20190611104043.22181-1-srinivas.kandagatla@linaro.org>
 <20190611104043.22181-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190611104043.22181-4-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 robh+dt@kernel.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 bgoswami@quicinc.com
Subject: Re: [alsa-devel] [RFC PATCH 3/5] soundwire: add module_sdw_driver
	helper macro
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 11-06-19, 11:40, Srinivas Kandagatla wrote:
> This Helper macro is for SoundWire drivers which do not do anything special in
> module init/exit. This eliminates a lot of boilerplate. Each module may only
> use this macro once, and calling it replaces module_init() and module_exit()

Applied, thanks

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  include/linux/soundwire/sdw_type.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/linux/soundwire/sdw_type.h b/include/linux/soundwire/sdw_type.h
> index 9c756b5a0dfe..aaa7f4267c14 100644
> --- a/include/linux/soundwire/sdw_type.h
> +++ b/include/linux/soundwire/sdw_type.h
> @@ -16,4 +16,15 @@ void sdw_unregister_driver(struct sdw_driver *drv);
>  
>  int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
>  
> +/**
> + * module_sdw_driver() - Helper macro for registering a Soundwire driver
> + * @__sdw_driver: soundwire slave driver struct
> + *
> + * Helper macro for Soundwire drivers which do not do anything special in
> + * module init/exit. This eliminates a lot of boilerplate. Each module may only
> + * use this macro once, and calling it replaces module_init() and module_exit()
> + */
> +#define module_sdw_driver(__sdw_driver) \
> +	module_driver(__sdw_driver, sdw_register_driver, \
> +			sdw_unregister_driver)
>  #endif /* __SOUNDWIRE_TYPES_H */
> -- 
> 2.21.0

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
