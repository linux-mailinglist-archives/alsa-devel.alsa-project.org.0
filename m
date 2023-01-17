Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 560CC66DF4A
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 14:49:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63B61685E;
	Tue, 17 Jan 2023 14:48:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63B61685E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673963382;
	bh=gExAUaEmE3snzFAJWhbGTvHdtARz37dQ4KsCQVEEZNU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IHPOU71d7oM6hsyNmEeIfQ+BqBEZuFPSyawMUQfnbEiYODq7lMjYt8RYIB1WxktHe
	 aoM8gw3a13WqntRuY0G5cEqGAoeKWAz9DjIt9NIMEFx0ubFmCPjaOTVQa3GO3bYqVP
	 OxYrdTI4cZCAgtk3HklMgrxvHqaOvnqyrBIymXrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32027F8026D;
	Tue, 17 Jan 2023 14:48:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E39AF8047B; Tue, 17 Jan 2023 14:48:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05F3CF80083
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 14:48:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05F3CF80083
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VYwa7eoK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673963328; x=1705499328;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gExAUaEmE3snzFAJWhbGTvHdtARz37dQ4KsCQVEEZNU=;
 b=VYwa7eoKJOCt0+//gFrHEZYmMAZFMEYA6HJ1yr267V8DEBOufyiGSe31
 zGlmvOWZOPTc0NUCZxyPhvErEehJn7oYSQdo9gwiyOaZpAh+L89FDXfPV
 sYf0gAxhx1cMCJNqIxUjrO6oQBYHOzeTnF3aGjSmr577BohO04D6M/R9f
 e0FS8jPE9XdlSSdS6SZudXeID3QaB62MDiH9ykcoxSVlX3mzS87PAU1c7
 YgOups4uwdKPWNOnvn6OPHoZw0wiNgLQ05M6lcoF7z+S/oFvVWNRQYROE
 V3ZCmm3rn6/1V8PLooltJVYhZ78HoligDbV9KVD10/DW7dd/HWBHgid7r w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="325971536"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="325971536"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 05:48:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="833171245"
X-IronPort-AV: E=Sophos;i="5.97,224,1669104000"; d="scan'208";a="833171245"
Received: from izakharo-mobl1.ger.corp.intel.com (HELO [10.252.14.16])
 ([10.252.14.16])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2023 05:48:34 -0800
Message-ID: <675f42a7-1d26-10bd-5862-f758d8b41849@linux.intel.com>
Date: Tue, 17 Jan 2023 15:48:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/3] ASoC: SOF: sof-audio: Fixes for widget prepare and
 unprepare
To: Mark Brown <broonie@kernel.org>
References: <20230116125506.27989-1-peter.ujfalusi@linux.intel.com>
 <Y8afrS+wfZujFRHS@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <Y8afrS+wfZujFRHS@sirena.org.uk>
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
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 lgirdwood@gmail.com, rander.wang@intel.com, yung-chuan.liao@linux.intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 17/01/2023 15:16, Mark Brown wrote:
> On Mon, Jan 16, 2023 at 02:55:03PM +0200, Peter Ujfalusi wrote:
> 
>> Mark: can these be picked for 6.2?
> 
> Well, patch 2 doesn't apply so not right now...

oh.
Let me see what is missing.

> 
> Applying: ASoC: SOF: sof-audio: Unprepare when swidget->use_count > 0
> Using index info to reconstruct a base tree...
> M	sound/soc/sof/sof-audio.c
> Falling back to patching base and 3-way merge...
> Auto-merging sound/soc/sof/sof-audio.c
> Applying: ASoC: SOF: sof-audio: skip prepare/unprepare if swidget is NULL
> Using index info to reconstruct a base tree...
> M	sound/soc/sof/sof-audio.c
> Falling back to patching base and 3-way merge...
> Auto-merging sound/soc/sof/sof-audio.c
> CONFLICT (content): Merge conflict in sound/soc/sof/sof-audio.c
> 

-- 
Péter
