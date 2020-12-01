Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9852CA7F4
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 17:17:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A82B16A8;
	Tue,  1 Dec 2020 17:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A82B16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606839431;
	bh=fe3e3RQkF+coD3MaLlnr5IZ8bfJcQvO8J8OscF5c1qg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RO2IbvN9ZDe+3Pm4Q+jV6rhAY1rhy89I03Uvuo4gaPfEAecXokKpMu/GCDFl8IjiV
	 dOBtf7K0oqWHJEnNTzzkmdWvOJv9U9QmegtUiBG4bzXetSoec+GUnFhaz6uTGavZ6n
	 jKRFCRsoPKB2kQ6bLilesDfa48CisbX3xCE9lQJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A603CF80254;
	Tue,  1 Dec 2020 17:15:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32CA1F8016D; Tue,  1 Dec 2020 17:15:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6642F80158
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 17:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6642F80158
IronPort-SDR: sTk513zovDm8KF51nEKKPQ0aBD+G16o55Iwc8818+iip4HwLfCH84UT/EeV6RHA5wXjCN5/XAB
 RRrF8M1t5WRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="173015859"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="173015859"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 08:15:17 -0800
IronPort-SDR: b4PgoVcNYTrl+nk8JXBm6SycYE0D12DjoBVFUbiTyo9+nTGWOBWLRzycdqCEzgww+Jmhmfog9S
 xF+UnR7Wghkw==
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; d="scan'208";a="361096958"
Received: from mabdelqa-mobl1.amr.corp.intel.com ([10.209.187.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 08:15:16 -0800
Message-ID: <ef5dce32556b20e184dfd496e5f7b81a54b60a3c.camel@linux.intel.com>
Subject: Re: Asoc: Intel: SST (CHT) regression in asoc/for-5.11
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
Date: Tue, 01 Dec 2020 08:15:15 -0800
In-Reply-To: <s5h5z5ld1ox.wl-tiwai@suse.de>
References: <93cc93a1-82bd-f5a3-4e19-4cfc65c868e7@redhat.com>
 <2d9d0d43-8239-01e2-3787-98dfd305e369@linux.intel.com>
 <7b50862a-d7e3-6a72-833d-5c8283c8deab@linux.intel.com>
 <s5h5z5ld1ox.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

> > 
> > I was able to reproduce this error with Mark's for-next branch on a
> > CHT device w/ rt5640, and git bisect points to this commit:
> > 
> > a27b421f1d04b201c474a15ee1591919c81fb413 is the first bad commit
> > commit a27b421f1d04b201c474a15ee1591919c81fb413
> > Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> > Date:   Tue Nov 17 13:50:01 2020 -0800
> > 
> >     ASoC: pcm: call snd_soc_dapm_stream_stop() in soc_pcm_hw_clean
> > 
> >     Currently, the SND_SOC_DAPM_STREAM_START event is sent during
> >     pcm_prepare() but the SND_SOC_DAPM_STREAM_STOP event is
> >     sent only in dpcm_fe_dai_shutdown() after soc_pcm_close().
> >     This results in an imbalance between when the DAPM widgets
> >     receive the PRE/POST_PMU/PMD events. So call
> >     snd_soc_dapm_stream_stop() in soc_pcm_hw_clean() before the
> >     snd_soc_pcm_component_hw_free() to keep the stream_stop DAPM
> >     event balanced with the stream_start event in soc_pm_prepare().
> > 
> >     Also, in order to prevent duplicate DAPM stream events,
> >     remove the call for DAPM STREAM_START event in
> > dpcm_fe_dai_prepare()
> >     and the call for DAPM STREAM_STOP event in
> > dpcm_fe_dai_shutdown().
> > 
> >     Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> >     Reviewed-by: Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com>
> >     Signed-off-by: Ranjani Sridharan <
> > ranjani.sridharan@linux.intel.com>
> >     Link:
> > https://lore.kernel.org/r/20201117215001.163107-1-ranjani.sridharan@linux.intel.com
> >     Signed-off-by: Mark Brown <broonie@kernel.org>
> > 
> >  sound/soc/soc-pcm.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> > 
> > 
> > I am not sure why this break the Atom/SST driver, this was reviewed
> > and seemed legit - even required IIRC to deal with topology
> > pipelines
> > initialized on-demand. Reverting this patch restores functionality.
> > I
> > would guess it's the DAPM_STREAM_START that's now missing (or in
> > the
> > 'wrong' location) and causing issues?
> 
> Indeed the DAPM_START_STREAM call completely disappeared after the
> patch, which looks very wrong.  This has to be revisited before 5.11
> merge.

Hi Pierre/Takashi,

The DAPM_STREAM_START event is still there in soc_pcm_prepare() and
this patch only removed the duplicate call in dpcm_fe_dai_prepare().

I wonder if it is the placement of the DAPM_STREAM_STOP is the issue. I
will look into this today.

Thanks,
Ranjani

