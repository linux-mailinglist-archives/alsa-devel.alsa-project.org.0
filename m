Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A0CD4274
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Oct 2019 16:12:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD992167D;
	Fri, 11 Oct 2019 16:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD992167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570803143;
	bh=3FTwothzFeciHF9+dOkBuoCMaF9Rcuc+zBxuQQrdKu4=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zl0PxtacJpFroqNt50txwR8HkthhEj8HVt1i09AyfF7h7tRu3csofVo5N/BVCm5sE
	 s4v08zxahS0UtWzWmjfDHYpdz2+n14inOQUmAlwiMSfA0xzv+uBaviCpqZ295ZAQWo
	 7QokK1BxTNiiMlqxFWjx8ErLW2bElgwUu2AyI58w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B3D3F802BE;
	Fri, 11 Oct 2019 16:10:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36F29F802BE; Fri, 11 Oct 2019 16:10:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8168F80113
 for <alsa-devel@alsa-project.org>; Fri, 11 Oct 2019 16:10:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8168F80113
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Oct 2019 07:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; d="scan'208";a="198708280"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga006.jf.intel.com with ESMTP; 11 Oct 2019 07:10:30 -0700
Date: Fri, 11 Oct 2019 17:10:29 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <cf6a8edb-689d-e068-a9c4-d728b7741fec@linux.intel.com>
Message-ID: <alpine.DEB.2.21.1910111705060.16459@zeliteleevi>
References: <20191011112745.25800-1-kai.vehmanen@linux.intel.com>
 <20191011112745.25800-6-kai.vehmanen@linux.intel.com>
 <cf6a8edb-689d-e068-a9c4-d728b7741fec@linux.intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: tiwai@suse.de, libin.yang@intel.com, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v6 5/9] ASoC: SOF: Intel: add support for
 snd-hda-codec-hdmi
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

On Fri, 11 Oct 2019, Pierre-Louis Bossart wrote:
> Kai, I get a conflict when I try to apply these patches on Mark's tree? You
> probably want to rebase?
> Or was the intent to go through Takashi's tree?

I rebased this on top of Takashi's latest before sending:

07be92a0e6b0 (tiwai/master) Merge branch 'for-next'

But yeah, the series will conflict with the DMI patch in Mark's tree:

43b2ab9009b1 ASoC: SOF: Intel: hda: Disable DMI L1 entry during capture

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
