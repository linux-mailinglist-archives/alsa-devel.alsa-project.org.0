Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 172114C162A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 16:09:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA09A1AB7;
	Wed, 23 Feb 2022 16:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA09A1AB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645628977;
	bh=1I5kow835AqoHj1AGtU+fqjD6moHIUT6qeU1XLbjvu0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HwNXAvVtpwS7anZ3nmrBsemoaIqDEvLDAHB3szqJgEDkPTrUQfaT4mOL0O5INp+ZK
	 n2jIyQFfC8bGbnyoZ41NDUl0bGAvAESDXp/CHin3sO7hjuq7Xv+4VAOMELK8bMDdnU
	 kRukmEfNb4NOWyX3HB28w3H24tk8VNqPUm5FQdaY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE8D8F8025D;
	Wed, 23 Feb 2022 16:08:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA985F80237; Wed, 23 Feb 2022 16:08:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 17D64F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 16:08:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17D64F800F5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1FE2ED1;
 Wed, 23 Feb 2022 07:08:21 -0800 (PST)
Received: from [10.57.40.147] (unknown [10.57.40.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 083703F5A1;
 Wed, 23 Feb 2022 07:08:18 -0800 (PST)
Message-ID: <e0bc8dd2-bea9-354b-3b48-3123e0bbf717@arm.com>
Date: Wed, 23 Feb 2022 15:08:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [RFT PATCH 0/3] Fix kfree() of const memory on setting
 driver_override
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Abel Vesa <abel.vesa@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andy Gross
 <agross@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
References: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
 <708eabb1-7b35-d525-d4c3-451d4a3de84f@rasmusvillemoes.dk>
 <afa7001d-901e-55bf-b8dc-77051b1e7f78@canonical.com>
 <0442526f-b6d9-8868-ac1c-dd11a2d3b2ab@arm.com>
 <636e5b92-8ed8-35a1-d6e9-516d5b35be91@canonical.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <636e5b92-8ed8-35a1-d6e9-516d5b35be91@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 2022-02-23 14:22, Krzysztof Kozlowski wrote:
> On 23/02/2022 15:04, Robin Murphy wrote:
>> On 2022-02-22 14:06, Krzysztof Kozlowski wrote:
>>> On 22/02/2022 14:51, Rasmus Villemoes wrote:
>>>> On 22/02/2022 14.27, Krzysztof Kozlowski wrote:
>>>>> Hi,
>>>>>
>>>>> Drivers still seem to use driver_override incorrectly. Perhaps my old
>>>>> patch makes sense now?
>>>>> https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/
>>>>>
>>>>> Not tested - please review and test (e.g. by writing to dirver_override
>>>>> sysfs entry with KASAN enabled).
>>>>
>>>> Perhaps it would make sense to update the core code to release using
>>>> kfree_const(), allowing drivers to set the initial value with
>>>> kstrdup_const(). Drivers that currently use kstrdup() or kasprintf()
>>>> will continue to work [but if they kstrdup() a string literal they could
>>>> be changed to use kstrdup_const].
>>>
>>> The core here means several buses, so the change would not be that
>>> small. However I don't see the reason why "driver_override" is special
>>> and should be freed with kfree_const() while most of other places don't
>>> use it.
>>>
>>> The driver_override field definition is here obvious: "char *", so any
>>> assignments of "const char *" are logically wrong (although GCC does not
>>> warn of this literal string const discarding). Adding kfree_const() is
>>> hiding the problem - someone did not read the definition of assigned field.
>>
>> That's not the issue, though, is it? If I take the struct
>> platform_device definition at face value, this should be perfectly valid:
>>
>> 	static char foo[] = "foo";
>> 	pdev->driver_override = &foo;
> 
> 
> Yes, that's not the issue. It's rather about the interface. By
> convention we do not modify string literals but "char *driver_override"
> indicates that this is modifiable memory. I would argue that it even
> means that ownership is passed. Therefore passing string literal to
> "char *driver_override" is wrong from logical point of view.
> 
> Plus, as you mentioned later, can lead to undefined behavior.

But does anything actually need to modify a driver_override string? I 
wouldn't have thought so. I see at least two buses that *do* define 
theirs as const char *, but still assume to kfree() them.

>> And in fact that's effectively how the direct assignment form works
>> anyway - string literals are static arrays of type char (or wchar_t),
>> *not* const char, however trying to modify them is undefined behaviour.
>>
>> There's a big difference between "non-const" and "kfree()able", and
>> AFAICS there's no obvious clue that the latter is actually a requirement.
> 
> Then maybe kfreeable should be made a requirement? Or at least clearly
> documented?

Indeed, there's clearly some room for improvement still. And I'm not 
suggesting that these changes aren't already sensible as they are, just 
that the given justification seems a little unfair :)

Even kfree_const() can't help if someone has put their string in the 
middle of some larger block of kmalloc()ed memory, so perhaps 
encouraging a dedicated setter function rather than just exposing a raw 
string pointer is the ideal solution in the long term.

Cheers,
Robin.
