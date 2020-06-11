Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBA41F6D4A
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jun 2020 20:14:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F3D61688;
	Thu, 11 Jun 2020 20:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F3D61688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591899286;
	bh=3dcycSN1pzs0IExZs9Kb+Py7q/ZZ0GFqj/DbNs72leg=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EvJmPNLBqWayxLiI5fIBD+zh5ITOrKQZU+PXeHdCzOH5eqkaKD95M3Zl25AYy8fAn
	 1xkBmXlD7LA5NFX6WZGyIJBDGpHTg5Akp+6EmSeWbkmc7ZQsj/3/J9PIfTfCOf5Tow
	 AP7XZyzK+g/0rdA3Uxh1i9MumL3tDQ7BOQwFE+w8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BCDFF8028D;
	Thu, 11 Jun 2020 20:13:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F0EFF8028C; Thu, 11 Jun 2020 20:13:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B98E9F80058
 for <alsa-devel@alsa-project.org>; Thu, 11 Jun 2020 20:12:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B98E9F80058
IronPort-SDR: Ie8cLxE5VPsXQMl3uRo0seWJWlpoYTLveVm42vn92kts5LSzvA4rOgN42Sur/O/zMXsmr7wlcV
 E4KsAKDslA+Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 11:12:54 -0700
IronPort-SDR: sgGeycKqS49OljXzUmElxdqto92wMSFKg9+yX1gughcpFA1byNZuzBPzJ+vRJabTr/S1Wb8+DX
 0OH2e2Ii1Fig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,500,1583222400"; d="scan'208";a="289624840"
Received: from ttvo1-mobl.amr.corp.intel.com ([10.251.138.170])
 by orsmga002.jf.intel.com with ESMTP; 11 Jun 2020 11:12:53 -0700
Message-ID: <ccccab4d074878cd8fc3b3c4313025e54f78b65a.camel@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: hda: unsolicited RIRB response
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>, "Lu, Brent" <brent.lu@intel.com>
Date: Thu, 11 Jun 2020 11:12:53 -0700
In-Reply-To: <s5h5zbxeb5t.wl-tiwai@suse.de>
References: <1591883073-17190-1-git-send-email-brent.lu@intel.com>
 <b7e0b822a9deea506acaa40e0e31cc9f488bb446.camel@linux.intel.com>
 <DM6PR11MB4316108BCF449D52E49C7E4297800@DM6PR11MB4316.namprd11.prod.outlook.com>
 <s5h5zbxeb5t.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "sound-open-firmware@alsa-project.orgDRIVERS"
 <sound-open-firmware@alsa-project.orgDRIVERS>, "commit_signer:6/16=38%,
 authored:6/16=38%, added_lines:123/248=50%, removed_lines:36/84=43%, Kai
 Vehmanen DRIVERS \)" <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, "Rojewski, 
 Cezary" <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart DRIVERS <pierre-louis.bossart@linux.intel.com>,
 "authored:2/16=12%, added_lines:21/248=8%, removed_lines:5/84=6%, \), Liam	 	
 Girdwood DRIVERS \)" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Daniel Baluta DRIVERS \)" <daniel.baluta@nxp.com>,
 Zhu Yingjiang <yingjiang.zhu@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Thu, 2020-06-11 at 19:59 +0200, Takashi Iwai wrote:
> On Thu, 11 Jun 2020 19:09:08 +0200,
> Lu, Brent wrote:
> > 
> > > Hi Brent,
> > > 
> > > Thanks for the patch. Is this fix for a specific issue you're
> > > seeing?
> > > If so, could you please give us some details about it?
> > > 
> > > Thanks,
> > > Ranjani
> > 
> > Hi Ranjani,
> > 
> > It's reported to happen on GLK Chromebook 'Fleex' that sometimes it
> > cannot output the audio stream to external display. The kernel is
> > Chrome v4.14 branch. Following is the reproduce step provided by
> > ODM but I could reproduce it simply running aplay or
> > cras_test_client
> > so I think it's not about the cable plug/unplug handling.
> > 
> > What steps will reproduce the problem?
> > 1.      Play YouTube video on Chromebook and connect it to external
> > monitor with Type C to DP dongle
> > 2.      Press monitor power button to turn off the monitor
> > 3.      Press monitor power button again to turn on the monitor
> > 4.      Continue to play YouTube video and check audio playback
> > 5.      No sound comes out from built-in speaker of external
> > monitor when turn on external monitor
> > 
> > I added debug messages to print the RIRBWP register and realize
> > that
> > response could come between the read of RIRBWP in the
> > snd_hdac_bus_update_rirb() function and the interrupt clear in the
> > hda_dsp_stream_interrupt() function. The response is not handled
> > but
> > the interrupt is already cleared. It will cause timeout unless more
> > responses coming to RIRB.
> 
> Now I noticed that the legacy driver already addressed it recently
> via
> commit 6d011d5057ff
>     ALSA: hda: Clear RIRB status before reading WP
> 
> We should have checked SOF at the same time, too...

Thanks, Takashi. But the legacy driver but doesnt remove the loop. The
loop added in the SOF driver was based on the legacy driver and
specifically to handle missed stream interrupts. Is there any harm in
keeping the loop?

Thanks,
Ranjani

