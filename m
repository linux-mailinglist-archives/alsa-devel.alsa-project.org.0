Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD8B3CD90A
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Jul 2021 17:07:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD67A1658;
	Mon, 19 Jul 2021 17:06:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD67A1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626707233;
	bh=6vcdk/Bz1jGUuVq3AH91l1woIHQKqPY6rFGYXxSuESU=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RW1IG0avT/0UDSzD1DH2fuyCAXu0hWgnHwSPh5qz7rFcFcBDZ5Wi2HdjmjHZ5edUO
	 EYAOxmG3v31eArboavCSPCOoNiX5mLETR+EQ4PuSLeU4pubXbgEbbRtR9MGVLlGp07
	 Db1hzsgZStVU+u1GKy4S7dXMy6WJ615vRNe128XY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D7A1F80256;
	Mon, 19 Jul 2021 17:05:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 645A9F800C5; Mon, 19 Jul 2021 17:05:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D637F800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Jul 2021 17:05:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D637F800C5
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="209168823"
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="209168823"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 08:05:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,252,1620716400"; d="scan'208";a="414880534"
Received: from jamespsa-mobl.amr.corp.intel.com (HELO [10.212.3.17])
 ([10.212.3.17])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 08:05:37 -0700
Subject: Re: 5.14 regression, Intel SST (BYT) audio no longer works
To: Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <6ebbcf0f-3a4b-0b28-1f17-8e1108f040c0@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f5dbc1c8-0118-17f7-1f6c-4dc8366b8dd0@linux.intel.com>
Date: Mon, 19 Jul 2021 10:05:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6ebbcf0f-3a4b-0b28-1f17-8e1108f040c0@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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



On 7/17/21 3:59 PM, Hans de Goede wrote:
> Hi All,
> 
> I just noticed and I won't have time to dig any deeper for approx. the
> coming 10 days. Still I wanted to report this in case anyone has any
> ideas. Or maybe you can reproduce and look for a fix ?
> 
> After building + installing 5.14-rc1 on a HP Elitepad 1000 G2
> (Bay Trail) with a RT5642 codec, I noticed that sound over the
> speakers and over the docks line-out jack no longer works.
> 
> Downgrading to 5.13 (without any other changes) fixes this, so this
> seems to be a regression with 5.14.
> 
> I've no been able to make time to test this on other BYT/CHT hardware,
> but I suspect that other models will be affected too.

Thanks Hans for the report, will look into this. 
I can't think of anything that might explain this regression.
I need to update the series to remove device properties so if the baseline is broken I'll see it as well...

