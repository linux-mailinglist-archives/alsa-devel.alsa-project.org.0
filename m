Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 052CD264C4D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 20:08:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E18A16CF;
	Thu, 10 Sep 2020 20:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E18A16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599761298;
	bh=PkFJufuAKpcbF19gUnZaxolFbQzfszd6sZ2ZR7VNBdk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PqKfik3AWVBU0S7x1G1vMuuZ72eP6L1Igrn19qIlJmWAanjrL5MCaVUsFbyGpqRQB
	 JnixUVov/79DfwlrivE4ZDt+jcSUCuLNNQSWYWNiBcGtc00d18W26LZbcv0mr8IsQW
	 YAGSZb8qNkWJggWSMWrurcyPFYwZP54hdwS+23dE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6686BF8026F;
	Thu, 10 Sep 2020 20:06:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E0EBF80264; Thu, 10 Sep 2020 20:06:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0D96F8010E
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 20:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0D96F8010E
IronPort-SDR: EkBuusbuFJJwi5RyVYwhenH6KiDzhchj3KMHRJ8Zc6bhMMtyh76xfbo3SXyeJMezMVb5xRR0BR
 ZAlRss6EZaaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9740"; a="176667478"
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="176667478"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 11:06:13 -0700
IronPort-SDR: TbgBTxIPfPO2q3x6WUpY71mIX7SVfd8A37B2i0+LloyCOO9FB+mrsi21XpYbGQaGB26TwRPORs
 yr/lw+0Tr2KQ==
X-IronPort-AV: E=Sophos;i="5.76,413,1592895600"; d="scan'208";a="505920334"
Received: from rdraharj-mobl1.amr.corp.intel.com (HELO [10.209.137.6])
 ([10.209.137.6])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2020 11:06:11 -0700
Subject: Re: [PATCH V6] ASoC: Intel: boards: Use FS as nau8825 sysclk in
 nau88125_* machine
To: Radoslaw Biernacki <rad@semihalf.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
References: <20200910172538.31425-1-rad@semihalf.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ea119537-f998-b1fb-6665-648d78a25928@linux.intel.com>
Date: Thu, 10 Sep 2020 13:06:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910172538.31425-1-rad@semihalf.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Lech Betlej <Lech.Betlej@intel.com>, alsa-devel@alsa-project.org,
 Todd Broch <tbroch@google.com>, Harshapriya <harshapriya.n@intel.com>,
 Alex Levin <levinale@google.com>, John Hsu <KCHSU0@nuvoton.com>,
 linux-kernel@vger.kernel.org, michal.sienkiewicz@intel.com,
 Ben Zhang <benzh@chromium.org>, Mac Chiang <mac.chiang@intel.com>,
 Marcin Wojtas <mw@semihalf.com>,
 Vamshi Krishna <vamshi.krishna.gopal@intel.com>, Yong Zhi <yong.zhi@intel.com>
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



On 9/10/20 12:25 PM, Radoslaw Biernacki wrote:
> Since 256xFS clocks cannot be generated by SKL, the NAU8825 is
> configured to re-generate its system clock from the BCLK using the
> FLL. The link is configured to use a 48kHz frame rate, and 24 bits in
> 25-bit slot. The SSP configuration is extracted from NHLT settings and
> not dynamically changed. Listening tests and measurements do not show
> any distortion or issues
> 
> Signed-off-by: John Hsu <KCHSU0@nuvoton.com>
> Signed-off-by: Yong Zhi <yong.zhi@intel.com>
> Signed-off-by: Mac Chiang <mac.chiang@intel.com>
> Signed-off-by: Ben Zhang <benzh@chromium.org>
> Signed-off-by: Radoslaw Biernacki <rad@semihalf.com>
> ---

LGTM, thanks!

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
