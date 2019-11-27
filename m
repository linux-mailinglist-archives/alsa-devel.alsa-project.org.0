Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F069E10AEBA
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Nov 2019 12:32:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 932B2170C;
	Wed, 27 Nov 2019 12:31:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 932B2170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574854364;
	bh=E3cMyu/Eiep6DFuVm/GLN52WR9cA/jouCRdtCazrdgg=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kKnCljNKchpoNTKyQpMYMcdeYsHTSyU6+zCVj4tz78oBNR6bQikyCZ3RExGq5Z0p/
	 huyLxZyAlt/0UGITF27kvEpl/3ihqzj9ZonBBcP4TiOm5y3P0Zd4ghfqB18C1vWUrF
	 jOGAAC4z8QkfVaSGzwOyk44AzKX4OogXdzcqnbUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C61EFF8013B;
	Wed, 27 Nov 2019 12:31:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F3D1F8014D; Wed, 27 Nov 2019 12:30:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1504DF800CE
 for <alsa-devel@alsa-project.org>; Wed, 27 Nov 2019 12:30:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1504DF800CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 03:30:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,249,1571727600"; d="scan'208";a="199158241"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga007.jf.intel.com with ESMTP; 27 Nov 2019 03:30:51 -0800
Date: Wed, 27 Nov 2019 13:30:50 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20191127112536.28791-1-kai.vehmanen@linux.intel.com>
Message-ID: <alpine.DEB.2.21.1911271327020.16459@zeliteleevi>
References: <20191127112536.28791-1-kai.vehmanen@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Nikhil Mahale <nmahale@nvidia.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: hdmi - fix regression in
 connect list handling
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

On Wed, 27 Nov 2019, Kai Vehmanen wrote:

> Fix regression in how intel_haswell_fixup_connect_list()
> results are used in hda_read_pin_conn(). Use of
> snd_hda_get_raw_connections() in hda_read_pin_conn() bypasses
> the cache and thus also bypasses the overridden pin connection

the original series did pass our SOF CI, but as we have now results from 
wider testing, it unfortunately seems a regression slipped through.
Re-reviewing the code, this bit seems clearly wrong, we can't use
get_raw_connections() if we depend on the connection overrides.

This patch should not affect non-Intel platforms, but please review
in any case.

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
