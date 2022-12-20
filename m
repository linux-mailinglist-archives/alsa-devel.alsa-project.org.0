Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F016E651718
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Dec 2022 01:15:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BF6E2BAA;
	Tue, 20 Dec 2022 01:14:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BF6E2BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671495305;
	bh=wojxyOFKdm6L4uqIQmijotUyx2cRJa9wrRZqSNm14s4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hOgZ9wPpliSOnQJ4YboFzkW9YNCvRXqW8krQJKtA2gerbNBLb6TMKnUKuxoSNYVZV
	 tIuEbWBj699YWpae8B0mC8vjXDNXI+SW12umdY0NACzU/ZNVRJin3JrXjxJxHyUYW4
	 5wrXYR3PiilHApO34kKJRATPn9MbB5ajaciAv4ak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17D25F8026D;
	Tue, 20 Dec 2022 01:14:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C1ABF8025E; Tue, 20 Dec 2022 01:14:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A091CF8025E
 for <alsa-devel@alsa-project.org>; Tue, 20 Dec 2022 01:14:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A091CF8025E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Hb/5267N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671495244; x=1703031244;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=wojxyOFKdm6L4uqIQmijotUyx2cRJa9wrRZqSNm14s4=;
 b=Hb/5267NeAdrdTXeUI0B9Pq2PAYPpi7IQEi4Ln76JyRWopwpzwPdV7dF
 cm3lo/AUto+1kEHhNXNKBnCZIVukwiwhsRlHIrZAXHILh4leHrAxI9VZY
 UNb1RmNLZmAt7dEjIUvejPqJ01i9/y1rZ1GwMMiWmYQRKanEi40LKerXO
 Mf5b+WZ5LJdogvLaEv3GT+UGL9K88x865OoI/NhiN2Ep3MHkdG/liNiox
 zphhuxZRdLS4IoHWXLuQF2Qnh4ejzBVRjzvDpx+rzZDnJTWkT4pZ0ZE9Q
 AnAqG+Tutrrj+2p/00BQQZh8l/wDztsjqJ97rarWbHdxELDLWDfMZo2rq Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="321387661"
X-IronPort-AV: E=Sophos;i="5.96,257,1665471600"; d="scan'208";a="321387661"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 16:13:38 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10566"; a="683218900"
X-IronPort-AV: E=Sophos;i="5.96,257,1665471600"; d="scan'208";a="683218900"
Received: from jsmorale-mobl.amr.corp.intel.com (HELO [10.213.162.242])
 ([10.213.162.242])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2022 16:13:37 -0800
Message-ID: <06af4d22-1032-bc2e-b9da-ebfd966d144d@linux.intel.com>
Date: Mon, 19 Dec 2022 18:13:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: rt5650 on HP Chromebook G5 Setzer faults
To: Mark Hills <mark@xwax.org>, alsa-devel@alsa-project.org
References: <2212181230200.24243@stax.localdomain>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2212181230200.24243@stax.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 12/18/22 7:02 AM, Mark Hills wrote:
> HP Chromebook (11a, G5 "Setzer") uses snd_soc_sst_cht_bsw_rt5645 module
> and presents a device "rt5650".

can you share the result of 'aplay -l', wondering which platform driver 
you are using.
> Audio works briefly, until after about 30 seconds it's interrupted by a
> square wave or short buffer cycling.

If this is with the SOF driver, there's a known issue and a known 
workaround, please add this to /etc/modprobe.d/alsa-base.conf

options snd_sof sof_debug=1


