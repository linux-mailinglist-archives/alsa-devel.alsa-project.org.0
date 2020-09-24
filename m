Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B540277002
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 13:33:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8CDF617BF;
	Thu, 24 Sep 2020 13:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8CDF617BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600947230;
	bh=hznsbZPTDVaikcDqXUerGNs1j0Cww2C6uGIAo5JcgM0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y3DisJb99/S7X2TSE9B4qNEMRE1/OS0q2z8d8N/RwHQ5fMS3oY3/U0NW0xXrkYBcz
	 5g41gGkOWKv3EyQxtqQag29tDsGveoo50wSpq4HOq0md1P3mUKQ/8SEtjjRjWXPIlT
	 g8para+c4Qx4IHlzVm4r+7uzaX61EFLIedXI82Ro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B07EEF80229;
	Thu, 24 Sep 2020 13:32:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B13AAF80232; Thu, 24 Sep 2020 13:32:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00C21F8015F
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 13:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00C21F8015F
IronPort-SDR: 45uEnHTfznsHp12DdzhwQ9APHrksMmqZR1lrLJzucp/CwFdpfYgg1MY3G6jODYq4WI1unGZ+IP
 W0cmD2x96P1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="148932796"
X-IronPort-AV: E=Sophos;i="5.77,297,1596524400"; d="scan'208";a="148932796"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 04:31:58 -0700
IronPort-SDR: +nJCKahE8ypbNjsjDFCIREbE2LNaBYJYmXdLKsrtjuLfsK6sc3tY0t2nkAPrpIl0DB1sVfh3QQ
 lu+12J22Rtug==
X-IronPort-AV: E=Sophos;i="5.77,297,1596524400"; d="scan'208";a="455314644"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 04:31:56 -0700
Date: Thu, 24 Sep 2020 14:30:23 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/5] ASoC: SOF: fix kcontrol size checks
In-Reply-To: <20200924105645.GA4754@sirena.org.uk>
Message-ID: <alpine.DEB.2.22.394.2009241426320.3186@eliteleevi.tm.intel.com>
References: <20200921110814.2910477-1-kai.vehmanen@linux.intel.com>
 <160073312817.6173.14263034136602358389.b4-ty@kernel.org>
 <alpine.DEB.2.22.394.2009240841280.3186@eliteleevi.tm.intel.com>
 <20200924105645.GA4754@sirena.org.uk>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

Hey,

On Thu, 24 Sep 2020, Mark Brown wrote:

> On Thu, Sep 24, 2020 at 08:45:30AM +0300, Kai Vehmanen wrote:
> > I wonder what happened here...? Patches 4 and 5 didn't end up applied 
> > although they were in the sent series. I can send them again no prob, but 
> > wondering if there was something wrong in the original series, so I can 
> > avoid the problem in the future.
> 
> Do those patches actually apply to for-5.10 or are they correcting
> issues that only exist in for-5.9?

yes, the series was based on broonie/for-5.10 for sending, and I tested 
again and both of the dropped patches still apply on top of for-5.10. They 
do not apply cleanly on top of for-5.9.

Br, Kai
