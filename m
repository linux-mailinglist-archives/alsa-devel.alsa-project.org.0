Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E807D60F89A
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 15:10:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 510F42F8D;
	Thu, 27 Oct 2022 15:09:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 510F42F8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666876242;
	bh=MCLBFO3GdgdeuhUJUcNaR1oNkl/w8+FZPyXKz03sSkk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BXOYfygZuloRNGPmaHtYOg5sQbtq55Wx2fXfwgDngklndbTE6G3RMAwSQJtllIuRG
	 87UF5yJHHYU5zQeIv8oSoVoFoNiqmy3efoM9DCFQ0XUaqHKNWa4tXgAKISmeCyIYb3
	 sdUuhzy/SxuxXp662+yt5DbXHeGguGaDUdb4CEjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89E80F80496;
	Thu, 27 Oct 2022 15:09:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A679AF8025E; Thu, 27 Oct 2022 15:09:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90D4EF80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 15:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90D4EF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hd9Dis9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666876183; x=1698412183;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MCLBFO3GdgdeuhUJUcNaR1oNkl/w8+FZPyXKz03sSkk=;
 b=hd9Dis9qN94nuHH3j8JninC6QCD5w7acol/NyihbjuZlzNcGxkAJJpXg
 fdv/dS6P1CnMzJLC5Sza8mHngvNSbd+GdtpO3v1o9vkPr3VMnM5fTuIy+
 8vhaUlfrSAcp1RA1NAyO9SnpTWHHDVbzEEer8xf3JWPjEKV6faCKF0bGW
 vojbpRw7vv0Il608V9vhqzSZkw/rdsXHhVjQA2Ub+QqlcFhTH9R6CFPn9
 8QzkvVVZbcg/eT/dKiIZmb7KlPO75bReVADNIvlUR8khv2DaPqrR7KrQs
 D+LOPISzExrePA5ZyS4YyF3yekqnzSWFXGthJWgiBloIpPxwP3S9OdxGj A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="295625498"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="295625498"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 06:09:36 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="757692314"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="757692314"
Received: from djohn1-mobl1.amr.corp.intel.com (HELO [10.212.54.86])
 ([10.212.54.86])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 06:09:35 -0700
Message-ID: <86b64496-71e0-7e2d-0911-f67e1684db20@linux.intel.com>
Date: Thu, 27 Oct 2022 08:45:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 6/6] soundwire: qcom: add support for v1.7 Soundwire
 Controller
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org,
 yung-chuan.liao@linux.intel.com
References: <20221026110210.6575-1-srinivas.kandagatla@linaro.org>
 <20221026110210.6575-7-srinivas.kandagatla@linaro.org>
 <e3ebba30-65ec-183a-eb91-c5147c28441d@linux.intel.com>
 <619a829e-d902-eba9-537e-176a8acb149c@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <619a829e-d902-eba9-537e-176a8acb149c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, sanyog.r.kale@intel.com
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


>>> @@ -1582,6 +1597,7 @@ static const struct of_device_id
>>> qcom_swrm_of_match[] = {
>>>       { .compatible = "qcom,soundwire-v1.3.0", .data =
>>> &swrm_v1_3_data },
>>>       { .compatible = "qcom,soundwire-v1.5.1", .data =
>>> &swrm_v1_5_data },
>>>       { .compatible = "qcom,soundwire-v1.6.0", .data =
>>> &swrm_v1_6_data },
>>> +    { .compatible = "qcom,soundwire-v1.7.0", .data = &swrm_v1_5_data },
>>
>> is this line intentional, it looks odd that 1.7 is compatible with 1.5,
>> but 1.6 isn't?
> This is more around the data rather than compatible, 1.6 data is marked
> with sw_clk_gate_required = true which is not the case with 1.7.
> 
> from 1.5 we use same frame shape info for 1.6, 1.7, except that 1.6 had
> this sw_clk_gate_required flag set.

probably worthy of a comment to show intent and explain the differences?
