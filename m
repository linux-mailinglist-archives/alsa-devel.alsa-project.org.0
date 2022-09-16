Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA735BA9F0
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 12:06:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0A3D1A2C;
	Fri, 16 Sep 2022 12:05:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0A3D1A2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663322780;
	bh=QJhaJZlzeBsCcRJwzatIAFEHttA8Lak9pZBYRJkQDxI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hvxiGAEu1yEkRPWLrgn0LzZSJ7/wVjanTNNbpxpVZ2+w3yoWc9nW14E2YFNHTGQHF
	 dS/VlOaWMj7WfC31YsyjVNFzBSaftpre9ObVw8F+KCuxThGt8pBe5Z9zROtsXmYZdb
	 0Zoyxj1P4uxj8jBNnQjvLaE473MqlbAimanFcioc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EDBAF80496;
	Fri, 16 Sep 2022 12:05:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E96BEF802BE; Fri, 16 Sep 2022 12:05:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57B19F800B5
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 12:05:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57B19F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dPLf2y4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663322715; x=1694858715;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QJhaJZlzeBsCcRJwzatIAFEHttA8Lak9pZBYRJkQDxI=;
 b=dPLf2y4ZqS7qjGjPG0Me+htKyc0ic8XCYfeEd9Q5AG9F2JILiaifTk/N
 lNYmuL4I9DDK6ThusFW0kocSpV6HQ4QrQ4n1YKFZkuJzdv9o3cTdWjTaQ
 ddu27QZ/+ZYyb8IKkT6ALBTHnNa7I+Hijo9oI218ANI0QZXL5snaX47N2
 N7EhM37G+rtH1M0vK8+k7QWjMZRGZ0Np9Wn4jbi/uYBS6VxPXesj3iEoa
 01GAXWS4fThdawplcgH9jRy/YUfwvSBYcDK7WM+Y04ryXnk7QwKH+Hwb6
 wWfVifyts9hXhWq4mxTkDDKSm99MMO94e5jHTeA4bOXj27lUSUMcyVZfd g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="385249200"
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="385249200"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 03:05:12 -0700
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; d="scan'208";a="617617827"
Received: from kchan21-mobl1.ger.corp.intel.com (HELO [10.252.61.56])
 ([10.252.61.56])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 03:05:08 -0700
Message-ID: <fe9b9897-ed37-386a-846f-c1f11087ed5c@linux.intel.com>
Date: Fri, 16 Sep 2022 12:05:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH] soundwire: qcom: update status from device id 1
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20220915124215.13703-1-srinivas.kandagatla@linaro.org>
 <3962348a-33b4-5941-4a0b-cb447a513a41@linux.intel.com>
 <bffab27c-6e25-5787-6958-648f9f2e2686@linaro.org>
 <2e1b81d2-e20f-db9f-b84e-b3c5ebb312cb@linux.intel.com>
 <4e42389e-c1c4-fe41-3bc8-03cc9a40ac0b@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <4e42389e-c1c4-fe41-3bc8-03cc9a40ac0b@linaro.org>
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



On 9/16/22 11:49, Srinivas Kandagatla wrote:
> 
> 
> On 16/09/2022 10:39, Pierre-Louis Bossart wrote:
>>
>>
>> On 9/16/22 11:12, Srinivas Kandagatla wrote:
>>>
>>>
>>> On 15/09/2022 14:10, Pierre-Louis Bossart wrote:
>>>>
>>>>
>>>> On 9/15/22 14:42, Srinivas Kandagatla wrote:
>>>>> By default autoenumeration is enabled on QCom SoundWire controller
>>>>> which means the core should not be dealing with device 0 w.r.t
>>>>> enumeration.
>>>>> Currently device 0 status is also shared with SoundWire core which
>>>>> confuses
>>>>> the core sometimes and we endup adding 0:0:0:0 slave device.
>>>>
>>>> The change looks fine, but the description of the issue is surprising.
>>>
>>> Thanks Pierre,
>>>
>>>>
>>>> Whether autoenumeration is enabled or not is irrelevant, by spec the
>>>> device0 cannot be in ALERT status and throw in-band interrupts to the
>>>> host with this mechanism.
>>>
>>> This issue is more of around enumeration stage in specific during device
>>> status change interrupt from controller. Sharing the device 0 status
>>> with core makes it think that there is a device with 0:0:0:0 address and
>>> it tries to park device to group 13.
>> Still not clear, sorry, see my comment below.
> 
> 
>>
>>>
>>>
>>> --srini
>>>
>>>>
>>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>>> ---
>>>>>    drivers/soundwire/qcom.c | 4 ++--
>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>>>>> index e21a3306bf01..871e4d8b32c7 100644
>>>>> --- a/drivers/soundwire/qcom.c
>>>>> +++ b/drivers/soundwire/qcom.c
>>>>> @@ -428,7 +428,7 @@ static int
>>>>> qcom_swrm_get_alert_slave_dev_num(struct qcom_swrm_ctrl *ctrl)
>>>>>          ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
>>>>>    -    for (dev_num = 0; dev_num <= SDW_MAX_DEVICES; dev_num++) {
>>>>> +    for (dev_num = 1; dev_num <= SDW_MAX_DEVICES; dev_num++) {
>>>>>            status = (val >> (dev_num * SWRM_MCP_SLV_STATUS_SZ));
>>>>>              if ((status & SWRM_MCP_SLV_STATUS_MASK) ==
>>>>> SDW_SLAVE_ALERT) {
>>
>> can this really happen?
>>
> I have not see this happening, I had to change this line for consistency
> reasons due to other changes in the patch.
> 
> Only case the issue was seen is during enumeration.
> 
>> Device0 cannot be in alert status, can it? The only this it can do is
>> assert PREQ and set the Device0 status to 1 (ATTACHED). I don't get how
>> a device status could be 2.
>>
>> So even if the status is shared somehow,I don't see how this could be
>> related to parking the device as suggested above. If the condition is
>> always false then changing the loop counter from 0 to 1 would not have
>> an effect?
> 
> The reason why core tries to park this device is because it sees
> status[0] as SDW_SLAVE_ATTACHED and start programming the device id,
> however reading DEVID registers return zeros which does not match to any
> of the slaves in the list and the core attempts to park this device to
> Group 13.

ok, that makes sense, thanks for the explanations.

I would recommend splitting this patch in two then:

1) the change for the handling of the alert status, which is unrelated
to the auto-enumeration. That removes a test for an always-false condition

2) the change for the device status, that indeed is related to enumeration.


> 
> 
> 
> 
> --srini
> 
>>
>>
>>>>> @@ -448,7 +448,7 @@ static void qcom_swrm_get_device_status(struct
>>>>> qcom_swrm_ctrl *ctrl)
>>>>>        ctrl->reg_read(ctrl, SWRM_MCP_SLV_STATUS, &val);
>>>>>        ctrl->slave_status = val;
>>>>>    -    for (i = 0; i <= SDW_MAX_DEVICES; i++) {
>>>>> +    for (i = 1; i <= SDW_MAX_DEVICES; i++) {
>>>>>            u32 s;
>>>>>              s = (val >> (i * 2));
