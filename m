Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E650781075
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 18:37:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D11F6E87;
	Fri, 18 Aug 2023 18:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D11F6E87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692376642;
	bh=nU+PYoRb2aLoPBQUdYTgkTX6GiAk6mSXJt392VHyqBs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XUQfLaJpP6zaaqpr6UsN7gOWcJ+Ext8cthTlz9Zq+dMhqaDw/RUI4KTFrVS4dGYL2
	 3claJG43nGB0eu4PQZhhIY3jddS84rg535YvBFZQq6Zk4COTXHbovbJAjo+RenlzUa
	 iTzT5guvq7LBSNebH/z9QG+C9wGgzGh+CoyhEr+s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61C60F80254; Fri, 18 Aug 2023 18:36:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52969F8016D;
	Fri, 18 Aug 2023 18:36:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5336FF801EB; Fri, 18 Aug 2023 18:36:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11790F800D1
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 18:36:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11790F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nyRog28s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692376586; x=1723912586;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nU+PYoRb2aLoPBQUdYTgkTX6GiAk6mSXJt392VHyqBs=;
  b=nyRog28su2MUbE6PoFV1kbfaj0PHjqoNlDfS24fxhtnrCmRQh6EOEaLX
   MaI/RzMWYFIacs9HaFj2ZItNA1bj6t6sgBtF9KRlFRWn7XjEdK94wlYvP
   t2N65mV6RR59LrsA/lbs7O/d+LjML2At6Q/7cpWDR6iBWo0BG6Oi5fM3o
   Ocqfx064iAyYytbNhOcFEhp0+2Z+MN/Ew3SMKE407BbmE8LA2gSQyQpJL
   GZi2k1TiWFYUQF3OW7XN5hex5SGEUTItheodsVR84G0IMga27mV21c5KH
   yTFFpumt15xpUOXYbxqpU+ZWOnxWt3r2NOIqoS1gY5UOCRmJAn1KXzELc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="370599340"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="370599340"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 09:36:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="728649714"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="728649714"
Received: from enewberr-mobl.amr.corp.intel.com (HELO [10.212.37.100])
 ([10.212.37.100])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 09:36:17 -0700
Message-ID: <72960354-3f69-e2fa-e7b0-dc8b61ca4940@linux.intel.com>
Date: Fri, 18 Aug 2023 11:36:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/2] ALSA: hda/tas2781: Add tas2781 HDA driver
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Shenghao Ding <shenghao-ding@ti.com>
Cc: robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz, kevin-lu@ti.com,
 13916275206@139.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
 mengdong.lin@intel.com, baojun.xu@ti.com, thomas.gfeller@q-drop.com,
 peeyush@ti.com, navada@ti.com, broonie@kernel.org, gentuser@gmail.com
References: <20230818085836.1442-1-shenghao-ding@ti.com>
 <87pm3kk63a.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87pm3kk63a.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 72UNDK65WYODI6IEHHWWC6OFRAHDR56F
X-Message-ID-Hash: 72UNDK65WYODI6IEHHWWC6OFRAHDR56F
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72UNDK65WYODI6IEHHWWC6OFRAHDR56F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/18/23 05:17, Takashi Iwai wrote:
> On Fri, 18 Aug 2023 10:58:35 +0200,
> Shenghao Ding wrote:
>>
>> Integrate tas2781 configs for Lenovo Laptops. All of the tas2781s in the
>> laptop will be aggregated as one audio device. The code support realtek
>> as the primary codec. Rename "struct cs35l41_dev_name" to
>> "struct scodec_dev_name" for all other side codecs instead of the certain
>> one.
>>
>> Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>
> 
> Now I applied both patches to for-next branch.
> 
> The patch 2 needed some minor adjustment in Kconfig to be applied to
> the latest branch, but I resolved it locally.

There are a number of issues I just reported, I guess they will have to
be handled with a follow-up patch now?
