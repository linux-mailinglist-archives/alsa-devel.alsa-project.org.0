Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2542725ABDA
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 15:13:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00CF017F9;
	Wed,  2 Sep 2020 15:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00CF017F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599052415;
	bh=PPwlHlVBZ0UNE5iTrTX04Ku/ZiD3BLN1g7sfR17Nh4I=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EizC6Z659fs+72MV4iGIVWWVFFsh8Mho+itYz1gOK5OWujMKJIMpsB802tvNYEfLM
	 EC9LTcFgkIt+QtWqZn43MV74NKDp9/D0aOnol088IJQRnUzoL6fQ/MtK/AC0seHu4Q
	 nj0Av/HJ1fQgh4u9WARKi1Bwv5NMkPhcYfTe7dvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 292EDF801DA;
	Wed,  2 Sep 2020 15:11:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B760CF80212; Wed,  2 Sep 2020 15:11:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE4C5F800BA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 15:11:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE4C5F800BA
IronPort-SDR: aG0iTbAiNl19GjcwheqVzNkFnx2/PF3ztFlaGuMbzb4NFtr/rFsF99RMGPJcGIQ3H+Zb+ZgjHA
 hMxoWEtjJvTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="175429781"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="175429781"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 06:11:41 -0700
IronPort-SDR: yq3/0isfLYJ9qTMHVw2S5kiGnVlQkby6ppw2nAUvd3nsk7U0Ap/p/2CZb0/qxuY3qPBE+dFlpk
 ePZlCUxgS8UQ==
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="502668857"
Received: from ntishkev-mobl.ger.corp.intel.com ([10.254.144.112])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 06:11:38 -0700
Message-ID: <5acf3d02b1705ee4be362d0bd57a62fd3b133667.camel@linux.intel.com>
Subject: Re: [PATCH] Revert "ASoC: Intel: haswell: Power transition refactor"
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Wed, 02 Sep 2020 14:11:33 +0100
In-Reply-To: <20200901153041.14771-1-cezary.rojewski@intel.com>
References: <20200901153041.14771-1-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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

On Tue, 2020-09-01 at 17:30 +0200, Cezary Rojewski wrote:
> This reverts commit 8ec7d6043263ecf250b9b7c0dd8ade899487538a.
> 
> 
> 
> While addressing existing power-cycle limitations for
> 
> sound/soc/intel/haswell solution, change brings regression for standard
> 
> audio userspace flows e.g.: when using PulseAudio.
> 
> 
> 
> Occasional sound-card initialization fail is still better than
> 
> pernament audio distortions, so revert the change.
> 
> 
> 
> Fixes: 8ec7d6043263 ("ASoC: Intel: haswell: Power transition refactor")
> 
> Reported-by: Christian Bundy <christianbundy@fraction.io>
> 
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Acked-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>

