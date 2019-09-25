Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB803BDD6B
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 13:48:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 420211704;
	Wed, 25 Sep 2019 13:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 420211704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569412106;
	bh=maS/02eZ/O/dNSo7rwZKkPZ8Rii8Y8Q8Xkm3nZCG15w=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FPtyXuypVR6hZxpnxF3gohU230hTaDYCIUX2/TZoL7kPQCr/V1AHv7KdCqVYwmux/
	 nXA20qLGFqKZdcL7wj4J62J1PZiqIcHZAWmPIvhst+MgRq/4phYdxfvPkGs4BYKaXE
	 cMsWep8ufm6RrBJyNEnx9jxqM5vrZ7nVy6/S3cz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB73CF80213;
	Wed, 25 Sep 2019 13:46:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51982F80138; Wed, 25 Sep 2019 13:46:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 789F8F80138
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 13:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 789F8F80138
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 04:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,547,1559545200"; d="scan'208";a="364299773"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by orsmga005.jf.intel.com with ESMTP; 25 Sep 2019 04:46:33 -0700
Date: Wed, 25 Sep 2019 14:46:32 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@zeliteleevi
To: sathya.prakash.m.r@intel.com
In-Reply-To: <1569391390-15328-1-git-send-email-sathya.prakash.m.r@intel.com>
Message-ID: <alpine.DEB.2.21.1909251444540.16459@zeliteleevi>
References: <1569391390-15328-1-git-send-email-sathya.prakash.m.r@intel.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: naveen.m@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com
Subject: Re: [alsa-devel] [PATCH v3 0/2] Add CML M/C for RT5682 and RT1011
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On Wed, 25 Sep 2019, sathya.prakash.m.r@intel.com wrote:

> From: Sathya Prakash M R <sathya.prakash.m.r@intel.com>
> 
> The series adds CML m/c driver with RT5682 on SSP0 and
> RT1011 on SSP1.

thanks, seems good now. For the series:

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
