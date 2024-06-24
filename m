Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC09991525D
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 17:30:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFF05DEC;
	Mon, 24 Jun 2024 17:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFF05DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719243015;
	bh=HiwUGh3h+O4D+lzmLCV51vt0qg2e8Je1TkPAjVdCxmw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lrMBz1Yy+zm3nuxDEaj61msuz2tY87+r87A+Tb6rEaWPkgaLOyYRKmEj9EEDhwBBF
	 KVHK15jF102eNbxFi464YEumk6OKITvJdzNryLteD8K3gHHUdngEfOSlFivRFFyf4y
	 9pyDAyrdTsF7Ns4RwFekP+RoEFuf+fENHqV9CMyg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6433DF805DA; Mon, 24 Jun 2024 17:29:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C61BF805B4;
	Mon, 24 Jun 2024 17:29:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCE2AF80495; Mon, 24 Jun 2024 17:29:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25949F800ED
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 17:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25949F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mCNjrunI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719242946; x=1750778946;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HiwUGh3h+O4D+lzmLCV51vt0qg2e8Je1TkPAjVdCxmw=;
  b=mCNjrunI5y2D3oQLKoa0hjUcz/zvKYKamtCskVj4uZYd5t4vt7tr3S2+
   ptnfIP+3uYggA7eJbFIL2Xlw0/fZ4Tt05KyJ/kifl9dZDX5zsUEcLyHRY
   X92Lah/HqXT3onZF6iVxfpGMfkmP94ewNWIWsnNRKpOMXPso7OTYD8EtF
   K+VqjghjZsdtGEZ0ic5qs2V1WVak5ECFfeSD+Wkk+r2JDCpk4xzWkatGV
   YxjvfOmJXU/CEHZtR8LPaNl7YcuZqaDSbBh3UPMzyPySFRl1mwtesU7b1
   LPkgXFazu1X3iBNF8qEi0wdld1qJUcuHAzr+lcJCmIgzZ3v9JWSxnksad
   w==;
X-CSE-ConnectionGUID: +R2MhC4PRjaFGBnDoW2tZQ==
X-CSE-MsgGUID: e07pEBy/TEKkrj8xIu9LQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="19121781"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000";
   d="scan'208";a="19121781"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 08:29:03 -0700
X-CSE-ConnectionGUID: 4ms7eq/DSAuvFoNIefQEjA==
X-CSE-MsgGUID: C3igsDhVTYi5ndlAgzS+uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000";
   d="scan'208";a="47703976"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO [10.245.246.230])
 ([10.245.246.230])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 08:29:01 -0700
Message-ID: <9394ab7c-d628-489b-9b88-66eb11fca0d7@linux.intel.com>
Date: Mon, 24 Jun 2024 17:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: Intel: maxim-common: add max_98373_get_tx_mask
 function
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 Brent Lu <brent.lu@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>
References: <20240624121119.91552-1-pierre-louis.bossart@linux.intel.com>
 <20240624121119.91552-3-pierre-louis.bossart@linux.intel.com>
 <f3b5caee-a27e-42f9-b541-4f6bf8e8d2f2@sirena.org.uk>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <f3b5caee-a27e-42f9-b541-4f6bf8e8d2f2@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6WPNOWLXTBABWCTRLHOGHXARTOFFUMWZ
X-Message-ID-Hash: 6WPNOWLXTBABWCTRLHOGHXARTOFFUMWZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WPNOWLXTBABWCTRLHOGHXARTOFFUMWZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/24/24 14:37, Mark Brown wrote:
> On Mon, Jun 24, 2024 at 02:11:17PM +0200, Pierre-Louis Bossart wrote:
>> From: Brent Lu <brent.lu@intel.com>
>>
>> Add a helper function max_98373_get_tx_mask() to get tx mask from
>> max98373 ACPI device properties at runtime.
> 
> Similarly here.

I may have misunderstood Brent's patch but this isn't a fix really, more
a cleanup to use ACPI when possible, with a fallback to the existing
hard-coded setup if ACPI properties are not found.

I don't think it's a real 'fix' impacting users, in the linux-stable
sense, nor that this needs to be back-ported with case.

Brent, please chime in if I am mistaken?
