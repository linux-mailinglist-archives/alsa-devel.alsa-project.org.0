Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A942410FF3A
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 14:50:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 035B384A;
	Tue,  3 Dec 2019 14:49:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 035B384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575381007;
	bh=i6jMf2TsuYXzdPB3CXGVE6QGl6Gliy/Ajj5CJ36G5Ds=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lN10C5AF+k+OE6Z+f3QXvaXHU8pvwbTjrr1rXCLEpk+5P/iIeHpsOU1H44ekOvfk7
	 3SZs3qELnO+chPLbOKPefy90xXyp+EnioWwFVE70GyNoTQh3S2TszF+TabJW/tTjxR
	 tczy64R+hrHzcdEkG7FICvVTG470MvMOcjIl9Ndg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D540F800B4;
	Tue,  3 Dec 2019 14:48:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63BB0F80227; Tue,  3 Dec 2019 14:48:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 932ECF800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 14:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 932ECF800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 05:48:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="293802538"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga001.jf.intel.com with ESMTP; 03 Dec 2019 05:48:11 -0800
Date: Tue, 3 Dec 2019 15:48:10 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: tiwai@suse.de, Nikhil Mahale <nmahale@nvidia.com>
In-Reply-To: <alpine.DEB.2.21.1912021149450.16459@zeliteleevi>
Message-ID: <alpine.DEB.2.21.1912031523380.16459@zeliteleevi>
References: <20191129143756.23941-1-kai.vehmanen@linux.intel.com>
 <20191129143756.23941-2-kai.vehmanen@linux.intel.com>
 <ca44751a-dcac-3711-b515-59083744df7b@nvidia.com>
 <alpine.DEB.2.21.1912021149450.16459@zeliteleevi>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 2/2] [RFC] ALSA: hda: hdmi - preserve
 non-MST PCM routing for Intel platforms
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

Hi Takashi and Nikhil,

On Mon, 2 Dec 2019, Kai Vehmanen wrote:
> yup, -1 for non-MST, that was just plain wrong in my Friday mail. The 
> problem seems to be pipe id is positive in some non-MST cases (like 
> https://github.com/thesofproject/linux/issues/1536 ), which is very 
> suprising looking at e.g. intel_audio_codec_enable(), but that seems to be 
> happening nevertheless.

ok, got graphics driver log from this case now, and this turns out to be a 
system with an unusual converter setup for HDMI output. I.e. from user 
point of view it's HDMI, but for graphics driver it looks like a DP 
connection (with MST enabled which is not so common but apparently is the 
case). So i915 driver is working as expected and in patch_hdmi we should 
handle it as a normal MST case.

Takashi, considering the commit message is wrong, I think it's better
to revert the "ALSA: hda: hdmi - preserve non-MST PCM routing for Intel 
platforms" patch. Should I send a revert?

It also doesn't fully preseve the old routing as in the case of a single 
DP-MST monitor (with dev_id=1), hdmi_find_pcm_slot() will not pick the 
preferred PCM "per_pin->pin_nid_idx", but will choose "spec->num_nids + 
(per_pin->dev_id - 1)". So seems better to just drop it.

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
