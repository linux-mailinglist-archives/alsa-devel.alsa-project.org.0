Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE76C6071
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 08:13:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 260FDEC3;
	Thu, 23 Mar 2023 08:13:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 260FDEC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679555636;
	bh=PlvOIUDA1fGTuNeGRONTi8+ntNjFOBvb79GtX/K1D+Y=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oNiqUew8sKD2Gx0riPJoZUAyA12uZJW0lo+N7aW9deoFyCjkXdFzQtFTcW15Qlmqd
	 s5Tb1igccpwuMvQcl287BurymkcdeN92sp6qt1qKhxURXK/7+7PDPpWXnuo9BYDXzL
	 pXGHa9iYQGBB5mLyHxxHbusluJpnLeCwfApQXggU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86CFFF80093;
	Thu, 23 Mar 2023 08:13:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09DF0F802E8; Thu, 23 Mar 2023 08:13:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64A32F80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 08:12:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64A32F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AGKpsOUS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679555577; x=1711091577;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=PlvOIUDA1fGTuNeGRONTi8+ntNjFOBvb79GtX/K1D+Y=;
  b=AGKpsOUSXDjm6Q3upIilf78rPPX82n7i3y9lOshH/VdgGyTAmWblkJy6
   lk4xpwCzQQHKP+iAXrwQvZhr7aQKxN6M7fRWtxj2BkSB8Oyr0OrEkMlCR
   5RTXTTGZYajhFOY/FRnMQV4LnwR0RxUQTNxp9/8W0HzHQSLC5NmiL6ka8
   c7P5DhGmQW53WckIBynP4/W5OANZiacJcWj5xOVOTA+JSdMgbubBL5Vwk
   TyiGmbCx2ncOihaf6xk4B/QBiSdA13zEmUuVhDx/cP9UztqMUu+RtEF3Z
   nA5gqqTRGXpgkCk5rsteREnH3jqezAdTbYzubGL6CWBtuqJ/wMdA43L/H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="401984101"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="401984101"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 00:12:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675592337"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675592337"
Received: from pjfarr-mobl1.ger.corp.intel.com (HELO [10.251.221.200])
 ([10.251.221.200])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 00:12:43 -0700
Message-ID: <d020171d-da86-9bf0-3e8f-3cfaf85fb408@linux.intel.com>
Date: Thu, 23 Mar 2023 09:13:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/3] ASoC: SOF: ipc4/intel: Support for ChainDMA
To: Mark Brown <broonie@kernel.org>
References: <20230322135927.7668-1-peter.ujfalusi@linux.intel.com>
 <ZBsK5mJUfHSyrlU5@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <ZBsK5mJUfHSyrlU5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CADD6LTAKE6NZ2OHDQVNFVTNJWA6BPJS
X-Message-ID-Hash: CADD6LTAKE6NZ2OHDQVNFVTNJWA6BPJS
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, jyri.sarha@intel.com, rander.wang@intel.com,
 error27@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CADD6LTAKE6NZ2OHDQVNFVTNJWA6BPJS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

On 22/03/2023 16:04, Mark Brown wrote:
> On Wed, Mar 22, 2023 at 03:59:24PM +0200, Peter Ujfalusi wrote:
>> Hi,
>>
>> Changes since v1:
>> - Fix missed mutex unlocking in sof_ipc4_widget_free()
>>   Reported by Dan Carpenter (thank you!)
> 
> Please do not submit new versions of already applied patches, please
> submit incremental updates to the existing code.  Modifying existing
> commits creates problems for other users building on top of those
> commits so it's best practice to only change pubished git commits if
> absolutely essential.

I'm aware of that and checked my mailbox several times that I don't have
your applied notification mail. I would have sent a fix patch instead
otherwise.

Sorry for the inconvenience.

-- 
Péter
