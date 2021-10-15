Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6743742F02C
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 14:06:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E638C16B8;
	Fri, 15 Oct 2021 14:05:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E638C16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634299570;
	bh=fYQRKAR/zaxMItTkaLEwouGkpn4gis7CYDli+hijTzM=;
	h=Subject:From:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MEDVnMgCRiD/EdV1AFiXWEyRvzCmxqrpp0RUolj/AB1cPf/xZQb1ZXjxycnVTHzFa
	 XFUH2pqvzvXnZUJ47W6sNJJfxFqyIm6iUDYqhdh86+dbOWPT7dMa5znygSvMaZk1iL
	 lSIpTTBQ1ZSucNMJHdrM+KQ2w80ZHAgc4YjWO2Mk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4567AF8012E;
	Fri, 15 Oct 2021 14:04:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35A79F80269; Fri, 15 Oct 2021 14:04:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1FE8F8016C
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 14:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1FE8F8016C
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="288766389"
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="288766389"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 05:04:44 -0700
X-IronPort-AV: E=Sophos;i="5.85,375,1624345200"; d="scan'208";a="492505226"
Received: from liminghu-mobl.ccr.corp.intel.com (HELO [10.212.23.213])
 ([10.212.23.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2021 05:04:43 -0700
Subject: Re: [RFC PATCH v3 05/13] ASoC: soc-pcm: align BE 'atomicity' with
 that of the FE
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>, Sameer Pujar <spujar@nvidia.com>
References: <20211013143050.244444-1-pierre-louis.bossart@linux.intel.com>
 <20211013143050.244444-6-pierre-louis.bossart@linux.intel.com>
 <2847a6d1-d97f-4161-c8b6-03672cf6645c@nvidia.com>
 <s5hmtnavisi.wl-tiwai@suse.de>
 <e2a79095-b8ce-9dd4-3e6d-00f8dda99f30@linux.intel.com>
Message-ID: <368f7507-cfb9-b64a-d3e4-558307c5e078@linux.intel.com>
Date: Fri, 15 Oct 2021 07:04:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <e2a79095-b8ce-9dd4-3e6d-00f8dda99f30@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, vkoul@kernel.org, broonie@kernel.org,
 Gyeongtaek Lee <gt82.lee@samsung.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
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



On 10/15/21 6:22 AM, Pierre-Louis Bossart wrote:
> If this patch causes issues outside of the trigger phase, then maybe we
> could just change the BE nonatomic flag temporarily and restore it after
> taking the lock, but IMHO something else is broken in other drivers.

Now that I think of it, this wouldn't work, the type of locks for the
BEs has to be set before the trigger: the DPCM flow is that we start
from the FEs and find which BEs need to be triggered. That would prevent
us from modifying a global BE property - each FE is independent.
