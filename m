Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 557E156BB7A
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 16:06:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF66E846;
	Fri,  8 Jul 2022 16:05:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF66E846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657289203;
	bh=xVnOUnazD02h1JsuZ/gxAGHlzh/LJNLBh58zQ/EmNBA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PH89nl1E6bm/eNRrdrm4hUokR0gebqmcl8XwrVBcGUjaMkf3x/o+ZVfNhW2VIPRbR
	 gRAQZTcjB7hIwprTCReeX+4CsrGprx9jVp7e4bcvzZ2MZALBXp1GDDbBOM6ks6aA1n
	 jnhvqDk5WbqCpGijTnDHoysd0YJzxhZf+u0X0tWQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51B96F800C5;
	Fri,  8 Jul 2022 16:05:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44DB4F8025B; Fri,  8 Jul 2022 16:05:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C517F80084
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 16:05:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C517F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dYnpaGUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657289137; x=1688825137;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xVnOUnazD02h1JsuZ/gxAGHlzh/LJNLBh58zQ/EmNBA=;
 b=dYnpaGUq8SDGeeqGRFsMH2mrWOVYPOAAaGuK9YCS24PrvxlK/TIxRIBn
 3/qY3DqX9VR3AFa6jkSvgiUMFmMftqbgz5CI2vf7IGee3dmm+H8a3FA42
 XeTDfXUiRb0d/MbTmNuaeClCzaiCwHdlR62WCVSkFONOaCA44LuQ3f4Zc
 hlb1q9tFDCV6I5yd7UITyRvvUQ3FPkBtR4s++xhEim5vJ90YSv5F1UEZL
 WqrJlV8XxLVR5nPER7NxELZC5Q2wUK6uh/ql30ME9JyoVUK7DS2bqkl2j
 lM8VKI/o3ta6E2gLI2jyB8FsuDrHlepJrZmKzQJ6rCK5Bf5iGVnPKRbX+ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="309857507"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="309857507"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 07:04:59 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="626712320"
Received: from gcisnero-mobl.amr.corp.intel.com (HELO [10.212.87.49])
 ([10.212.87.49])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 07:04:59 -0700
Message-ID: <e4e1593c-5b25-e663-22f5-cfa37a0275fa@linux.intel.com>
Date: Fri, 8 Jul 2022 09:04:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [bug report] soundwire: qcom: Check device status before reading
 devid
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <Ysfl7lzEyRVuQ+Dg@kili>
 <747099de-504a-daed-6d45-34bf0e379562@linaro.org>
 <20220708084555.GJ2316@kadam>
 <ff3c59c4-9af4-f5c8-0804-61a4583e5fab@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <ff3c59c4-9af4-f5c8-0804-61a4583e5fab@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Vinod Koul <vkoul@kernel.org>
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



On 7/8/22 04:02, Srinivas Kandagatla wrote:
> 
> 
> On 08/07/2022 09:45, Dan Carpenter wrote:
>> On Fri, Jul 08, 2022 at 09:31:31AM +0100, Srinivas Kandagatla wrote:
>>> Hi Dan,
>>>
>>> On 08/07/2022 09:08, Dan Carpenter wrote:
>>>> Hello Srinivas Kandagatla,
>>>>
>>>> The patch aa1262ca6695: "soundwire: qcom: Check device status before
>>>> reading devid" from Jul 6, 2022, leads to the following Smatch static
>>>> checker warning:
>>>>
>>>>     drivers/soundwire/qcom.c:484 qcom_swrm_enumerate()
>>>>     error: buffer overflow 'ctrl->status' 11 <= 11
>>>>
>>>> drivers/soundwire/qcom.c
>>>>       471 static int qcom_swrm_enumerate(struct sdw_bus *bus)
>>>>       472 {
>>>>       473         struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
>>>>       474         struct sdw_slave *slave, *_s;
>>>>       475         struct sdw_slave_id id;
>>>>       476         u32 val1, val2;
>>>>       477         bool found;
>>>>       478         u64 addr;
>>>>       479         int i;
>>>>       480         char *buf1 = (char *)&val1, *buf2 = (char *)&val2;
>>>>       481
>>>>       482         for (i = 1; i <= SDW_MAX_DEVICES; i++) {
>>>>                        ^^^^^
>>>> This a loop that starts from 1 instead of 0.  I looked at the
>>>> surrounding context and it seems like it should be a normal loop that
>>>> starts at 0 and goes to < SDW_MAX_DEVICES.
>>>>
>>>
>>> In SoundWire world device id 0 is special one and used for
>>> enumerating the
>>> SoundWire devices.
>>>
>>> Only addresses from 1-11 are valid devids that can be assigned to
>>> devices by
>>> the host/controller.
>>>
>>> This part of the code is reading the devids assigned by the hw
>>> auto-enumeration, So the loop start from 1 is correct here.
>>>
>>>
>>>> (Or possibly the other loops are buggy as well).
>>>
>>> Atleast this code is fine, but I see other places where are starting
>>> from 0
>>> which could be fixed but the SoundWire core will ignore the status
>>> for devid
>>> 0.
>>
>> This code is *not* fine either because it should be < instead of <=.
>>
>> It might be that we always hit a zero first and break so the bug might
>> not affect users but it's still wrong.
> 
> I agree, Let me send a fix or send a v2.


the <= SDW_MAX_DEVICES is perfectly fine, provided that the allocation
is done correctly.

include/linux/soundwire/sdw.h:#define SDW_MAX_DEVICES                   11


drivers/soundwire/bus.c:        for (i = 1; i <= SDW_MAX_DEVICES; i++) {

drivers/soundwire/bus.c:        for (i = 1; i <= SDW_MAX_DEVICES; i++) {

drivers/soundwire/bus.c:        for (i = 1; i <= SDW_MAX_DEVICES; i++) {


drivers/soundwire/cadence_master.c:     for (i = 0; i <=
SDW_MAX_DEVICES; i++) {

the start at zero is intentional here.
drivers/soundwire/cadence_master.c:     enum sdw_slave_status
status[SDW_MAX_DEVICES + 1];



drivers/soundwire/qcom.c:       for (dev_num = 0; dev_num <
SDW_MAX_DEVICES; dev_num++) {


This one is a bug! device 11 is not handled

drivers/soundwire/qcom.c:       for (i = 0; i < SDW_MAX_DEVICES; i++) {


This one is a bug! device 11 is not handled

drivers/soundwire/qcom.c:       for (i = 1; i <= SDW_MAX_DEVICES; i++) {

This one has a bug! off-by-one access

drivers/soundwire/qcom.c:       enum sdw_slave_status
status[SDW_MAX_DEVICES];

Shoud be [SDW_MAX_DEVICES + 1]

The spec defines valid devices in the range 1..11 included.
Device0 is reserved for enumeration
Devices 12 and 13 are for groups
Device 14 is reserved for manager addressing
Device 15 is an 'all devices' alias.



