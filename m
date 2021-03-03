Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C76A32BC6C
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Mar 2021 23:00:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A77D1A97;
	Wed,  3 Mar 2021 23:00:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A77D1A97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614808857;
	bh=iySlkCO1K550Oh3Lu70T+zfKLxZBYvLbiffNx7eKi6E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=skUjgI5kiYCDAMBgVg33XUIk2Oc5d/739fFZ4JbUAmpdARMRLI2ogd6eT6m69sGIJ
	 jJE7MKfJfulq8ELKOBUiiULrNCfK50h/Zr7FS05r6fpaBvlY2fwT5NSFi7RvhRtUg4
	 r7i6QF8RIZcqmoR2wAlAlBUkwzvXh2YMZ+nZJDMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48147F80272;
	Wed,  3 Mar 2021 22:59:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D166F80257; Wed,  3 Mar 2021 22:59:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E15DF80227
 for <alsa-devel@alsa-project.org>; Wed,  3 Mar 2021 22:59:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E15DF80227
IronPort-SDR: KxtYm+OrXtqRn56Kce5lPXDzpMNiz94JuAQpsn4WEkidFFJxEZA80142zcPMLN8AfWjwcsS8ln
 PCxr1atyLO3w==
X-IronPort-AV: E=McAfee;i="6000,8403,9912"; a="174405686"
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; d="scan'208";a="174405686"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 13:59:13 -0800
IronPort-SDR: xPuyXcgcp6AOnk3OFK851lgX0vAM/NBvbQ0XwP74WyfCB4aJvCI4Javx8OhCLDT8ngD4ZjmfuB
 gl+tbVVgTmgg==
X-IronPort-AV: E=Sophos;i="5.81,220,1610438400"; d="scan'208";a="586487017"
Received: from srcook1-mobl1.amr.corp.intel.com (HELO [10.209.143.11])
 ([10.209.143.11])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 13:59:12 -0800
Subject: Re: [PATCH v2 1/5] soundwire: qcom: add support to missing transport
 params
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20210226155814.27536-1-srinivas.kandagatla@linaro.org>
 <20210226155814.27536-2-srinivas.kandagatla@linaro.org>
 <00842f73-c0fb-5728-3ed0-c0a1fd75f94e@linux.intel.com>
 <31eca99d-9f84-e088-443b-9aae782c2df2@linaro.org>
 <06a687f6-e79c-9bad-32c2-ea61356f882e@linux.intel.com>
 <d0dc4c6f-cbd5-06e8-6ed8-234a55f9de9c@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <de3b8223-f51d-6cb1-6346-7bd7dcefb482@linux.intel.com>
Date: Wed, 3 Mar 2021 10:16:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d0dc4c6f-cbd5-06e8-6ed8-234a55f9de9c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
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


> soundwire-controller@3210000 {
>      reg = <0 0x3210000 0 0x2000>;
>      compatible = "qcom,soundwire-v1.5.1";
>      interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
>      clocks = <&rxmacro>;
>      clock-names = "iface";
>      qcom,clock-stop-mode0;
>      qcom,din-ports = <0>;
>      qcom,dout-ports = <5>;
> 
>      qcom,ports-sinterval-low = /bits/ 8 <0x03 0x1F 0x1F 0x07 0x00>;
>      qcom,ports-offset1 = /bits/ 8 <0x00 0x00 0x0B 0x01 0x00>;
>      qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x0B 0x00 0x00>;
>      qcom,ports-hstart = /bits/ 8 <0xFF 0x03 0xFF 0xFF 0xFF>;
>      qcom,ports-hstop = /bits/ 8 <0xFF 0x06 0xFF 0xFF 0xFF>;
>      qcom,ports-word-length = /bits/ 8 <0x01 0x07 0x04 0xFF 0xFF>;
>      qcom,ports-block-pack-mode = /bits/ 8 <0xFF 0x00 0x01 0xFF 0xFF>;
>      qcom,ports-lane-control = /bits/ 8 <0x01 0x00 0x00 0x00 0x00>;
>      qcom,ports-block-group-count = /bits/ 8 <0xFF 0xFF 0xFF 0xFF 0x00>;
> 
>      #sound-dai-cells = <1>;
>      #address-cells = <2>;
>      #size-cells = <0>;
> };
>> properties that may or may not be valid. If this is intentional and 
>> desired, this should still be captured somehow, e.g. in the bindings 
>> documentation or in the code with a comment, no?
> 
> Yes, I agree with you on this, I should document this in bindings!

thanks for the explanations, it'd be useful indeed to document what this 
magic 0xFF value means.

