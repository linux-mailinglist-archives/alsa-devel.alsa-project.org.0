Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B431DE25D
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2019 04:49:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9312384C;
	Mon, 21 Oct 2019 04:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9312384C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571626179;
	bh=yoouIB56W0Rv+B78VtcntCaSt4u2TCNXnGdW0Ku1Mps=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lvUQ/KjBryyhjLadBMduV3oRlscV15SUc33cq5YhEZlYAZDEzhgJd0cmk+GEyTkLp
	 Di9Rj0EvF0Fd4+XhdE7NDe4AgetHX8S6lyC3hobnTltwutpHz2f6gql35EOMAayFSu
	 uc+hlhpoBtbzrlV/hra4b665L/Jw5rHzaPVNfsro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30128F80368;
	Mon, 21 Oct 2019 04:47:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CE9FF80368; Mon, 21 Oct 2019 04:47:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86DD5F801EB
 for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2019 04:47:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86DD5F801EB
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Oct 2019 19:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,321,1566889200"; d="scan'208";a="203221302"
Received: from pgsmsx105.gar.corp.intel.com ([10.221.44.96])
 by FMSMGA003.fm.intel.com with ESMTP; 20 Oct 2019 19:47:35 -0700
Received: from pgsmsx108.gar.corp.intel.com ([169.254.8.51]) by
 PGSMSX105.gar.corp.intel.com ([169.254.4.226]) with mapi id 14.03.0439.000;
 Mon, 21 Oct 2019 10:47:34 +0800
From: "Lu, Brent" <brent.lu@intel.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [PATCH] ASoC: bdw-rt5677: enable runtime channel merge
Thread-Index: AQHVeQDQJxSKmeHo60W0FoozADL3CqdkfMRQ
Date: Mon, 21 Oct 2019 02:47:34 +0000
Message-ID: <CF33C36214C39B4496568E5578BE70C74031B9FD@PGSMSX108.gar.corp.intel.com>
References: <1570007072-23049-1-git-send-email-brent.lu@intel.com>
In-Reply-To: <1570007072-23049-1-git-send-email-brent.lu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMGUyMDI2MTItNzU0Zi00ZjMzLWE0NWUtZjVjZjhmNDU2MGQ0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiT1VkQ1ByNGlteHBlOXBhU2l6SU13dnVLSzlFMTNJTGZ6R1ExNWlVbWhXT3ZCUXNoSEFrVHpqQVU5UUE0WUpYZiJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, "Zavras,
 Alexios" <alexios.zavras@intel.com>, Mark Brown <broonie@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH] ASoC: bdw-rt5677: enable runtime channel
	merge
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

> Subject: [PATCH] ASoC: bdw-rt5677: enable runtime channel merge
> 
> In the DAI link "Capture PCM", the FE DAI "Capture Pin" supports 4-channel
> capture but the BE DAI supports only 2-channel capture. To fix the channel
> mismatch, we need to enable the runtime channel merge for this DAI link.
> 

Hi Pierre,

This patch is for the same issue discussed in the following thread:
https://patchwork.kernel.org/patch/11134167/

We enable the runtime channel merge for the DMIC DAI instead of adding a
machine driver constraint. It's working good on chrome's 3.14 branch (which
requires some backport for the runtime channel merge feature). Please let
me know if this implementation is correct for the FE/BE mismatch problem.
Thanks.


Regards,
Brent
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
