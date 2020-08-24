Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE05D24FDA2
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Aug 2020 14:19:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 524C51661;
	Mon, 24 Aug 2020 14:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 524C51661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598271576;
	bh=e7ruQRGxzVVwS2LmETUHdVA8NodPWtkBcfJ5BrGVaJc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P58TSBzRAOlXggDz8TD5CZkFqNpQ3wO484cbZHJeksv5UMLnMZwMHz74AMR8SnUx/
	 G+Bosk9wdODr5Rjd9xaEF/VeR0nCQAdwUsVFRUJU3SGtkiM/4ArjnKj8lORcaNNBX0
	 xbd75E848ko3/2W8QsMb1PD+ZTyVzNfz+ga2ZNUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 664B4F801EC;
	Mon, 24 Aug 2020 14:17:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 094C9F801D9; Mon, 24 Aug 2020 14:17:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3F71F800B8;
 Mon, 24 Aug 2020 14:17:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3F71F800B8
IronPort-SDR: I91TwC0Q561JEeQ6t8c8YyvyMgNrFMoQixYgdEpwIhjnzGSrzbVnRGyIuSVaJrg/2Wd3vecaaN
 fWeoFz4JHWXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="155869720"
X-IronPort-AV: E=Sophos;i="5.76,348,1592895600"; d="scan'208";a="155869720"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 05:17:36 -0700
IronPort-SDR: v1DgNXcEDp1P6pt0Og2CYj5cDnO7hdNAXgTXZ6Ee6BHbVLXBANsLfEXS8kzoToRHl76mWUK2Wh
 J3aCsXSqRJNQ==
X-IronPort-AV: E=Sophos;i="5.76,348,1592895600"; d="scan'208";a="443185272"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2020 05:17:34 -0700
Date: Mon, 24 Aug 2020 15:16:26 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Pawel Harlozinski <pawel.harlozinski@linux.intel.com>
Subject: Re: [PATCH] ALSA: hda: Refactor calculating SDnFMT according to
 specification
In-Reply-To: <20200824100034.3129-1-pawel.harlozinski@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2008241434310.3186@eliteleevi.tm.intel.com>
References: <20200824100034.3129-1-pawel.harlozinski@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, patch@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com
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

Hey,

On Mon, 24 Aug 2020, Pawel Harlozinski wrote:

> Set SDnFMT depending on which format was given, as maxbps only describes container size.

hmm, I'm not entirely sure that is correct. Usage may be a bit varied, but 
most places in existing code, "maxbps" is treated as number of significant 
bits, not the container size. E.g. in hdac_hda.c:

»       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
»       »       maxbps = dai->driver->playback.sig_bits;
»       else
»       »       maxbps = dai->driver->capture.sig_bits;

It would seem "maxbps" is a bit superfluous given the same information can 
be relayed in "format" as well. But currently it's still used. E.g. if you 
look at snd_hdac_query_supported_pcm(), if codec reports 24bit support, 
format is always set to SNDRV_PCM_FMTBIT_S32_LE, even if only 24bit are 
valid. So snd_pcm_format_width() will not return the expected significant 
bits info, but you have to use "maxbps". So original code seems correct 
(or at least you'd need to update both places).

Br, Kai
