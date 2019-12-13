Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2FE11E44B
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 14:05:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E716177B;
	Fri, 13 Dec 2019 14:04:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E716177B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576242345;
	bh=3tYwXLZE/cXZa6pUD0rBNZufquYjr6gSfI2HKepZ+R0=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fGGmMlHfi6ztVMMnoUr49PbYAzFQHx5gY5fAyv59owXAQadLrRPlIJX21xgWdifPY
	 Q5wR4L4SV2EQxIorUgD3LNZOfDzhZn9R3dbofBe++vbcm1ALLdZRojfnSRvXvcNiXa
	 5XdVbYN2O8u9VTfB4jm2fLeX6kbHk8ExQEeRWLOE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2523EF8021D;
	Fri, 13 Dec 2019 14:04:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3ECDF801F4; Fri, 13 Dec 2019 14:03:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F9B1F8014F
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 14:03:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F9B1F8014F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Dec 2019 05:03:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,309,1571727600"; d="scan'208";a="211434981"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga008.fm.intel.com with ESMTP; 13 Dec 2019 05:03:51 -0800
Date: Fri, 13 Dec 2019 15:03:50 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191212191101.19517-2-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.1912131455260.16459@zeliteleevi>
References: <20191212191101.19517-1-tiwai@suse.de>
 <20191212191101.19517-2-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ALSA: hda: Use waitqueue for RIRB in
 HDA-core helper, too
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

On Thu, 12 Dec 2019, Takashi Iwai wrote:

> This patch implements the same logic that was done for the legacy
> HD-audio controller driver by the commit 88452da92ba2 ("ALSA: hda: Use

looks good to me. Code review ok, SOF CI shows no regressions [1] and I 
did a local test with a large amount of suspend/resyme cycles on a HDA machine 
and no errors seen. So for these two patches:

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[1] https://github.com/thesofproject/linux/pull/1625
     -> https://sof-ci.01.org/linuxpr/PR1625/build2716/devicetest/

Br, Kai

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
