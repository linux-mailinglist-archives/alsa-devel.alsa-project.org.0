Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E14802BC70
	for <lists+alsa-devel@lfdr.de>; Tue, 28 May 2019 02:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E13017C6;
	Tue, 28 May 2019 02:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E13017C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559002319;
	bh=OcIqoICXFYT1myoAT8fzHtU1me7JVbofoFDrRBO/5Bs=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BKsVCXXuQ0aecwgKu2nQ19N+UePE56iferkzGyx963MRTdRuXJl7hd7aFrXJZ8TkJ
	 BOBp8wYVCyWwD+1dk9BX9deBZ84QAegG550lwCnYeAulU0WxcptZBkw2MOdSgegVCi
	 aJikT3cJxaOnkTQNE/GTDzpxqW/W4mztXQALRAgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C2DCF896E8;
	Tue, 28 May 2019 02:10:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 800C1F896E4; Tue, 28 May 2019 02:10:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ACA7FF8065A
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 02:10:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ACA7FF8065A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 17:10:06 -0700
X-ExtLoop1: 1
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga006.jf.intel.com with ESMTP; 27 May 2019 17:10:06 -0700
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 27 May 2019 17:10:05 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 27 May 2019 17:10:05 -0700
Received: from shsmsx101.ccr.corp.intel.com ([169.254.1.129]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.18]) with mapi id 14.03.0415.000;
 Tue, 28 May 2019 08:10:03 +0800
From: "Liao, Bard" <bard.liao@intel.com>
To: Takashi Iwai <tiwai@suse.de>, Bard liao <yung-chuan.liao@linux.intel.com>
Thread-Topic: [PATCH 1/5] ALSA: hda - Force polling mode on CNL for fixing
 codec communication
Thread-Index: AQHVFEixWNA3kWO/BU+fDK1ANpwxxKZ+D0cAgAGav0A=
Date: Tue, 28 May 2019 00:10:02 +0000
Message-ID: <567A313375B6F043A9BE3A1D9B8C6E7F0B43C750@SHSMSX101.ccr.corp.intel.com>
References: <20190526165836.10867-1-yung-chuan.liao@linux.intel.com>
 <s5ha7f89wm7.wl-tiwai@suse.de>
In-Reply-To: <s5ha7f89wm7.wl-tiwai@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTFmYzJjMzAtZDlmNi00ZjQ2LThjMmMtNDNkMDg3OWMzNzU4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidTdhSEgzeTJDQnJRMkRsZXZEbTBtcXZENzh0Rll0N1pLUDRlT3hCemVhODdZenk2bmpoQjFZblFGV3llalYrNCJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>, "Yang,
 Libin" <libin.yang@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/5] ALSA: hda - Force polling mode on CNL
 for fixing codec communication
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

> -----Original Message-----
> From: Takashi Iwai [mailto:tiwai@suse.de]
> Sent: Monday, May 27, 2019 3:37 PM
> To: Bard liao <yung-chuan.liao@linux.intel.com>
> Cc: broonie@kernel.org; alsa-devel@alsa-project.org;
> liam.r.girdwood@linux.intel.com; pierre-louis.bossart@linux.intel.com; Liao,
> Bard <bard.liao@intel.com>; Yang, Libin <libin.yang@intel.com>
> Subject: Re: [PATCH 1/5] ALSA: hda - Force polling mode on CNL for fixing codec
> communication
> 
> On Sun, 26 May 2019 18:58:32 +0200,
> Bard liao wrote:
> >
> > From: Bard Liao <yung-chuan.liao@linux.intel.com>
> >
> > We observed the same issue as reported by commit
> > a8d7bde23e7130686b7662
> > ("ALSA: hda - Force polling mode on CFL for fixing codec
> > communication") We don't have a better solution. So apply the same
> workaround to CNL.
> >
> > Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> I think this should go to 5.2-rc, as it's a bug fix, so likely I'm going to take it soon
> later.
> 
> The question is about the rest patches.  The patches 2-4 are basically to move
> the polling handling into HDA-core, so they could be for 5.3.
> And patch 5 is for SOF.  This is still an open question.  If this SOF fix is needed for
> 5.2, all patches should go as well.

I am fine if patches 2-5 are for 5.3 :)

> 
> 
> thanks,
> 
> Takashi
> 
> 
> > ---
> >  sound/pci/hda/hda_intel.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
> > index 2ec91085fa3e..a93468ffb85c 100644
> > --- a/sound/pci/hda/hda_intel.c
> > +++ b/sound/pci/hda/hda_intel.c
> > @@ -375,6 +375,7 @@ enum {
> >
> >  #define IS_BXT(pci) ((pci)->vendor == 0x8086 && (pci)->device ==
> > 0x5a98)  #define IS_CFL(pci) ((pci)->vendor == 0x8086 && (pci)->device
> > == 0xa348)
> > +#define IS_CNL(pci) ((pci)->vendor == 0x8086 && (pci)->device ==
> > +0x9dc8)
> >
> >  static char *driver_short_names[] = {
> >  	[AZX_DRIVER_ICH] = "HDA Intel",
> > @@ -1700,8 +1701,8 @@ static int azx_create(struct snd_card *card, struct
> pci_dev *pci,
> >  	else
> >  		chip->bdl_pos_adj = bdl_pos_adj[dev];
> >
> > -	/* Workaround for a communication error on CFL (bko#199007) */
> > -	if (IS_CFL(pci))
> > +	/* Workaround for a communication error on CFL (bko#199007) and
> CNL */
> > +	if (IS_CFL(pci) || IS_CNL(pci))
> >  		chip->polling_mode = 1;
> >
> >  	err = azx_bus_init(chip, model[dev], &pci_hda_io_ops);
> > --
> > 2.17.1
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
