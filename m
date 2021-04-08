Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED989358A24
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 18:51:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70A96165E;
	Thu,  8 Apr 2021 18:50:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70A96165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617900709;
	bh=5hxq1YMUZDXX38JDwpHyuOyvRSEhszi/jinSXWekPMc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k9p/G1ac4adgIrBbPRfzFpZU0X90bIOVuPHVLKprIetWVVQu3U4HIaEIrxGnaaPLZ
	 l10czxrnRTfV6qMD3A71CWGhTDuuIyj9uEk+r8ewHz8Me/ZwzxLfQLpvNpxePYgIy+
	 fewD2Z3T0GqVAwUHu//UVvo+N0Ukkq1E1I3RsD68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9C91F800BD;
	Thu,  8 Apr 2021 18:50:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14993F800BD; Thu,  8 Apr 2021 18:50:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AD651F800BD
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 18:50:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD651F800BD
IronPort-SDR: gnbDlaVi/3Exu+4p538qIjfXHDYjEMW4sNo3CLElR9h4MofRfPQ5E9tUHvtNQk383fr/LNhPzV
 52w5d/tbJM6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="191432989"
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; d="scan'208";a="191432989"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 09:50:12 -0700
IronPort-SDR: qhGfNQPzbPT4Bpj5N6nY7kXhlYa6xOT9K2uN5o+Q1n9jlekw2/HeLlHSSRRLbhWmbqlw3Zn/Wr
 GxqwN0gvYBTg==
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; d="scan'208";a="458899864"
Received: from kritiaga-mobl.amr.corp.intel.com (HELO [10.212.59.29])
 ([10.212.59.29])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 09:50:11 -0700
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
 <20210408162250.GN4516@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <da26eb5e-aaa6-8170-1e75-c53c7bbcda60@linux.intel.com>
Date: Thu, 8 Apr 2021 11:50:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210408162250.GN4516@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
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



On 4/8/21 11:22 AM, Mark Brown wrote:
>> Actually, the generic ASoC drivers are too much generic and they didn't
>> provide a solid information about the hardware.
> So if the information provided through the driver is too generic then we
> should ideally be fixing those drivers/systems to do something sensible.
> For the DT systems the generic cards have properties that let the system
> just specify names directly so it will just be a case of setting them
> properly and it should just be the x86 systems that are a problem.  ACPI
> is a bit of a lost cause here, most of the systems aren't interested in
> supporting Linux in the first place and the idioms there aren't great,
> but for DT it's reasonably tractable to push back on people if there's
> issues and it's much more scalable to do that than telling individual
> users to do that.

Even in the DT case, you may be able to set a specific path for DSP 
firmware and topology but would you really have enough information to 
describe what the DSP firmware and topology actually do? That 
information is part of the DSP firmware manifest and topology.

In addition, the firmware/topology are typically located on the file 
system, it'd be a hassle to have to edit DT properties every time you 
have a new distribution update, wouldn't it?
