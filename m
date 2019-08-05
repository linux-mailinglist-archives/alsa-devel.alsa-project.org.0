Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E82B82267
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2019 18:31:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C015D1666;
	Mon,  5 Aug 2019 18:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C015D1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565022668;
	bh=RYjK3EcmW7oNEbGy0OAP91UEzMyIHyZX8sk/K98r0i0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EjMYARlk8Us9bFVSjfGGInMCApNwRdrURAmoYZQR0t8fbNdw5P0yvXV2VcJc7PgBI
	 jY1i8AtfihfFpAnD3NeFRfat5MyPYrJ05R6RNqtt96kZFXoppUnWo0XFf3R55yNttq
	 +/sG9r3thzUKW8axkOmDBR/UQhcpc4e4Us0pHkJk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92B68F8053A;
	Mon,  5 Aug 2019 18:14:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DD6AF80534; Mon,  5 Aug 2019 18:14:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C2EAF8011B
 for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2019 18:14:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C2EAF8011B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 09:06:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="202505572"
Received: from mnasarax-mobl.amr.corp.intel.com (HELO [10.252.200.160])
 ([10.252.200.160])
 by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2019 09:06:14 -0700
To: Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <87pnlx5rq3.wl-kuninori.morimoto.gx@renesas.com>
 <87o91h5rp5.wl-kuninori.morimoto.gx@renesas.com>
 <20190805154512.GJ6432@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <6c3a00c9-fa0c-98ea-c4f1-34e995d80559@linux.intel.com>
Date: Mon, 5 Aug 2019 11:06:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805154512.GJ6432@sirena.org.uk>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>
Subject: Re: [alsa-devel] [PATCH v2 01/29] ASoC: Intel: skl-pcm: disable
 skl_get_time_info
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



On 8/5/19 10:45 AM, Mark Brown wrote:
> On Fri, Jul 26, 2019 at 01:49:17PM +0900, Kuninori Morimoto wrote:
> 
>> Now, ALSA SoC doesn't setup rtd->ops.get_time_info.
>> This means it never used in ALSA SoC even if
>> sound driver had .get_time_info.
> 
>> This patch disable .get_time_info from skl-pcm.c.
>> Because we might be going to support it in the future,
>> it uses #if 0.
> 
> The #if 0 here isn't exactly nice...  it'd be better to just implement
> get_time_info().

IIRC Cezary's team had a patch reviewed internally at Intel to add the 
missing pieces, so this will be supported soonish (likely after the 
Summer break).
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
