Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F7B66DDBD
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:37:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31C656784;
	Tue, 17 Jan 2023 13:36:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31C656784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673959048;
	bh=uhUyp8s8X+TLtfLu32/M/aKyQIv+uFrr5EaeTyAlnig=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SsfXL9+46ScbvHAyAho/LNGT7ZINZqy1aI3GSOpxfXuL6LV7k9tYB+EUYO0zhkeJl
	 Amqzkd7ucsaEE8wIa+5qc1Qld44g4MytTMXywaUBCWXWUhKEvQL0d8QD6DE4wcVQWc
	 YqJPeR8temSflCnzH6xX8TcwFVKo3Y9/rNll2ROw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE0B2F8026D;
	Tue, 17 Jan 2023 13:36:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB370F804E6; Tue, 17 Jan 2023 13:36:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4BC2F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:36:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4BC2F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=b7m8Gxj9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673958992; x=1705494992;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uhUyp8s8X+TLtfLu32/M/aKyQIv+uFrr5EaeTyAlnig=;
 b=b7m8Gxj9TQ3oZ2fNAhok3Uu3aN+9ST1FqIb8RZdVRrMzi/l7F9tFTeaq
 QCdxfuuo0qO2XFJALxdBkqRY4IvNcW2cPbBi63tO2AEy567USSq2nlET4
 ItqClxJg5sw2GcPDstj39RueFYmbMF+/nzR1+5bFs6pIaZdjBvfocwRAF
 KywYw5sRgyBPF73iJib1TO4IZ3eT/8lBkm0kpI7RJpz1P/xLz/0174JQY
 4AYXL9dZY96Q3xGEyzbT+Ebd4JiPEk6pD+MlkTqDy5xwZUB0fmB0xdYNL
 tUDCZ1QGEZGhc4bJVBckgu+qiQZRudPQP9FaHsNjDEooDN+Lp4BU7oecf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="305058722"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="305058722"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:36:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="722641870"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; d="scan'208";a="722641870"
Received: from tdnguye2-mobl.amr.corp.intel.com (HELO [10.212.127.230])
 ([10.212.127.230])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 04:36:20 -0800
Message-ID: <f3aaf5b7-d822-d5d6-eb7c-71ef1e9c9e73@linux.intel.com>
Date: Tue, 17 Jan 2023 06:36:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 19/19] ASoC: amd: ps: increase runtime suspend delay
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <5a34e6f7-eaf1-8128-81e4-81f65541d9a8@linux.intel.com>
 <1a14e117-4216-b98d-f972-c9a02cf79d1e@amd.com>
 <eb12ed5d-a9f9-cb8d-28f5-ac84c75cf441@linux.intel.com>
 <90782037-109b-b197-ca17-b7d199931f7d@amd.com>
 <e73032b1-ac5b-4a3a-e2a0-8ac121853dee@linux.intel.com>
 <Y8G3mPUDWWUu/3ZR@sirena.org.uk>
 <ef05d550-c2aa-e256-58ec-612c2a3294ca@amd.com>
 <62272f17-bb97-aa10-d5d9-0914595e5431@linux.intel.com>
 <b61474ce-01a9-7602-e3c0-df8fdc5191c6@amd.com>
 <625915d5-0c2a-ce63-e71b-ff4f4f2c6d07@linux.intel.com>
 <Y8aRlJRsCjIzYuqa@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <Y8aRlJRsCjIzYuqa@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Mastan.Katragadda@amd.com, Sunil-kumar.Dommati@amd.com,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, vkoul@kernel.org, "Limonciello,
 Mario" <mario.limonciello@amd.com>, "Mukunda,
 Vijendar" <vijendar.mukunda@amd.com>, arungopal.kondaveeti@amd.com,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/17/23 06:16, Mark Brown wrote:
> On Tue, Jan 17, 2023 at 05:51:03AM -0600, Pierre-Louis Bossart wrote:
>> On 1/17/23 05:33, Mukunda,Vijendar wrote:
> 
>> [    2.758904] rt1316-sdca sdw:0:025d:1316:01:0: ASoC: error at
>> snd_soc_component_update_bits on sdw:0:025d:1316:01:0 for register:
>> [0x00003004] -110
> 
>> The last one is clearly listed in the regmap list.
> 
>> You probably want to reverse-engineer what causes these accesses.
>> I see this suspicious kcontrol definition that might be related:
> 
>> 	SOC_SINGLE("Left I Tag Select", 0x3004, 4, 7, 0),
> 
> Looks like a case for putting the CODEC in cache only mode...

Right, and I think we'd need to do this during the probe instead of the
hardware initialization (which could happen at a later time).

I started a PR to try and improve regmap handling, see
https://github.com/thesofproject/linux/pull/3941

I was trying to solve the case where codecs become unattached, but
apparently the problem is hardware-related. One of the suggested
improvements was to move the cache_only part earlier to prevent such
accesses. Unfortunately the work isn't complete so that PR is just a
draft at the moment.
