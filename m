Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23240197A72
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 13:12:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB635166F;
	Mon, 30 Mar 2020 13:11:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB635166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585566748;
	bh=0nD+qvArpuxMqiXIfO5Dak1D6FkziC3FNji16T5wgGE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A64xeamwsdYzFl3LPHgUbsi6ZmhYweFCcB/AiDKUxvNvppPR06u1Juaa9xd/pTHt9
	 F8V/IjzQwWyAw6ywnLpRJ5SsbXwk/CZZpLIyiZoiyHDd1tgWiz8qQk5pdDHYr8KlX6
	 U+UMfYaon35kEBbDJ3W4UcHEPACN+AsQjCGMrUBk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0EC0F8014A;
	Mon, 30 Mar 2020 13:10:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF49EF80148; Mon, 30 Mar 2020 13:10:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1097F800EB
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 13:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1097F800EB
IronPort-SDR: zRux1CULX6XVNT9Oz7Okv+3F1szJQv5zDHe1cEbuR4Yp5Senx3NWQhZjOquFw5KGxvctsCbBa/
 pwpX0anNyU7w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 04:10:38 -0700
IronPort-SDR: bppOdF40OdLoDwKSFJtP2VGF7LktLALGDFxSycraXvH9JdU6WwwdaBRjeVDMPnp3Lp+aeivARV
 JglWs2pepCBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,324,1580803200"; d="scan'208";a="359146234"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.213.6.130])
 ([10.213.6.130])
 by fmsmga001.fm.intel.com with ESMTP; 30 Mar 2020 04:10:35 -0700
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
To: Dominik Brodowski <linux@dominikbrodowski.net>
References: <20200318162029.GA3999@light.dominikbrodowski.net>
 <e49eec28-2037-f5db-e75b-9eadf6180d81@intel.com>
 <20200318192213.GA2987@light.dominikbrodowski.net>
 <b352a46b-8a66-8235-3622-23e561d3728c@intel.com>
 <20200318215218.GA2439@light.dominikbrodowski.net>
 <e7f4f38d-b53e-8c69-8b23-454718cf92af@intel.com>
 <20200319130049.GA2244@light.dominikbrodowski.net>
 <20200319134139.GB3983@sirena.org.uk>
 <a01359dc-479e-b3e3-37a6-4a9c421d18da@intel.com>
 <20200319165157.GA2254@light.dominikbrodowski.net>
 <20200330102356.GA16588@light.dominikbrodowski.net>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <43c098c9-005e-b9f4-2132-ed6e4a65feee@intel.com>
Date: Mon, 30 Mar 2020 13:10:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330102356.GA16588@light.dominikbrodowski.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 curtis@malainey.com, tiwai@suse.com, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 Mark Brown <broonie@kernel.org>
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

On 2020-03-30 12:23, Dominik Brodowski wrote:
> 
> Seems this patch didn't make it into v5.6 (and neither did the other ones
> you sent relating to the "dummy" components). Can these patches therefore be
> marked for stable, please?
> 
> Thanks,
> 	Dominik
> 

While one of the series was accepted and merged, there is a delay caused 
by Google/ SOF folks in merging the second one.

Idk why rt286 aka "broadwell" machine board patch has not been merged 
yet. It's not like we have to merge all (rt5650 + rt5650 + rt286) 
patches at once. Google guys can keep verifying Buddy or whatnot while 
guys with Dell XPS can enjoy smooth audio experience.

Sneak peak Dominik: there will be more suspend/ resume patches coming 
soon ^)^ reducing power consumption in low-power state which honestly 
you might not even notice, but hey why not :P

Czarek
