Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 865142CCD0
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 19:00:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D85E81848;
	Tue, 28 May 2019 19:00:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D85E81848
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559062858;
	bh=RVOQVBuEUige0CiG0k1jCN0BJ5GOX9EjJ4iJgBJ+eA0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ncvf4+7xOv8zsJBGo8a7JgC2gniFREDxf1zTQCI6TKtNjOq1LqVUtN0/cvgv66zGd
	 mOlZYSMHWTNRMEvQCAMD7qAX9L84blKscIb2WWqFLqBsbTnxACt0y3r4G5Xm7CQfFz
	 yTSR8uI6d5vxYT8oytO/h6WBU+k7ZAdqqUwC7NT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C303F896EB;
	Tue, 28 May 2019 18:59:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA1E5F89706; Tue, 28 May 2019 18:59:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D3D2F8065A
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 18:59:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D3D2F8065A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 May 2019 09:59:04 -0700
X-ExtLoop1: 1
Received: from ngnagark-mobl.amr.corp.intel.com (HELO [10.254.104.129])
 ([10.254.104.129])
 by orsmga007.jf.intel.com with ESMTP; 28 May 2019 09:59:04 -0700
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>,
 Connor McAdams <conmanx360@gmail.com>
References: <s5hblzmvdcq.wl-tiwai@suse.de>
 <9668d632-c5c9-5114-39cb-0e8a105a547c@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <9d5ef75c-9b28-3998-865d-a958b7aaaa75@linux.intel.com>
Date: Tue, 28 May 2019 11:59:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9668d632-c5c9-5114-39cb-0e8a105a547c@perex.cz>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Merging the new firmware files for CA0132 into
 alsa-firmware
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



On 5/28/19 11:38 AM, Jaroslav Kysela wrote:
> Dne 28. 05. 19 v 16:54 Takashi Iwai napsal(a):
>> Hi,
>>
>> it seems that Connor's previous attempt to put a couple of ca0132
>> firmware files into linux-firmware tree didn't go through,
>> unfortunately.  And now I'm thinking of taking them into alsa-firmware
>> package as a stop-gap.  We already distribute other ca0132 firmware
>> files, so the addition shouldn't be a big problem.
>>
>> Jaroslav, what do you think?
> 
> No problem. The same situation is for the SoC SOF firmware files (drivers are
> in kernel, firmware files are missing). Perhaps, we can release those files
> quickly in alsa-firmware and then migrate them slowly to linux-firmware.

for SOF there are 4 cases

1. developers/integrators build from scratch themselves from the public 
tree.
2. integrators build from scratch with their own secret sauce added.
3. distros want a binary since they don't want to build from source 
and/or don't have access to all the DSP tools
4. distros needs a binary signed with the Intel production key (e.g. to 
run on devices initially designed for Windows).

So far we were mostly dealing with case 1. Case 2 is allowed by the SOF 
permissive license and there's no need to look into this. We are 
planning releases for the last two cases, with a cadence aligned with 
kernel updates. It's not fully clear to me if the linux-firmware tree is 
the 'right' solution since ideally we'd want to have firmware, topology 
and UCM files released at the same time.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
