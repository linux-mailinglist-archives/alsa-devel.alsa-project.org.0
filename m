Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ACF5BA993
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 11:41:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ECE51A4D;
	Fri, 16 Sep 2022 11:40:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ECE51A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663321279;
	bh=ZBvekQuq9hr3ltHRDiUIVvXOQ3wAHFuwmG8zeGorN+A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JKHfsgQUXF5LH4qEMQF5M5H8tVDx8H+FsuSnbv734w9s6kw/dpPEusw31cPgjpf3N
	 GR7pwT+4oigI98qDCcZTu4ZtSl4jyeGVszo1AHxsRxmuK2+9gGzpdzBYIuYEASIAhC
	 GiuKaUv9HQvnJjgRoUZoldROfcSNB/HeYF7iBJSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B101F80496;
	Fri, 16 Sep 2022 11:40:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35DE2F802BE; Fri, 16 Sep 2022 11:40:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 164F5F800B5
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 11:40:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 164F5F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZfverA4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663321213; x=1694857213;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZBvekQuq9hr3ltHRDiUIVvXOQ3wAHFuwmG8zeGorN+A=;
 b=ZfverA4NloH1WvjaRtg6GO537T64Fo5ksgB10KgleW0P4AgfaTMPjC/s
 C2uk2sFS+qXKxNa+0wpj08qJHpYwPkCENVCywE+wrOt7LVPbQX0T8w79p
 fMkEtssfW2FX5aHgdsLvz03Ix6S1HnziR99yBcnmRCwZyTMtQ9nhIGaDQ
 hm/s2c8A5BzqPqaT7MvoNmHZffn8nQjfdSE5W6p2/psKpRQZUDTqxWhP5
 O3NHkYmTpstnS1aLo/9XfXIlxuAFouV+AiN+ngDnKFySWbVsxYRBz0jVS
 L7O5T19YQBjp6JMA+2e97lOsSfXMj3WdNHVUGmYnamtKi4wa3KRZBF4rA g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="296542895"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="296542895"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 02:39:44 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="946317688"
Received: from kchan21-mobl1.ger.corp.intel.com (HELO [10.252.61.56])
 ([10.252.61.56])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 02:39:42 -0700
Message-ID: <2e1b81d2-e20f-db9f-b84e-b3c5ebb312cb@linux.intel.com>
Date: Fri, 16 Sep 2022 11:39:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] soundwire: qcom: update status from device id 1
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20220915124215.13703-1-srinivas.kandagatla@linaro.org>
 <3962348a-33b4-5941-4a0b-cb447a513a41@linux.intel.com>
 <bffab27c-6e25-5787-6958-648f9f2e2686@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <bffab27c-6e25-5787-6958-648f9f2e2686@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 9/16/22 11:12, Srinivas Kandagatla wrote:
> 
> 
> On 15/09/2022 14:10, Pierre-Louis Bossart wrote:
>>
>>
>> On 9/15/22 14:42, Srinivas Kandagatla wrote:
>>> By default autoenumeration is enabled on QCom SoundWire controller
>>> which means the core should not be dealing with device 0 w.r.t
>>> enumeration.
>>> Currently device 0 status is also shared with SoundWire core which
>>> confuses
>>> the core sometimes and we endup adding 0:0:0:0 slave device.
>>
>> The change looks fine, but the description of the issue is surprising.
> 
> Thanks Pierre,
> 
>>
>> Whether autoenumeration is enabled or not is irrelevant, by spec the
>> device0 cannot be in ALERT status and throw in-band interrupts to the
>> host with this mechanism.
> 
> This issue is more of around enumeration stage in specific during device
> status change interrupt from controller. Sharing the device 0 status
> with core makes it think that there is a device with 0:0:0:0 address and
> it tries to park device to group 13.
Still not clear, sorry, see my comment below.

> 
> 
> --srini
> 
>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> ---
>>>   drivers/soundwire/qcom.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>>> index e21a3306bf01..871e4d8b32c7 100644
>>> --- a/drivers/soundwire/qcom.c
>>> +++ b/drivers/soundwire/qcom.c
>>> @@ -428,7 +428,7 @@ static int
>>> qcom_swrm_get_alert_slave_dev_num(struct qcom_swrm_ctrl *ctrl)
>>>         ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
>>>   -    for (dev_num = 0; dev_num <= SDW_MAX_DEVICES; dev_num++) {
>>> +    for (dev_num = 1; dev_num <= SDW_MAX_DEVICES; dev_num++) {
>>>           status = (val >> (dev_num * SWRM_MCP_SLV_STATUS_SZ));
>>>             if ((status & SWRM_MCP_SLV_STATUS_MASK) ==
>>> SDW_SLAVE_ALERT) {

can this really happen?

Device0 cannot be in alert status, can it? The only this it can do is
assert PREQ and set the Device0 status to 1 (ATTACHED). I don't get how
a device status could be 2.

So even if the status is shared somehow,I don't see how this could be
related to parking the device as suggested above. If the condition is
always false then changing the loop counter from 0 to 1 would not have
an effect?


>>> @@ -448,7 +448,7 @@ static void qcom_swrm_get_device_status(struct
>>> qcom_swrm_ctrl *ctrl)
>>>       ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
>>>       ctrl->slave_status = val;
>>>   -    for (i = 0; i <= SDW_MAX_DEVICES; i++) {
>>> +    for (i = 1; i <= SDW_MAX_DEVICES; i++) {
>>>           u32 s;
>>>             s = (val >> (i * 2));
