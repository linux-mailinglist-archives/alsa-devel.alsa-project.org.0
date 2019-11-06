Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE82CF1572
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 12:52:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7912C16BC;
	Wed,  6 Nov 2019 12:51:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7912C16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573041145;
	bh=O3UW0xYYd7LEiLsTnyubpNgDT2qtW6cuUAFw6pS+Ap4=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XwIyLGv1CjMVhXV+r1SMU51oBHnl6JOUzWabYSNhLS1Q7BQAaWVG/f3KoYAKE1upz
	 pDVZQsKzZR5+q5BPszGMaKP28rgQel+c3x/tFTJ6A3/VCI6zVKexUYHkfJYfiCOA+K
	 UygXESwMJmnT9F5JB5NGEPmdpOfWfC/mKPIP0XBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAB21F803D0;
	Wed,  6 Nov 2019 12:50:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAACCF803D0; Wed,  6 Nov 2019 12:50:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B06E9F8015B
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 12:50:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B06E9F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 03:50:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,274,1569308400"; d="scan'208";a="232845891"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2019 03:50:31 -0800
Date: Wed, 6 Nov 2019 13:50:30 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <6dcc3e0d-0df5-90cf-220f-59253d3b5c7c@perex.cz>
Message-ID: <alpine.DEB.2.21.1911061327470.16459@zeliteleevi>
References: <6dcc3e0d-0df5-90cf-220f-59253d3b5c7c@perex.cz>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Hi Jaroslav,

On Tue, 5 Nov 2019, Jaroslav Kysela wrote:

> 	I make some internal ucm code cleanups in alsa-lib and added three
> major extensions to allow more complex configurations which we require for the
> SOF kernel driver.

looks very good and pragmatic way to tackle some of the issues you hit 
with current UCM.

E.g. the If block would be also sufficient to tackle the recent HDMI codec 
driver change (with a single UCM file) -- i.e. use existence of the 
hdac-hdmi driver controls to select which enable-sequences to run. Hmm, I 
like this better than trying to select a whole different UCM file based on 
which drivers are used.

And same usage pattern can be applied to other mixer control name changes
(like you already did for the HDA mic control).

That of course leads to the question do we soon need mechanisms to 
choose between more than two conditions (e.g. if mixer controls have 
changed multiple times in recent kernels, so covering for this 
in UCM would need a Switch, If-Else, or similar). But yeah, one can
always define another UCM, so keeping-it-simple might be the right 
choice here.

> 	I added everything to keep the interface backward compatible, so the
> current applications should not observe any different behavior. The
> applications like pulseaudio should use the 'hw:CARD_INDEX' specifier for the
> open call in the future and snd_use_case_parse_ctl_elem_id() helper for the
> element control names.

This sounds good as well. Some testing with common versions of 
e.g. Pulseaudio is probably in order to sanity check how this 
works.

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
