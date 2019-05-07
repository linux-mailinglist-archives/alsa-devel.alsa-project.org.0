Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FCDE16CD6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 23:08:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94C9D17D2;
	Tue,  7 May 2019 23:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94C9D17D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557263323;
	bh=iR6z9JcXa9nvhhGZHQichWdPfTotM6tbuD1ZmztR4ek=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V0OFJoPfgYlrGhio9vnI0Zexy9pepZDP0iexD/sm9wcnhP1093P1TP+O6BPlFIKmp
	 5ykDvhowMtJJ43/HuT1dMZM/H6eZxzwkLpOx2lVNNrWpE/eWS5u35/jZPG3XRhEnd+
	 50ns7St3Us0hzVMAgmuLiZtzmk6DsqptHK+6EzHI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4465FF89674;
	Tue,  7 May 2019 23:06:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DC63F89674; Tue,  7 May 2019 23:06:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58040F807B5
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 23:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58040F807B5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 May 2019 14:06:48 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga004.fm.intel.com with ESMTP; 07 May 2019 14:06:48 -0700
Received: from khbyers-mobl2.amr.corp.intel.com (unknown [10.251.29.37])
 by linux.intel.com (Postfix) with ESMTP id 6BA21580105;
 Tue,  7 May 2019 14:06:47 -0700 (PDT)
To: Evan Green <evgreen@chromium.org>
References: <20190506225321.74100-1-evgreen@chromium.org>
 <20190506225321.74100-2-evgreen@chromium.org>
 <74e8cfcd-b99f-7f66-48ce-44d60eb2bbca@linux.intel.com>
 <64FD1F8348A3A14CA3CB4D4C9EB1D15F30A7C756@BGSMSX107.gar.corp.intel.com>
 <5c42b741-5e5c-ce00-8321-59df1df115f1@linux.intel.com>
 <CAE=gft5TeW1h3GAT9Gkwdf8eE_p5aoywveE2ddXgYQ+fET8Sdg@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <73ebe767-0371-00aa-bb0b-9cb2ba708a42@linux.intel.com>
Date: Tue, 7 May 2019 16:06:46 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAE=gft5TeW1h3GAT9Gkwdf8eE_p5aoywveE2ddXgYQ+fET8Sdg@mail.gmail.com>
Content-Language: en-US
Cc: Rajat Jain <rajatja@chromium.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>, "M R,
 Sathya Prakash" <sathya.prakash.m.r@intel.com>, "M,
 Naveen" <naveen.m@intel.com>
Subject: Re: [alsa-devel] [PATCH v1 1/2] ASoC: SOF: Add Comet Lake PCI ID
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


>> What we are missing are the PCI IDs for CML PCH-LP (0x02C8) and CML
>> PCH-H (0x06C8).
>>
>> Can we respin this patchset to add support for those last two instead of
>> just the -LP case?
> 
> Sure. So just to clarify, you want the entry for 0x02c8, and you want
> an additional entry for 0x06c8 under the same config. Will do.

I'd like both entries but with different Kconfigs (e.g. CometLake-LP and 
CometLake-H). We have one PCI ID per Kconfig so far.

>>
>> I'll send a patch to add those IDs for the HDaudio legacy driver for
>> consistency.
> 
> Actually I've got that change ready to go too, I'm happy to send that out.

I guess I beat you to it.
Thanks for reporting all this.
-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
