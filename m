Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 971B218BB81
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 16:49:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8DFC1793;
	Thu, 19 Mar 2020 16:48:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8DFC1793
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584632947;
	bh=zFd1rVZAKvfeFtBxbCg3bYts2QcL2bqomqYikg/QkMY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TFZxJ5PWmreoN1hHHIJnr1+jgm5FgjEMWes82HKqc1xbyo0y6YweB5xFzvmpYzyUR
	 bWQAYmNcChWdAvPe7sYf++W6Pg84STrLCljokIxDEs/0erG9cqjWpIcxxuxW13Ds3h
	 cyWXGwLkaU4PSQF0MsaKxMiEAbHQzlZeQ7oXQA3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F585F80217;
	Thu, 19 Mar 2020 16:48:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8038F8022B; Thu, 19 Mar 2020 16:48:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70E44F8012F
 for <alsa-devel@alsa-project.org>; Thu, 19 Mar 2020 16:48:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70E44F8012F
IronPort-SDR: jB3qZBiqdRkoQnmyLQDFzvTeA8frwdpLKCLBOJ+upDz2MZK/3VWZLzf9TTwSj3rs3d2CGHxjKl
 hSMI/SuN/KPQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 08:48:07 -0700
IronPort-SDR: CGTdcGF3z7TQ09hhIoa4PjIUsXi6Tbq+unUG7nuDe2of5JawDCFCSTssDwLvkPSjQcKLQgravP
 imxwFtrF77Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,572,1574150400"; d="scan'208";a="245198430"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.128.140])
 ([10.249.128.140])
 by orsmga003.jf.intel.com with ESMTP; 19 Mar 2020 08:48:04 -0700
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
To: Mark Brown <broonie@kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>
References: <41d0b2b5-6014-6fab-b6a2-7a7dbc4fe020@linux.intel.com>
 <20200318123930.GA2433@light.dominikbrodowski.net>
 <d7a357c5-54af-3e69-771c-d7ea83c6fbb7@linux.intel.com>
 <20200318162029.GA3999@light.dominikbrodowski.net>
 <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
 <20200318192213.GA2987@light.dominikbrodowski.net>
 <b352a46b-8a66-8235-3622-23e561d3728c@intel.com>
 <20200318215218.GA2439@light.dominikbrodowski.net>
 <e7f4f38d-b53e-8c69-8b23-454718cf92af@intel.com>
 <20200319130049.GA2244@light.dominikbrodowski.net>
 <20200319134139.GB3983@sirena.org.uk>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <a01359dc-479e-b3e3-37a6-4a9c421d18da@intel.com>
Date: Thu, 19 Mar 2020 16:48:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319134139.GB3983@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 curtis@malainey.com, tiwai@suse.com, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com
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

On 2020-03-19 14:41, Mark Brown wrote:
> On Thu, Mar 19, 2020 at 02:00:49PM +0100, Dominik Brodowski wrote:
> 
>> Have some good news now, namely that a bisect is complete: That pointed to
>> 1272063a7ee4 ("ASoC: soc-core: care .ignore_suspend for Component suspend");
>> therefore I've added Kuninori Morimoto to this e-mail thread.
> 
> If that's an issue it feels more like a driver bug in that if the driver
> asked for ignore_suspend then it should expect not to have the suspend
> callback called.
> 

Requested for tests with following diff applied:

diff --git a/sound/soc/intel/boards/broadwell.c 
b/sound/soc/intel/boards/broadwell.c
index db7e1e87156d..6ed4c1b0a515 100644
--- a/sound/soc/intel/boards/broadwell.c
+++ b/sound/soc/intel/boards/broadwell.c
@@ -212,7 +212,6 @@ static struct snd_soc_dai_link 
broadwell_rt286_dais[] = {
                 .init = broadwell_rt286_codec_init,
                 .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
                         SND_SOC_DAIFMT_CBS_CFS,
-               .ignore_suspend = 1,
                 .ignore_pmdown_time = 1,
                 .be_hw_params_fixup = broadwell_ssp0_fixup,
                 .ops = &broadwell_rt286_ops,
