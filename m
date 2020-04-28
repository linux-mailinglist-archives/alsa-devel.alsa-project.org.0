Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1261BC487
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Apr 2020 18:09:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 804DF168C;
	Tue, 28 Apr 2020 18:08:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 804DF168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588090157;
	bh=9qVvGBQNzubzxi14rCxjQcMXzShu+rEGHeHl5Yh09dE=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FwdY+jS+c1TLX7YxjIEnQbUp7M6xMzI2MC/ovFJyTg3CTtlraeaMR06wAgVLvT80B
	 XdEpLrwdkwAWELR76My4e6YGMQR0ACGUl1xWfrx43eU8ettpvoXDdTI0V86lSkXJzu
	 fPI0Q0k5VdAd8WQ40FNMotinppdbjK3BoI4KkTX4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9075F80136;
	Tue, 28 Apr 2020 18:07:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D26FCF801DB; Tue, 28 Apr 2020 18:07:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49DFDF800D2
 for <alsa-devel@alsa-project.org>; Tue, 28 Apr 2020 18:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49DFDF800D2
IronPort-SDR: 5Zg8SWSPi/izfoZ2JBMtrtJueVDAPEYGGPVhmhDK/hcDBsMlc9cuSrwLtK4MmdQlT4GVe9iBTZ
 5bRsFlLdtG9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 09:07:06 -0700
IronPort-SDR: mxW/369R7S46tUoF5u1MULGWFdzNKxhnFQmuhs2VfAnoEPcK3rgyq/3kZUfzWoaJV/PWyDNfFk
 2xWTuNdewkaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; d="scan'208";a="432232773"
Received: from thtang-mobl.amr.corp.intel.com ([10.251.151.171])
 by orsmga005.jf.intel.com with ESMTP; 28 Apr 2020 09:07:05 -0700
Message-ID: <e5116a2b2be975f07ba29ea438f100bbe93ded76.camel@linux.intel.com>
Subject: Re: [PATCH] ASoC: core: Make sure component driver names are unique
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 28 Apr 2020 09:07:04 -0700
In-Reply-To: <20200428114044.GF5677@sirena.org.uk>
References: <20200427193306.31198-1-ranjani.sridharan@linux.intel.com>
 <20200428114044.GF5677@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com
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

On Tue, 2020-04-28 at 12:40 +0100, Mark Brown wrote:
> On Mon, Apr 27, 2020 at 12:33:06PM -0700, Ranjani Sridharan wrote:
> 
> > When registering a component, make sure that the driver names
> > are unique. This will ensure that the snd_soc_rtdcom_lookup()
> > function returns the right component based on the name.
> 
> I would not expect driver names to be unique, you can have multiple
> instances of the same device on a board for example when two mono
> speaker drivers are used for stereo playback.
Maybe I misunderstood your comment in the previous thread then, Mark.

https://mailman.alsa-project.org/pipermail/alsa-devel/2020-April/166665.html

Did you mean to say that the individual drivers should do this check
before registering multiple platform components to make sure they are
unique?

Thanks,
Ranjani

