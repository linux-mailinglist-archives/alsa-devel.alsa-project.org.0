Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 678D56E81CA
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 21:24:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BBADEF1;
	Wed, 19 Apr 2023 21:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BBADEF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681932269;
	bh=X6hMqwH1Z8d3l6IJ21kubFIUWU8jsQOBcpbF0eR5p7M=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qSU0fmpbRZuE2x+MSyjW7yGZiJ2wZNFjByaPEBqNzzvCqKDd5S35E1QKkjaX2r6Y1
	 lX+45A7CxBGIEZ7wyQb7zQNTmBev5nD4EO3BpKV4pkOadZmf+wef/l5spE7kDmvDo7
	 iGmeA8tfR5skUedxhqBxYRMFi+HsexQMq1QQiaPE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8811AF80149;
	Wed, 19 Apr 2023 21:23:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65C7AF80155; Wed, 19 Apr 2023 21:23:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16EDBF800D0
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 21:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16EDBF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lmE4zdrg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681932213; x=1713468213;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=X6hMqwH1Z8d3l6IJ21kubFIUWU8jsQOBcpbF0eR5p7M=;
  b=lmE4zdrgw30BGtTVL5oTj6elssrWBfLpmT57pchAjZ414vCkAmijULnL
   LKaZ2akPoadtX6tyXIyWkehQcqPqyxhIuMVPFmFkNBmUpah0AUOFYEj5E
   amj2osm5m/XpiBpM2Pmx4X02CvFSBNIcHAbpwBixSemCHw1Ypx4Tk97Ym
   IA/LwXDceHawOS5stOINjWccjvLeCSsf2+qZfw+bc/omXn/vWODm7rz1k
   JU2NmNjh+wXIkglX6I7BNG8TIBikBaSSKpIHnvjyatUblmLiYYpc7Ng8N
   n24h9ugfKPSc4DksVQ33ypr2ZMG+pKRvHDXTQAL9Yz41VvX1qjpx1K4QE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="344290929"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="344290929"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:23:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021329420"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="1021329420"
Received: from gargicha-mobl1.amr.corp.intel.com (HELO [10.209.74.38])
 ([10.209.74.38])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:23:27 -0700
Message-ID: <9bb98362-8654-292a-06ed-ec6d1bccf5c7@linux.intel.com>
Date: Wed, 19 Apr 2023 14:23:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH] ALSA: hda: patch_realtek: add quirk for Asus N7601ZM
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20230406152725.15191-1-pierre-louis.bossart@linux.intel.com>
 <87355dt40f.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87355dt40f.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6Q67J6L5HQ4XPIXVY4QNBSS4ZLZ3XDMZ
X-Message-ID-Hash: 6Q67J6L5HQ4XPIXVY4QNBSS4ZLZ3XDMZ
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, broonie@kernel.org,
 Erik Brakkee <erik@brakkee.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6Q67J6L5HQ4XPIXVY4QNBSS4ZLZ3XDMZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

On 4/6/23 10:38, Takashi Iwai wrote:
> On Thu, 06 Apr 2023 17:27:25 +0200,
> Pierre-Louis Bossart wrote:
>>
>> Add pins and verbs needed to enable speakers and jack.
>>
>> The pins and verbs configurations were identified by snooping the
>> Windows driver commands, with a nice write-up here:
>> https://brakkee.org/site/2023/02/07/fixing-sound-on-the-asus-n7601zm/
>>
>> Reported-by: Erik Brakkee <erik@brakkee.org>
>> Tested-by: Erik Brakkee <erik@brakkee.org>
>> Link: https://github.com/thesofproject/linux/issues/4176
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> 
> Applied now with a minor correction of the entry (to be sorted in SSID
> order).

Apologies if I am missing something but I don't see this patch being
applied on the for-next/ branch?

Thanks,
-Pierre
