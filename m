Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECAEE029D
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Oct 2019 13:17:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB781166B;
	Tue, 22 Oct 2019 13:16:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB781166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571743061;
	bh=2riWWhodJQxDAI3qTukDXi0TFzXBrQpdl2wcTEofkRs=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cglMPs3jhwC27G8qn20yaNinYXzSS2q8klIAJaifXWErEzHoO13VbtqdeJsaMkAjJ
	 x7gxraf8AZTSarokPqVXSCxkTfIUEcXCqvp9FA1WSSvG2zmqDh2M62Io9GEs/TwZ6t
	 cmyD5ilE084V7sSW8t3psl3kq15m7llKfiT+cNuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B809DF80322;
	Tue, 22 Oct 2019 13:15:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86358F8031A; Tue, 22 Oct 2019 13:15:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BE03F8026A
 for <alsa-devel@alsa-project.org>; Tue, 22 Oct 2019 13:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BE03F8026A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 04:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="227664843"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga002.fm.intel.com with ESMTP; 22 Oct 2019 04:15:47 -0700
Date: Tue, 22 Oct 2019 14:15:46 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <s5hk193iyoh.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1910221401580.16459@zeliteleevi>
References: <20191011112745.25800-1-kai.vehmanen@linux.intel.com>
 <20191011112745.25800-4-kai.vehmanen@linux.intel.com>
 <s5hk193iyoh.wl-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v6 3/9] ASoC: Intel: skl-hda-dsp-generic:
 use snd-hda-codec-hdmi
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

Hi,

On Thu, 17 Oct 2019, Takashi Iwai wrote:
> Kai Vehmanen wrote:
> > +static inline struct snd_pcm *hda_dsp_hdmi_pcm_handle(struct snd_soc_card *card,
> > +						      int hdmi_idx)
> > +{
[...]
> > +static inline int hda_dsp_hdmi_build_controls(struct snd_soc_card *card,
> > +					      struct snd_soc_component *comp)
>
> These additions look a bit too large for inline functions.
> Wouldn't it be difficult to make them non-inline?

ack, shouldn't be too difficult. I'll make the update and also rebase on 
top of Mark's tree.

My rationale for inlining was that these functions are used by machine 
drivers only, so each machine driver got a copy anyways in the end, plus 
I wanted to avoid modifying the Makefile rules for all the machine drivers
I touched. But neither is a hard requirement, so let's put the new helpers
into their own compilation unit.

Thanks for the review!

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
