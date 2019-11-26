Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B16A10A0D7
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 15:58:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBFD1178A;
	Tue, 26 Nov 2019 15:58:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBFD1178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574780330;
	bh=QWpBXp7ky5VH7RTk1C9mjvFts0rbaDu0Q6ylU6MrcI8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KX+ShC41sQojotYGAkpWL97AnXCs/BiLEE8uZpHjTU5JyHVIQ19Vn9TVjAUOjcVhP
	 bMI6yaYTvejdFmHLnncrybe99MS/nn0YL4X9cWn2j35mQnP9B0gMXG5D5oE1gbbNnt
	 XpfLoFOmMDqWnl8arYNt3Egtd3oqdXB/bXzNZYjY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BDB8F801F4;
	Tue, 26 Nov 2019 15:57:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF10FF80159; Tue, 26 Nov 2019 15:57:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B38E5F800DD
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 15:57:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B38E5F800DD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 06:57:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="211435194"
Received: from vramali2-mobl1.amr.corp.intel.com (HELO [10.251.155.193])
 ([10.251.155.193])
 by orsmga006.jf.intel.com with ESMTP; 26 Nov 2019 06:57:50 -0800
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20191126103404.29534-1-perex@perex.cz>
 <dd238740-f154-a660-2a80-0ada80183dd2@linux.intel.com>
 <32edec86-ec1c-1809-2278-fecac09ac321@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <14a7c2b3-111a-5658-5203-5cbceb7c4251@linux.intel.com>
Date: Tue, 26 Nov 2019 08:57:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <32edec86-ec1c-1809-2278-fecac09ac321@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: intel/skl/hda - export number of
 digital microphones via control components
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



On 11/26/19 7:51 AM, Jaroslav Kysela wrote:
> Dne 26. 11. 19 v 13:33 Pierre-Louis Bossart napsal(a):
>>
>>
>> On 11/26/19 4:34 AM, Jaroslav Kysela wrote:
>>> It is required for the auto-detection in the user space (for UCM).
>>>
>>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>> Cc: Mark Brown <broonie@kernel.org>
>>
>> Thanks Jaroslav.
>> The changes are fine, but the code changes in hda.c will conflict with
>> the cleanups done by Ranjani (which I was planning to send next week).
>>
>> Any objections if we take this patch into the SOF tree (without changes
>> to authorship) and provide it on alsa-devel next week with the cleanups,
>> so that we don't have any conflicts?
> 
> I'm fine with that, if we don't miss the 5.5 merge window. Otherwise, 
> you may rebase your changes on top. Mark?

I just shared the changes, but I wasn't planning to see those changes in 
5.5 since they are quite big, so if you want this in 5.5 I'll rebase.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
