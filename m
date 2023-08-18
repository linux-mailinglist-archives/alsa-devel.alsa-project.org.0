Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3364780BCB
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 14:29:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC86DDF0;
	Fri, 18 Aug 2023 14:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC86DDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692361764;
	bh=GctVCNTw8ESzuUERp0VBFkWHXTLT3XaK5llUVzorn9k=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PGDiwktfy6D63Q5N3+u9I0angs959xUxRa5r23CrTVYBJgKpOpfeZqa2CjSXmJfsM
	 PGUizwXBATfBzWqrpLBYB7GsqdIzY90XDuAaSZGAVkkUkhE3QKVVPrNAbrtd/XnDoN
	 fKP260JnlEfTYhwAH5ysjI6y919vV392WnYqcdoE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51BB4F800EE; Fri, 18 Aug 2023 14:28:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7DBCF8016D;
	Fri, 18 Aug 2023 14:28:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E2ABF801EB; Fri, 18 Aug 2023 14:28:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38D4EF800D1;
	Fri, 18 Aug 2023 14:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38D4EF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gVmBQapS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692361697; x=1723897697;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GctVCNTw8ESzuUERp0VBFkWHXTLT3XaK5llUVzorn9k=;
  b=gVmBQapS/Jv70fncBPcMNqSZNBLjPWq2yCIgj2tWr8GK/rVIHTBXjbr7
   X2TCLK/gKIcPyIrkEhEbr8+yEI3kd4XNZnFsOJvKX5W/ZFw/eXXesfHmQ
   a2EBbYic44KCDnpZ8hplJhZZGV5QPOTK1gedYMdL00rkMcqIVM0zN/rwA
   sb14SEqwduXqj5/+rWQBN9VSWhM+Hjj/BgIQuQbOF9I6Q87BJuEwhxurg
   47bEn4Q192ddWMKu+L108EnzPELJkPsXst/OGKD5WaBEwdiEQ+HMl92Zk
   Y+rJwK+TyBXVb3nUcaXYuzEzcgGoW4rQYkoMUapnGBKEf+wdPISYcwvrd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="371992659"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="371992659"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 05:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="711981389"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="711981389"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 05:28:05 -0700
Date: Fri, 18 Aug 2023 15:24:14 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Takashi Iwai <tiwai@suse.de>
cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
    Maarten Lankhorst <dev@lankhorst.se>,
    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
    Alsa-devel <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>,
    Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
    Liam Girdwood <liam.r.girdwood@linux.intel.com>,
    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
    Bard Liao <yung-chuan.liao@linux.intel.com>,
    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
    Kai Vehmanen <kai.vehmanen@linux.intel.com>,
    Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
    linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v3 8/9] ASoC: SOF: Intel: Move binding to display driver
 outside of deferred probe
In-Reply-To: <87il9ck52l.wl-tiwai@suse.de>
Message-ID: 
 <alpine.DEB.2.22.394.2308181522050.3532114@eliteleevi.tm.intel.com>
References: <20230807090045.198993-1-maarten.lankhorst@linux.intel.com>
 <20230807090045.198993-9-maarten.lankhorst@linux.intel.com>
 <4acc7318-69b3-3eb5-1fe8-f7deea8adfad@linux.intel.com>
 <87a5uwr7ya.wl-tiwai@suse.de>
 <e88d139f-e62b-1654-0d35-a46c698298c6@lankhorst.se>
 <87il9ck52l.wl-tiwai@suse.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Message-ID-Hash: GK7L2O2UGJTUXXBYOEKGGPTQC7UVJPEZ
X-Message-ID-Hash: GK7L2O2UGJTUXXBYOEKGGPTQC7UVJPEZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GK7L2O2UGJTUXXBYOEKGGPTQC7UVJPEZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On Fri, 18 Aug 2023, Takashi Iwai wrote:

> On Mon, 14 Aug 2023 16:26:01 +0200,
> Maarten Lankhorst wrote:
> > 
> > Ping on this?
> 
> Pierre?  Does one of your recent patch sets achieves the suggested
> thing?  Or do we need another rewrite/respin of this series?
> Currently it's blocking the merge for 6.6.

this is likely to require another spin. Pierre did a draft of
the new ops at https://github.com/thesofproject/linux/pull/4527
and Maarten is looking to adapt the series to this.

Br, Kai
