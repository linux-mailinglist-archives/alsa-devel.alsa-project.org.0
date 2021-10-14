Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8460142E33C
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Oct 2021 23:25:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11AAD1661;
	Thu, 14 Oct 2021 23:24:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11AAD1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634246717;
	bh=GoRKiMowd+fV6Eq+LWsXcWCnIxjddWj77CjYyyQTTK4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rpQ2ks2zSWUzpsEssPof0B4qGuaITLsvE8in0jqpG3oA6hzSn7LHUL5cNntN4WeHe
	 u9cK+J+z2lFLYtVUsfZAd1uvx+sELoP3/BH+vwrg/+vWWaY5ujUwloqMlUYnczD2QU
	 G4AA/V2cqYJEazKlJRdKwnBV+DEqJLjHwmJ3kV4Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F320F80245;
	Thu, 14 Oct 2021 23:24:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F535F80212; Thu, 14 Oct 2021 23:23:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71D03F8016C
 for <alsa-devel@alsa-project.org>; Thu, 14 Oct 2021 23:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71D03F8016C
X-IronPort-AV: E=McAfee;i="6200,9189,10137"; a="227748391"
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="227748391"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 14:23:44 -0700
X-IronPort-AV: E=Sophos;i="5.85,373,1624345200"; d="scan'208";a="461343932"
Received: from ktrimble-mobl.amr.corp.intel.com (HELO [10.209.188.150])
 ([10.209.188.150])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2021 14:23:37 -0700
Subject: Re: [PATCH] ASoC: soc-component: improve error reporting for register
 access
To: Mark Brown <broonie@kernel.org>
References: <20211014161330.26645-1-srinivas.kandagatla@linaro.org>
 <cdd5fb0f-ff3e-9da0-1ea4-1d1ae5e982bc@linux.intel.com>
 <YWiK5Hq5Cyt/8Kq0@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <867076c3-d0fa-991e-a32f-17239b089d68@linux.intel.com>
Date: Thu, 14 Oct 2021 16:23:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWiK5Hq5Cyt/8Kq0@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, lgirdwood@gmail.com
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




>> BTW while looking at the code, I started to wonder if it's intentional
>> that we cannot check any error code on component->driver->read(). We do
>> for the write and on regmap read, which suggests this API is problematic?
> 
> I dunno about intentional but it's always been that way since ASoC was
> originally merged, it's just that nobody's ever changed that as part of
> one of the refactorings.  I did add error checking to the regmap read
> interface when I wrote that but I wasn't about to go fixing up all the
> ASoC drivers for a new API.

I started looking, there aren't that many users of that callback, but
some of the tlv320dac33 and twl6040 drivers would need a lot of changes.
that's probably going to be legacy code at this point.
