Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD9331B2BD
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Feb 2021 22:22:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C98183B;
	Sun, 14 Feb 2021 22:21:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C98183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613337738;
	bh=uE5Ag7OlfThaV8bpCmsBK0eVCIjwrE21N9DHjPF2cbk=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tWg2GF/v5Oe7UOUF1vrC4vlyWaRykAaKuoMSm/90cEMwBjntxHwpar0H4PMW0liDz
	 sXxNs6/BCyZ4FVWtiJo52WZXB8vKbtAo7spR7yBjHEQm44JMXY0Z5geDxsqo/fhoke
	 yPFxT0G/VutVFQXau9ebyPSTQ8KOURnuQc5+YYuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CDF2F8015A;
	Sun, 14 Feb 2021 22:20:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79C14F80155; Sun, 14 Feb 2021 22:20:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AA58F800B2
 for <alsa-devel@alsa-project.org>; Sun, 14 Feb 2021 22:20:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AA58F800B2
IronPort-SDR: gGiZOK7Bct2h1fuoEjuvxqTt5EaiIUc0PY6AugXUPVK7RT713wvLfenmPUYGXUnG3PFDy9Pahp
 ibmcLSJu2jxA==
X-IronPort-AV: E=McAfee;i="6000,8403,9895"; a="161741138"
X-IronPort-AV: E=Sophos;i="5.81,179,1610438400"; d="scan'208";a="161741138"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2021 13:20:34 -0800
IronPort-SDR: JmWcKmRu6Hb+lraOtbe4R9iypFEO3sodZNLhSaxl4usRoxKHnO6ci58ymeZ7RvKIwwS1TcAba7
 GTN/OiyFhc1A==
X-IronPort-AV: E=Sophos;i="5.81,179,1610438400"; d="scan'208";a="398783208"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2021 13:20:33 -0800
Date: Sun, 14 Feb 2021 23:17:03 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 2/3] ASoC: soc-pcm: add soc_pcm_hw_update_chan()
In-Reply-To: <62f03ec8-7b9c-4550-d63d-cc50693e62fa@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2102142311050.864696@eliteleevi.tm.intel.com>
References: <87tuqs90rl.wl-kuninori.morimoto.gx@renesas.com>
 <87r1lw90oo.wl-kuninori.morimoto.gx@renesas.com>
 <62f03ec8-7b9c-4550-d63d-cc50693e62fa@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard liao <yung-chuan.liao@linux.intel.com>
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

Hi,

On Fri, 12 Feb 2021, Pierre-Louis Bossart wrote:

> > We have soc_pcm_hw_update_rate() now.
> > This patch creates same function for chan.
> 
> This patch seems to break all SOF platforms. I tested manually to try and
> reproduce the CI results and it's indeed not so good:

ouch -- I think this will impact also non-SOF platforms.

The new helper functions seem all correct, but the problem would seem to 
be in the dpcm_init_runtime_hw() as some of the inputs are not initialized 
as expected here. I'll try to send a fixup patch asap. In case 5.11 is 
released later today, this regression needs to be fixed for first 5.12 
pull req.

Br, Kai
