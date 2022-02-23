Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0D04C1511
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 15:05:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECAB41AA8;
	Wed, 23 Feb 2022 15:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECAB41AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645625146;
	bh=Ksh7ojyup1xH1eAX2liVw+3ETJb4LTiC6fZId4XMlTA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BtHf+qRa4K3eQB6X+049LNp0pFCkaLOsYT1AjH3svNJzoNkKfHxvsyXa+F62Vm6pc
	 mqNaWIQXrrl+poACXJ6JRgcH4IYoD1oSFrpeYrLQs45LGpCvlF9tLQwFi7CLdWx91z
	 O3AW5bosWaPJ6f5STqPmLvNWqdKFSXY2CYJtLW78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65432F80118;
	Wed, 23 Feb 2022 15:04:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70E2DF80237; Wed, 23 Feb 2022 15:04:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id AA530F80118
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 15:04:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA530F80118
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35FB3ED1;
 Wed, 23 Feb 2022 06:04:31 -0800 (PST)
Received: from [10.57.40.147] (unknown [10.57.40.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 228AF3F5A1;
 Wed, 23 Feb 2022 06:04:28 -0800 (PST)
Message-ID: <0442526f-b6d9-8868-ac1c-dd11a2d3b2ab@arm.com>
Date: Wed, 23 Feb 2022 14:04:23 +0000
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
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <afa7001d-901e-55bf-b8dc-77051b1e7f78@canonical.com>
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

On 2022-02-22 14:06, Krzysztof Kozlowski wrote:
> On 22/02/2022 14:51, Rasmus Villemoes wrote:
>> On 22/02/2022 14.27, Krzysztof Kozlowski wrote:
>>> Hi,
>>>
>>> Drivers still seem to use driver_override incorrectly. Perhaps my old
>>> patch makes sense now?
>>> https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/
>>>
>>> Not tested - please review and test (e.g. by writing to dirver_override
>>> sysfs entry with KASAN enabled).
>>
>> Perhaps it would make sense to update the core code to release using
>> kfree_const(), allowing drivers to set the initial value with
>> kstrdup_const(). Drivers that currently use kstrdup() or kasprintf()
>> will continue to work [but if they kstrdup() a string literal they could
>> be changed to use kstrdup_const].
> 
> The core here means several buses, so the change would not be that
> small. However I don't see the reason why "driver_override" is special
> and should be freed with kfree_const() while most of other places don't
> use it.
> 
> The driver_override field definition is here obvious: "char *", so any
> assignments of "const char *" are logically wrong (although GCC does not
> warn of this literal string const discarding). Adding kfree_const() is
> hiding the problem - someone did not read the definition of assigned field.

That's not the issue, though, is it? If I take the struct 
platform_device definition at face value, this should be perfectly valid:

	static char foo[] = "foo";
	pdev->driver_override = &foo;

And in fact that's effectively how the direct assignment form works 
anyway - string literals are static arrays of type char (or wchar_t), 
*not* const char, however trying to modify them is undefined behaviour.

There's a big difference between "non-const" and "kfree()able", and 
AFAICS there's no obvious clue that the latter is actually a requirement.

Cheers,
Robin.
