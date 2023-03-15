Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A616BAD1F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 11:10:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27BE212D9;
	Wed, 15 Mar 2023 11:09:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27BE212D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678875014;
	bh=eXPQpD4bRYDF5NT+if6f4+A0IwSmQw0qHuuIm39/+L0=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DI7V3jTrLrBIW38VYtuQLR5ylo15dGLFXEUBiFOToFDldg+9lHXtbXI1or1rfUwfA
	 DMHdjpvPLpkyasr5e/k5+87ZzHcyzGou3zwjFWecza7jmlaJi4isXkdH1iMXGIjmDs
	 pT29cjV5qwgcvfL3oOMGUuDwLUP5jtgsAxULWskg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0F35F8032D;
	Wed, 15 Mar 2023 11:09:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A432F80423; Wed, 15 Mar 2023 11:09:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6051F80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 11:09:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6051F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NmCpI8Pe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC61B61CBD;
	Wed, 15 Mar 2023 10:09:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EE5C433D2;
	Wed, 15 Mar 2023 10:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678874955;
	bh=eXPQpD4bRYDF5NT+if6f4+A0IwSmQw0qHuuIm39/+L0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NmCpI8Pe4X1CTy+4q5l/PX2K8h603UKRaVsu6jOYm99KecuvDlB4RxHE1mUY3mXim
	 U/bCTZtrvGWYOSu7ZiFpdlMv3MQ+4aVAKznyxtwDmjSPOO7Jd/7R3ciAyUwrn2mZ0C
	 tET5V/IsCdrLTKBjJWMx2ItHjiDc/MT4CApVpTxwQyGAaEZAc1bto8xCfVsOS3Jofb
	 4ILpwxA8RWvurwSuaq7hWaoBhIruivmRZwu9pXIVUxXiWVdDpiGTuSzxxrw7eXzqOL
	 pwU3s558P+i/T5jF28wo5lY6cvnFQEDnYRgF0s1cLcCfnlOpoM+hxJTJdR/Io5hhsl
	 DpdnAphUkV0/A==
Date: Wed, 15 Mar 2023 15:39:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: stream: uniquify dev_err() logs
Message-ID: <ZBGZR2ACa8AbNmvy@matsya>
References: <20230309054905.21507-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230309054905.21507-1-yung-chuan.liao@linux.intel.com>
Message-ID-Hash: XFSURWSELHJHEQPS3I3XEXKFEBSGSP6M
X-Message-ID-Hash: XFSURWSELHJHEQPS3I3XEXKFEBSGSP6M
X-MailFrom: vkoul@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XFSURWSELHJHEQPS3I3XEXKFEBSGSP6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09-03-23, 13:49, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> There are a couple of duplicate logs which makes harder than needed to
> follow the error flows. Add __func__ or make the log unique.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  drivers/soundwire/stream.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
> index 2e39587ed1de..dd09855caac9 100644
> --- a/drivers/soundwire/stream.c
> +++ b/drivers/soundwire/stream.c
> @@ -1389,7 +1389,7 @@ static int _sdw_prepare_stream(struct sdw_stream_runtime *stream,
>  
>  	ret = do_bank_switch(stream);
>  	if (ret < 0) {
> -		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
> +		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);

why make it pr_ and loose the dev name? There is a trick to emit
function for dev_err too using dynamic debug


>  		goto restore_params;
>  	}
>  
> @@ -1477,7 +1477,7 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
>  		/* Program params */
>  		ret = sdw_program_params(bus, false);
>  		if (ret < 0) {
> -			dev_err(bus->dev, "Program params failed: %d\n", ret);
> +			dev_err(bus->dev, "%s: Program params failed: %d\n", __func__, ret);
>  			return ret;
>  		}
>  
> @@ -1497,7 +1497,7 @@ static int _sdw_enable_stream(struct sdw_stream_runtime *stream)
>  
>  	ret = do_bank_switch(stream);
>  	if (ret < 0) {
> -		dev_err(bus->dev, "Bank switch failed: %d\n", ret);
> +		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
>  		return ret;
>  	}
>  
> @@ -1567,14 +1567,14 @@ static int _sdw_disable_stream(struct sdw_stream_runtime *stream)
>  		/* Program params */
>  		ret = sdw_program_params(bus, false);
>  		if (ret < 0) {
> -			dev_err(bus->dev, "Program params failed: %d\n", ret);
> +			dev_err(bus->dev, "%s: Program params failed: %d\n", __func__, ret);
>  			return ret;
>  		}
>  	}
>  
>  	ret = do_bank_switch(stream);
>  	if (ret < 0) {
> -		pr_err("Bank switch failed: %d\n", ret);
> +		pr_err("%s: do_bank_switch failed: %d\n", __func__, ret);
>  		return ret;
>  	}
>  
> @@ -1664,7 +1664,7 @@ static int _sdw_deprepare_stream(struct sdw_stream_runtime *stream)
>  		/* Program params */
>  		ret = sdw_program_params(bus, false);
>  		if (ret < 0) {
> -			dev_err(bus->dev, "Program params failed: %d\n", ret);
> +			dev_err(bus->dev, "%s: Program params failed: %d\n", __func__, ret);
>  			return ret;
>  		}
>  	}
> @@ -1893,7 +1893,8 @@ int sdw_stream_add_master(struct sdw_bus *bus,
>  
>  	m_rt = sdw_master_rt_alloc(bus, stream);
>  	if (!m_rt) {
> -		dev_err(bus->dev, "Master runtime alloc failed for stream:%s\n", stream->name);
> +		dev_err(bus->dev, "%s: Master runtime alloc failed for stream:%s\n",
> +			__func__, stream->name);
>  		ret = -ENOMEM;
>  		goto unlock;
>  	}
> @@ -2012,7 +2013,8 @@ int sdw_stream_add_slave(struct sdw_slave *slave,
>  	 */
>  	m_rt = sdw_master_rt_alloc(slave->bus, stream);
>  	if (!m_rt) {
> -		dev_err(&slave->dev, "Master runtime alloc failed for stream:%s\n", stream->name);
> +		dev_err(&slave->dev, "%s: Master runtime alloc failed for stream:%s\n",
> +			__func__, stream->name);
>  		ret = -ENOMEM;
>  		goto unlock;
>  	}
> -- 
> 2.25.1

-- 
~Vinod
