Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3673651FDA
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 12:42:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39DF318F6;
	Tue, 20 Dec 2022 12:41:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39DF318F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671536559;
	bh=OhLxX3BrNlCDxRWA4Q0Y3wDHz6GSXqLm/UxFiiwiB48=;
	h=Date:From:To:Subject:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SMOOXURCv/MU9eVAw3toUxxJRd9eFHxTfHuBLCmDL0kUXGgu1oGRHrC1g6LIxjnME
	 ZLGIlI+XB4f81AO8lb99nlN89xk4Yw3wCciswzEPiZsba7C1kn/bmebe4m2ihGrS8x
	 3jwamXkfp57+ate52qdklnqIInhzLXrLAdUuJamg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1471F801C0;
	Tue, 20 Dec 2022 12:41:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1322EF8032B; Tue, 20 Dec 2022 12:41:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDB6BF8025E
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 12:41:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDB6BF8025E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z06+BvjQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671536498; x=1703072498;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=OhLxX3BrNlCDxRWA4Q0Y3wDHz6GSXqLm/UxFiiwiB48=;
 b=Z06+BvjQIRThAedKnmiO2khLGGKZBjDlAjheWuksCXaovqNPyjG+f1SU
 v8h0NmwWPlvpJHYHOSE3PQDbuYVhu+7dfWpF+pyEAgKa28KJCQURkKO3j
 /j1GwJI9n0bK7tGQcbF1079QqvQUGwkLu2S4TxtU33hwjTorv1y7xbgDq
 BBhVvq7nZMvH3vaZwlTcVRHM1vccfjNXTJaGA2KcIPUjObJU3SrQhYfZ0
 SHZg6Uwl3w0o5Tor4MiAyZCItdKxFBa3oK/nZSRTVlulYhFHy5YsRGmag
 I+5GmoPK7y1iakN9P1r67908ddG7mRe76nac5DfWeuOcRpMGuXYHGymK3 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="381815502"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="381815502"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 03:41:34 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="601031193"
X-IronPort-AV: E=Sophos;i="5.96,259,1665471600"; d="scan'208";a="601031193"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2022 03:41:30 -0800
Date: Tue, 20 Dec 2022 13:41:01 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Mark Brown <broonie@kernel.org>, 
 Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH 0/2] ASoC: SOF: remove unregister calls from shutdown
In-Reply-To: <Y6BhTWGUp2D5hhbE@sirena.org.uk>
Message-ID: <alpine.DEB.2.22.394.2212201334340.3532114@eliteleevi.tm.intel.com>
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
 <167102472177.27755.10161077455234852195.b4-ty@kernel.org>
 <e23ec080-9fe4-ee28-1d4c-879127803660@leemhuis.info>
 <Y6BhTWGUp2D5hhbE@sirena.org.uk>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Alsa-devel <alsa-devel@alsa-project.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 yung-chuan.liao@linux.intel.com, Oliver Neukum <oneukum@suse.com>,
 peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, Zhen Ni <nizhen@uniontech.com>,
 ranjani.sridharan@linux.intel.com, Ricardo Ribalda <ribalda@chromium.org>,
 Archana Patni <archana.patni@intel.com>, daniel.baluta@nxp.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Mon, 19 Dec 2022, Mark Brown wrote:

> On Mon, Dec 19, 2022 at 10:41:41AM +0100, Thorsten Leemhuis wrote:
> 
> > * there are no "CC: <stable..." tags in these patches. Is the plan to
> > manually ask for a backport? Or how can we get the regression fixed in
> > older releases?
> 
> Speak to the stable maintainers I guess, or hope their bot picks the
> commits up.

thanks Thorsten for the notice. These patches do lack the "Fixes:" tag, so 
it's possible the bots will not pick these up. I can follow up and send 
these to stable if this does not happen.

Br, Kai
