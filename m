Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE8C429D0
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 16:48:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 350161767;
	Wed, 12 Jun 2019 16:47:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 350161767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560350904;
	bh=pabRPKF8foplMzxQNs/jKtTuOh0IuwXHbYUCIpugM/Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gu2Fn4fiC0Lq15Wqkt0CnS5TlenWW94/Z0+JJGIfjVFPiGjcCXfpzoVKCMl7N/XIW
	 Z0rGBXugxE86nV55riDLuzuD815ISDIc+fVQ3wi1/Evs1X/idXKq+A7WFJZMm2ludx
	 I7B7RYU1M/JYfPWFMg6Wop7ItDlwu4ZB1QCDaf04=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0C26F896E0;
	Wed, 12 Jun 2019 16:46:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E77EF896E0; Wed, 12 Jun 2019 16:46:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ED24F80791
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 16:46:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ED24F80791
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 07:46:24 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 12 Jun 2019 07:46:23 -0700
Received: from smriley-mobl.amr.corp.intel.com (unknown [10.252.130.236])
 by linux.intel.com (Postfix) with ESMTP id 91F16580490;
 Wed, 12 Jun 2019 07:46:23 -0700 (PDT)
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20190612094452.1060-1-kai.vehmanen@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ba5e42ab-7f1e-01b9-835d-52a1e42a0fe0@linux.intel.com>
Date: Wed, 12 Jun 2019 09:46:24 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612094452.1060-1-kai.vehmanen@linux.intel.com>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] [PATCH 0/3] ASoC: SOF: fix suspend ordering with
	runtime idle
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

[Cc: Takashi]

On 6/12/19 4:44 AM, Kai Vehmanen wrote:
> Hi all,
> this series addresses issues with ordering of HDA codec and controller
> suspends in the runtime PM flows. The implemented logic for SOF is
> similar to what has been used by the Intel AZX HDA driver.
> 
> To implement this, first a fix is needed to hdac_hdmic ASoC codec
> driver. SOF framework also needs to be extended to allow SOF devices
> to implement a runtime_idle callback. Third, concrete implementation
> is in a separate patch for APL/CNL Intel hardware, for which strict
> ordering of codec-controller power down sequence needs to be
> maintained.

Looks good to me
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

but of course we'd want feedback from Takashi and other folks more 
familiar with the HDaudio history. There will be additional patches in 
the coming days where we are catching up with issues that were fixed in 
the legacy driver but either missed or not known to the SOF developers.

> 
> As this extends the SOF device interface, Pierre asked me to
> send to the list for wider review. This series has been prereviewd
> at SOF github as:
> https://github.com/thesofproject/linux/pull/1003

Indeed we want the SOF core changes and dependencies (topology and 
hdaudio typically) to be reviewed on the alsa-devel mailing list. For 
Intel-specific fixes we still want to use GitHub and provide patches 
when we've hit a decent level of validation on prototype and production 
hardware, otherwise we'll increase the traffic on this list for no good 
reason.

> Kai Vehmanen (3):
>    ASoC: hdac_hdmi: report codec link up/down status to bus
>    ASoC: SOF: add runtime idle callback
>    ASoC: SOF: Intel: implement runtime idle for CNL/APL
> 
>   sound/soc/codecs/hdac_hdmi.c  |  2 ++
>   sound/soc/sof/intel/apl.c     |  1 +
>   sound/soc/sof/intel/cnl.c     |  1 +
>   sound/soc/sof/intel/hda-dsp.c | 13 +++++++++++++
>   sound/soc/sof/intel/hda.h     |  1 +
>   sound/soc/sof/pm.c            |  8 ++++++++
>   sound/soc/sof/sof-acpi-dev.c  |  2 +-
>   sound/soc/sof/sof-pci-dev.c   |  2 +-
>   sound/soc/sof/sof-priv.h      |  2 ++
>   9 files changed, 30 insertions(+), 2 deletions(-)
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
