Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF9C17E07
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 18:22:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 099EC176F;
	Wed,  8 May 2019 18:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 099EC176F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557332574;
	bh=JykMm6tsxrkEkYjcCHAWy/6nMioPqI7DrzeF8jUy41Q=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rb0IjEpUVe/aN5YKsqHhCLwOADzSrItlfcC00cRbQ/QcZh1JN8G/hDszmTSvOtyn+
	 7U+M85TKrC46vRFY7OeSgkiJbIEa3kA5JvSZXLtJQeLpHZBrblNnuUbpIeluSLTpjg
	 q0HXbHSg9vNEluYH+cLoQ6fIAsZ7Dw2a2ZY6TJAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99890F896FF;
	Wed,  8 May 2019 18:21:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21EF4F8075E; Wed,  8 May 2019 18:21:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 442DDF8075E
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 18:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 442DDF8075E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2019 09:21:37 -0700
X-ExtLoop1: 1
Received: from mayalewx-mobl1.amr.corp.intel.com (HELO [10.255.230.159])
 ([10.255.230.159])
 by fmsmga006.fm.intel.com with ESMTP; 08 May 2019 09:21:37 -0700
To: Mark Brown <broonie@kernel.org>
References: <20190507163236.8783-1-pierre-louis.bossart@linux.intel.com>
 <20190507163236.8783-3-pierre-louis.bossart@linux.intel.com>
 <20190508062717.GK14916@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <44be7c35-1b4d-5183-ce4a-1def4126c55f@linux.intel.com>
Date: Wed, 8 May 2019 11:21:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190508062717.GK14916@sirena.org.uk>
Content-Language: en-US
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, kbuild-all@01.org
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: SOF: core: fix undefined nocodec
 reference
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



On 5/8/19 1:27 AM, Mark Brown wrote:
> On Tue, May 07, 2019 at 11:32:36AM -0500, Pierre-Louis Bossart wrote:
>> The existing code mistakenly uses IS_ENABLED in C code instead of as
>> in conditional compilation, leading to the following error:
> 
>> ld: sound/soc/sof/core.o: in function `sof_machine_check':
>> sound/soc/sof/core.c:279: undefined reference to `sof_nocodec_setup'
> 
> There's nothing wrong with using IS_ENABLED() in C code - it can be
> cleaner than using an ifdef to help the compiler eliminate unneeded
> code.

Agree, and we do make use of it. In this case it wasn't smart though.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
