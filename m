Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C41411A0DF0
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Apr 2020 14:46:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C7D886E;
	Tue,  7 Apr 2020 14:45:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C7D886E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586263572;
	bh=GlNYPcJ8GDNn+WF7JeZdHvbRN7prKbmWlOD0HWWdsRk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WCvob2SqymftYufOVq5ksORgBqhW60y/D9rbr2tbKNz0jKeNVsdD260eeZUgyUTJL
	 TVVm0HE2x/tw2/42gTGMVyIB8KSC82CV/HFp65mLEI7H/541ynqFmltLwhUYwVo2yf
	 PVvxb0KAf0UUU0TMUpCr6zxPJ/Kn7QWBf10vvWtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D477F80216;
	Tue,  7 Apr 2020 14:44:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51E40F801DA; Tue,  7 Apr 2020 14:44:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73BD1F800F0;
 Tue,  7 Apr 2020 14:44:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73BD1F800F0
IronPort-SDR: tNHavdjTeFJH5DhEXc9erYnEqjIQCgTPLsyhbhAYzT2tKkRrLUzy6C5PgaQAJqEt/G9aeAOsQ7
 mYVS/nhvZlrg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2020 05:44:12 -0700
IronPort-SDR: sd+dw2Ek7xCAx7VEvM1L7C5rW865Wet2ZaU4wL+Z15o98iwErmLGmSJ1KS/RwDfxMn8pYsrabz
 rkwa6ymjxjgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,354,1580803200"; d="scan'208";a="249515559"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.249.40.132])
 by orsmga008.jf.intel.com with ESMTP; 07 Apr 2020 05:44:10 -0700
Date: Tue, 7 Apr 2020 14:44:09 +0200
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [Sound-open-firmware] [PATCH v2 00/12] [RESEND] ASoC: SOF DSP
 virtualisation
Message-ID: <20200407124409.GA26007@ubuntu>
References: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
 <20200403092842.GB4286@sirena.org.uk>
 <20200403110404.GA23734@ubuntu>
 <29be8be8d9b8700588da693d93b9f10adbb10016.camel@linux.intel.com>
 <20200403180918.GA25646@ubuntu> <20200407112411.GA10133@ubuntu>
 <20200407113026.GB5247@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407113026.GB5247@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

Hi Mark,

On Tue, Apr 07, 2020 at 12:30:26PM +0100, Mark Brown wrote:
> On Tue, Apr 07, 2020 at 01:24:11PM +0200, Guennadi Liakhovetski wrote:
> 
> > After a discussion we agreed, that we shall try to port SOF VirtIO support on 
> > top of RPMSG, even though this would be the first ever such use of RPMSG. And 
> > since this likely will take a while and be a big change we suspend this 
> > review process for now. 
> 
> OK...  the generic patches (IIRC it was about the list that Liam
> identified) looked OK so if you want to send them by themselves then I
> can apply them and it's less diff for you to carry.

Ok, I'll route them via Pierre then, because they include a new SOF IPC, which 
probably requires an ABI version update, even though it will never be sent to 
the DSP.

Thanks
Guennadi
