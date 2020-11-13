Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD6B2B1D9C
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 15:43:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C26416E5;
	Fri, 13 Nov 2020 15:42:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C26416E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605278585;
	bh=lPiZtbaZGN7IiPilatA5CRm3b8p9HIIk6Lbvqh1xCFQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AGCiu/xxxyKPKgckX8ClRFfOKoTTRUIiUfZOs7RDX/xoMTYGq1T5TWv2OihemWlEd
	 YYYck1DkfdOzAB3YcP1QEfIRqvB4MS4m1uPsdS2oJ8Q3i3pCOu8rH8p6PfVV7s90eE
	 CbhVF9gdyIXDgVR/Z7Uq7xboAZa8etbMxroM86Dk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1600F8022B;
	Fri, 13 Nov 2020 15:41:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFB83F8020C; Fri, 13 Nov 2020 15:41:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0A31F80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 15:41:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0A31F80086
IronPort-SDR: 5ntui40OvorwupbyPdoE0zMER2l3Eo+Difte35pnvJrGdHYvuSt6Kb0uloGmObx9qngRt54LVq
 UOX/uPNv4TLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="169696990"
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="169696990"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 06:40:55 -0800
IronPort-SDR: jP/mOoG3bwpMRAxjZHG43L6Y5LgaTPqjQcSsiDCZy4IWG6P7ldwZ9TlUCPmTkJ9Nvyz2XNEA0n
 NM8LaGXetVAg==
X-IronPort-AV: E=Sophos;i="5.77,475,1596524400"; d="scan'208";a="532589707"
Received: from rjjumade-mobl.amr.corp.intel.com (HELO [10.209.182.8])
 ([10.209.182.8])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 06:40:52 -0800
Subject: Re: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
 <0a0854d1ddaf4f9b81ef5569a7d501a5@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <59ffee62-1c9c-a9ae-ab50-bec1b5356a7c@linux.intel.com>
Date: Fri, 13 Nov 2020 08:40:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0a0854d1ddaf4f9b81ef5569a7d501a5@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "tiwai@suse.de" <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
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


> Once and if SOF is ready to support all available atom configuration, it
> should deprecate and replace it with the same fashion catpt replaced its
> predecessor. Until that moment, things should remain as they are. No
> additional quirks or magic, just plain simple ACPI-ID based selection.

We have lots of users for the existing legacy Baytrail/Cherrytrail 
driver and we cannot ask distributions to switch one sunny day.

I reached out to Hans and Jaroslav to understand how this deprecation 
might happen, and it has to be done in steps. First include the 
SOF/BYT-CHT driver in builds, experiment and test and after a successful 
test period switch over.

Keep in mind that Intel folks have only a very limited subset of the 
hardware based on BYT/CHT so we have to work with the community to get 
feedback, that's very different to Broadwell where there are only 3 
platforms to be supported and an extremely limited number of users 
impacted by a switch since we are out of the ChromeOS support period.

In all cases, distributions and users, not Intel, make the call.
