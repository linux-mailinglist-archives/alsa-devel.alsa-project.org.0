Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B889690E62
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 17:35:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E465E88;
	Thu,  9 Feb 2023 17:34:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E465E88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675960499;
	bh=UCrVKBB8il7rlSBFVYB2c+lqqWNUhI97u5OeRJ7I8Bo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tStZzkcJ3LQKmC5VVcCUMk2j03EUVnj/1lBTJJ/brS8QjplRQg6pL/atAPoCkTLzr
	 KVtadaGeZgUzHL/NLvT+P2RTf2RbrcPMlq7UtjoDXZh0ntytcZBM5Xllf844jak8Gl
	 lWF+aqk+fJWlbDR0xodqeBNaTgJc3qM2l+S0VRvo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59723F800B8;
	Thu,  9 Feb 2023 17:34:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49FABF800E4; Thu,  9 Feb 2023 17:34:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66066F80094
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 17:33:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66066F80094
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L3vVih6w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675960436; x=1707496436;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=UCrVKBB8il7rlSBFVYB2c+lqqWNUhI97u5OeRJ7I8Bo=;
  b=L3vVih6wK1QJtXAFlE77PJ98sSgg5Qvu2Jo762dGa5pjGMIdjrQpCC/d
   T/PhlojIwBA8VBhp01b1lMS2YOMxlu/e9ZA6e4SVfi/4TpEJvm9mmOunt
   2LiUf/sx0ksS++rEk/Jnl4grDeiQdwNDnCM7E91+G8LG9ZI1uen2TKwaJ
   xwnpMIU0HemDRjlplacrLKSvE4EOoFIqIL1bwZXQr8iCLQfkJyP44BPa0
   k75b1b8vlGYy/upRWOWOhL/1cjMadZmz1vnbJvb42l1BxxF8Uuof/5LDb
   tluvkV4s1tw1BR2OyGeZpEmuxCeKqG4GzPG6hx045Tk5jKeDvtuTfn5WY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309801416"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000";
   d="scan'208";a="309801416"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 08:33:52 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="756471334"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000";
   d="scan'208";a="756471334"
Received: from fpastor-mobl4.amr.corp.intel.com (HELO [10.212.74.130])
 ([10.212.74.130])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 08:33:51 -0800
Message-ID: <f956351e-de37-062b-c02e-5cbdf9a3bdfd@linux.intel.com>
Date: Thu, 9 Feb 2023 10:33:50 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 3/5] soundwire: qcom: wait for fifo to be empty before
 suspend
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
 <20230209131336.18252-4-srinivas.kandagatla@linaro.org>
 <dbec6aab-6456-72b3-39b6-3490dfdf083c@linux.intel.com>
 <a1d79008-3ec4-d7b5-12b5-ea5c6c5a8370@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <a1d79008-3ec4-d7b5-12b5-ea5c6c5a8370@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SK42J2GAMVRHX5DYJOVV74SDSLXI3EJM
X-Message-ID-Hash: SK42J2GAMVRHX5DYJOVV74SDSLXI3EJM
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SK42J2GAMVRHX5DYJOVV74SDSLXI3EJM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/9/23 09:52, Srinivas Kandagatla wrote:
> 
> 
> On 09/02/2023 15:23, Pierre-Louis Bossart wrote:
>>
>>
>> On 2/9/23 07:13, Srinivas Kandagatla wrote:
>>> Wait for Fifo to be empty before going to suspend or before bank
>>> switch happens. Just to make sure that all the reads/writes are done.
>>
>> For the suspend case that seems like a valid approach, but for bank
>> switch don't we already have a bus->msg_lock mutex that will prevent the
>> bank switch command from being sent before the other commands are
>> handled?
> 
> All read/writes are fifo based, so writes could be still pending.

I am not following. The bank switch happens with this function, where a
mutex is taken.

int sdw_transfer(struct sdw_bus *bus, struct sdw_msg *msg)
{
	int ret;

	mutex_lock(&bus->msg_lock);

	ret = sdw_transfer_unlocked(bus, msg);

	mutex_unlock(&bus->msg_lock);

	return ret;
}

The transfer_unlocked is synchronous and waits for the command response
to be available.

In other words, there's both a mutual exclusion and a synchronous
behavior, so not sure how commands *before* the bank switch could be
pending?
