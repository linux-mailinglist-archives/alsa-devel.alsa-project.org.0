Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B37E4E46BE
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 11:09:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D0A2178F;
	Fri, 25 Oct 2019 11:09:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D0A2178F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571994596;
	bh=GjCxDpSy9b+E3SR2EleGk9CqfRrb92fBanLTtaTJ/44=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=frueZbuQWlYu0XZJvkKggO6I1ct6pdiZU0XASdwcLIFbCCzBXOUBwxbKjrmp1iH+0
	 3EJepEifAY/IBaDnHC/UosHm8O03USRtgEsEu4Rxp896wYquaQn4FJME+QZO2oaPsC
	 2zvxA/Jty/5vCy0zlz7YbELc1tRe5QQ4/vdyVo0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64AD2F80368;
	Fri, 25 Oct 2019 11:08:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C7BFF8036F; Fri, 25 Oct 2019 11:08:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BB03F802A0
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 11:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BB03F802A0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 02:08:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,228,1569308400"; d="scan'208";a="197377501"
Received: from kmsmsx152.gar.corp.intel.com ([172.21.73.87])
 by fmsmga008.fm.intel.com with ESMTP; 25 Oct 2019 02:07:58 -0700
Received: from pgsmsx108.gar.corp.intel.com ([169.254.8.51]) by
 KMSMSX152.gar.corp.intel.com ([169.254.11.51]) with mapi id 14.03.0439.000;
 Fri, 25 Oct 2019 17:07:57 +0800
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH] ASoC: Intel: eve: Enable mclk and ssp
 sclk early for rt5514
Thread-Index: AQHVibVeihUHG65lMUel8ewyaYl6D6dn2HEAgAM3GCA=
Date: Fri, 25 Oct 2019 09:07:56 +0000
Message-ID: <CF33C36214C39B4496568E5578BE70C740320031@PGSMSX108.gar.corp.intel.com>
References: <1571843796-5021-1-git-send-email-brent.lu@intel.com>
 <b68e5cb8-6d03-def0-646d-c68bd2604ecd@linux.intel.com>
In-Reply-To: <b68e5cb8-6d03-def0-646d-c68bd2604ecd@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDYwNWRiZDYtYzc4MC00ZGJlLWJiYjQtYjM3NjZjZjFlZjcxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNmtGSldXOGFmUlNYNWpIbEhhK1hndE5NanVtXC8zRFhCRFhQeUhxYjVzSlJsU3Y4UGtKSGF2RkRsYXU2TDY0VTMifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Richard Fontana <rfontana@redhat.com>, Jie Yang <yang.jie@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>, "M,
 Naveen" <naveen.m@intel.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: eve: Enable mclk and ssp sclk
 early for rt5514
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

> The patch looks fine, but I'd like to clear a doubt I have on how MCLKs are
> handled.
> 
> IIRC, the hardware exposes 2 MCLK outputs, and it's not uncommon to share
> the same MCLK between SSPs, or use a different MCLK id for the same SSP
> on different platforms (it's one of the differences between
> apl-da7219 and glk-da7219).
> 
> Can you double-check that at the board level the MCLK pins are actually
> different? If they are not, then we should not be enabling/disabling them
> separately, or you'll have side effects between headset and DMICs.
> 
> I also don't know what the SKL driver does with 'ssp0_mclk' and 'ssp1_mclk'?
> Cezary, would you happen to know how the mapping between MCLK and
> SSPs is handled?
> 

On the board I only see one mclk output which name is "GPPD23/I2S_MCLK". I will
use ssp1_mclk instead since rt5514 is also use it when enabling DSP voice wake up
function.

I've talked to Realtek people about this issue. They said rt5514 requires explicit
clock control over mclk in its rt5514_set_bias_level() function which explains
why this patch could fix the issue but the patch seems to be an overkill. I will upload
another patch which touches mclk only in card's set_bias_level() function . Thanks
for the review.

Regards,
Brent
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
