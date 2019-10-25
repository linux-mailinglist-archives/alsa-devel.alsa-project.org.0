Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDC9E5659
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 00:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3178118C1;
	Sat, 26 Oct 2019 00:00:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3178118C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572040893;
	bh=aTCDaUh4DFD9hg6Pqa6aEYtdmKcSCSCsxUm9dbCKgzs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qb3fLi2RhrmSVnabDH5H6aXPaXd9FQIcXl7BldE6vh4uyJxPHbNwerUsgPCyJdwFz
	 oXstcs+swbWeSUdbDu5MV+e7RqeJUkeNiz3dQKgGAaxwpwnU0pzbNCTyA8P4Gj/gDz
	 7LnMrKqSGLE++bFFIlZ93/YVTbcDcaOcJA88/If4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8147EF803A6;
	Fri, 25 Oct 2019 23:59:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD44AF8036F; Fri, 25 Oct 2019 23:59:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACED3F80274
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 23:59:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACED3F80274
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qwmWtewK"
Received: by mail-pf1-x443.google.com with SMTP id q21so2465929pfn.11
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 14:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=eW3QcADxWiA9bB+f1V3Z1+dcU/1XE8CGZphcypGekbY=;
 b=qwmWtewKTdVLT5daUxPBZ5FzRpQl/egXLrBQ+UeZlpbEcHCiFqCaJklDEfi4dFeioG
 /XiO73dbDOzSSEE0e8De1pxiRwZ82JdWzsFQbae0oD79Pxhqy6EVKuu4BKTBEkvC1nMa
 m3nTmAaZ5lJOwxsHqbeokO4CRoYMoCgFlTZrR2iNULK3dzXeUmsnDqhk1sIspgID48YJ
 jKHqlgxD3nXUuqVQk2uwhEI9NgoalG4q+9bExzO5fTaykJS13q4yv6FQ6bKvkosayM2c
 ySkyd6GIpHirJ0zV2dZlTAiKIXtdOi7lS9lY13KClqTq1nv1w3qqvyeAPyYB1sKvas75
 WFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eW3QcADxWiA9bB+f1V3Z1+dcU/1XE8CGZphcypGekbY=;
 b=R5EOI114qmNJZ+2OEYIsiUR/gMvuwD59qsHk+ciCyD9bLtmyaQi9r/fbv8Ncs+Mi0L
 meELyDBl52qPzVrtQzWo7zW3F0BVHvtzghgtRrrF9+oruZFUKMrfro10jqgigiLuE/Jj
 V2XUqTgj83KYsgzIydOCj4KBsTXiOSFIbrIEw6SxlMN0WMBdtmKuj0DP8MYemlyskFas
 dE8pSNl9SdBDvwFyTKfvjti+1kO/D9nDD7Iz3syioNhUMd5hr9qaKA/5iBu7K3VQ+Nbd
 tcYRH2+Iebfl90Mav8/pF9+A/NNQzSn6Yp9vBqAXf3+DPndqhJI30Qc9LgDK6xZLgqfp
 RNCg==
X-Gm-Message-State: APjAAAUgpcn7//v74eMfrwOXIJXztXj3pyKW3MTqloCwkmwwj34jVddz
 kyFfxB0SW9KLLqW/4tKCoAM=
X-Google-Smtp-Source: APXvYqzAlyQ6QgA1OIplwWAdTMmiF8dDyvSSD0lN3oGKWYGdoPCg4gqnizy04m7h1H3tGg509ldamQ==
X-Received: by 2002:a17:90a:d351:: with SMTP id
 i17mr6807596pjx.36.1572040779795; 
 Fri, 25 Oct 2019 14:59:39 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id d5sm2815101pjw.31.2019.10.25.14.59.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 25 Oct 2019 14:59:39 -0700 (PDT)
Date: Fri, 25 Oct 2019 14:59:20 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20191025215919.GB15101@Asurada-Nvidia.nvidia.com>
References: <a0cd2ecf5e833fbdc064ba73391481d6073e7254.1571986398.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a0cd2ecf5e833fbdc064ba73391481d6073e7254.1571986398.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V2] ASoC: fsl_asrc: refine the setting of
 internal clock divider
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

On Fri, Oct 25, 2019 at 03:13:22PM +0800, Shengjiu Wang wrote:
> The output divider should align with the output sample
> rate, if use ideal sample rate, there will be a lot of overload,
> which would cause underrun.
> 
> The maximum divider of asrc clock is 1024, but there is no
> judgement for this limitaion in driver, which may cause the divider

typo: "limitaion" => "limitation"

> setting not correct.
> 
> For non-ideal ratio mode, the clock rate should divide the sample
> rate with no remainder, and the quotient should be less than 1024.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

And some comments inline. Please add my ack once they are fixed:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks

> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 0bf91a6f54b9..89cf333154c7 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -259,8 +259,11 @@ static int fsl_asrc_set_ideal_ratio(struct fsl_asrc_pair *pair,
>   * It configures those ASRC registers according to a configuration instance
>   * of struct asrc_config which includes in/output sample rate, width, channel
>   * and clock settings.
> + *
> + * Note:
> + * use_ideal_rate = true is need by some case which need higher performance.

I feel we can have a detailed one here and drop those inline comments, e.g.:

+ * Note:
+ * The ideal ratio configuration can work with a flexible clock rate setting.
+ * Using IDEAL_RATIO_RATE gives a faster converting speed but overloads ASRC.
+ * For a regular audio playback, the clock rate should not be slower than an
+ * clock rate aligning with the output sample rate; For a use case requiring
+ * faster conversion, set use_ideal_rate to have the faster speed.

> @@ -351,8 +355,10 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
>  	/* We only have output clock for ideal ratio mode */
>  	clk = asrc_priv->asrck_clk[clk_index[ideal ? OUT : IN]];
>  
> -	div[IN] = clk_get_rate(clk) / inrate;
> -	if (div[IN] == 0) {
> +	clk_rate = clk_get_rate(clk);
> +	rem[IN] = do_div(clk_rate, inrate);
> +	div[IN] = (u32)clk_rate;

> +	if (div[IN] == 0 || (!ideal && (div[IN] > 1024 || rem[IN] != 0))) {

Should have some comments to explain this like:
	/*
	 * The divider range is [1, 1024], defined by the hardware. For non-
	 * ideal ratio configuration, clock rate has to be strictly aligned
	 * with the sample rate. For ideal ratio configuration, clock rates
	 * only result in different converting speeds. So remainder does not
	 * matter, as long as we keep the divider within its valid range.
	 */
>  		pair_err("failed to support input sample rate %dHz by asrck_%x\n",
>  				inrate, clk_index[ideal ? OUT : IN]);
>  		return -EINVAL;

And move the min() behind this if-condition with no more comments:
+	div[IN] = min_t(u32, 1024, div[IN]);

> @@ -360,18 +366,29 @@ static int fsl_asrc_config_pair(struct fsl_asrc_pair *pair)
>  
>  	clk = asrc_priv->asrck_clk[clk_index[OUT]];
>  
> -	/* Use fixed output rate for Ideal Ratio mode (INCLK_NONE) */
> -	if (ideal)
> -		div[OUT] = clk_get_rate(clk) / IDEAL_RATIO_RATE;
> +	/*
> +	 * Output rate should be align with the out samplerate. If set too
> +	 * high output rate, there will be lots of Overload.
> +	 * But some case need higher performance, then we can use
> +	 * IDEAL_RATIO_RATE specifically for such case.
> +	 */

Can drop this since we have the detailed comments at the top.

> +	clk_rate = clk_get_rate(clk);
> +	if (ideal && use_ideal_rate)
> +		rem[OUT] = do_div(clk_rate, IDEAL_RATIO_RATE);
>  	else
> -		div[OUT] = clk_get_rate(clk) / outrate;
> +		rem[OUT] = do_div(clk_rate, outrate);
> +	div[OUT] = clk_rate;
>  
> -	if (div[OUT] == 0) {

And add before this if-condition:

	/* Output divider has the same limitation as the input one */

> +	if (div[OUT] == 0 || (!ideal && (div[OUT] > 1024 || rem[OUT] != 0))) {
>  		pair_err("failed to support output sample rate %dHz by asrck_%x\n",
>  				outrate, clk_index[OUT]);
>  		return -EINVAL;
>  	}
>  
> +	/* Divider range is [1, 1024] */

Can drop this too.

> +	div[IN] = min_t(u32, 1024, div[IN]);
> +	div[OUT] = min_t(u32, 1024, div[OUT]);

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
