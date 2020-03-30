Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB221996A5
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 14:38:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6692C1670;
	Tue, 31 Mar 2020 14:37:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6692C1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585658306;
	bh=sZFOXXvTDxefyCXONcNx7z2eZrg27oYbPnm8Ui/dGOk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UZqUbSyak2un9mxAq1Kqc2aFy+8vmMHWI3B1TAUadYsvg1RIDXnYTdiTg28QogZbf
	 BqqgCPMLRbPsiclGGWvmRZTih6645iNVditIQiUFyJ/FwfHdgRzzIYerNbXu4D3BqA
	 UAUCwM7B1Fr5Z14ATKeYYxygxgVkp26riWOm01oA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2F86F801F2;
	Tue, 31 Mar 2020 14:37:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F4E1F80157; Tue, 31 Mar 2020 14:37:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F347FF8010C
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 14:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F347FF8010C
IronPort-SDR: oZXMcHHveDeAfbfbFnsQaRBBgHjPw/wwbyhy0N2lxNmGe/xlkbfn/6qZMrFH75bL8KMwqRrNzn
 LIt8osbPJBeQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2020 04:44:41 -0700
IronPort-SDR: 6NC5DNzzhZzqdYL8y+kWiysUfk9djPWjYH30OVtAoLZ1puj7smnLaSMEDKTL0pHEXLIT8kMrfd
 zbbDDDAM8csQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,327,1580803200"; d="scan'208";a="240100557"
Received: from kmariste-mobl.amr.corp.intel.com (HELO [10.212.248.138])
 ([10.212.248.138])
 by fmsmga007.fm.intel.com with ESMTP; 31 Mar 2020 04:44:39 -0700
Subject: Re: [PATCH 3/4] ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag
 from SSP0 dai link
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
 <20200319204947.18963-4-cezary.rojewski@intel.com>
 <dea20cf7-f324-a933-8f8e-e70a4dffa249@linux.intel.com>
 <259cbb60-9e59-1132-8371-83f837577f86@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cfb3612e-e453-526d-8351-9167f26fecca@linux.intel.com>
Date: Mon, 30 Mar 2020 18:49:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <259cbb60-9e59-1132-8371-83f837577f86@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Curtis Malainey <cujomalainey@google.com>, tiwai@suse.com,
 Dominik Brodowski <linux@dominikbrodowski.net>, lgirdwood@gmail.com,
 vkoul@kernel.org, broonie@kernel.org, Ben Zhang <benzh@google.com>
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


>> Btw the .ignore_suspend is also set in bytcr_rt5640/51 drivers, so 
>> wondering if additional devices are broken, or if there's something 
>> off about Broadwell in general. Hans, have you heard of any 
>> regressions on Baytrail devices?
> 
> I've just tested 5.6.0 on Bay Trail + a rt5651 codec,
> using the bytcr_rt5651 machine driver which sets
> ignore_suspend, as well as on a Cherry Trail + rt5645
> device using the chtrt5645 machine driver which does
> _not_ set ignore suspend.
> 
> Suspend/resume work fine on both and music playing
> before suspend continues playing after suspend.

Thanks for testing Hans.

I think we should remove those .ignore_suspend from all 
Baytrail/Cherrytrail drivers, no one ever enabled advanced power 
management except in very specific Android distributions that are no 
longer maintained.
> 
> Note that the bytcr_rt5651 machine driver also does:
> 
>          snd_soc_dapm_ignore_suspend(&card->dapm, "Headphone");
>          snd_soc_dapm_ignore_suspend(&card->dapm, "Speaker");
> 
> Which the bdw-rt5677 seems to not do...


On the bytcr_rt5661, these two lines were added in the initial code in 
2016, and it's also part of the legacy byt-rt5640, so it's likely a 
copy/paste more than a feature added on purpose.
