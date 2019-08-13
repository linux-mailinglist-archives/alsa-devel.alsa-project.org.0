Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 849CB8BB32
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 16:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC6A0165F;
	Tue, 13 Aug 2019 16:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC6A0165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565705374;
	bh=LvFZTwZ4FZKnlE7SN6DGrs58B5otqW/o8CE2nKz5Y/8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NficdcXtYKIBLf0CT/zIofSL6YoIL2ErnjPDciCIKa5dJTgnjt5EmRiae9YkUZ8co
	 Z96APvU+4lqzvQdL8t6DqwBUQpJLi1IBw0T7SW0djkQQdrij4SNGDBa8gIQDQghX6n
	 iTfwPQCL+KcMEBilmLxJHZtLyI2MDMkFNB0B8Dko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 684F1F80274;
	Tue, 13 Aug 2019 16:07:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7007AF80120; Tue, 13 Aug 2019 16:07:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72671F80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 16:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72671F80120
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Aug 2019 07:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; d="scan'208";a="170405185"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 13 Aug 2019 07:07:41 -0700
Received: from dalyrusx-mobl.amr.corp.intel.com (unknown [10.251.3.205])
 by linux.intel.com (Postfix) with ESMTP id E8ECD5800FE;
 Tue, 13 Aug 2019 07:07:40 -0700 (PDT)
To: Mark Brown <broonie@kernel.org>, Tony Lindgren <tony@atomide.com>
References: <20190809070003.GA52127@atomide.com>
 <s5hwofmhkbs.wl-tiwai@suse.de> <20190809074643.GB52127@atomide.com>
 <s5hv9v6hhm9.wl-tiwai@suse.de> <20190813102451.GJ52127@atomide.com>
 <20190813112920.GC5093@sirena.co.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <76dbd0ed-bbba-1a11-376e-7bf28c78ad9c@linux.intel.com>
Date: Tue, 13 Aug 2019 09:07:59 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813112920.GC5093@sirena.co.uk>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] Regression in next with codec unload and
 snd_soc_component_get/put
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

On 8/13/19 6:29 AM, Mark Brown wrote:
> On Tue, Aug 13, 2019 at 03:24:51AM -0700, Tony Lindgren wrote:
>> * Takashi Iwai <tiwai@suse.de> [190809 08:24]:
> 
>>> ... and it was already fixed in the later commit 0e36f36b04e7
>>> "ASoC: soc-core: fix module_put() warning in soc_cleanup_component".
> 
>> Mark, looks like this commit is still not in Linux next, forgot
>> to push out something?
> 
> There's a build failure the Intel guys haven't fixed.

see ('ASoC: SOF: fix HDA direct MMIO access') posted on alsa-devel 
yesterday

https://mailman.alsa-project.org/pipermail/alsa-devel/2019-August/153914.html


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
