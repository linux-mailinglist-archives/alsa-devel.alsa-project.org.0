Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0102A6DF9
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 18:21:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CC09168A;
	Tue,  3 Sep 2019 18:21:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CC09168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567527714;
	bh=9G+gF7jZcoitxDxC+6ne9uAhesAE9AVIwHC2lYtXKMk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bIsM2NikZBqqB4YB9UNT9Wk9l9PSmaQzX/UMJDU5D4IIAbuHNaVY47DpCQnreigp7
	 QfYv0EcFSnFHMRY1TYqGvXzKChAL6+t6x2yZ1+WgZiKmk0eRNwZ5k8veJ9jB0yC+bi
	 Jo0DxfjzNQ03S6ikLV6SeQMgT+P0NqaUjAff4PPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C476CF8045F;
	Tue,  3 Sep 2019 18:20:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9EBEF8045F; Tue,  3 Sep 2019 18:20:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE5A4F80228
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 18:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE5A4F80228
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 09:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,463,1559545200"; d="scan'208";a="184806082"
Received: from vypatel-mobl.amr.corp.intel.com (HELO [10.252.205.143])
 ([10.252.205.143])
 by orsmga003.jf.intel.com with ESMTP; 03 Sep 2019 09:19:59 -0700
To: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
References: <20190831145842.32990-1-hdegoede@redhat.com>
 <6fb859af-0ef8-5e64-6799-7679aaba1cb0@linux.intel.com>
 <dd42dd36-9a4f-e5fe-e8a1-9b3da1152899@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <df05fb72-7cf3-abbf-63fd-b9a52dd8566f@linux.intel.com>
Date: Tue, 3 Sep 2019 11:19:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dd42dd36-9a4f-e5fe-e8a1-9b3da1152899@redhat.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] [PATCH 1/2] conf/ucm: Add UCM profile for
 cht-bsw-rt5672 boards
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


>> I can't recall if I did any work here, took default settings from Bard 
>> Liao (when he was a Realtek) or if I just took examples from a 
>> Chromebook UCM file. I know there's a Dell tablet which uses this 
>> codec, but I just can't recall other devices.
> 
> I only have the Lenovo Thinkpad 8 with this codec.
> 
>> Also how does the selection of the configs work, I don't see the same 
>> thing as in bytcr_rt5640/51 to play with the card long name and 
>> quirks. Do you expect the user to select the 'right' configs based on 
>> experimental trial-and-error.
> 
> Like with the chtrt5645 and chtnau8824 there is no need for any
> kernel side quirks depending on the input/output config.
> 
> So the plan is to have a default profile which
> allows selecting all possible inputs / outputs (including
> ones not present) and then have DMI name based profiles,
> like the profile added for the Lenovo Thinkpad 8 in the
> second patch in this series, which only include the
> relevant inputs / outputs for that specific device
> (as we are doing already for the chtrt5645 and chtnau8824
> profiles)

Makes sense, I am not aware of too many devices so DMI would work. I 
have a Dell Venue Pro 5855 which is one of the quirks for this codec.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
