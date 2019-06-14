Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 266FE45A59
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 12:26:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE704186B;
	Fri, 14 Jun 2019 12:25:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE704186B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560507980;
	bh=qpxJ4mH+W7+MZR2Y7LPv8DGWZ5+3YuH6Mn0jMBpnqkw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CkY8vEB0HfhRyNDDkFjiTca/+gwbFrKBPfTxsQg5iO206lLgd1EcQaRST0tPkVv7/
	 meXykt9+wlox8+vvh6NFSkhXddXcMPzNe3OVny9mQrz/LiR5zftkIGfqVE7CqAjJX7
	 THWZaBTgXA3Nb01hdzHyVRHQ280V+BgXW+oK5RQ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51A63F896E0;
	Fri, 14 Jun 2019 12:24:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6526FF896E0; Fri, 14 Jun 2019 12:24:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CC55F80794
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 12:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CC55F80794
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jun 2019 03:24:27 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 14 Jun 2019 03:24:26 -0700
Received: from jhoenked-mobl.ger.corp.intel.com (unknown [10.252.48.113])
 by linux.intel.com (Postfix) with ESMTP id 171255803E4;
 Fri, 14 Jun 2019 03:24:24 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
References: <20190612164726.26768-1-pierre-louis.bossart@linux.intel.com>
 <20190612164726.26768-3-pierre-louis.bossart@linux.intel.com>
 <20190613184801.GV5316@sirena.org.uk> <s5hk1dpe283.wl-tiwai@suse.de>
 <20190613191303.GX5316@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3e1f9a13-02db-5524-3457-935b34db4115@linux.intel.com>
Date: Fri, 14 Jun 2019 12:24:22 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613191303.GX5316@sirena.org.uk>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH v2 2/3] ASoC: SOF: acpi: add module param
 to disable pm_runtime
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


>>> I can't immediately find it right now but isn't there some generic way
>>> of doing this in the runtime PM framework?  If not it seems like it'd be
>>> a good thing to add, these can't be the only devices where it'd be
>>> useful.
> 
>> Well, runtime PM can be fully controlled via sysfs, but the problem is
>> that the driver declares itself being runtime-enabled.
>> So, either we leave it default and let user-space enabling it (via
>> udev or other way), or introduce some condition in the driver side.
> 
> I thought someone had added a command line parameter to do it based on
> dev_name(), perhaps they were just talking about it or it was in some
> BSP somewhere though.

If there is a better way I am all ears. It's indeed not very elegant to 
duplicate the same parameter for two different modules and it's not an 
SOF-specific need.

The only way I am aware of is to play with 
/sys/bus/pci/devices/xyz/power/ files but it's not very useful if you 
want to disable the initial runtime pm transition which is often the 
more problematic one. Completely removing runtime_pm support from all 
drivers at compile time is also not very good either.




_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
