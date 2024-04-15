Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D79B8A5C4B
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Apr 2024 22:38:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34E6FE72;
	Mon, 15 Apr 2024 22:38:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34E6FE72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713213516;
	bh=mj/d6XfCmBlkmXBivha0wtrqltaACCYW4d8XdaEw0gQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j28KxxJRkCa2ilVPKaKAd4ozC7jnuN8o90XM/2dd/9Q+8cfCsMrYI2Lkm0o9bdSqb
	 n3NG5hCAiD2Omz2D9usE4a4PNXwdLgQ9QWb/vkaSiu8DyPSNKhtDIjdK55hGN4NaIM
	 W+r5/g10SCmIkAvCPFAnnCZBBC/WzVirdokPPWlk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 530E9F80496; Mon, 15 Apr 2024 22:38:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAC5DF805A8;
	Mon, 15 Apr 2024 22:38:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AEDFF8025A; Mon, 15 Apr 2024 22:37:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 898A8F80124
	for <alsa-devel@alsa-project.org>; Mon, 15 Apr 2024 22:37:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 898A8F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EwMhPprz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713213473; x=1744749473;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mj/d6XfCmBlkmXBivha0wtrqltaACCYW4d8XdaEw0gQ=;
  b=EwMhPprzZHdkmA050k73oWCyg1v7xjE/XVQDN8G4sMK/lTxp2jjg4Hrc
   bNQpveV2S1hoCrLGFMdj4CRIEXzvGeCC5czapm+C3lHG20nY5BCBkng09
   R74iH6eHEh3OC7WKNwXWZAkjUu/ul+2Wm/5iNUX9EtAaSv5EDPXpcGj1E
   fHuqtjTukDF++Pbcd/wINT0AKxYX4B904oOi0LxFpD1RxNOzpl2/WkCfB
   GEGWsHaHV4H65UeLtSWRNn5AM8T4+ySZUYizOfI2I3Whec6QFxlAKBXTw
   VNGS7c8sDX4e291Q28FXELpo5jBi/M5g1DSvQ45RcWknFf2k5vq35S9mm
   w==;
X-CSE-ConnectionGUID: zGMwot1xTrCMFfY9bx5+Ig==
X-CSE-MsgGUID: i0C+eec4QG2DZXdTGYQiuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8495498"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000";
   d="scan'208";a="8495498"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 13:37:48 -0700
X-CSE-ConnectionGUID: /P9wVcfASMS33HE6R8oVWw==
X-CSE-MsgGUID: NpUmND22S/KLi6fXPyzEww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000";
   d="scan'208";a="22085694"
Received: from sadhupha-mobl.amr.corp.intel.com (HELO [10.212.11.252])
 ([10.212.11.252])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 13:37:47 -0700
Message-ID: <aa0494cc-ab5d-493d-a57a-889a376f4fbc@linux.intel.com>
Date: Mon, 15 Apr 2024 15:37:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: rt715: add vendor clear control register
To: Jack Yu <jack.yu@realtek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "pierre-louis.bossart@intel.com" <pierre-louis.bossart@intel.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 "Flove(HsinFu)" <flove@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqYXQ==?= <shumingf@realtek.com>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
References: <6a103ce9134d49d8b3941172c87a7bd4@realtek.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <6a103ce9134d49d8b3941172c87a7bd4@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: V4NEISGDTWAWYXQGWPJ2MILWF4P2APF7
X-Message-ID-Hash: V4NEISGDTWAWYXQGWPJ2MILWF4P2APF7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V4NEISGDTWAWYXQGWPJ2MILWF4P2APF7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/15/24 01:27, Jack Yu wrote:
> Add vendor clear control register in readable register's
> callback function. This prevents an access failure reported
> in Intel CI tests.
> 
> Signed-off-by: Jack Yu <jack.yu@realtek.com>

Closes: https://github.com/thesofproject/linux/issues/4860
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
