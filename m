Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 796A94CA9B6
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 16:55:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F21771F8E;
	Wed,  2 Mar 2022 16:55:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F21771F8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646236554;
	bh=J3QyWZ8upUtHgBDWTTYjjpCx2tok8/ohC3W1niBYtI0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JSi7RfNTcmz6rol2eYTShrfUfzFiL7ZxWIuvGMyJ+1CmSHWAdTLH5D2CLygM0iMkT
	 j+kINXLY8R26dkXp8bvj1n7gbGBsNijy3rjcmzWjc2g4O6rwR7CcS8b9iZwCB6FQ6w
	 Kb6tSR+NHXD0HV/pjGlfBF+XUajxvUjAengJmWmg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F9F0F80154;
	Wed,  2 Mar 2022 16:54:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52170F80167; Wed,  2 Mar 2022 16:54:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54EF3F80167
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 16:54:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54EF3F80167
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DpfIsQCg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646236452; x=1677772452;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=J3QyWZ8upUtHgBDWTTYjjpCx2tok8/ohC3W1niBYtI0=;
 b=DpfIsQCg0A0axv0VlzZLJEGGG+It1Ls0tWZEOoy0X5z4ZavIvDd+qz6w
 Ggts9r4iog+Dx3onNPnPe8uc4I7SszEFQkil9c+hi25M5WHYSzUp16eXL
 cCdikCCIsc9DAKpXvgrJA3Davd1yWkESCdZ20eClEjaqQ4hfXCo1/+qjc
 9hxq4WrjUqddMlmFs0PtZxCvVAx24P/LxFg8xupz3zZpbqu9frEtYaHbL
 pQszqwxbQAJgejXoWNzvjsDHzUSoyZTxNskXc8ndQ2ImGKDOzA0vQ3Gjx
 niU+hOzWlOYSZEZ4Fu29hbZ38dv5K0dw7VQKD9HIUGoglFMuwfXNfdt6Q g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="234049412"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="234049412"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 07:54:06 -0800
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="535435329"
Received: from tpthomas-mobl2.amr.corp.intel.com (HELO [10.212.252.17])
 ([10.212.252.17])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 07:54:05 -0800
Subject: Re: [PATCH 7/8] ASoC: Intel: sof_ssp_amp: rename driver and support
 cs35l41 amplifier
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, alsa-devel@alsa-project.org
References: <20220301194903.60859-1-pierre-louis.bossart@linux.intel.com>
 <20220301194903.60859-8-pierre-louis.bossart@linux.intel.com>
 <e597f364-96b6-08b1-3c88-436693c65b04@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <33d27810-a023-f2f7-5218-e406fc7c13e5@linux.intel.com>
Date: Wed, 2 Mar 2022 09:50:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <e597f364-96b6-08b1-3c88-436693c65b04@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 3/2/22 8:56 AM, Amadeusz Sławiński wrote:
> On 3/1/2022 8:49 PM, Pierre-Louis Bossart wrote:
>> From: Brent Lu <brent.lu@intel.com>
>>
>> Add support of CS35L41 amplifier to the machine driver, as well as
>> the support of HDMI playback and BT offload DAI Link.
>>
>> Rename the driver to a generic name to support different amplifiers
>> from different vendors.
>>
>> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> Signed-off-by: Brent Lu <brent.lu@intel.com>
>> Signed-off-by: Pierre-Louis Bossart 
>> <pierre-louis.bossart@linux.intel.com>
>> ---
> 
> Eh... rename should happen in separate patch, as there seems to be some 
> changes done to the file and it is quite hard to review it, when whole 
> file is in diff due to being moved.

that was a conscious decision on my side to keep the patches as is, 
first add the initial contribution for the rt1308 amp from our embedded 
Linux team, and show how it was extended to support another amplifier 
for Chrome.

Indeed it leads to a bit of a tick-tock patch with the rename but it's 
not that bad, is it? The alternative would lead to a much bigger patch 
if I squash the whole thing.
