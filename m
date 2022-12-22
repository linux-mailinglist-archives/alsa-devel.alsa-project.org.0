Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EA1653A18
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Dec 2022 01:28:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 330DC1706;
	Thu, 22 Dec 2022 01:27:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 330DC1706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671668899;
	bh=jHQcEHSK0InmHnPsXM0Gx80tyPuqDCQXyyxjt9KKKBE=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=m1ygqjV0iVKEDURmzMyB8Pprigwo97RYkxU+t6Is2k2jr3EQBFdnZN1SThTetLHHb
	 PFdL8fiMqjSHvELtej73Evi9dEg/BLT/Gnwynn8oENQIP9vM1tmncoeG0UQlXXyASQ
	 orfcUwNIlxjejKF4fHfs3Pf2muz9iX9OYqVFZleo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB334F801C1;
	Thu, 22 Dec 2022 01:27:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92882F804AD; Thu, 22 Dec 2022 01:27:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22C63F801C1
 for <alsa-devel@alsa-project.org>; Thu, 22 Dec 2022 01:27:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22C63F801C1
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bu1Wri1X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671668844; x=1703204844;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jHQcEHSK0InmHnPsXM0Gx80tyPuqDCQXyyxjt9KKKBE=;
 b=bu1Wri1XIc5kfQZ500L03mZ3Hh89djJAdtCrdC+Vw3X/MH31/IFGJbq/
 zzP1NqmHqb1RGwwgvy7/378B7Hxy0tTbVEdxEzEmXqYTRcjg7GAxFHIK1
 hd6Kwnolxlp/7GBe2g+lB8jzdBw7IE6cPS+M7+mI0LTIg1E3/vOXGurAl
 QC2Oh7wO11orzRCX/VeunMfHd3fDvOGvMFXg2D2SXj5L4m1zsrG1dQtun
 khIX1LG2+pKDE5h+cDBJA9s0vZwmVK9H+uqGw8tRVo9tB3ZgiRr59NvxT
 DABdA6PTBE2kN8j8bbAUuhG5RiMym8rpJ7Caa0Wf8opGPnkpWrlQoqFdT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="299679566"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="299679566"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 16:27:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="740360369"
X-IronPort-AV: E=Sophos;i="5.96,263,1665471600"; d="scan'208";a="740360369"
Received: from gaoyuanf-mobl.amr.corp.intel.com (HELO [10.212.85.133])
 ([10.212.85.133])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 16:27:15 -0800
Message-ID: <07538266-ea40-389e-9e68-054822121e0b@linux.intel.com>
Date: Wed, 21 Dec 2022 18:27:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2] ASoC: Intel: sof_nau8825: add variant with nau8318
 amplifier.
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
References: <20221216154938.9426-1-ajye_huang@compal.corp-partner.google.com>
 <b0612bbd-2eba-36cf-9c29-7542cf32adfd@linux.intel.com>
 <CALprXBYy9_ax8-xfh0paB59Pn=TB7yVLwtY8vnT_-y5vWd867w@mail.gmail.com>
 <9aa4bffd-bc7e-0e40-3063-5ce80b5fbe9a@linux.intel.com>
 <CALprXBZkhWitJBeenKHxzyQvkf=Q2FDAHKD511oCWC8-SJBK+A@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CALprXBZkhWitJBeenKHxzyQvkf=Q2FDAHKD511oCWC8-SJBK+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Libin Yang <libin.yang@intel.com>,
 "balamurugan . c" <balamurugan.c@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, David Lin <CTLIN0@nuvoton.com>,
 alsa-devel@alsa-project.org, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/21/22 17:30, Ajye Huang wrote:
> Hi Pierre
> 
> On Sat, Dec 17, 2022 at 1:37 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
> 
>>
>> Ok, thanks for the explanations.
>>
>> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Yesterday, I saw Arnd Bergmann sent this patch "ASoC: Intel:
> sof-nau8825: fix module alias overflow " for reducing the string to
> prevent over length,https://patchwork.kernel.org/project/alsa-devel/patch/20221221132515.2363276-1-arnd@kernel.org/.
> 
> so, I need to check with you, should my string need to change the
> format style with his, even the my string does not over length , from
> .drv_name = "adl_nau8318_nau8825" to .drv_name = "adl_nau8318_8825",
> align with his format style?

That would be more consistent indeed, no objections from me.
