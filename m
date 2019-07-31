Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 173F57C36A
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 15:25:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A54A716F6;
	Wed, 31 Jul 2019 15:24:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A54A716F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564579530;
	bh=KLmihzEDiZIrWIMxJFYFlWVdRi7xqxHoJEewm3Z1x+4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QKpWDTri0FmAvETrSR8cyvtLbPf3jNiU0h0p+IyApCJbQKlKvUFPwLiaKRfbArhXM
	 CoCtrzqB1FuEoegM00EbX/xPGaoa1MnxNIHgnYOgy8jjpLTywaJx8SF81yC1Uc1Uas
	 PTk7oqBsjtK+4Pe7ayt+I22sPA8F7Ksrlw7theFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63828F8049B;
	Wed, 31 Jul 2019 15:23:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 599D3F80483; Wed, 31 Jul 2019 15:23:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39885F80214;
 Wed, 31 Jul 2019 15:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39885F80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2019 06:23:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,330,1559545200"; d="scan'208";a="166389125"
Received: from wmasilun-mobl.ger.corp.intel.com ([10.251.89.117])
 by orsmga008.jf.intel.com with ESMTP; 31 Jul 2019 06:23:37 -0700
Message-ID: <0059ed8e8f2fbd7ffbc258ca53ce5efbf1885c5b.camel@linux.intel.com>
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Daniel Drake <drake@endlessm.com>, 
 "Lin, Mengdong" <mengdong.lin@intel.com>
Date: Wed, 31 Jul 2019 14:23:37 +0100
In-Reply-To: <8dceb60b-35a5-93e9-ce01-1eb852e93f44@perex.cz>
References: <CAD8Lp45Bp1xVC7NjuNaANA7kAEN2Edshw+cViaTF3tRZEumgZA@mail.gmail.com>
 <cc9fa5b52138daffb09dc5b66ea9248379c9f60e.camel@linux.intel.com>
 <CAD8Lp46GW8n8K7ttOeSje_au06BsyvCp4seVwj2wNbipei5ssA@mail.gmail.com>
 <a4b17a75-d4e0-fc6b-a286-aa6b7b281b7d@linux.intel.com>
 <CAD8Lp444soO1i8mWF73eucT16yAhy2js1byWJCTV5fn=TikHBg@mail.gmail.com>
 <9e8b667f1aa2333dbcc34b5253372d1a8667551e.camel@linux.intel.com>
 <ee34f820-0753-dfbe-09c0-7147cf229cc0@perex.cz>
 <6493f195-eb5a-1a6d-2c31-e3a4123b2ad1@linux.intel.com>
 <7c940d90-297e-19c0-2f74-1843439d5ccf@perex.cz>
 <d41b02286db2a827648d1c1ec793bbd0a55e99c1.camel@linux.intel.com>
 <8dceb60b-35a5-93e9-ce01-1eb852e93f44@perex.cz>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Jian-Hong Pan <jian-hong@endlessm.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 sound-open-firmware@alsa-project.org
Subject: Re: [alsa-devel] [Sound-open-firmware] Signed firmware availability
	for kbl/cnl
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

+ Mengdong

On Wed, 2019-07-24 at 18:23 +0200, Jaroslav Kysela wrote:
> > Yeah, been thinking about this atm. It may be better to package the
> > binaries (firmware and topologies) as part of Linux firmware repo
> > (since the driver expects to load them all from lib/firmware) and
> > package the sources (firmware and topology) via sof tarball ?
> 
> It looks good in my eyes, because topology files are another pieces
> of the
> driver from the user space perspective. The unanswered question is
> the UCM
> configuration which is linked to the topology configuration (if I
> understand
> this correctly). I proposed to place an unique identifier/version to
> the
> topology file and propagate this identifier to the user space, so the
> alsa-lib
> can pick the right UCM configuration when topology changes. The
> component
> string (snd_component_add function / struct snd_ctl_card_info ->
> components)
> can be used for this identification.

Apologizes for the delay, Pierre and I have been discussing this
internally as we have to synchronise the deployment of the topologies
and UCMs alongside the FW.

Current thinking has changed from shipping FW + tplg via linux-firmware 
repo to only shipping FW binaries in the FW repo and using alsa-ucm-
conf.git for UCMs + topologies (since the coupling between UCM and
topology is tighter than the FW coupling).

Any objections to using this repo for topologies too ? I know we
haven't yet used it for UCMs but now is probably a good point to move
(including moving the older UCMs over too).
The "make" rule would compile topologies, whilst the "make install"
rule would install the UCM's and binary topologies in the correct
places ?

Thanks

Liam

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
