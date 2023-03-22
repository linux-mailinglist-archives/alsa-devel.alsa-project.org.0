Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E671B6C436B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 07:42:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D352F829;
	Wed, 22 Mar 2023 07:41:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D352F829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679467349;
	bh=aEorBz5DAEsqWv7UypA60gCqwdVRXbToFGJhJfuZjkg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uFH/4Jx4QC6gtBAjQ2cKJAJRWyQ3iyd4jASr8c/Xo1zbY+91QAZ7O8UHRiZxK2Mc1
	 VSHe2NqDtFbhiFR9NMvuRZ2/xpcls1IDSF2tDus6l3tkUJeWH/5bx6Zo7pHzC+bVKU
	 0zNibZEITeWAcFTkx3V3CsOvPBl1TMqowqAjIy5o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 85D2CF80254;
	Wed, 22 Mar 2023 07:41:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A597DF80093; Wed, 22 Mar 2023 07:38:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D139EF80093
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 07:36:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D139EF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iHS1hBOs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679466986; x=1711002986;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=aEorBz5DAEsqWv7UypA60gCqwdVRXbToFGJhJfuZjkg=;
  b=iHS1hBOsZ2uzxpA+1prLFYcABAakaTOAt6CT+eyahxCztYfQ/Kz61RXJ
   OCE8S55AX8slXtdeOel6X0egvCzrwgV/rYYq+Y5ewZRvYxwRZOltVAvz9
   Z8UK90SXQzGLSyH3MI0bdkLeXTauSEL7LUMJzUEmBvKqWXfhWMpAgqqDF
   Dhx/F644YoSn4bFssCk63WaCsttUUM15I+tgcqDZC813KrdX+IVOIzGJ1
   sqa0LmQzwhFBiwv+v4lJcnTajCl+ao2MQDfxEuzikf5FyAdgfRLMvnc13
   RtidZTgWZSW8lg8UkZz2yGxRLJVYrmfxmA/I/nWU7vbzfVAvI9a0a5zPI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339179814"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="339179814"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 23:36:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="770939251"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400";
   d="scan'208";a="770939251"
Received: from gjantea-mobl.ger.corp.intel.com (HELO [10.251.222.2])
 ([10.251.222.2])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2023 23:36:18 -0700
Message-ID: <e85214c6-9dd6-73f7-6c61-eaefa86fc405@linux.intel.com>
Date: Wed, 22 Mar 2023 08:36:48 +0200
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
Message-ID-Hash: F2YJPRXLRX4R3HISBN7ACUIIXWEO42GO
X-Message-ID-Hash: F2YJPRXLRX4R3HISBN7ACUIIXWEO42GO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F2YJPRXLRX4R3HISBN7ACUIIXWEO42GO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Dan,

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

It bugged me a great deal how could I have missed this initially as I
was testing the firmware side and user space, I had not one failure with
this until all the pieces found there places...

The reason is simple: we have one control per swidget and in the error
print:
dev_err(sdev->dev, "kcontrol %d set up failed for widget %s\n",
	scontrol->comp_id, swidget->widget->name);

only the widget's name gave usable information for a human. If we would
have taken the comp_id from swidget->comp_id then this would not have
been discovered.

scontrol was not invalid (but ignored), swidget name was correct, one
control per swidget, all looked about right for the eye ;)

Again, thanks for the report!

-- 
Péter
