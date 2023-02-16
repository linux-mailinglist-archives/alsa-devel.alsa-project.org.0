Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0401699A42
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 17:40:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D775F04;
	Thu, 16 Feb 2023 17:39:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D775F04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676565617;
	bh=bOd7dvQNd6sVzPj8IyuShV6brUPSukSWIkp4BnGO/7Q=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PRo/mgfpLNeueflpvkeP5Q8JrmIqFpdHDHEHDs8EJA1WjLAEuBpxIr/Wpf8G6hVqv
	 LaBTsQ+jSO4ueb2bJ1i7Go5syLRwAbiD42n5ZQ7YaVnTHO+SrpVJMMYxBLmpruKNvW
	 IoH1IDpYqSQXMCjlGLNe2HmTbaxqcWdK6bqZqazA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E971AF800E4;
	Thu, 16 Feb 2023 17:39:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0F95F80171; Thu, 16 Feb 2023 17:39:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1764EF800B6
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 17:39:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1764EF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IKdBvYx8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676565559; x=1708101559;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bOd7dvQNd6sVzPj8IyuShV6brUPSukSWIkp4BnGO/7Q=;
  b=IKdBvYx83+ozY+Wyc1VjPbSu5/OBSlSdFegi9feCZf/IXSI0AV9OT2U/
   KZ5ikrpm7Qa5xc1Hp8/ijmlyjwnC7wJtMxSLHDnH24gnuZtLE9p1ybWpK
   GNMUIGwCcVQXnhuyBSytfWTDAGhAreu8ZNQjGaaMwW1HVgNYtTCT88xeN
   RNqSdhvi27Rcgwq/8NuPfUhpl7FLvbWIsJbTDIIEqh1Ui0oyTe3zqbUiJ
   yCbxdL+aodcfE6FLaollYBkFCCFiZc54xZ0/f5Qma4GCfYG16fI6b7KrI
   zZgNyYehnVOyRtXsYyrpmbmheiloHRrtnh+6IlASn9Y5hIPty/65AJVlG
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333952711"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000";
   d="scan'208";a="333952711"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 08:24:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="702612476"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000";
   d="scan'208";a="702612476"
Received: from sbadria-mobl.ger.corp.intel.com (HELO [10.252.18.21])
 ([10.252.18.21])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 08:24:39 -0800
Message-ID: <33fd3541-688d-74b0-cc9d-98bdb0c9e035@linux.intel.com>
Date: Thu, 16 Feb 2023 18:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.2
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-dai: fix possible stream_tag leak
To: Mark Brown <broonie@kernel.org>
References: <20230216144054.26203-1-peter.ujfalusi@linux.intel.com>
 <Y+5RjX3cB9gwnvVs@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <Y+5RjX3cB9gwnvVs@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X6NHXRYSCW7RCUCYYHW3ZMZNEAPJCB6U
X-Message-ID-Hash: X6NHXRYSCW7RCUCYYHW3ZMZNEAPJCB6U
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com,
 yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6NHXRYSCW7RCUCYYHW3ZMZNEAPJCB6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 16/02/2023 17:53, Mark Brown wrote:
> On Thu, Feb 16, 2023 at 04:40:54PM +0200, Peter Ujfalusi wrote:
> 
>> is there still time to send this for v6.2?
>> If not, then I will re-send it with stable 6.2 tag.
> 
> In general it's best to just include the relevant Fixes: if
> you're concerned about this...  it's rather late and Takashi was
> looking for early pull requests, I can apply and send but now I
> have to wait for you to tell me the commit it's fixing in case it
> doesn't get pulled in in time which just slows things down :/

OK, I sent v2 with a Complement tag to guide the patch to 6.2 and I will
try to track back the stable kernels and send a clean backport when this
is in mainline.

-- 
Péter
