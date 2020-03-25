Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E59511926E6
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 12:12:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F73F1670;
	Wed, 25 Mar 2020 12:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F73F1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585134727;
	bh=X5BW7HgOHsTm6egW/woCqq8GLnLFJELku2ZUAGZ+3Dc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FgGwDR+E14S13NrN/UPWs0s54MNT1VhHOnDAEzTvJqgOIWFq1iFFq8kfo3plL1OcB
	 ECdtVkA29jpIAGs8PHOduKKHpXCADJ3USOVlJSn3Nw0XLiMhMKO13bdIfC5p7psOsL
	 7Hq0x1CdFkuPrG0pVLbdVOVg47bDWzZpI82nBXws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EAB3F8011E;
	Wed, 25 Mar 2020 12:10:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0639F80158; Wed, 25 Mar 2020 12:10:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6234EF80095;
 Wed, 25 Mar 2020 12:10:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6234EF80095
IronPort-SDR: yIpYAeXAK+kPgabtrfHQcc6JeED4kT+r8f9CmoXy1jeQYG3NFuqml8RnZoUoYVP0iPQxln+3JW
 PHSigPpO8U/A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 04:10:15 -0700
IronPort-SDR: ksz0v4tiwq2ofN2vzhqBw8RQX3Y+V6Nv0z93XOGs/jOkJs/to0w1ox5T1kDcye7YaOwTfbcBAb
 TOek6/Z9DUjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; d="scan'208";a="235907286"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO ubuntu)
 ([10.252.55.115])
 by orsmga007.jf.intel.com with ESMTP; 25 Mar 2020 04:10:14 -0700
Date: Wed, 25 Mar 2020 12:10:12 +0100
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 0/2] ASoC: SOF: initialise work immediately
Message-ID: <20200325111012.GA7131@ubuntu>
References: <20200324122921.29582-1-guennadi.liakhovetski@linux.intel.com>
 <20200324133042.GB7039@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324133042.GB7039@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
 sound-open-firmware@alsa-project.org
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

On Tue, Mar 24, 2020 at 01:30:42PM +0000, Mark Brown wrote:
> On Tue, Mar 24, 2020 at 01:29:19PM +0100, Guennadi Liakhovetski wrote:
> > Fix uninitialised work errors by moving initialisation to directly
> > after allocation.
> > 
> > Guennadi Liakhovetski (2):
> >   ASoC: SOF: (cosmetic) use for_each_pcm_streams() in sof_dai_load()
> >   ASoC: SOF: fix uninitialised "work" with VirtIO
> 
> As documented in submitting-patches.rst please send patches to the 
> maintainers for the code you would like to change.  The normal kernel
> workflow is that people apply patches from their inboxes, if they aren't
> copied they are likely to not see the patch at all and it is much more
> difficult to apply patches.

An update: these patches got merged into the SOF tree, so, no need to 
merge them to ASoC directly.

Thanks
Guennadi
