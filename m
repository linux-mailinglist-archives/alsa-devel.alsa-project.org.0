Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C9630EE14
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 09:12:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58B2516F9;
	Thu,  4 Feb 2021 09:11:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58B2516F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612426347;
	bh=mf/uNcoTSBZ4Vsp2F0lP+BHPd3Rf1N2SnJG+jZs4P74=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KmTP0RkSIF3UCJ1reib4nNhfMjGIvW+wsTL4Mfa1vGXpQvftU8PKc8cxQRNVKVt5J
	 hm+nKCEg9VfnCtTHSpiqtNPA6NsgdYcqXS1TTBz8KgtdNOcV5ivbgeNjZzvWOjFUGr
	 06nEtKs0+KFMxrYNkei5JWDfFej84os6RFW7XLWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A54C9F801F7;
	Thu,  4 Feb 2021 09:10:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44106F80171; Thu,  4 Feb 2021 09:10:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72A6BF80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 09:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72A6BF80152
IronPort-SDR: XAkfK+JcjKm6QrQM7z/0a6ZYebqwtxn/x5Rr6OTRlQ6bkEMY/IhmWR0cgZBxfa3Htda7yhTp+U
 NP0BOHZLes5g==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="160951757"
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="160951757"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 00:10:42 -0800
IronPort-SDR: NfLR8mfPDOXy32QEIlZVYoK8/MoOeiuCDSoYbE65Ej7zG7LrQGTHulPZOhI5B+zLeNwSfL/+b5
 Y9OkDeENunEw==
X-IronPort-AV: E=Sophos;i="5.79,400,1602572400"; d="scan'208";a="508057996"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 00:10:41 -0800
Date: Thu, 4 Feb 2021 10:07:09 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [RFC PATCH] ALSA: hda: call ext hda codec link up/down if
 available
In-Reply-To: <20210204075821.1503539-1-kai.vehmanen@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2102040959490.864696@eliteleevi.tm.intel.com>
References: <20210204075821.1503539-1-kai.vehmanen@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

On Thu, 4 Feb 2021, Kai Vehmanen wrote:
> To support more fine-grained control of link power, this patch
> implements new helper functions for codec drivers to turn codec links
> up and down. The HDA common suspend/resume code is modified to use
> the new functions. This allows to fully reuse the driver code both
> for plain and extended HDA controllers.

Takashi and others, this patch is a follow-up to the earlier thread about 
hdac link management:
https://mailman.alsa-project.org/pipermail/alsa-devel/2021-January/179715.html

We have absolutely no calls from sound/pci/hda/ to hdaudio_ext.h before
this patch, so I'm wondering if this is the right approach to take. 

It does seem to be the natural path forward and mimics what was done in 
e.g. hdac_hdmi. But we want to keep reusing driver code for all HDA 
implementations, so adding hdac-ext support to codec drivers seem like the 
best path.

Br, Kai
