Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 003E378FD31
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 14:28:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4868DDF1;
	Fri,  1 Sep 2023 14:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4868DDF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693571282;
	bh=5IwvKZUL4r+o1Dkpg2+N1HzSJYIChqWKmULOQ9RkBY0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nxqWel7GMZiXiEPFQfztiwb1LiwBEN1CqF6+uFP0pX4/bzh5Fc5fj06Fmv/XuNS5y
	 dyusAoKmibt5SEYJx74InLxgnzBx9xxHaCn7G4+JyoWjjQWoPP5ERWaKBqu+LmPRbl
	 g6zlg3oCsIHzsuIwcY3ynM2VFJknmKcibqhfUThU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1A27F80155; Fri,  1 Sep 2023 14:27:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 532F1F80155;
	Fri,  1 Sep 2023 14:27:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3476BF80158; Fri,  1 Sep 2023 14:27:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E12A1F800D1;
	Fri,  1 Sep 2023 14:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E12A1F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hpqeMhEr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693571225; x=1725107225;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5IwvKZUL4r+o1Dkpg2+N1HzSJYIChqWKmULOQ9RkBY0=;
  b=hpqeMhEr/Hfsp66PtweJB5iXcNTE+5cv5i59Xm9QwlYljGhcqaDtU3Tk
   AY2YBvB0eH0huS6WvSYgoAHGuEwbEhIpwi/5r8Q5l1lNerZV+8KwgPUIP
   SoDUYT2+yoF1Sf2Z666IcGIudl+67ucCFW00X6oMQ4pcolnhXwlVxpK4v
   nyJAiA7OQ1U+rwSZ84LckyAb+lN4THXib63jypeJoKOcrY+DxhFoZOPeo
   A5PXcL9aDKuIsrT1X0ElcNc/KZfH8u9jM9bD5rGonwVI1EUhJtBAX3gc+
   slDULeYZuGvJU+zux/wgFZeHOLhNonFhAxa0i2TB247EdhmYz0ySvsihC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442602210"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000";
   d="scan'208";a="442602210"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:26:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="1070732852"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000";
   d="scan'208";a="1070732852"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:26:49 -0700
Date: Fri, 1 Sep 2023 15:22:50 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
    alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
    Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
    Liam Girdwood <liam.r.girdwood@linux.intel.com>,
    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
    Bard Liao <yung-chuan.liao@linux.intel.com>,
    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
    Kai Vehmanen <kai.vehmanen@linux.intel.com>,
    Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
    linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v4 01/11] ASoC: SOF: core: add 'no_wq' probe and remove
 callbacks
In-Reply-To: <ac21f644-dedc-289b-3783-0cf2db8c0a73@linux.intel.com>
Message-ID: 
 <alpine.DEB.2.22.394.2309011516110.3532114@eliteleevi.tm.intel.com>
References: <20230830153652.217855-1-maarten.lankhorst@linux.intel.com>
 <20230830153652.217855-2-maarten.lankhorst@linux.intel.com>
 <ac21f644-dedc-289b-3783-0cf2db8c0a73@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: AXHQLNJ7DWOYCEELPPFUKFLSZ7HTQTP3
X-Message-ID-Hash: AXHQLNJ7DWOYCEELPPFUKFLSZ7HTQTP3
X-MailFrom: kai.vehmanen@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AXHQLNJ7DWOYCEELPPFUKFLSZ7HTQTP3/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Wed, 30 Aug 2023, Pierre-Louis Bossart wrote:

> >  	/* probe/remove/shutdown */
> > +	int (*probe_no_wq)(struct snd_sof_dev *sof_dev); /* optional */
> > +	int (*remove_no_wq)(struct snd_sof_dev *sof_dev); /* optional */
> 
> My initial PR didn't have this remove_no_wq() callback.
> 
> For symmetry it could be useful if it is meant to undo what the
> probe_no_wq() did, but conceptually the first thing we do in the remove
> is make sure that workqueue is either not scheduled or we wait until it
> completes.

I think that's exactly what the patch ends up with, remove_no_wq releases 
resources acquired in probe_no_wq, i.e. they are symmetrical.
 
> int snd_sof_device_remove(struct device *dev)
> {
> 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
> 	struct snd_sof_pdata *pdata = sdev->pdata;
> 	int ret;
> 
> 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
> 		cancel_work_sync(&sdev->probe_work);

So this seems ok as well:
 - if wq is used, at remove, we first wait wq to be finished 
   and only then proceed with removal
 - the remove_no_wq is run only when the first step is completed

Br, Kai
