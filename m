Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B225F4C0632
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 01:32:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60DE41906;
	Wed, 23 Feb 2022 01:31:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60DE41906
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645576360;
	bh=9nLGmFa4SonpF2qf8NgANpNkiWR11udF8i0fGALAavU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A5VzroBlrZkKHwSntme3wzJwWgkgMU62uJs3zLL2TK403UQTXFTT/NOL4Xr57EcK4
	 BYx0Lxb5HVnYLDhAPkdFgH1kRIOy/rcKCH0HxEmEi86qVDrNSxmDmuwDi9wVHZX4ja
	 ezbfqrbfpTSdgGfb3xhlwdJpNobXn+SpZsbfzjCQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B93AF800D1;
	Wed, 23 Feb 2022 01:31:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0359F80238; Wed, 23 Feb 2022 01:31:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 390A7F801EC
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 01:31:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 390A7F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kqcGP5rr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645576297; x=1677112297;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9nLGmFa4SonpF2qf8NgANpNkiWR11udF8i0fGALAavU=;
 b=kqcGP5rrRDjljHXiwPHGQ5eTnShQP9XOXyW+OVp5w9LSh5SuA6JoMAa5
 6ojHoGEs4IvayZW0FHTbpEquYNhVKGxQcNn91hBa5zpcgbbZrI6h6BNri
 PPC4UqCgPu/SxwU029n/MBDYOgSB4KNqURcNLGkbAYEq8RLKbGbNDhJv6
 rym/aZflEl6fC4lef/qxHGW5Tjdie8ZRH9d9hlt7xr8Ioo+ucd9VoSg/R
 ooly9qLtOrrArXcdGVaPiTc6rptlciDlekHy57H/9sRlt8KI5m48n8L8q
 MKfEqBTZ9CwlhQ/dmLlR2iqCaXmuNaepUg5e+bOs/lM0sGQT4rJCtTswo w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="235358584"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="235358584"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 16:31:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="639110296"
Received: from mjpatel-mobl.amr.corp.intel.com (HELO [10.212.37.223])
 ([10.212.37.223])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 16:31:32 -0800
Message-ID: <49099bcb-35e9-0bea-9658-006caed3ab33@linux.intel.com>
Date: Tue, 22 Feb 2022 18:31:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] soundwire: qcom: add wake up interrupt support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh+dt@kernel.org, 
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220221104127.15670-1-srinivas.kandagatla@linaro.org>
 <20220221104127.15670-4-srinivas.kandagatla@linaro.org>
 <5e050d4c-e3d2-35fb-ca49-7be53579bc31@linux.intel.com>
 <1cb4e02f-f040-23bd-44d0-0675429332bd@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1cb4e02f-f040-23bd-44d0-0675429332bd@linaro.org>
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



On 2/22/22 16:52, Srinivas Kandagatla wrote:
> 
> 
> On 22/02/2022 19:26, Pierre-Louis Bossart wrote:
>>
>>
>>
>>> +static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
>>> +{
>>> +    struct qcom_swrm_ctrl *swrm = dev_id;
>>> +    int ret = IRQ_HANDLED;
>>> +    struct sdw_slave *slave;
>>> +
>>> +    clk_prepare_enable(swrm->hclk);
>>> +
>>> +    if (swrm->wake_irq > 0) {
>>> +        if (!irqd_irq_disabled(irq_get_irq_data(swrm->wake_irq)))
>>> +            disable_irq_nosync(swrm->wake_irq);
>>> +    }
>>> +
>>> +    /*
>>> +     * resume all the slaves which must have potentially generated this
>>> +     * interrupt, this should also wake the controller at the same
>>> time.
>>> +     * this is much safer than waking controller directly that will
>>> deadlock!
>>> +     */
>> There should be no difference if you first resume the controller and
>> then attached peripherals, or do a loop where you rely on the pm_runtime
>> framework.
>>
>> The notion that there might be a dead-lock is surprising, you would need
>> to elaborate here.Issue is, if wakeup interrupt resumes the controller
>> first which can 
> trigger an slave pending interrupt (ex: Button press event) in the
> middle of resume that will try to wake the slave device which in turn
> will try to wake parent in the middle of resume resulting in a dead lock.
> 
> This was the best way to avoid dead lock.

Not following, sorry. if you use pm_runtime functions and it so happens
that the resume already started, then those routines would wait for the
resume to complete.

In other words, there can be multiple requests to resume, but only the
*first* request will trigger a transition and others will just increase
a refcount.

In addition, the pm_runtime framework guarantees that the peripheral
device can only start resuming when the parent controller device is
fully resumed.

While I am at it, one thing that kept us busy as well is the
relationship between system suspend and pm_runtime suspend. In the
generic case a system suspend will cause a pm_runtime resume before you
can actually start the system suspend, but you might be able to skip
this step. In the Intel case when the controller and its parent device
were suspended we had to pm_runtime resume everything because some
registers were no longer accessible.


