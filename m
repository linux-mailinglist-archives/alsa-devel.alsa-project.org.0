Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A359210A13F
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 16:34:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FF551767;
	Tue, 26 Nov 2019 16:33:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FF551767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574782467;
	bh=s7H55iSQvhRnhjBXYjTJ8Gy+89NeL2038RKpIqRA5lU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IzcmIzdhIZFfRyhoIR2a7zghH6IrDIHf7OjhtDoc11vjgfC9WhPvdGPFGYGh0qawl
	 uSrJkhCgyPlWNqx3yW5vnOOBGG/FcfUOCLgk5KRyGIuVrmrNu0lQScEJrkaHyoDVYZ
	 BfUt1oTSCgVRQgpD0/ZA1Oo3MUSA48I99ypPBK4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01490F801F5;
	Tue, 26 Nov 2019 16:33:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19372F801ED; Tue, 26 Nov 2019 16:33:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAF2FF800DD;
 Tue, 26 Nov 2019 16:33:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAF2FF800DD
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 07:32:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="202751079"
Received: from mpawlows-mobl2.ger.corp.intel.com ([10.252.20.57])
 by orsmga008.jf.intel.com with ESMTP; 26 Nov 2019 07:32:54 -0800
Message-ID: <6a508a6f957b13a2ccb71c1c91316a272fb38b3a.camel@linux.intel.com>
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: Daniel Baluta <daniel.baluta@gmail.com>, "Sridharan, Ranjani"
 <ranjani.sridharan@intel.com>
Date: Tue, 26 Nov 2019 15:32:51 +0000
In-Reply-To: <CAEnQRZBsmz17JGdxT_bB_tDHsmWskdXCW47R5wf5dhEw=Jpu-g@mail.gmail.com>
References: <CAEnQRZBsmz17JGdxT_bB_tDHsmWskdXCW47R5wf5dhEw=Jpu-g@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, sof@nxp.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
Subject: Re: [alsa-devel] Converting a non BE to BE inside soc_check_tplg_fes
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

On Mon, 2019-11-25 at 18:45 +0200, Daniel Baluta wrote:
> Hi all,
> 
> I am trying how a non-BE link is converted to a BE link
> inside soc_check_tplg_fes.
> 
> soc_check_tplg_fes
> => for all components that have ignore_machine setup to card name
>      => dai_link->platforms->name = component->name;
>      => dai_link->no_pcm = 1;
> 
> But the thing is that the link is a true non-DPCM link, than fields
> like dpcm_playback/dpcm_capture are not set and playback/record
> substreams are no created.

These fields should be being populated by topology since they are
runtime configuration on a non DPCM PCM device. 

> 
> The question is: is this supposed to be working with non-DPCM links?

Yes, it "should do" and did when I last tested - there were some non
DPCM Intel machine drivers that needed to work (grep -L no_pcm
sound/soc/intel/boards/*.c), but I am not as up to date as other on the
SOF driver core now. So if it's not working, it could be a regression
(as these non DPCM boards are not used now IIRC).

Liam

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
