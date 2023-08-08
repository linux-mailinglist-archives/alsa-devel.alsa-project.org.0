Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 334D47739D4
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 13:03:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FE5D845;
	Tue,  8 Aug 2023 13:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FE5D845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691492611;
	bh=jHOYn9//8iPX+RoPt/5H1z0TENE0RN0IS8pVvDCFJC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t95xM1KPVgREzDMvZUrOKNdCAEohRrrxwShY+qYw9vBD5GZgwkpVrnOoIGJr2c18v
	 VoN+7Lzimac/EBgzEtpPPq9QVBUJ/RV6dLDi7iJXA2JUNOBAv2WJLauLLpLvv+LTan
	 6kZOZrAN1uEHah2O1mKX+0lGV5h8DyQS4CzfwC9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF276F8053B; Tue,  8 Aug 2023 13:02:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28060F80154;
	Tue,  8 Aug 2023 13:02:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97307F80534; Tue,  8 Aug 2023 13:02:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3929F800FE;
	Tue,  8 Aug 2023 13:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3929F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TVrwh/lz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691492531; x=1723028531;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jHOYn9//8iPX+RoPt/5H1z0TENE0RN0IS8pVvDCFJC0=;
  b=TVrwh/lzLc257raqqxBONIWrDm83UsnIU1sK5ORLSUg1uAKYb8VefgQR
   2gkvhKFDvW7yVm2nDMlOTMc7HNUz3sMvORet4s/7FWs1bCGgn0xf1Qaan
   deW9pZrz0CCz0b4mCHl8kYor5QKcOPH0Mnea1L+TlgUPGadfFV8D8iDd6
   4sR192hqd3LpLMrYYS81sjBWsacleIwATaFiDVEsupTjaL4jB2+/xgZyB
   mDOm7W+9HApzVK487lna5EmOSkP9Be/jTJrwQkhrCqidC0yD78wofFvEQ
   QZAPWQUdstNy4E4+yD5aIuXAolXawc07vH/SlSf9h/yYIhlTEdI922fSv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457176641"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="457176641"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:01:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="681198357"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200";
   d="scan'208";a="681198357"
Received: from romanagn-mobl1.ger.corp.intel.com (HELO [10.252.49.59])
 ([10.252.49.59])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2023 04:01:45 -0700
Message-ID: <98188012-8e07-4bb1-be1c-04d6c0f5260a@linux.intel.com>
Date: Tue, 8 Aug 2023 14:03:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression fix not progressing towards mainline/stable
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Cc: sound-open-firmware@alsa-project.org, LKML
 <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Alsa-devel <alsa-devel@alsa-project.org>
References: <661fcece-a83c-cb24-1b37-5d8693b1fb94@leemhuis.info>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <661fcece-a83c-cb24-1b37-5d8693b1fb94@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z4AAUV6MSKZVQP5KVRQ7SJOF5QTFGIJP
X-Message-ID-Hash: Z4AAUV6MSKZVQP5KVRQ7SJOF5QTFGIJP
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z4AAUV6MSKZVQP5KVRQ7SJOF5QTFGIJP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Thorsten,

On 08/08/2023 09:10, Thorsten Leemhuis wrote:
> Hi everyone, I noticed a regression fix that afaics lingers in the
> thesofproject's git repo instead of progressing towards the stable trees
> and wondered what's up here.
>
> I'm talking about about the fix "ASoC: SOF: intel: hda: Clean up link
> DMA for IPC3 during stop" for this ticket:
> https://github.com/thesofproject/linux/issues/4455
> 
> Two more tickets about it:
> https://github.com/thesofproject/linux/issues/4482
> https://bugzilla.kernel.org/show_bug.cgi?id=217673
> 
> It seems the fix is ready and reviewed for two weeks now, but not even
> in -next by now. That's not how it should be for regression fixes, as
> per https://docs.kernel.org/process/handling-regressions.html it ideally
> should be in -stable soon or already. Is this a mistake, am I missing
> something, or is there a good reason for this?

We take regressions (and user reports) seriously and trying our best to
provide fixes asap.
We do prioritize bug fixes over features but in this case for some
reason the review process took longer than it usually does and the patch
has not been sent upstream. Patches must pass the review before they put
to the upstream queue.

I will be sending the fix in few minutes after testing it on top of next.

-- 
Péter
