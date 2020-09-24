Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD804276890
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 07:49:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51AE017A4;
	Thu, 24 Sep 2020 07:48:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51AE017A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600926560;
	bh=1W64pjvAof5OsM4DMhjZ2MZtg1c2Pj/Xl5RtkbnGoZQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Of1LmE/nSSlIU27qIa/UfgIsnr20PzO3yLH2swBGtCx21gF8eZzwSD6a03iSk67IH
	 8+Aeu3Utgi3voFBmRDH30/WJoRlxqVgN306eGzK8P7/GIUxwiICAap2ZcjKvbaOPYW
	 8GexPqdAD4cae+pKmjf4UM/Z6hKApaz+8KbEqqH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70F44F8015F;
	Thu, 24 Sep 2020 07:47:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FFCAF80232; Thu, 24 Sep 2020 07:47:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55994F8015F
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 07:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55994F8015F
IronPort-SDR: ajrSPJodEgL1cyMDIys+vFLRQmEBlLEIAdbRRb50ZoN2sHCTH8xcEDVxrILAnlyN4oq9vLsGKE
 p7bJzRk+wckQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="148856165"
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; d="scan'208";a="148856165"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 22:47:15 -0700
IronPort-SDR: TMF/A4RtDGVTWyhNudwXWNKE1zbZCxG85du9qJrSJ77RIlTPaoashV8l/KZSdRTm0jP6Xg78RO
 fvz+BTnA5kkA==
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; d="scan'208";a="335801799"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 22:47:13 -0700
Date: Thu, 24 Sep 2020 08:45:30 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/5] ASoC: SOF: fix kcontrol size checks
In-Reply-To: <160073312817.6173.14263034136602358389.b4-ty@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2009240841280.3186@eliteleevi.tm.intel.com>
References: <20200921110814.2910477-1-kai.vehmanen@linux.intel.com>
 <160073312817.6173.14263034136602358389.b4-ty@kernel.org>
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

Hi Mark,

On Tue, 22 Sep 2020, Mark Brown wrote:

> [3/5] ASoC: SOF: control: add size checks for ext_bytes control .put()
>       commit: 2ca210112ad91880d2d5a3f85fecc838600afbce
> [4/5] ASoC: SOF: control: remove const in sizeof()
>       (no commit info)
> [5/5] ASoC: SOF: topology: remove const in sizeof()
>       (no commit info)
[...]
> Applied to                                                                                                                                                                                   
>                                                                                                                                                                                             
>   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next  

I wonder what happened here...? Patches 4 and 5 didn't end up applied 
although they were in the sent series. I can send them again no prob, but 
wondering if there was something wrong in the original series, so I can 
avoid the problem in the future.

Br, Kai
