Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D24553150
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 13:48:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1E56205A;
	Tue, 21 Jun 2022 13:47:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1E56205A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655812079;
	bh=LR+ORp3OTaxtK9ECJOJXIk4TgNuRd9/9MS1vqqnUMi8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NNFImBcPPI7VXXWl7v8G/jSdqBGoWZlKeHLkIWM1an885JUZszeMXp5a0K2Iynlwz
	 wB3J5CmKG5kcKUUkztIVU7PwS2/ZiwpeXmMhl6mhc051ZlFfT4aMkuNDvMf3e/2J1f
	 6ablzPrhYeyMys1kqsKKKHI/6s6N2LLOs9d2rwyo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37D89F800E3;
	Tue, 21 Jun 2022 13:47:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30575F80155; Tue, 21 Jun 2022 13:46:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6992F800CB
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 13:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6992F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="W9p+Ukgx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655812015; x=1687348015;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=LR+ORp3OTaxtK9ECJOJXIk4TgNuRd9/9MS1vqqnUMi8=;
 b=W9p+UkgxGeEzy1Txe5Vs09r0JlOuISwg+vIfAryC+CXeSAwoqzPTqWXh
 o/zXVH2dZEzEvb08PHNyL+GBMaC+/HZdysuAeWl4BhHljjbRY97Qn6YOc
 Owzx2W+4AG9nfpXSXqKvOpsMqGf2tKvjSbw9tkxAkciKTMJwwsr7d9GL4
 WRS8AtiJXs8R6E1mJs0HTs9Y/3SaUQ49OObUD/X6JnMWrGPSD/iirJ/a0
 W4odviymi993yOe5DUglwY/rIcuU3kZ33M5kz1H+DmDosNz3ppBtqtcxt
 2S2HNiuPVw8HsFRZmxpx5tHqDN9w6Tx5bJmYUFFnkJLDVEL8GhiuAgIP5 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10384"; a="344090162"
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="344090162"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 04:46:46 -0700
X-IronPort-AV: E=Sophos;i="5.92,209,1650956400"; d="scan'208";a="729807104"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2022 04:46:45 -0700
Date: Tue, 21 Jun 2022 14:36:04 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: Intel HDMI probe regression on IVB (and older?)
In-Reply-To: <alpine.DEB.2.22.394.2206201916240.1532214@eliteleevi.tm.intel.com>
Message-ID: <alpine.DEB.2.22.394.2206211427200.1532214@eliteleevi.tm.intel.com>
References: <87bkunztec.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2206201141320.1532214@eliteleevi.tm.intel.com>
 <87r13jpec5.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2206201821290.1532214@eliteleevi.tm.intel.com>
 <87h74fpc6f.wl-tiwai@suse.de>
 <alpine.DEB.2.22.394.2206201916240.1532214@eliteleevi.tm.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Lucas De Marchi <lucas.demarchi@intel.com>
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

Hi,

On Mon, 20 Jun 2022, Kai Vehmanen wrote:

> On Mon, 20 Jun 2022, Takashi Iwai wrote:
> 
> > > But it's a marginal difference, so for your version:
> > > 
> > > Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> > 
> > OK, could you throw the patch to CI for verification?
> > I can merge it for the next pull request (probably in this week) once
> > after confirmation. 
> 
> sure thing, I'll confirm later this week.

tests are clean for the patch so

Tested-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Did a bit of analysis why this was not caught in testing earlier. IVB (and 
older) systems are covered in the intel-gfx CI, but it turns out PCI class 
is 0300 (VGA compatible adapter) on all of these. But alas on the 
reporter's system, PCI_CLASS_DISPLAY_OTHER was used, so the problem is 
definitely there and the fix is needed.

Br, Kai
