Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6691CE02BC
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 13:21:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D68A7166C;
	Tue, 22 Oct 2019 13:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D68A7166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571743261;
	bh=aiarSu8ypgytjluTsQA7+jNoU5s4hf2ccZXmhola0js=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q/b4X5J7gYCucbVKAZSgPLGKkRJ2TMhAVKDF5AIu92MbxJLmpd8efEj0RsulCnbSw
	 7S1kjo7jsExWj8wP+jjLwiPKOk01eoYCmMu0lGMSo23pgh9uyube8tHrnTCieyFdB+
	 nUUXNCuMYtwgc7fWoevRpsLhWSr7cDWwRC6jlQHs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37B03F8031A;
	Tue, 22 Oct 2019 13:19:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24A9DF8031A; Tue, 22 Oct 2019 13:19:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A65FF8026A
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 13:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A65FF8026A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 04:19:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="201638671"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga006.jf.intel.com with ESMTP; 22 Oct 2019 04:19:06 -0700
Date: Tue, 22 Oct 2019 14:19:06 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2b172a1b-04d3-624f-f10b-6ff15bdc6c9d@linux.intel.com>
Message-ID: <alpine.DEB.2.21.1910221416430.16459@zeliteleevi>
References: <20191011112745.25800-1-kai.vehmanen@linux.intel.com>
 <20191011112745.25800-6-kai.vehmanen@linux.intel.com>
 <cf6a8edb-689d-e068-a9c4-d728b7741fec@linux.intel.com>
 <alpine.DEB.2.21.1910111705060.16459@zeliteleevi>
 <s5hmudziz13.wl-tiwai@suse.de>
 <2b172a1b-04d3-624f-f10b-6ff15bdc6c9d@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>, libin.yang@intel.com,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v6 5/9] ASoC: SOF: Intel: add support for
 snd-hda-codec-hdmi
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

Hey,

On Thu, 17 Oct 2019, Pierre-Louis Bossart wrote:
> On 10/17/19 2:58 AM, Takashi Iwai wrote:
> > A trivial conflict can be resolved by either Mark or my side, so don't
> > worry too much about it.
> > 
> > But if the patches don't rely on the new stuff that are found only in
> > my tree, maybe it's better to rebase on Mark's tree, so that you can
> > follow the whole other SOF development.
> 
> I'll let Kai comment, but this change will have ripple effects on machine
> drivers we need to upstream, so it might be better to use Mark's tree?

ack on both, now that we agree on the few change to generic hda part,
the rest is SOF specific and easier to merge via Mark's tree. I'll 
work with Pierre to submit v7 (either directly, or even as part of 
Pierre's next SOF series).

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
