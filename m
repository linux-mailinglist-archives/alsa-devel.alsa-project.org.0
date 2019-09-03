Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B4DA6DDE
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 18:17:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C7F01689;
	Tue,  3 Sep 2019 18:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C7F01689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567527479;
	bh=aaGllOi/HYSiv1oaaeephFHSPfHuhSNc1W62bZpacKs=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iuH7OQfT8aJH7g40yNdI7k8kZsXQZuQZV1A0Zyg6feFwJGBwbDN+ze1JLQjYcMGro
	 PjbWM2kwMVeFcWdIr/76EcS7bNtyzgMqzYYkEHcOwwyhjjIW2/6GcX5IlFWYcOk9zi
	 2W1ALadEr/ZP2pWtKUrXJNJghYOnDD0YJ4YCcwCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47069F804A9;
	Tue,  3 Sep 2019 18:16:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E32E4F8045F; Tue,  3 Sep 2019 18:16:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 094F7F80228
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 18:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 094F7F80228
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 09:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,463,1559545200"; d="scan'208";a="207139582"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga004.fm.intel.com with ESMTP; 03 Sep 2019 09:16:03 -0700
Date: Tue, 3 Sep 2019 19:16:02 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <s5hv9u9tnxa.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1909031909220.16459@zeliteleevi>
References: <20190829135348.23569-1-kai.vehmanen@linux.intel.com>
 <s5h7e6w2h10.wl-tiwai@suse.de>
 <alpine.DEB.2.21.1909031656490.16459@zeliteleevi>
 <s5hv9u9tnxa.wl-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [RFC PATCH 0/7] adapt SOF to use snd-hda-codec-hdmi
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

On Tue, 3 Sep 2019, Takashi Iwai wrote:

> On Tue, 03 Sep 2019 16:18:11 +0200, Kai Vehmanen wrote:
> > On some systems this is manageable as e.g. pulseaudio will fallback to 
> > legacy non-UCM path and e.g. HDMI/DP audio keeps working. But, but, this 
> > may be problematic if UCM is needed for other functionality on these 
> > systems.
> 
> Just out of curiosity: which systems are with such UCM profiles?
> Chromebooks?

I believe this year's XPS 13 Developer edition is one such device. I'll 
try to confirm if there are more cases.

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
