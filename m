Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B37B21885F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 15:03:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E434A1675;
	Wed,  8 Jul 2020 15:02:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E434A1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594213380;
	bh=Pndj25BEWL6BHl172HdY9+l6a2Y8JcuM+11vNlQiqik=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ITkqjyCXIl6FGrLxFAtJ98g3ohXY36swbqy9iRE5eYmYbTfuKTPCX4qH6IOxkp0Bc
	 AghxXiLbpb0JislDFFFnDYmj6tuqkOjIj+8J/vxOtXC7uNFhwSKTgOPdBnaT5rxa19
	 6tbNVZi/UP/R4TuZT8jWa0AQDRF9TLp9g9aiejOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36BFFF80269;
	Wed,  8 Jul 2020 15:01:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2F17F80258; Wed,  8 Jul 2020 15:01:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68D86F80115
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 15:01:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68D86F80115
IronPort-SDR: p/6o69lY/qCWmjpilBVqYDmRSN2vzqguMTDAPd8A+7mKVbMpz4yEBJ5uWGN40ZDDQQmpOd0vLw
 g0pxgD8jHuVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="209318039"
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="209318039"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 06:01:25 -0700
IronPort-SDR: 5dCVdnOX8Fh0M3H2B9/5DQSTXuURvKoHm0inOdQD/WGakJT9By1Um3SYS4c78yWD64cqbWRxf/
 xyaZateMGdMw==
X-IronPort-AV: E=Sophos;i="5.75,327,1589266800"; d="scan'208";a="323871787"
Received: from sare-mobl.amr.corp.intel.com (HELO [10.251.7.246])
 ([10.251.7.246])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 06:01:25 -0700
Subject: Re: [PATCH v2 6/6] ASoC: Intel: sdw_max98373: add card_late_probe
 support
To: Mark Brown <broonie@kernel.org>
References: <20200707205740.114927-1-pierre-louis.bossart@linux.intel.com>
 <20200707205740.114927-7-pierre-louis.bossart@linux.intel.com>
 <20200708114805.GJ4655@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3dca9635-4ec1-d4ca-8d09-d033dd951a90@linux.intel.com>
Date: Wed, 8 Jul 2020 08:01:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200708114805.GJ4655@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 randerwang <rander.wang@linux.intel.com>
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



On 7/8/20 6:48 AM, Mark Brown wrote:
> On Tue, Jul 07, 2020 at 03:57:40PM -0500, Pierre-Louis Bossart wrote:
>> From: randerwang <rander.wang@linux.intel.com>
>>
>> Disable Left and Right Spk pin after boot so that sof can
>> get suspended. Please check patch: ASoC: Intel: Boards:
>> tgl_max98373: add dai_trigger function
> 
> A commit ID would have been useful here.

yes, will add.
