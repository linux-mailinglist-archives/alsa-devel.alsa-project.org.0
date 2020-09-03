Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBBD25B9E7
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Sep 2020 06:49:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A45C618B7;
	Thu,  3 Sep 2020 06:48:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A45C618B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599108577;
	bh=sgpr2jECLka0Lxt4kFjTIGwqVp2ceTlDsSvGmXtkYcU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YAdezxWJkjMd1QhzHvyO8aToVG97IQDV0qRmDBfkb8h2iAKTac+irHJaw/Apx8wag
	 fTxJOhln6Tc/6YkQvQbsGCy6fiM91HK4dtUadDsudyOfVGtGszofO3OrZcm7ThsT0i
	 Ld4vOMzbrclf1k1VFNHf+R6x95sQlfg95jb/fZlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEFFAF800BA;
	Thu,  3 Sep 2020 06:47:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DE4DF80217; Thu,  3 Sep 2020 06:47:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56BF5F800BA
 for <alsa-devel@alsa-project.org>; Thu,  3 Sep 2020 06:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56BF5F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AX8gP0EP"
Received: from localhost (unknown [122.171.179.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47FB5207EA;
 Thu,  3 Sep 2020 04:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599108460;
 bh=sgpr2jECLka0Lxt4kFjTIGwqVp2ceTlDsSvGmXtkYcU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AX8gP0EPN+cNuohfC7yIwldF2cSl0aW7MF2gq54Sv074u4DZ0YTZPsxVTsClkJTyB
 7VJlEzKiXdKantxDXsA/a1Vc+yPqDIw6LtHqUK/84H/Qnho1BHb6AfvD2qjO5sDI7/
 mnAstTIzalgPUDIIH19eWgL7Ug+IBl5+Vp2NLn60=
Date: Thu, 3 Sep 2020 10:17:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 07/18] ALSA: compress_offload: remove redundant
 initialization
Message-ID: <20200903044735.GC2639@vkoul-mobl>
References: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
 <20200902212133.30964-8-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902212133.30964-8-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

On 02-09-20, 16:21, Pierre-Louis Bossart wrote:
> Fix cppcheck warning:
> 
> sound/core/compress_offload.c:1044:6: style: Redundant initialization
> for 'ret'. The initialized value is overwritten before it is
> read. [redundantInitialization]
> 
>  ret = snd_register_device(SNDRV_DEVICE_TYPE_COMPRESS,
>      ^
> sound/core/compress_offload.c:1034:10: note: ret is initialized
>  int ret = -EINVAL;
>          ^
> sound/core/compress_offload.c:1044:6: note: ret is overwritten
>  ret = snd_register_device(SNDRV_DEVICE_TYPE_COMPRESS,
>      ^
> 

Acked-By: Vinod Koul <vkoul@kernel.org>

> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/core/compress_offload.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index e3eb314acb10..c1fec932c49d 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -1032,7 +1032,7 @@ static const struct file_operations snd_compr_file_ops = {
>  
>  static int snd_compress_dev_register(struct snd_device *device)
>  {
> -	int ret = -EINVAL;
> +	int ret;
>  	struct snd_compr *compr;
>  
>  	if (snd_BUG_ON(!device || !device->device_data))
> -- 
> 2.25.1

-- 
~Vinod
