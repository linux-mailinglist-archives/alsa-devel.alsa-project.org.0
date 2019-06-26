Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B2C562E6
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 09:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83D1D1679;
	Wed, 26 Jun 2019 09:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83D1D1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561532941;
	bh=sH4dWx3nSOFU/c7VLvHFSe8qewb1DTxTkUo7xEORLLc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JBf+buozTDJOB+n69Zf4NLq/FZ7chK1g8rfJiIF+OyGp4jj9Wxp05x3MA2EI7O51Y
	 ssvJvI9U5uKq4exptgl6a1h6hmv3yyAdyrVj6yPcmNmQJwxDQ8qf0VzGD+XbPVSZDU
	 B8s7EUjp38imbV52X0aXLD6cyNMdsWpsVITgJM/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CB98F896CC;
	Wed, 26 Jun 2019 09:07:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3538EF896B9; Wed, 26 Jun 2019 09:07:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C37C3F8070C
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 09:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C37C3F8070C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 00:07:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,418,1557212400"; d="scan'208";a="188559958"
Received: from rlanex-mobl.amr.corp.intel.com ([10.251.157.231])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2019 00:07:09 -0700
Message-ID: <d6868e311421d8b2e77a67787ad10b7bc4c0829b.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Wed, 26 Jun 2019 00:07:08 -0700
In-Reply-To: <s5h7e98u9q5.wl-tiwai@suse.de>
References: <20190626062935.5549-1-ranjani.sridharan@linux.intel.com>
 <s5h7e98u9q5.wl-tiwai@suse.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH 0/2] Fixes for SOF module unload/reload
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 2019-06-26 at 08:44 +0200, Takashi Iwai wrote:
> On Wed, 26 Jun 2019 08:29:33 +0200,
> Ranjani Sridharan wrote:
> > 
> > A recent commit "ALSA: hdac: fix memory release for SST and SOF
> > drivers"
> > removed the kfree call for the hdac device in
> > snd_hdac_ext_bus_device_exit(). This requires that the SOF driver
> > also make the hdac_device and hdac_hda_priv device-managed so
> > that they can be freed when the SOF module in unloaded. The first
> > patch takes care of this change.
> > 
> > Additionally, because of the above change, the hda_codec is
> > device-managed and freeing it in snd_hda_codec_dev_release() leads
> > to kernel panic with module unload/reload stress tests. The second
> > patch includes the change to avoid freeing hda_codec for ASoC
> > driver.
> 
> In such a case, both patch need to be put into a single patch.
> Otherwise it leads to a bisection failure.
Thanks, Takashi. Just sent a v2 combining both the changes.

Thanks,
Ranjani
> 
> 
> thanks,
> 
> Takashi
> 
> > 
> > More details for the module unload/reload test failures can be
> > found
> > here: https://github.com/thesofproject/linux/issues/966
> > 
> > Ranjani Sridharan (2):
> >   ASoC: SOF: Intel: hda: Make hdac_device device-managed
> >   ASoC: hda: don't free hda_codec for HDA_DEV_ASOC type
> > 
> >  sound/pci/hda/hda_codec.c       | 8 +++++++-
> >  sound/soc/sof/intel/hda-codec.c | 6 ++----
> >  2 files changed, 9 insertions(+), 5 deletions(-)
> > 
> > -- 
> > 2.17.1
> > 
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
