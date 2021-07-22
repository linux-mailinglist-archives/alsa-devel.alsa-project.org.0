Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1E73D25B1
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jul 2021 16:27:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0B5A16D4;
	Thu, 22 Jul 2021 16:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0B5A16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626964043;
	bh=XmYplOie5HEy9/vSSQ/PUghbNFLBm2pTslYOOdFDp2g=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RA41w/3I/THEmlUM4Ei9cAw4vB2kwwgZ4e02SPbh4Fn24R1B3/N69PxmFZdzeXnsf
	 lyy4VqP4SEB630RxX/N4zPLESL6Pt460eqLQRiDzGasN1T6ki0SXbs71xXY19bDX4n
	 KIkisYuqJwqglUZOKL+2g3YjpR04dUOgbnUnAVZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 385D7F80423;
	Thu, 22 Jul 2021 16:26:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F5E1F80423; Thu, 22 Jul 2021 16:26:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66ECFF80114
 for <alsa-devel@alsa-project.org>; Thu, 22 Jul 2021 16:25:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66ECFF80114
X-IronPort-AV: E=McAfee;i="6200,9189,10053"; a="198925439"
X-IronPort-AV: E=Sophos;i="5.84,261,1620716400"; d="scan'208";a="198925439"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 07:25:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,261,1620716400"; d="scan'208";a="577312905"
Received: from kkho1-mobl1.amr.corp.intel.com (HELO [10.212.20.95])
 ([10.212.20.95])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2021 07:25:54 -0700
Subject: Re: [PATCH 1/2] soundwire: dmi-quirks: add quirk for Intel 'Bishop
 County' NUC M15
To: Vinod Koul <vkoul@kernel.org>
References: <20210719233248.557923-1-pierre-louis.bossart@linux.intel.com>
 <20210719233248.557923-2-pierre-louis.bossart@linux.intel.com>
 <YPl6Z+jqR9gnTw05@matsya>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <c86efd0f-b941-f3ff-885d-f1d0d7d46d30@linux.intel.com>
Date: Thu, 22 Jul 2021 09:25:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPl6Z+jqR9gnTw05@matsya>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org, Rander Wang <rander.wang@intel.com>,
 broonie@kernel.org, Bard liao <yung-chuan.liao@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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



On 7/22/21 9:02 AM, Vinod Koul wrote:
> On 19-07-21, 18:32, Pierre-Louis Bossart wrote:
>> The same quirk is used for LAPBC510 and LAPBC710 skews who use the
>> same audio design.
>>
>> These devices have the same BIOS issues inherited from the Intel
>> reference, add the same _ADR remap previously used on HP devices.
> 
> This fails to apply on rc1, pls rebase or if there are any dependencies,
> do spell them out

it likely depends on

[PATCH] soundwire: dmi-quirks: add ull suffix for SoundWire _ADR values

which was sent by Bard when the merge window opened.
