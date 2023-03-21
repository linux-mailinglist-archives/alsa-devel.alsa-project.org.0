Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D21D6C34BB
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Mar 2023 15:49:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EF2E1F6;
	Tue, 21 Mar 2023 15:48:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EF2E1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679410188;
	bh=MB6fzYURTHaH5g6pcIFMM3t85mWSk8lN+wI2OsQsnyY=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TL38IC0UXodVLhb7hhgNquTafcrl/fg06cNq4jcVDsCqknt1DRM5ebisvP+EeEpXt
	 clyZskd2NJpWJcIF1dZPFdQTvhAGhEw7jlgKq62PoJ4w8IZYJeZ+g2Kq2henROVERD
	 m5d5uUKbgWqIcUfziyk1TG9UsxUu7o38ZHlEbOaE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0A0CF80254;
	Tue, 21 Mar 2023 15:48:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC75AF8027B; Tue, 21 Mar 2023 15:48:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 204EDF80105
	for <alsa-devel@alsa-project.org>; Tue, 21 Mar 2023 15:48:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 204EDF80105
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ShzWhrl8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679410133; x=1710946133;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=MB6fzYURTHaH5g6pcIFMM3t85mWSk8lN+wI2OsQsnyY=;
  b=ShzWhrl8zRLoBEMoXMSw6pODU8X2G0xNLe6yF97OcJzhRFfzp11lB3oQ
   Gw1L1Ja5vxFbUUojUuxgGTyRatUyKG5jiBS0M5aoYP91p2/bG9dHSdr34
   JeNriTU74uVjrQ5YNzKZGiJZC4QKV18cAjVhmB9oxhV9iN/4X0xp9Sz8W
   TsiFf/qkqEmQIxk440JfZiaYQHFkE48w6pEFfIbxbUU5TN8aNHBUVnf+i
   myVDAmhk97GcsB1ouHamH8DmBtFcXdq179nBYJUCSorI/oh8TZ3MYhTnS
   ppaAqTOLt/eQHimkMO8Jb7JyiYnelsAHgLxl8vDbcxGIlsMU7jcYLHGdz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="340500903"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400";
   d="scan'208";a="340500903"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="658795396"
X-IronPort-AV: E=Sophos;i="5.98,279,1673942400";
   d="scan'208";a="658795396"
Received: from markusbu-mobl.ger.corp.intel.com (HELO [10.252.60.215])
 ([10.252.60.215])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 07:48:27 -0700
Message-ID: <5499b4c0-a1f2-8b5f-1136-699ddc46b57a@linux.intel.com>
Date: Tue, 21 Mar 2023 16:48:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: SOF: ipc4-control: Return on error in
 sof_ipc4_widget_kcontrol_setup()
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>
References: <20230321134919.25844-1-peter.ujfalusi@linux.intel.com>
 <c6e2f1d2-bdc0-4028-a9c3-5a077e52722d@kili.mountain>
 <692de037-f69f-be82-7f8c-a00e03952c53@linux.intel.com>
 <2b3f2d22-afcc-4552-b608-783801c7f2b1@kili.mountain>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <2b3f2d22-afcc-4552-b608-783801c7f2b1@kili.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3D2QPM5S7OHSW4FGXWXONBHIQ6YE2CYK
X-Message-ID-Hash: 3D2QPM5S7OHSW4FGXWXONBHIQ6YE2CYK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3D2QPM5S7OHSW4FGXWXONBHIQ6YE2CYK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 21/03/2023 16:46, Dan Carpenter wrote:
> On Tue, Mar 21, 2023 at 04:40:05PM +0200, Péter Ujfalusi wrote:
>>
>>
>> On 21/03/2023 16:16, Dan Carpenter wrote:
>>> On Tue, Mar 21, 2023 at 03:49:19PM +0200, Peter Ujfalusi wrote:
>>>> The patch adding the bytes control support moved the error check outside
>>>> of the list_for_each_entry() which will cause issues when we will have
>>>> support for multiple controls per widgets.
>>>
>>> Even now it causes an issue.  We're exiting the list_for_each_entry()
>>> without hitting a break statement so the scontrol points to somewhere
>>> in the middle of the sdev instead of to a valid scontrol entry.
>>>
>>> The scontrol->comp_id will be some garbage value.
>>
>> I'm not sure what you see
> 
> No, the patch is correct.  My issue is with the commit message because
> it says "will cause issues when we will have support for multiple
> controls per widgets."  The bug already causes issues now.

Right, I will reword and resend.

> 
> regards,
> dan carpenter
> 

-- 
Péter
