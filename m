Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B39508EB9
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 19:43:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 956381AF8;
	Wed, 20 Apr 2022 19:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 956381AF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650476582;
	bh=3CtKJu86H4ZmVWLsuoKje6DsnJeg0MUXUxRcD9E3dzM=;
	h=Date:Subject:From:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pTKI5wNsRRQUhYDh2J4LGpV+9/Slk8bvwmRMAogygkElqf5ljjSyojvmdtGmWbJkK
	 iXwrAIeJxKZk1LKSLB+3uUfzyWe+IrIP6zKOfg0NChwrpIYJQfSVQ3gmmSe9Xw9Bzc
	 +yc7lg9UBRs6DJdmAl9aS0g76tVYqYqbGd43uUEU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F245DF80116;
	Wed, 20 Apr 2022 19:42:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF034F80125; Wed, 20 Apr 2022 19:42:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 685B1F800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 19:41:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 685B1F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MGKWmdX/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650476519; x=1682012519;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=3CtKJu86H4ZmVWLsuoKje6DsnJeg0MUXUxRcD9E3dzM=;
 b=MGKWmdX/Uo6QegZ4f4Jfy0VxwGz4dvyA0PESNLyvshANDUrDE/gjOEtA
 2L6heY4o4S+HG4gibKSAPWxAr06B7SZeKicFlVwGD/G3+cqSjXN7Vh4av
 UmxeeTnAjxcskbsgBsZFN6QpMJY3CRUHOBZetNuReaGF5wdVhW7pmHrYJ
 hyjqF6ZVyCobj0fMHyscNDTMB3YYrajuhSq4p1VOGk6npNO1Bpmk5XHMB
 SLD6PQGaZQHNOoqNkg6lhpOvCl569AD1NPc1OxrcyMa+pmv9Wntjo/c2I
 qLdSL7mF6eg3K/jYbIkxqpIXtT4lxnGGfs24KjBFlXb9/M/jijLjXxVEb A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="327006931"
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="327006931"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 10:40:59 -0700
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="576712409"
Received: from sbidasar-mobl.amr.corp.intel.com (HELO [10.209.100.171])
 ([10.209.100.171])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 10:40:58 -0700
Message-ID: <217a59f8-86fb-5508-bdd9-25c553052a48@linux.intel.com>
Date: Wed, 20 Apr 2022 12:40:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/3] soundwire: qcom: add in-band wake up interrupt
 support
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh+dt@kernel.org, 
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
 <20220228172528.3489-4-srinivas.kandagatla@linaro.org>
 <a3240a03-2e14-35e6-4915-41f994e365fc@linux.intel.com>
In-Reply-To: <a3240a03-2e14-35e6-4915-41f994e365fc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


>> +static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
>> +{
>> +	struct qcom_swrm_ctrl *swrm = dev_id;
>> +	int ret;
>> +
>> +	ret = pm_runtime_get_sync(swrm->dev);
>> +	if (ret < 0 && ret != -EACCES) {
>> +		dev_err_ratelimited(swrm->dev,
>> +				    "pm_runtime_get_sync failed in %s, ret %d\n",
>> +				    __func__, ret);
>> +		pm_runtime_put_noidle(swrm->dev);

missing 'return ret' here as well, is this intentional?

Fix at https://github.com/thesofproject/linux/pull/3602/commits/6353eec8dc971c5f0fda0166ae1777f71784ea32 ready to go, but not sure what the intent was.

>> +	}
>> +
>> +	if (swrm->wake_irq > 0) {
>> +		if (!irqd_irq_disabled(irq_get_irq_data(swrm->wake_irq)))
>> +			disable_irq_nosync(swrm->wake_irq);
>> +	}
>> +
>> +	pm_runtime_mark_last_busy(swrm->dev);
>> +	pm_runtime_put_autosuspend(swrm->dev);
>> +
>> +	return IRQ_HANDLED;
>> +}
