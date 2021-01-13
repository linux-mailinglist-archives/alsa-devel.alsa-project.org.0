Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0130A2F4E0E
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 16:03:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E9AD16D0;
	Wed, 13 Jan 2021 16:02:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E9AD16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610550186;
	bh=T+vRA3FAhlPg1LKZ1Cr1vsqEsz6NP9iPsMFWfMUA1m0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NQxvpUWrVe1Gx5x/KNkJslOF6fXW0toEPrHCTB/jmNZa/EqI98rivAfknT6MN5fEW
	 AWZKbIFXkZurQStAXGFCZe6fgXbiMLZYStFwuuMIs9mb05ABWglGZl8T7S+DIySDUY
	 5ApOwZpW58jms+1/XJJxE/99qv5g4lGQuSxpI+sA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B33BF80254;
	Wed, 13 Jan 2021 16:01:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 591A4F801ED; Wed, 13 Jan 2021 16:01:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E48D7F80085
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 16:01:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E48D7F80085
IronPort-SDR: 0r98i2bEBv7rGLKRay3f0ASM6W145ZHiJAJV9XTfnQpiU9/xV9uvWvwZKE0jhD3Y1o/BVfvpVV
 RqYBeW0vnccQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9862"; a="165887975"
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="165887975"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 07:01:09 -0800
IronPort-SDR: 6crpaSpDFenJkpsAJQgSbezS6LS9WgEXcNRUChxgfRstq7FQNM+WJHvDiRhFIVBX5PYadcrccu
 AYnoCebKq9MA==
X-IronPort-AV: E=Sophos;i="5.79,344,1602572400"; d="scan'208";a="348846046"
Received: from kekkonen.fi.intel.com ([10.237.72.68])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2021 07:01:08 -0800
Date: Wed, 13 Jan 2021 16:53:14 +0200
From: Jaska Uimonen <jaska.uimonen@linux.intel.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: Re: [RFC PATCH 1/3] ALSA: control: add kcontrol_type to control
Message-ID: <20210113145314.GA2115387@kekkonen.fi.intel.com>
References: <20210108112355.2053917-1-jaska.uimonen@linux.intel.com>
 <20210108112355.2053917-2-jaska.uimonen@linux.intel.com>
 <1272f71c-c736-d267-563e-c2bf43b740da@perex.cz>
 <20210108140659.GA44940@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108140659.GA44940@workstation>
Cc: alsa-devel@alsa-project.org
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

On Fri, Jan 08, 2021 at 11:06:59PM +0900, Takashi Sakamoto wrote:
> Hi,
> 
> On Fri, Jan 08, 2021 at 12:40:28PM +0100, Jaroslav Kysela wrote:
> > Dne 08. 01. 21 v 12:23 Jaska Uimonen napsal(a):
> > > Current kcontrol structs don't have a member to describe the control
> > > type. The type is present in the widget which contains the control. As
> > > there can be many controls in one widget it is inherently presumed that
> > > the control types are the same.
> > > 
> > > Lately there has been use cases where different types of controls would
> > > be needed for single widget. Thus enable this by adding the control type
> > > to kcontrol and kcontrol_new structs.
> > 
> > It looks like a SoC only extension. Use private_data to carry this
> > information. It has no value for the toplevel code.
> > 
> > 				Jaroslav
> 
> In current design of ALSA control core, the type of control element is
> firstly determined by driver in callback of snd_kcontrol.info(). The
> callback is done when userspace applications call ioctl(2) with
> SNDRV_CTL_IOCTL_ELEM_INFO request.
> 
> The patch doesn't touch to the above processing. It means that the type
> information is just for kernel-land implementation and is not exposed to
> userspace application.
> 
> Essentially, driver is dominant to determine the type of control element
> in control element set which the driver adds. It's possible to achieve
> your intension without changing ALSA control core itself, in my opinion.
> 
> As Jaroslav said, it's better to change core of ALSA SoC part according
> to your intention. If you'd like to change ALSA control core, I'd like
> to request for the check of mismatch between the value of added member
> in snd_kcontrol and the value of type of control element returned from
> driver, like:
> 
> ```
> diff --git a/sound/core/control.c b/sound/core/control.c
> index 809b0a62e..c3ae70574 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -973,6 +973,7 @@ static int __snd_ctl_elem_info(struct snd_card *card,
>         result = kctl->info(kctl, info);
>         if (result >= 0) {
>                 snd_BUG_ON(info->access);
> +               snd_BUG_ON(info->type == kctl->kcontrol_type);
>                 index_offset = snd_ctl_get_ioff(kctl, &info->id);
>                 vd = &kctl->vd[index_offset];
>                 snd_ctl_build_ioff(&info->id, kctl, index_offset);
> ```
> 
> 
> Regards
> 
> Takashi Sakamoto

Hi,

Thanks for the comments, I tried to do the same thing now in asoc level, 
will send v2.

br,
Jaska

