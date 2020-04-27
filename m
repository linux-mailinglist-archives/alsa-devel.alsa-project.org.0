Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 533B91BA225
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 13:16:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9BB41689;
	Mon, 27 Apr 2020 13:15:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9BB41689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587986210;
	bh=C+DSSJMEvfKvba8+hgGRm70EsIX/y1y3VOSJUEiv1Dc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=suDO2rJQKqO9GZ+SMGwF3G2t922Cl9EJ5KV0RLuXcxqAHdYutj6q3xhELBeJbMTVa
	 1JwvPMJ5R1FxGC7ao003HfXotlupfCDr6r52L6bzPhNp82Esi9IcvvO3pfdR5Wmryt
	 SlhXaVsS6SpbL7CrK1QAXYF8pVVQQkFlWs/H/HsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1585CF80232;
	Mon, 27 Apr 2020 13:15:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D06B6F8022B; Mon, 27 Apr 2020 13:14:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EFC4F8010A
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 13:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EFC4F8010A
IronPort-SDR: 4KV9gbClMolpHY5+1T6Czi7N295NDV2KMv7HViQdi6aRb9+t6rh5K772dVSGGTM48aBZ0Qef4S
 xCw0wnu0BGwA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 04:14:53 -0700
IronPort-SDR: /PtLdhwd9OuLG59TZ3F2ZR6UL+OduJVaHBWYbaorADvlnIaroXBTxdZ+oMu6nta7nYAIJruVyT
 muip1dYUf8Hw==
X-IronPort-AV: E=Sophos;i="5.73,323,1583222400"; d="scan'208";a="247384560"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.135.60.246])
 ([10.135.60.246])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2020 04:14:51 -0700
Subject: Re: [PATCH v4 0/3] Add support for different DMIC configurations
To: Mark Brown <broonie@kernel.org>
References: <20200424132002.3850-1-mateusz.gorski@linux.intel.com>
 <20200424145236.GG5850@sirena.org.uk>
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Message-ID: <24bdfe47-104b-e87a-db97-ce0dccdb0662@linux.intel.com>
Date: Mon, 27 Apr 2020 13:14:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200424145236.GG5850@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: pl
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com
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


>> Set of patches to enable DMIC capture on different hardware
>> configurations.
> Neither this posting nor the last posting seem to have managed to send
> me a copy of patch 2.


The only reason I can think of is the fact, that one of Signed-by tags 
in patch 2/3 had a comma in it and git send-patch added one additional, 
invalid CC recipient.

I have adjusted that Signed-by tag in patchset v5.


Mateusz

