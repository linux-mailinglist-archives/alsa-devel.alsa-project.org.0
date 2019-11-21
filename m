Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7940A1055E1
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Nov 2019 16:43:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D62D81778;
	Thu, 21 Nov 2019 16:42:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D62D81778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574351006;
	bh=UiaQfOC3S1Kf5hwISOMu3NmdyNHCBgypkmgjs0a41ow=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QmnQej2hy0pcNuNG9g2XOTKyJXCGkw1oSyIs+gK+paugzb9dyThOj34ZCMrNHXJK8
	 m+7NfwF4Hq2a5OWVzWE8n91GrpbKajlrAXgy6nJPK0FhhemOpQVn5bJTuE4GvWb1PR
	 gaw/GfrfxF+kDA17FIiO1DBW0UD0JnTNuFP3S59s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 113E0F8014E;
	Thu, 21 Nov 2019 16:41:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 460F2F800C1; Thu, 21 Nov 2019 16:41:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 225F7F800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Nov 2019 16:41:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 225F7F800C1
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Nov 2019 07:41:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,226,1571727600"; d="scan'208";a="205105002"
Received: from ptan2-mobl1.amr.corp.intel.com (HELO [10.255.231.235])
 ([10.255.231.235])
 by fmsmga008.fm.intel.com with ESMTP; 21 Nov 2019 07:41:32 -0800
To: Tzung-Bi Shih <tzungbi@google.com>
References: <20191120060256.212818-1-tzungbi@google.com>
 <20191120060256.212818-4-tzungbi@google.com>
 <8273f728-3d4b-b0dc-03b7-6276c5ae4460@linux.intel.com>
 <CA+Px+wWSajOFXwLAS+jrO9XUBeKaxjZaEOqng0YO9VmL3VXaSQ@mail.gmail.com>
 <7f055263-01a6-e1cd-8085-1790222bb808@linux.intel.com>
 <CA+Px+wX2UtU3As-3Bf4rWn1kzqDMPw60xk508gDDaOPk6Q5dgw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d97b9724-27d0-f157-ce5d-ed6c75bafae8@linux.intel.com>
Date: Thu, 21 Nov 2019 09:08:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CA+Px+wX2UtU3As-3Bf4rWn1kzqDMPw60xk508gDDaOPk6Q5dgw@mail.gmail.com>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>,
 Jimmy Cheng-Yi Chiang <cychiang@google.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: max98090: fix possible race
 conditions
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



On 11/21/19 12:17 AM, Tzung-Bi Shih wrote:
> On Thu, Nov 21, 2019 at 11:20 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>> Still you may want to clarify your second point and the commit message.
>> The first race condition was clear, the second one not so much.
>>
>> what did you mean with 'assert ULK == 0' and what does this map to in
>> pll_work
> 
> The case (2) race condition is based on the previous patch:
> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-November/158852.html

ah, ok, so that's a race you introduced :-)

> 
> After applying the patch, the code would be something like: (in the
> case, two threads read 0x01.)
> static void max98090_pll_work(struct work_struct *work)
> {
> [snip]
>          snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
>                              M98090_SHDNN_MASK, 0);
>          snd_soc_component_update_bits(component, M98090_REG_DEVICE_SHUTDOWN,
>                              M98090_SHDNN_MASK, M98090_SHDNN_MASK);
> 
>          for (i = 0; i < 10; ++i) {
>                  /* Check lock status */
>                  pll = snd_soc_component_read32(
>                                  component, M98090_REG_DEVICE_STATUS);
>                  if (!(pll & M98090_ULK_MASK))
>                          break;
> 
>                  /* Give PLL time to lock */
>                  usleep_range(1000, 1200);
>          }
> }

Sorry, I don't see at what point the race happens.

if your interrupt sees an ULK status, it will schedule the pll_work.
You only test the status again *after* switching the device on/off, so 
what is the side effect?

I am also wondering if you shouldn't sleep first in the loop, then check 
the status?

And in case you do have a side effect due to the clear on read, maybe 
you could save the status in a context and retest in the workqueue, that 
way you'd have a trace of the ULK event even if the register was cleared.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
