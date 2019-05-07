Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D782C163C5
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 14:32:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48B6617C6;
	Tue,  7 May 2019 14:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48B6617C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557232329;
	bh=y6+Q8VGZ/4X4hZckjh6oZdMIZr9LgdohFmx2ulkB1u0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C9n80z7c1SAXK6YmFeXVFmpPyMENL6irt7emgFf3aPr5881/Ba54eWYoZ9Ci/kmVb
	 Hjj3xLOVuwEZSVqLm1bLwnKv2b8dzYFa42vQulOKh/SRtJTnx12zAbA7gW1OqZG5kS
	 7I1gxC9b/W7Auzl/L1bgnwx2AZXEtGA80c4Fpc+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6685F807B5;
	Tue,  7 May 2019 14:30:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B48E9F89674; Tue,  7 May 2019 14:30:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 458A5F807B5
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 14:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 458A5F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gVMCQO/x"
Received: from localhost (unknown [106.200.210.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 864A8206A3;
 Tue,  7 May 2019 12:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557232217;
 bh=5PjezRR4ACN28UQLqzd7/AWsEoOwlOjfNJzwth+nV/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gVMCQO/x0F4P0YZfwHz4SyHNE7Kaggo0cOKuQVId/VhCq3SjhxqxtL0sXTcAxF2jB
 P9T13HJ/m7zJLoRtkdnKvonYQ10ZA3a+R88EQ9TFEA9Y1fHGnr6oNnDUmDN+riEkMe
 zJ2XOeYj5+cO0sbZ75Fflz+gzk+NR3080e+r83K0=
Date: Tue, 7 May 2019 18:00:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190507123011.GP16052@vkoul-mobl>
References: <20190504002926.28815-1-pierre-louis.bossart@linux.intel.com>
 <20190504002926.28815-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190504002926.28815-4-pierre-louis.bossart@linux.intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 joe@perches.com, Sanyog Kale <sanyog.r.kale@intel.com>
Subject: Re: [alsa-devel] [PATCH 3/8] soundwire: mipi_disco: expose
 sdw_slave_read_dpn as symbol
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

On 03-05-19, 19:29, Pierre-Louis Bossart wrote:
> sdw_slave_read_dpn was so far a static function, which prevented
> codec drivers from using it. Expose as non-static function and add symbol
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  drivers/soundwire/mipi_disco.c | 7 ++++---
>  include/linux/soundwire/sdw.h  | 3 +++
>  2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
> index 6df68584c963..4995554bd6b6 100644
> --- a/drivers/soundwire/mipi_disco.c
> +++ b/drivers/soundwire/mipi_disco.c
> @@ -161,9 +161,9 @@ static int sdw_slave_read_dp0(struct sdw_slave *slave,
>  	return 0;
>  }
>  
> -static int sdw_slave_read_dpn(struct sdw_slave *slave,
> -			      struct sdw_dpn_prop *dpn, int count, int ports,
> -			      char *type)
> +int sdw_slave_read_dpn(struct sdw_slave *slave,
> +		       struct sdw_dpn_prop *dpn, int count, int ports,
> +		       char *type)
>  {
>  	struct fwnode_handle *node;
>  	u32 bit, i = 0;
> @@ -283,6 +283,7 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL(sdw_slave_read_dpn);

Fine to export but would be great to accompany user with it. In
general do not add a API without user.

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
