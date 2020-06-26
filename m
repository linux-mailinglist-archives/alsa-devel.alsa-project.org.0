Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BDE20B416
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jun 2020 17:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98D39168D;
	Fri, 26 Jun 2020 17:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98D39168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593183727;
	bh=hKk3kNTh/WRFHcn28DGQlSEsgbXOzN2tEfoebxoC9r8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XsZJTCmorQfBAynKcSJiCiWeuSDUaS9EU7ODOPggRM4Q+r9+op3YLxB+qHWtmbRjT
	 2/94umvnbvCqUJGah4tv1gmuqAvepESrE35keCYZPtZ1iu14ba2SRhxKfgCRNOzd/j
	 s3KpF7BsJfifcQSa9HzXGLM/4xk025Zr9dDHxnIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A39BCF80162;
	Fri, 26 Jun 2020 17:00:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB92DF8015A; Fri, 26 Jun 2020 17:00:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38A18F8015A
 for <alsa-devel@alsa-project.org>; Fri, 26 Jun 2020 17:00:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38A18F8015A
IronPort-SDR: GnvglHFegquBNP0+k/2ksxMp/32aI2GkkbsEqi3teGlhSSVFicwMd/9zW4FfApjGus6wxnrw7P
 td/DMjNBgGHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="230122131"
X-IronPort-AV: E=Sophos;i="5.75,284,1589266800"; d="scan'208";a="230122131"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 08:00:14 -0700
IronPort-SDR: l4Jl6cstXFZPBOzWZl1C6USk7rddGymPDaYXKx/8S2hIbUOGNQs90g2hLe1kAFnmD6ourLo1o5
 Uuwh1TDrImxg==
X-IronPort-AV: E=Sophos;i="5.75,284,1589266800"; d="scan'208";a="280171532"
Received: from avenkat1-mobl2.amr.corp.intel.com (HELO [10.254.109.204])
 ([10.254.109.204])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 08:00:14 -0700
Subject: Re: [PATCH 16/17] ASoC: Intel: sdw_max98373: add card_late_probe
 support
To: Mark Brown <broonie@kernel.org>
References: <20200625192652.4365-1-pierre-louis.bossart@linux.intel.com>
 <20200626143732.GA34281@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2ca5ecb6-8827-458a-4db2-4232818a6841@linux.intel.com>
Date: Fri, 26 Jun 2020 09:52:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200626143732.GA34281@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 randerwang <rander.wang@linux.intel.com>
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



On 6/26/20 9:37 AM, Mark Brown wrote:
> On Thu, Jun 25, 2020 at 02:26:52PM -0500, Pierre-Louis Bossart wrote:
>> From: randerwang <rander.wang@linux.intel.com>
>>
>> Disable Left and Right Spk pin after boot so that sof can
>> get suspended. Please check patch: ASoC: Intel: Boards:
>> tgl_max98373: add dai_trigger function
> 
> This doesn't apply against current code, please check and resend.

Not sure what happened here, I always apply the patches on your latest 
branch in a separate tree, then re-extract them and recheck. maybe an 
email glitch, SMTP was behaving yesterday?

087e499f3588 (HEAD) ASoC: Intel: common: add match table for TGL 
MAX98373 + RT5682 SoundWire driver
b823b27ac76a ASoC: Intel: sdw_max98373: add card_late_probe support
e880afab0e1e ASoC: Intel: sof_sdw: Add MAX98373 support
420f436a475d ASoc: Intel: cml_rt1011_rt5682: explicitly access first codec
5c1e816dc7f8 ASoC: Intel: Boards: tgl_max98373: Update TDM configuration 
in hw_params
580146e7aa3c ASoC: intel: cml_rt1011_rt5682: use for_each_card_prelinks
5be6a56bf667 ASoC: Intel: Boards: cml_rt1011_rt5682: use statically 
define codec config
ec850dd28467 ASoC: Intel: Boards: cml_rt1011_rt5682: reduce log level 
for printing quirk
ff4ddc936df9 ASoC: intel: sof_rt5682: Add support for jsl-max98360a-rt5682
340cd9f9204a ASoC: Intel: Boards: tgl_max98373: Fix the comment for 
max_98373_components
1411290ca7d7 ASoC: Intel: Boards: tgl_max98373: add dai_trigger function
66cc4de87f59 ASoC: Intel: boards: byt*.c: remove cast in dev_info quirk log
4d57ebbdc285 ASoC: Intel: sof_sdw: add quirk override with kernel parameter
c0279ffae76b ASoC: Intel: bxt_rt298: add missing .owner field
6d3f35161e30 ASoC: Intel: sof_sdw: add missing .owner field
84b3d261c3c2 ASoC: Intel: cml_rt1011_rt5682: add missing .owner field
af35def7968d ASoC: SOF: nocodec: add missing .owner field
6f81e520b290 (broonie/for-5.9) ASoC: tas2562: Fix shut-down gpio property
