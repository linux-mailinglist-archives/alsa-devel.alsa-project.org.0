Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E19FF6C3494
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 15:43:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D749B1EF;
	Tue, 21 Mar 2023 15:42:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D749B1EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679409805;
	bh=4TiQm/W12TWJCqKlFbCRTMTZQV1QOXpWqZ9DvROXmXQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=frDavdVQIbxOwLvJR9Xa6xrIuIQi4utaDHKQPI0xVzcZPA+Fc8VixwPQHCX5dNUP7
	 EIuMgxGFfYf0MLyEHRZAHrC7vnrtixJZU4q4QSKwvXaPY4GfgUTanppFM2D5x54+jw
	 O3icSNgyeOg0EgWONK63JKcFskGbg6Z/8GKYbQBE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 447B4F80254;
	Tue, 21 Mar 2023 15:42:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9505EF8027B; Tue, 21 Mar 2023 15:42:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66A5CF80105
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 15:42:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66A5CF80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=a+lSp96o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679409745; x=1710945745;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4TiQm/W12TWJCqKlFbCRTMTZQV1QOXpWqZ9DvROXmXQ=;
  b=a+lSp96oJnltUYXkgvFn5Yxq+6mPgRa3UUKS6RQsE6Af4GO6nMf2vZxa
   fZYNkvNKN/wmQMu4ZbOr6pscRJSGWDa1FrLZXsoqR2kj1V0ym0KbCnLb0
   4eYPGs4CnWbskFfkIuMvOPVjqkEPibH1ItNWecpZAehn7UrgBKpMLr/j+
   YtHRHA9qYjdUMFDLkrD95cUqpKXwa2+gv84t3VZyiR3Yrp2EuUAgVjHAi
   YiKpppbOvIQ7iZ4gKn3RoEI8amiXWJmjlr8I3QGaCweTpyDtegD527SQ0
   wdC39z36xzaX6JuKszYrSKp+NV5McxI0CxeHUDYjdC4OvsY/XzpCxUVUo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="401522567"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400";
   d="scan'208";a="401522567"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:39:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="750582886"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400";
   d="scan'208";a="750582886"
Received: from markusbu-mobl.ger.corp.intel.com (HELO [10.252.60.215])
 ([10.252.60.215])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:39:36 -0700
Message-ID: <692de037-f69f-be82-7f8c-a00e03952c53@linux.intel.com>
Date: Tue, 21 Mar 2023 16:40:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: SOF: ipc4-control: Return on error in
 sof_ipc4_widget_kcontrol_setup()
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>
References: <20230321134919.25844-1-peter.ujfalusi@linux.intel.com>
 <c6e2f1d2-bdc0-4028-a9c3-5a077e52722d@kili.mountain>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <c6e2f1d2-bdc0-4028-a9c3-5a077e52722d@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RP5YOPIH2YVPBV4TJAUTWJTCSZXKMYDC
X-Message-ID-Hash: RP5YOPIH2YVPBV4TJAUTWJTCSZXKMYDC
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RP5YOPIH2YVPBV4TJAUTWJTCSZXKMYDC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 21/03/2023 16:16, Dan Carpenter wrote:
> On Tue, Mar 21, 2023 at 03:49:19PM +0200, Peter Ujfalusi wrote:
>> The patch adding the bytes control support moved the error check outside
>> of the list_for_each_entry() which will cause issues when we will have
>> support for multiple controls per widgets.
> 
> Even now it causes an issue.  We're exiting the list_for_each_entry()
> without hitting a break statement so the scontrol points to somewhere
> in the middle of the sdev instead of to a valid scontrol entry.
> 
> The scontrol->comp_id will be some garbage value.

I'm not sure what you see
ret = 0;
list_for_each_entry(scontrol, &sdev->kcontrol_list, list) {
	if (scontrol->comp_id == swidget->comp_id) {
		switch (scontrol->info_type) {
		...
		}

		if (ret < 0) {
			/* scontrol is still valid and not changed */
			dev_err();
			return ret;
		}
	}
}

I think this is correct, I could have the ret check one level up, but no
point  of doing it if scontrol->comp_id != swidget->comp_id

-- 
Péter
