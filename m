Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9C812305C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Dec 2019 16:31:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 886951615;
	Tue, 17 Dec 2019 16:30:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 886951615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576596703;
	bh=TYhhB0lvWSUluD9H11bMQnkkvYrHk3PSjVDceYEYOmw=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VfpZ6P6h2nliZDTgKTvqCgkMOKzM9RNPgkRISz50XlwIxh40cQHpBjSRVOUz/xbK/
	 Y9DRGdKTXM5TCnyD3aYj15JQiXXGTKA0MUPLH0jaIPJTk3Vw9ARRHpTWn7c//QPn1S
	 MXDzDaWyLpfeK4w+m1WoWflJ7FgokK0p8eAaFoz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCA05F80266;
	Tue, 17 Dec 2019 16:29:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59CE2F8023F; Tue, 17 Dec 2019 16:29:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2774F8023F
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 16:29:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2774F8023F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 07:29:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; d="scan'208";a="212605846"
Received: from pbossart-mac02.an.intel.com ([10.122.138.72])
 by fmsmga008.fm.intel.com with ESMTP; 17 Dec 2019 07:29:24 -0800
To: Takashi Iwai <tiwai@suse.de>, Cezary Rojewski <cezary.rojewski@intel.com>
References: <20191217095851.19629-1-cezary.rojewski@intel.com>
 <20191217095851.19629-6-cezary.rojewski@intel.com>
 <s5hzhfr1c8u.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <503799c4-b9cd-4128-5d5c-91f0fb25a009@linux.intel.com>
Date: Tue, 17 Dec 2019 08:06:32 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <s5hzhfr1c8u.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Divya Prakash <divya1.prakash@intel.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 5/7] ALSA: core: Implement compress page
 allocation and free routines
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

On 12/17/19 4:24 AM, Takashi Iwai wrote:
> On Tue, 17 Dec 2019 10:58:49 +0100,
> Cezary Rojewski wrote:
>>
>> Add simple malloc and free methods for memory management for compress
>> streams. Based on snd_pcm_lib_malloc_pages and snd_pcm_lib_free_pages
>> implementation.
> 
> I see no user of these functions in the series.  How these are
> supposed to be used?

I asked Cezary to post those patches on alsa-devel to make sure there is 
no disagreement on the initial solution.

The next steps would be probes (data injection/extraction in the DSP 
firmware) and compressed audio support for i.MX and Intel platforms.
Both would be coming in early Q1 next year.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
