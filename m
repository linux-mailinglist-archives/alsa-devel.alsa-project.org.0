Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F52805995
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 17:13:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF547A4D;
	Tue,  5 Dec 2023 17:12:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF547A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701792789;
	bh=wDtj9DdSJ7Y93+n4xPNycXhG5HoyUMQZ1DvGBkUKDxM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H1WK3ByLdDKJIDB8su1QAq1fW+V+e2tJjAQniavR5LXtqkTOsxLYQCkQ20poOQwWR
	 sZFiha7JOYINskcEWl97mJCg8z2bPbQOMUKtq5X/S8OPRByzOdZi5igDmcFghuQ+Zo
	 pmdRKphSqtAN0JlrzC+QuFg8F5skstb+0nkYaKjc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BEADF802BE; Tue,  5 Dec 2023 17:12:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8546DF80571;
	Tue,  5 Dec 2023 17:12:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5263F8024E; Tue,  5 Dec 2023 17:12:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07D78F800F5
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 17:12:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07D78F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JPPAwiO+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701792761; x=1733328761;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=wDtj9DdSJ7Y93+n4xPNycXhG5HoyUMQZ1DvGBkUKDxM=;
  b=JPPAwiO+0gcVhh5iXfnMEMupsZccxsTUmiXcBVBmJpEW1+vF3I3vR6UF
   bCDBCbB0ji//uq4Y++vuAMiJvhChv/Ox/TRewYt2Zjs1BbSxlYrOTNjIx
   C0YEejYVKAxbwEYtDq5/+yj4CQLQVgYEV0IrQQd2DFUdkD5rDNysxxYVg
   d673dREh8Eu6gchL7WAR5aPKjycCmncXMG75cjFRL3KEqrmP+sghypLEX
   Gv2/KLqX5cFKnRLeh0GGnU/NyDX3twJ8f9RW5oTiG5p8jeG5AFRM8NtMV
   aOfoXsQwZhy2VsnpfS+Iu8TeHkBwSFwoVMvPrnI73WTuk3YNwJSMvEu5y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="392781040"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600";
   d="scan'208";a="392781040"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 08:12:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="747290491"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600";
   d="scan'208";a="747290491"
Received: from mbapna-mobl1.amr.corp.intel.com (HELO [10.212.151.198])
 ([10.212.151.198])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 08:12:24 -0800
Message-ID: <fc19ccbe-2e06-42f5-b968-446f8c08ec22@linux.intel.com>
Date: Tue, 5 Dec 2023 10:12:23 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ALSA: hda/tas2563: Add tas2563 HDA driver
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Gergo Koteles <soyer@irl.hu>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
References: <cover.1701733441.git.soyer@irl.hu>
 <4a2f31d4eb8479789ceb1daf2e93ec0e25c23171.1701733441.git.soyer@irl.hu>
 <90765ee0-a814-4852-9b2a-020cda98d930@linux.intel.com>
 <974d41f6c703d9b65ebcd75a2c659cecf13bd877.camel@irl.hu>
 <a530e70a-2491-4270-b582-cd493d1512b1@linux.intel.com>
In-Reply-To: <a530e70a-2491-4270-b582-cd493d1512b1@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3KVGU7RSRZO2NTX5EBPB32UYUIK5SBVD
X-Message-ID-Hash: 3KVGU7RSRZO2NTX5EBPB32UYUIK5SBVD
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KVGU7RSRZO2NTX5EBPB32UYUIK5SBVD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>>> +static const struct dev_pm_ops tas2563_hda_pm_ops = {
>>>> +	SYSTEM_SLEEP_PM_OPS(tas2563_system_suspend, tas2563_system_resume)
>>>
>>> where's the pm_runtime stuff?
>>>
>>
>> The amp stores its state in software shutdown mode.
>> The tas2563_hda_playback_hook wakes/shutdowns the amp, not the
>> pm_runtime.
> 
> My point was that you have all these pm_runtime_ calls in the code, but
> nothing that provides pm_runtime suspend-resume functions so not sure
> what exactly the result is?

if the inspiration was the tas2781, then see below it does have a
RUNTIME_PM_OPS line as well as runtime_suspend/resume routines.

static const struct dev_pm_ops tas2781_hda_pm_ops = {
	RUNTIME_PM_OPS(tas2781_runtime_suspend, tas2781_runtime_resume, NULL)
	SYSTEM_SLEEP_PM_OPS(tas2781_system_suspend, tas2781_system_resume)
};

