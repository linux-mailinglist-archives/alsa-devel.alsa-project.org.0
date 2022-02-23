Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B89974C1B43
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 19:57:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CB3B1A26;
	Wed, 23 Feb 2022 19:56:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CB3B1A26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645642649;
	bh=RimaKXFhr9mzukP4fNaT0hhnC3zqMaGlaLRl4CVVfDA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=INozIu/xx1zthC/4/5dGJtL0Jvg2edzsWdzwzbKegIs98ctIEVGTgZm6pJqr6TOOG
	 kGgfHHC59vPS1/iYpU1U7gwmVOqU0XrYixq00kO2WcTnG4n9kQX1ITyA4XY7bbPCF+
	 t/lamJ3o74IxSJc+esxKdJ7vjKfldNZZv9xgXFAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CCA5F8025D;
	Wed, 23 Feb 2022 19:55:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0487F802E3; Wed, 23 Feb 2022 19:55:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCBB8F80118
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 19:55:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCBB8F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Enl0hfN7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645642548; x=1677178548;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RimaKXFhr9mzukP4fNaT0hhnC3zqMaGlaLRl4CVVfDA=;
 b=Enl0hfN7gbpSaubMfaLSZOwKgpYw5lEhoFa7xow0fqOXD6EP5GvFqwQc
 arFce1LZBndoQ7myJOJPeUk0RZgdpRQNLmHUx6RmTonZRFqSVDi8I3Rvt
 P5BXcOr/PHaPdV6gemLGQQWtias+3QZ+g2+piubdt9QpQJXYSVGJ7srSN
 z7a95d5yG22YPG5yZjjtaz0peKzRFqteDdPnFjbYT7cEU02dqykfHd9I5
 oEw8N9S3JJ9l5Ml2h8fSrKTWSYat6uvktCfToyyH8L8BFEQts1VfEFYzr
 9UajffadVu0Wx0Wt6UFnQmFgM3jahCpwppykCzTy5GBVf9OmXT52U2nzi g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="276676944"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="276676944"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 10:55:39 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; d="scan'208";a="491319477"
Received: from aacunaco-mobl1.amr.corp.intel.com (HELO [10.209.144.93])
 ([10.209.144.93])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2022 10:55:39 -0800
Message-ID: <d0b57e7b-3591-ee7c-c77b-02e328dba752@linux.intel.com>
Date: Wed, 23 Feb 2022 12:21:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] soundwire: qcom: add runtime pm support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh+dt@kernel.org, 
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220221104127.15670-1-srinivas.kandagatla@linaro.org>
 <20220221104127.15670-2-srinivas.kandagatla@linaro.org>
 <70db9c01-104e-e081-198e-0b6d8a1c17da@linux.intel.com>
 <1e532280-5388-157b-8e2d-2ca8b2619f37@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1e532280-5388-157b-8e2d-2ca8b2619f37@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, quic_srivasam@quicinc.com
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


> There are two cases here.
> 
> 1> Controller Instance support ClockStop Mode0, we mostly use the
> generic core to do that except in resume path we make sure that we start
> the clock.
> 
> 2> Controller Instances which that do not support ClockStop, we do soft
> reset of controller along with hard resetting slaves.

both are fine. we have similar cases defined in sdw_intel.h



>>> +static int swrm_runtime_resume(struct device *dev)
>>> +{
>>> +    struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
>>> +    int ret;
>>> +
>>> +    clk_prepare_enable(ctrl->hclk);
>>> +
>>> +    if (ctrl->clk_stop_bus_reset) {
>>> +        reinit_completion(&ctrl->enumeration);
>>> +        ctrl->reg_write(ctrl, SWRM_COMP_SW_RESET, 0x01);
>>> +        qcom_swrm_get_device_status(ctrl);
>>
>> don't you need some sort of delay before checking the controller and
>> device status? The bus reset sequence takes 4096 bits, that's a non-zero
>> time.
> 
> This is soft reset not full Bus Reset as WSA slaves have hard reset pins
> that will be toggled as part of suspend-resume.

Above you mentioned the peripherals go through a reset as well, in which
case they can only re-attach on the bus after 16 frames best case - they
need to observe a full cycle of the dynamic sync before changing status.

That's still a non-zero delay (0.3ms for a 48kHz frame rate)

>>
>>> +        sdw_handle_slave_status(&ctrl->bus, ctrl->status);
>>> +        qcom_swrm_init(ctrl);
