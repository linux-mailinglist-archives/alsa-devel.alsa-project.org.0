Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F70110192
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 16:52:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8128A1662;
	Tue,  3 Dec 2019 16:51:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8128A1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575388354;
	bh=ZSawu1xQ7Cv+yX1pnJuD0grN7Kdm1b8eSQYsBmFDAoA=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lt0eHKPRM69h4P5rG9bs8Ko/I7J68naotpEnmRP6sYdrFgOoQZWDEd5QlaXaK0ZaF
	 OgHUFxtPB6KqUu2Df+inoxwfjWrwK5ZD7T5NaiWHiNrmDbx8t013Saw3+9kH3RrDdv
	 uVgUmtbMJWhac4v9L5RKx/YfRcHI1MVwdtPz/VvQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02601F800F0;
	Tue,  3 Dec 2019 16:50:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F118F80228; Tue,  3 Dec 2019 16:50:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9FA9F800F0
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 16:50:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9FA9F800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 07:50:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="205014962"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga008.jf.intel.com with ESMTP; 03 Dec 2019 07:50:40 -0800
Date: Tue, 3 Dec 2019 17:50:39 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191203154105.30414-1-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1912031746280.16459@zeliteleevi>
References: <20191203154105.30414-1-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Nikhil Mahale <nmahale@nvidia.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda: hdmi - Keep old slot assignment
 behavior for Intel platforms
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

thanks Takashi. A small correction still:

On Tue, 3 Dec 2019, Takashi Iwai wrote:

> The commit 609f5485344b ("ALSA: hda: hdmi - preserve non-MST PCM
> routing for Intel platforms") tried to restore the old behavior wrt
> assignment of the PCM slot for Intel platforms, but this didn't do it
> right.  As found in the later discussion, even on non-MST, a positive
> pipe id is passed, which is equivalent with dev_id on Intel.

Small correction still:

""As found in the later discussion, a positive pipe id can be
passed for single monitor attachment case.""

> This patch reverts the previous attempt and applies a simpler
> workaround instead.  Actually, for Intel platforms, we can handle as
> if per_pin->dev_id=0, assign the primary slot at the first try.  This
> assures the compatible behavior with the previous versions regarding
> the slot assignment.

This applies. So if you have a DP-MST case with a single monitor
and dev_id>0, this patch assure compatible behaviour with past versions.

Br, Kai

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
