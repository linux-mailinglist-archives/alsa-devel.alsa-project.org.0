Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9D2A97FD
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 15:59:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C3C4168B;
	Fri,  6 Nov 2020 15:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C3C4168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604674777;
	bh=2fuo3KyDmAUWXxViAA/JAWxQeMOrwkX97EwNaDmiSwk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FyaDtfilOcgGE78u+0r7+2IIcC2iGJ8eTQVGT5jLN9qIlwYZUksX3z20b2M/q8T4n
	 lIoUKVFNlYHC6kUkwdX9i+m6iNTvjxDgwnpdRZmyLonuc30AfP5ALwiWCQJfC5hgJo
	 MTliR6DRVDam7V/zHtVedk2L9UT7eGW3H62eW4Fk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A870AF8023E;
	Fri,  6 Nov 2020 15:58:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2712BF80234; Fri,  6 Nov 2020 15:58:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98BEAF80150
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 15:57:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98BEAF80150
IronPort-SDR: 2CgUjiYxBVeh/xXQxXm/2+OHbx+kXiTcdd5yPjggkMoREabfi5PmzKllRhdEt9WcOmloXWqK+M
 JOhlK8dQeZrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9796"; a="169701132"
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; d="scan'208";a="169701132"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 06:57:53 -0800
IronPort-SDR: OmJuWz8P06aSUlik6lktFYd51aVruH6q5z3D2X9Iq5Q+6GJ62vG74zu84YOCVReMfoeSkURV4U
 3zL4k19n/eYQ==
X-IronPort-AV: E=Sophos;i="5.77,456,1596524400"; d="scan'208";a="472090337"
Received: from robrodri-mobl1.amr.corp.intel.com (HELO [10.209.98.80])
 ([10.209.98.80])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2020 06:57:52 -0800
Subject: Re: [PATCH] ASoC: nau8315: add codec driver
To: Mark Brown <broonie@kernel.org>, CTLIN0 <CTLIN0@nuvoton.com>
References: <20201102023212.594137-1-CTLIN0@nuvoton.com>
 <0adb99c2-d0d9-5052-c163-4d9a341239fc@linux.intel.com>
 <da4d4666-3c91-16d7-926b-b339ae4e39be@nuvoton.com>
 <da9232f9-15c9-01ea-44cf-107ff4dd6c58@linux.intel.com>
 <CA+Px+wVGosx=pmSkJKtYd9dQZ98D0aYG0KaDq6-ov67UoiV8Jw@mail.gmail.com>
 <20201105150249.GC4856@sirena.org.uk>
 <bd3d3b6f-2cca-cd4b-2eff-b32792b3b2e4@linux.intel.com>
 <b1b1efee-b19e-2d5c-3806-5532c39c7c47@nuvoton.com>
 <20201106122058.GC49612@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <aab83231-c2fb-364f-c512-5f74f34174db@linux.intel.com>
Date: Fri, 6 Nov 2020 08:57:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201106122058.GC49612@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>, YHCHuang@nuvoton.com,
 WTLI@nuvoton.com, KCHSU0@nuvoton.com, Liam Girdwood <lgirdwood@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>
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



On 11/6/20 6:20 AM, Mark Brown wrote:
> On Fri, Nov 06, 2020 at 11:31:36AM +0800, CTLIN0 wrote:
> 
>> Thanks for your comments. However, I also agree the opinion from
>> Tzung-Bi Shih @ Google.
>> May I confirm whether I should keep this patch, and remove dapm widget
>> of EN_PIN next patch?
> 
> Please send incremental patches on top of this one with any changes.

EN_PIN is not strictly required but as discussed it provides additional 
flexibility for machine drivers, so probably better to keep it?
