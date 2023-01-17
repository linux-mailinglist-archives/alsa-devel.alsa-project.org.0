Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B866DFEB
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 15:06:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A86F68AD;
	Tue, 17 Jan 2023 15:05:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A86F68AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673964390;
	bh=I6gcqn4Nr677TusPygDhyhXwBxwNGtc093BbHhnt2jY=;
	h=Date:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e9x8UTBP6U14B9mWoleQ0S/MudNSu55n69/bsjubrBWCdXND/bVs9tfs/N35Cvlii
	 WTrIPUlVKLZ+vaBYmHwiSYMqTWdmZxWFc2P0V4UNbmyeMLMsvQ/BZHZoVOkURLxOdQ
	 t2vb4hWYiVRgIAxr2Kqjtg/BPxk/uWIklZJGhbns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE511F804DE;
	Tue, 17 Jan 2023 15:05:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1956EF8023A; Tue, 17 Jan 2023 15:05:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBE77F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 15:05:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBE77F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QQC4SbhX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673964328; x=1705500328;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=I6gcqn4Nr677TusPygDhyhXwBxwNGtc093BbHhnt2jY=;
 b=QQC4SbhXeh2NhtPXOEwx85EPCQs2TaFmiBbKJZHYvAkK3XMCOiOx+lua
 qLM1hEo658pshnEnog0wVoQYot6px9YWUX31iQd+/U6JwF779J+0dYwSn
 RftT9LE7XxnQ6Zc3uZXy9ZD86gaCHPVSaYgF75v2pPaNMzDnfEOY6UUyF
 zkw5rF8kB1OZ8iOg/2VhtY1jnRl7HxIWar/3WAX4dNeJBKxQzalOOvj5a
 DH5mYsSI0dsbG/wLw3/99dhB6VlENjGO/JMyuMgE9liCZzGUynTu6squL
 Fto/C20vwUJGpjXxTg/cUQwOcNzDrs5U/doRlhXCChztprgN86HaOoVWo Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="322388283"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="322388283"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 06:05:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="661302644"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="661302644"
Received: from izakharo-mobl1.ger.corp.intel.com (HELO [10.252.14.16])
 ([10.252.14.16])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 06:05:13 -0800
Message-ID: <597d5cee-f9fd-411f-c780-8413b6fd422d@linux.intel.com>
Date: Tue, 17 Jan 2023 16:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/3] ASoC: SOF: sof-audio: Fixes for widget prepare and
 unprepare
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
References: <20230116125506.27989-1-peter.ujfalusi@linux.intel.com>
 <Y8afrS+wfZujFRHS@sirena.org.uk>
 <675f42a7-1d26-10bd-5862-f758d8b41849@linux.intel.com>
In-Reply-To: <675f42a7-1d26-10bd-5862-f758d8b41849@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 17/01/2023 15:48, Péter Ujfalusi wrote:
> 
> 
> On 17/01/2023 15:16, Mark Brown wrote:
>> On Mon, Jan 16, 2023 at 02:55:03PM +0200, Peter Ujfalusi wrote:
>>
>>> Mark: can these be picked for 6.2?
>>
>> Well, patch 2 doesn't apply so not right now...
> 
> oh.
> Let me see what is missing.

It is the topology ops optionality stuff. It is in itself a trivial (for
my eyes) conflict, but it is a conflict never the less.

This is not going to backport cleanly to stable either.

What would be the preferred way to handle this (for next, for 6.2 and
for 6.1.x)?

>>
>> Applying: ASoC: SOF: sof-audio: Unprepare when swidget->use_count > 0
>> Using index info to reconstruct a base tree...
>> M	sound/soc/sof/sof-audio.c
>> Falling back to patching base and 3-way merge...
>> Auto-merging sound/soc/sof/sof-audio.c
>> Applying: ASoC: SOF: sof-audio: skip prepare/unprepare if swidget is NULL
>> Using index info to reconstruct a base tree...
>> M	sound/soc/sof/sof-audio.c
>> Falling back to patching base and 3-way merge...
>> Auto-merging sound/soc/sof/sof-audio.c
>> CONFLICT (content): Merge conflict in sound/soc/sof/sof-audio.c
>>
> 

-- 
Péter
