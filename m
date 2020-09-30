Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF627E836
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 14:08:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76A591804;
	Wed, 30 Sep 2020 14:07:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76A591804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601467717;
	bh=7Lmcebaf/ulmwBS0PbWZSQYU7QTJFIiVjqgJsB/WBeo=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cdWFT+8l/TVYQ8yjoGXXDf3vMc4/AkgDbjAzRpTu8Cve0hLbeO7QKy9gq7wK4AaqN
	 4N6hsreMZ5WhTKP+sWTNaW5Cm43C6FERPJLv2CzhUBLS3yEKZxpE6NSel1frxZTv9z
	 5eoUtGHuGXlYw+q5CDqO0gcZOvDSPoHQSVAw8/5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83AA4F80110;
	Wed, 30 Sep 2020 14:06:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12B37F801ED; Wed, 30 Sep 2020 14:06:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F1A2F80110
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 14:06:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F1A2F80110
IronPort-SDR: z/TpfaAVnyF5wmyttoZoflPbp4bnoY6XBX76de/7I/OsQcrLs02TqUDfUCVI7bSAv9veqL+ctw
 jSEg1U8s4YKQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="224025585"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="224025585"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 05:06:42 -0700
IronPort-SDR: iT4JrMOe85IaJ2VnC4EL7aleLLIPjiFSEgHxAFHF/KIBFBd3PdmNUoyJ3QNPLG4B9Q5vkVT/xY
 KvPBC/vHfAbA==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="497241970"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 05:06:39 -0700
Date: Wed, 30 Sep 2020 15:05:01 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH v2 0/2] ALSA: HDA: Early Forbid of runtime PM
In-Reply-To: <20200930114140.3839617-1-kai.vehmanen@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2009301453110.3186@eliteleevi.tm.intel.com>
References: <20200930114140.3839617-1-kai.vehmanen@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, kailang@realtek.com,
 Takashi Iwai <tiwai@suse.de>, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, harshapriya.n@intel.com,
 broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 emmanuel.jillela@intel.com
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

On Wed, 30 Sep 2020, Kai Vehmanen wrote:

> Fix a race with runtime PM enabled during codec initialization.
> 
> For snd-hda-intel, no changes are needed in controller code, but
> to not break ASoC controller drivers, this V2 series adds
> an additional change in ASoC hdac_hda to allow runtime pm again
> at end of probe.

this is a follow-up to:
https://mailman.alsa-project.org/pipermail/alsa-devel/2020-August/173141.html

It turns out we need to make changes both in ASoC and sound/hda at the 
same time, to not break anything. So again a case where either Takashi or 
Mark, you should take both at the same time, if code itself is ok to all.

PS And sorry, versioning is confusing, should have sent this as V3.
   V1 modified only realtek codec, V2 modified hda_codec.c part and
   this V3 adds a patch to ASoC hdac_hdmi.c.

Br, Kai
