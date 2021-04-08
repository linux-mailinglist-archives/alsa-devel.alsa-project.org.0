Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E2F358894
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 17:34:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B700D165E;
	Thu,  8 Apr 2021 17:33:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B700D165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617896050;
	bh=cdxzXpA+uLf8pLQKmA8qF75iHLDWIUzco3m6yvidPHA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ARjzh8ktpTn7+kW2sMGg+zGEYl81+A1h5jHlaZMYXtHNA03CT+buNkPyEDMgggOLY
	 AgM/Ge/5/GNoswFipAzitduWeZsh5hU6tM1z0Orm2fk2XIWU0bCmpiYj8ZLpBt+uzs
	 3hZaJl0IoYCC5Q2joY3sgTTdFzuWlSM3DE4LAmtg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04F52F80246;
	Thu,  8 Apr 2021 17:32:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF618F8020B; Thu,  8 Apr 2021 17:32:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2DB4F8012F
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 17:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2DB4F8012F
IronPort-SDR: 7th+Pgt7uuY96/rJUkxD+MUKDDSpIeR64nS7+x9Q/YpEQ9FecD2GcfVpiQA59XHrUxgvPSvFCB
 ygXOAhO7DA+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="193682994"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="193682994"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 08:32:32 -0700
IronPort-SDR: PtnTpvQsFIsmztLMayGgbauJRCJ6abowomed6VHmi6FrDCnJRbtnNv+BnLdAAVh23nIAlZPRQB
 C0zqBRwc6yhg==
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; d="scan'208";a="610128148"
Received: from raltaraw-mobl1.amr.corp.intel.com (HELO [10.212.106.80])
 ([10.212.106.80])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 08:32:31 -0700
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>,
 Mark Brown <broonie@kernel.org>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3107db1d-f97d-539a-05db-6f880b762f00@linux.intel.com>
Date: Thu, 8 Apr 2021 10:32:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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



On 4/8/21 10:01 AM, Jaroslav Kysela wrote:
> When we have a common standard layer for the plug-and-play handling (udev), we
> should concentrate to allow changing / refining of this information there.
> Those strings are not used for anything else than the user space. So from my
> view, there's no reason to create another mechanism to handle the overrides.
> It should be a safe, fast, flexible and_optional_  solution. The udev can
> alter the sysfs attributes directly without any hassle with the file
> modifications or looking for another way to pass / store this information
> somewhere.

There's one part where I am lost.

The initial idea of udev what to modify kernel parameters to pick a 
different path for firmware/topology before probing the PCI driver. At 
that point there is no card and no sysfs attributes just yet, they will 
be added at a later point during the probe itself.

So are we talking about a second set of rules that would be applied when 
the card is created?
