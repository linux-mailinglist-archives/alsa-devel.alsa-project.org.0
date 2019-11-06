Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB1DF17E9
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 15:06:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91C8516A4;
	Wed,  6 Nov 2019 15:05:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91C8516A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573049173;
	bh=Y0LelRQ2dUpn2RAtV/oSdLVf6acemGHowy8yHig7VNY=;
	h=From:To:In-Reply-To:References:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SXEp1A1mzGLB/gnaIlmD5MEYSdce1eTj8Bndw4CLQmODvveEjO9kpwsgotTZUoq90
	 p4JrKycDKEsSkFmNbLO/0/kQwavbHMbTztfDzzawkx266kVa5NwPkyVwHwn3I28DBz
	 /4c4WZwuiHYnNBFiKJdRKRgcBp1ISO+Tt4Ht7070=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AED74F8045F;
	Wed,  6 Nov 2019 15:04:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 723ECF803D0; Wed,  6 Nov 2019 15:04:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_135,SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E4F4F8015B
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 15:04:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E4F4F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 06:04:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,275,1569308400"; d="scan'208";a="212779321"
Received: from kekkonen.fi.intel.com ([10.237.72.156])
 by fmsmga001.fm.intel.com with ESMTP; 06 Nov 2019 06:04:17 -0800
Message-ID: <1573048312.40545.9.camel@linux.intel.com>
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>
In-Reply-To: <140d987f-280a-309a-d09c-fa4b210563db@perex.cz>
References: <6dcc3e0d-0df5-90cf-220f-59253d3b5c7c@perex.cz>
 <alpine.DEB.2.21.1911061327470.16459@zeliteleevi>
 <140d987f-280a-309a-d09c-fa4b210563db@perex.cz>
Date: Wed, 06 Nov 2019 15:51:52 +0200
Mime-Version: 1.0
X-Mailer: Evolution 3.24.6 (3.24.6-1.fc26) 
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] UCM extensions
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

On Wed, 2019-11-06 at 14:10 +0100, Jaroslav Kysela wrote:
> Dne 06. 11. 19 v 12:50 Kai Vehmanen napsal(a):
> > Hi Jaroslav,
> > 
> > On Tue, 5 Nov 2019, Jaroslav Kysela wrote:
> > 
> > > 	I make some internal ucm code cleanups in alsa-lib and added
> > > three
> > > major extensions to allow more complex configurations which we
> > > require for the
> > > SOF kernel driver.
> > 
> > looks very good and pragmatic way to tackle some of the issues you
> > hit
> > with current UCM.
> > 
> > E.g. the If block would be also sufficient to tackle the recent
> > HDMI codec
> > driver change (with a single UCM file) -- i.e. use existence of the
> > hdac-hdmi driver controls to select which enable-sequences to run.
> > Hmm, I
> > like this better than trying to select a whole different UCM file
> > based on
> > which drivers are used.
> > 
> > And same usage pattern can be applied to other mixer control name
> > changes
> > (like you already did for the HDA mic control).
> > 
> > That of course leads to the question do we soon need mechanisms to
> > choose between more than two conditions (e.g. if mixer controls
> > have
> > changed multiple times in recent kernels, so covering for this
> > in UCM would need a Switch, If-Else, or similar). But yeah, one can
> > always define another UCM, so keeping-it-simple might be the right
> > choice here.
> 
> I already implemented the nested If (so you may use another If in
> the 
> True/False blocks).
> 
> Also 'String' (equal, substring) and 'RegexMatch' conditions were
> added.
> 
> For the substitution, I added ${CardComponents}, too. The driver
> might pass 
> another component description strings to the user space for a better 
> identification - there is snd_component_add() kernel function for
> this.
> 
> > > 	I added everything to keep the interface backward compatible,
> > > so the
> > > current applications should not observe any different behavior.
> > > The
> > > applications like pulseaudio should use the 'hw:CARD_INDEX'
> > > specifier for the
> > > open call in the future and snd_use_case_parse_ctl_elem_id()
> > > helper for the
> > > element control names.
> > 
> > This sounds good as well. Some testing with common versions of
> > e.g. Pulseaudio is probably in order to sanity check how this
> > works.
> 
> Yep, I will do more testing.
> 
> Do you have any progress with the pulseaudio volume UCM extension?
> Could you 
> send me a link to the repository again? Thank you.
> 
If you mean the ucm hw volume support:
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/merge_requests/189
This is my fixes on top of Arun's original patch.

This is working pretty well for me, for example I have mute leds
working in X1 with this. Unfortunately Pulseaudio community is pretty 
loaded with reviews, so no comments yet.

My problem is also that some distributions are using pulseaudio v11.1
so backporting is little bit nasty... My personal branch if for some 
reason someone want's to test in v11.1:
https://gitlab.freedesktop.org/juimonen/pulseaudio/tree/lenovo_test
(This branch has also couple of backports to support automatic routing 
between profiles -> ucm use cases)

br,
Jaska


> 					Jaroslav
> 
> > 
> > Br, Kai
> > 
> 
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
