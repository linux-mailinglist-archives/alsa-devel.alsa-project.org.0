Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C6B38A69
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 14:34:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5795B1668;
	Fri,  7 Jun 2019 14:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5795B1668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559910845;
	bh=9K/LLpptIwdNyvocXiscQYzDrAfAocAUFohRmy8nmeI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=axpovUwrUNyRZSIf6hT296XPLCdkn6AqZ+PQWa56jWHfPdBI3tLlnr/MUwr59zK1y
	 kGQM7biexw7aAwtbu75AG+t3pNvaDI8Boa6HXxLS6CyUI5wGH8og2cGfSITztC6t0c
	 sRUJgoLcvmwvU7bf27S3JkSJ3fVuKpJXPDj0r2HI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C39E2F896DE;
	Fri,  7 Jun 2019 14:32:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7EFDF896DD; Fri,  7 Jun 2019 14:32:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A90CF8072A
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 14:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A90CF8072A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Jun 2019 05:32:12 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2019 05:32:11 -0700
Received: from kwong4-mobl.amr.corp.intel.com (unknown [10.252.203.122])
 by linux.intel.com (Postfix) with ESMTP id 04D3A58044F;
 Fri,  7 Jun 2019 05:32:10 -0700 (PDT)
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org, 
 vkoul@kernel.org
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
 <20190607085643.932-4-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a4b527af-c999-829d-c4a0-41f0a6775b65@linux.intel.com>
Date: Fri, 7 Jun 2019 07:31:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607085643.932-4-srinivas.kandagatla@linaro.org>
Content-Language: en-US
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, robh+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [RFC PATCH 3/6] soundwire: core: define
	SDW_MAX_PORT
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 6/7/19 3:56 AM, Srinivas Kandagatla wrote:
> This patch adds SDW_MAX_PORT so that other driver can use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>   include/linux/soundwire/sdw.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index aac68e879fae..80ca997e4e5d 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h
> @@ -36,6 +36,7 @@ struct sdw_slave;
>   #define SDW_FRAME_CTRL_BITS		48
>   #define SDW_MAX_DEVICES			11
>   
> +#define SDW_MAX_PORTS	14

That's an ambiguous definition.
You can have 16 ports per the SoundWire spec, but DP0 is reserved for 
control and DP15 is an alias for all ports (same idea as device 15 for 
broadcast operations but limited to a single device), which leaves 14 
ports for audio usages.

In the MIPI specs, specifically the DisCo part, the difference is called 
about with the the DP0 and DPn notations, so this could be SDW_MAX_DPn. 
Alternatively you could use SDW_MAX_AUDIO_PORTS which is more 
self-explanatory and does not require in-depth familiarity with the spec.

>   #define SDW_VALID_PORT_RANGE(n)		((n) <= 14 && (n) >= 1)
>   
>   #define SDW_DAI_ID_RANGE_START		100
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
