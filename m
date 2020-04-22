Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 092671B4411
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 14:13:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E57E16BD;
	Wed, 22 Apr 2020 14:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E57E16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587557596;
	bh=mvSxt/a2xuLRtom5b7ZG+xCyiljFzu5iT+ek2Q5vMPg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CsvB/RHdjj016AcqQ7m4xPs27L95Z5EfzynepEvz97br1snk4Df45GtE4L6GhaFvW
	 /JNFXokDOx+VRk9/sSYyiL0WYiNH0pKoSpjUM5tuJRao2W8VBf0Z18ilJtsmEzRq5k
	 hYjmGibnGDFtU1AHG2NwDHKqxCBS8KUcaYOnsL1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87A03F8020C;
	Wed, 22 Apr 2020 14:11:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D88F9F80142; Wed, 22 Apr 2020 14:11:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFB84F800FF
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 14:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFB84F800FF
IronPort-SDR: fazHepEyvJLfRDBr7A68uOcvai3vQl/TM267c7Lsg9vjK0GLTBfLL5mc9TQTRVN1GenyGW66Rr
 qsB5WoLd5Q3Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 05:11:27 -0700
IronPort-SDR: +LiaooBVuZi/Vf+89dWJVa2qpfJHALevLyA573kKCh+sKvfjmXY0JiH10MpgMWQTRUWR+kEZl/
 Ic/9608H0Vmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,414,1580803200"; d="scan'208";a="259049944"
Received: from lokoro-mobl.amr.corp.intel.com (HELO [10.251.147.75])
 ([10.251.147.75])
 by orsmga006.jf.intel.com with ESMTP; 22 Apr 2020 05:11:27 -0700
Subject: Re: [PATCH] ASoC: SOF: Fix build
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Karol Trzcinski <karolx.trzcinski@linux.intel.com>
References: <20200422112602.13109-1-broonie@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2c307fac-077e-6692-a57a-2c2084a4742f@linux.intel.com>
Date: Wed, 22 Apr 2020 07:11:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422112602.13109-1-broonie@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org
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



On 4/22/20 6:26 AM, Mark Brown wrote:
> The recent batch of SOF changes failed to build on some x86
> configurations including an allmodconfig, revert the commits:
> 
> e150ef4169a76  ASoC: SOF: Introduce extended manifest
> 371091417864b  ASoC: SOF: ext_manifest: parse firmware version
> 7c024b948c206  ASoC: SOF: ext_manifest: parse compiler version
> 9e72f13ee541c  ASoC: SOF: ext_manifest: parse windows
> 
> to fix this.

Not sure what happened here, these patches were held for a rather long 
time in the SOF tree, I haven't seen any kbuild report or email on this?
We'll fix 'this' but if there's a pointer on what configurations failed 
that would be nice to know.
Thanks
-Pierre
