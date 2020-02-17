Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78687161475
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Feb 2020 15:23:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FA4B166D;
	Mon, 17 Feb 2020 15:22:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FA4B166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581949413;
	bh=zOwdTJlUt9tcwaqWCUz1p2sDv9tk1KPl754U53U2wys=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JIgLjAwZVJmDozrxkdgRTrjuGmaG3poiXucuUVOC9dcttAx6wkiHsflRKH/OCHVtx
	 d3nhZKe8i2KgsDmPKeL49zObVO8Fvz+ocDYHqLo87Avd4mw53C6dQ/VSWYh2jd1tFs
	 44FHnnLMWkdsnciQSYRfYaDBZp6d0oaqudnwqwC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FCDDF800B6;
	Mon, 17 Feb 2020 15:21:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFE9FF80172; Mon, 17 Feb 2020 15:21:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B16A2F800C4
 for <alsa-devel@alsa-project.org>; Mon, 17 Feb 2020 15:21:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B16A2F800C4
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2020 06:21:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,453,1574150400"; d="scan'208";a="258281162"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 17 Feb 2020 06:21:38 -0800
Date: Mon, 17 Feb 2020 16:21:37 +0200 (EET)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <s5hk14lgvy6.wl-tiwai@suse.de>
Message-ID: <alpine.DEB.2.21.2002171612320.2957@eliteleevi.tm.intel.com>
References: <20200216203516.10869-1-tiwai@suse.de>
 <alpine.DEB.2.21.2002171506330.2957@eliteleevi.tm.intel.com>
 <s5hk14lgvy6.wl-tiwai@suse.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: intel: Fix probe error without
 i915 graphics
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

Hey,

On Mon, 17 Feb 2020, Takashi Iwai wrote:

> On Mon, 17 Feb 2020 14:17:54 +0100, Kai Vehmanen wrote:
> >  snd_hdac_i915_exit() calls
> >    -> snd_hdac_acomp_exit(), which again calls
> >    -> component.c:component_master_del(dev, &hdac_component_master_ops);
> >    -> component.c:take_down_master()
> >    -> devres.c:devres_release_group(master->dev, NULL);
> > 
> > ...  now that is somewhat suprising. Basicly that goes on to release all 
> > devres resources for the hdac_bus device (not just those related to 
> > acomp!).
> 
> Does it really?  I thought it applies only to the group, and id=NULL
> indicating that it's a local group that was created with id=NULL (by
> address match).

at least in my tests, acomp_exit() ended up releasing a bunch of devres 
allocations made with devm_kzalloc() that had no relation to acomp. I 
noted that in devres.c:find_group(), docs say:

/* Find devres group with ID @id.  If @id is NULL, look for the latest. */
static struct devres_group * find_group(struct device *dev, void *id)

... I don't see how it would be limiting a local group.

Br, Kai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
