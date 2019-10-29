Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 023EAE852D
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 11:13:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AB342208;
	Tue, 29 Oct 2019 11:12:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AB342208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572344012;
	bh=FOHEu1x9bSS7PWVs/e/bFu/GByp0+IU/qhB/60KVFuc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=btSJAohy3daJCBwBS3hFwvEZHk6FmYXGPd3ZMc397SXJOSR/nHyxYZg6ZoaCMaahH
	 UNwnZJzWsTnNrnwEWjTqrZWife8QFFzNyDcPSHNnzZdPfdUq5qUK4V2wpwFS5kbW9U
	 zQvIB+xZ766MgWssHBp0jqK5a9+Ec9pwxR/JGKaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C0FCF80392;
	Tue, 29 Oct 2019 11:11:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4866DF80392; Tue, 29 Oct 2019 11:11:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D136F80269
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 11:11:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D136F80269
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 03:11:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,243,1569308400"; d="scan'208";a="205426647"
Received: from apboie-mobl2.amr.corp.intel.com (HELO [10.252.8.198])
 ([10.252.8.198])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2019 03:11:39 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
 <20191025224122.7718-9-pierre-louis.bossart@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <75fa1574-c5c4-595c-182c-fd6e509be348@intel.com>
Date: Tue, 29 Oct 2019 11:11:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025224122.7718-9-pierre-louis.bossart@linux.intel.com>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Keyon Jie <yang.jie@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 08/26] ASoC: SOF: token: add tokens for PCM
 compatible with D0i3 substate
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019-10-26 00:41, Pierre-Louis Bossart wrote:
> From: Keyon Jie <yang.jie@linux.intel.com>
> 
> Add stream token SOF_TKN_STREAM_PLAYBACK_COMPATIBLE_D0I3 and
> SOF_TKN_STREAM_CAPTURE_COMPATIBLE_D0I3 to denote if the stream can be
> opened at low power d0i3 status or not.
> 
> Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

By any chance, can stream be playback D0ix incompatible but capture D0ix 
compatible? Single token would suffice, no?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
