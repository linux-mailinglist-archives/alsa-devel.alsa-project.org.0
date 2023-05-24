Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE5670FBB5
	for <lists+alsa-devel@lfdr.de>; Wed, 24 May 2023 18:30:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00EA5825;
	Wed, 24 May 2023 18:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00EA5825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684945837;
	bh=Wxs1efodNwmO3noHNtr7WWYtJ8HcJA1UDpCYCdf4Nss=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d03CX8HAm7E+qXt+vZ5Z5oK9jMcuVVi9Sfpa3tNJK+hMoNW9DKW0eHTHbXa3ApU4x
	 UpOQO1dGHn0IrJpOXeLCbLa90tP4v4dzHdZCITVaY0ZkuK+yP7WdY/FphqKvqk70Cn
	 udfNuHBscA1EJcltHbAyBudUqJqDqEQyCMvojdPc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1CB1F805E4; Wed, 24 May 2023 18:21:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D085F805E4;
	Wed, 24 May 2023 18:21:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53976F805E8; Wed, 24 May 2023 18:21:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 94E68F805E5
	for <alsa-devel@alsa-project.org>; Wed, 24 May 2023 18:21:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94E68F805E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=eF/3Z0kU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684945308; x=1716481308;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Wxs1efodNwmO3noHNtr7WWYtJ8HcJA1UDpCYCdf4Nss=;
  b=eF/3Z0kUWbfKJVz0oNLAeB5tT/Oj03TspIPOwCEgHg0cvxvhQrDhPwyh
   uDJ699I1e8QaYMEGRjgv3QJzuzgXBDNXK0RKSHt0bLwEsE769inDeSsHl
   dOpQSZ5+XdfoxjCBBdP195fqRmsCOFuo7I3bnFAYM+Yw/BkeeXDWlZl7x
   2LRAoT9No+RA/dpyTTGyyfM0itK/V1WReO79AprfaJNUsZuajbk4Z37BI
   9mY4BLfc04TmMrxfKkO1WujpkNlQVY7it7bpV2vu1yFNcOHtQyOlQ88Xo
   7nIDhTK86vMkg32pCU0pAP89jqtbwV9lUPXdjCANaophjuaCUpD0bX8R9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="352464787"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400";
   d="scan'208";a="352464787"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 09:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="681956950"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400";
   d="scan'208";a="681956950"
Received: from ychen94-mobl1.amr.corp.intel.com (HELO [10.212.132.213])
 ([10.212.132.213])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 09:19:27 -0700
Message-ID: <734986f7-18be-7392-17ec-cf64bf0f7b34@linux.intel.com>
Date: Wed, 24 May 2023 11:19:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: cs35l45: Relicense to GPL only
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org,
 u.kleine-koenig@pengutronix.de
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com
References: <20230510092534.3919120-1-ckeepax@opensource.cirrus.com>
 <20230524090556.GC68926@ediswmail.ad.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230524090556.GC68926@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 72BD5FOJ6LO3FODNMZH75VRRKTIC4575
X-Message-ID-Hash: 72BD5FOJ6LO3FODNMZH75VRRKTIC4575
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/72BD5FOJ6LO3FODNMZH75VRRKTIC4575/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/24/23 04:05, Charles Keepax wrote:
> On Wed, May 10, 2023 at 10:25:34AM +0100, Charles Keepax wrote:
>> Cirrus never intended to upstream dual licensed code, convert to
>> GPL only.
>>
>> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
>> ---
>>
>> Apologies for this but this was never our intention and I believe that
>> it can be a little legally involved maintaining dual licensed kernel code.
>> Fortunately not that many people outside of Cirrus have contributed to
>> the files in question. I have CCed everyone who has contributed both
>> internally and externally.
> 
> Pierre, Uwe,
> 
> Apologies for chasing but it would be really helpful to get an
> ack for this one, we need the approval of everyone who
> contributed to fix the licensing issue.

Sorry, I missed that you were asking me...

My only contribution is a two-character change in a header file to make
cppcheck happy.

-int cs35l45_apply_patch(struct cs35l45_private *cs43l45);
+int cs35l45_apply_patch(struct cs35l45_private *cs35l45);

I double-checked with Intel legal to be sure, and there's no issue with
removing the BSD3 license.


Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>



