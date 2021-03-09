Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DDA332FDE
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 21:28:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35C7017B7;
	Tue,  9 Mar 2021 21:27:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35C7017B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615321714;
	bh=ylE+Np7ykLHEy3ofD9a0EgATAxxjgAbgyZq2N0bQihA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wdg0KFZuciEv/rvNLvQVXGMA93v8RiQWWVmL0ACdDNFXCH3DBMyzthStO5W2g0xD+
	 1+YUP1kVX4Wqq4ka1Ep+qEAQyJX9GXdlgtmC7/a+DT8pAAS/mryvPPhsJqqQetVMlo
	 AvZXdSgDHrx31BzlB5aWSEWnX4q/GPOnG7GJqBMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86636F80256;
	Tue,  9 Mar 2021 21:27:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E798FF80227; Tue,  9 Mar 2021 21:27:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16297F800D0
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 21:26:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16297F800D0
IronPort-SDR: 736ZEOmrmlX/PfY5LLX0rWVNJLAIU+6/MC/UBUNBPCNYFyyDeudVcUcIGl/qxHuFun6DfKIKYK
 NL3Xc602DSAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="188418790"
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; d="scan'208";a="188418790"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 12:26:46 -0800
IronPort-SDR: cjAkylnbPtBFxT7LKq1WrDenzV5R1oniQbt1Ce6GZcxlnoR3VFfW1GNObVCojKY2LvJivUc3qT
 6EcAq6MKoa/w==
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; d="scan'208";a="371663313"
Received: from fsantes-mobl.amr.corp.intel.com (HELO [10.212.215.138])
 ([10.212.215.138])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 12:26:43 -0800
Subject: Re: [PATCH] ASoC: rt1015p: add acpi device id for rt1015p
To: Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>, 
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
References: <20210226020517.17124-1-jack.yu@realtek.com>
 <b4af8c40-d1c6-35f2-0f70-3032fd04697f@linux.intel.com>
 <2e2eaa61cdcd44529f379085c615a4c9@realtek.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f4327b67-7202-0a4c-69af-93a4a1982dfe@linux.intel.com>
Date: Tue, 9 Mar 2021 14:26:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2e2eaa61cdcd44529f379085c615a4c9@realtek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?UTF-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>, =?UTF-8?B?6Zmz5pi25b+X?= <kenny_chen@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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



>>> +#ifdef CONFIG_ACPI
>>> +static const struct acpi_device_id rt1015p_acpi_match[] = {
>>> +	{ "ALCP1015", 0},
>>
>> This isn't much better, ALC is not a vendor ID as defined by
>> https://uefi.org/PNP_ACPI_Registry
>>
>> I've ask for guidance from Intel ACPI folks on this, please stay tuned.
>>
> 
> Hi Pierre,
> 
> Is there any update from Intel ACPI team regarding to this ID format issue?

Sorry about the delay.

It seems that the options are limited. The HID needs to be made of two 
parts, vendor ID and part ID.

For the vendor ID, you may use the PNP ID (RTL) or the PCI ID (10EC).

For the part ID, you are limited to 4 hex-digits. I didn't get any 
positive answers on how to support '1015P', the only solution seems to 
be to create a new part number, or detect at run-time which of the 
'1015' skews is actually used.
