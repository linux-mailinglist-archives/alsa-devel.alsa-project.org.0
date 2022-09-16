Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1905BAF5E
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 16:27:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BC3E1AD2;
	Fri, 16 Sep 2022 16:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BC3E1AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663338427;
	bh=gv+2/C8ClWBbHILgrFONJ9rBiBl5ZJdLRc3Bch3QP2M=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DoU1HJ+Npdl8z9WTHYQAzTdFIZzr51g+Um7DMYTjywy6b6GmUR6rlhwaBLEkrEdTx
	 mqvwn3B7lYKCw8tpj9N4vtQZIR5dGGCLzkUQqiegQy4q0MTg9r4mH2rR66Kcxg5h9x
	 7V6449Yb3ois531vkbA3NapOuL8X3fIUbtD7oVNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFB00F804D2;
	Fri, 16 Sep 2022 16:25:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 536FBF80567; Fri, 16 Sep 2022 16:25:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9353EF8024C
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 16:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9353EF8024C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="O+w0OZkv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663338296; x=1694874296;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gv+2/C8ClWBbHILgrFONJ9rBiBl5ZJdLRc3Bch3QP2M=;
 b=O+w0OZkvkFItzWIfopDAtjEMXLUZI+dwfpl0Pkq7JtqNfO171Ydo8CfO
 G+xE15Tn0UEgyW1h8IxzwfB5sW2KCGOeLNyvKYBthx5BuUxjuapekxDzG
 +AE/lYJ5Axp5eu25maOaUQPiw8ljaf5YEScdZz/BnaTn4a/VlB2kH/cjl
 0pCtWvZ2ZzfDL+JJ3IGuKYwifsq/umydAxAsBv2nC9M0Ic/WTohPBdXJU
 0p1T0g2elpwsKZu/W0k4aGMIUjv27L0sCajuo37swn61xa2nCONBMC1I2
 g/CBTuJTE9+/1WVdF29ypOzNB3TgSATsBjZLmQiGjmUd2wGI8KEKwaUp5 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="300363094"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="300363094"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:24:42 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="650889189"
Received: from kchan21-mobl1.ger.corp.intel.com (HELO [10.252.61.56])
 ([10.252.61.56])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 07:24:39 -0700
Message-ID: <ffb79f8b-7557-92eb-2c20-e8f5fd2afaee@linux.intel.com>
Date: Fri, 16 Sep 2022 16:22:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] soundwire: qcom: update status from device id 1
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20220916135352.19114-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220916135352.19114-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, sanyog.r.kale@intel.com,
 yung-chuan.liao@linux.intel.com, quic_srivasam@quicinc.com
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



On 9/16/22 15:53, Srinivas Kandagatla wrote:
> By default autoenumeration is enabled on QCom SoundWire controller
> which means the core should not be dealing with device 0 w.r.t enumeration.
> 
> During Enumeration if SoundWire core sees status[0] as SDW_SLAVE_ATTACHED and
> start programming the device id, however reading DEVID registers return zeros
> which does not match to any of the slaves in the list and the core attempts
> to park this device to Group 13.  This results in adding SoundWire device
> with enumeration address 0:0:0:0
> 
> Fix this by not passing device 0 status to SoundWire core.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
> Changes since v1:
> 	- updated change log and split patch in to two as suggested by Pierre
> 
>  drivers/soundwire/qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index e7f95c41eb70..d3ce580cdeaf 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -448,7 +448,7 @@ static void qcom_swrm_get_device_status(struct qcom_swrm_ctrl *ctrl)
>  	ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
>  	ctrl->slave_status = val;
>  
> -	for (i = 0; i <= SDW_MAX_DEVICES; i++) {
> +	for (i = 1; i <= SDW_MAX_DEVICES; i++) {
>  		u32 s;
>  
>  		s = (val >> (i * 2));
