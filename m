Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EABF079A3EE
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Sep 2023 08:53:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47C4983A;
	Mon, 11 Sep 2023 08:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47C4983A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694415209;
	bh=4vB32nanE+MDEqTy1CJdYDHQ1Wfx+YCcuQAd0vYkfI0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Jy/HcMOp7fB6SOYLlQtXtuy23THaxANjz4r1xCq+37WFSPfg18c4QNr0XBsdAtnGF
	 VjJARXeMgN2dRZWUJUGhZZb9QlHyKaP+O6GfiRXOyKzPFHZySwaPYPoipaIgim7ecQ
	 Yy6tP37K+TvpLFHkEgx7DNkP3gulEKPt/HGBPwN0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B177EF801F5; Mon, 11 Sep 2023 08:52:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C343F80246;
	Mon, 11 Sep 2023 08:52:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1832F80425; Mon, 11 Sep 2023 08:52:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0142DF8007C;
	Mon, 11 Sep 2023 08:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0142DF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=U0EEHFga
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694415152; x=1725951152;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4vB32nanE+MDEqTy1CJdYDHQ1Wfx+YCcuQAd0vYkfI0=;
  b=U0EEHFgaB8wvjaQEFGfY5p4jYw79Y0T4Hbnp4AS4rvO6RJampr6fFqgV
   uMGN08x8bh3RRJ+xHQ51APfkCL/XfxpxTCSgumfnSmRujO9eiZfGNjR7y
   12KuL/NDRln82dbugglj4F4hUAZZ9yUAP3yVWY4m5BaKC5gIBNhVwLnW2
   pTqCD3hugILb6V9SuwWTdSodu/0s4nzHPF5mINDief0oIa9BRiUyksqfw
   X4AuTz9qT55b809gxe1GK4RXX40V4jynos6nA9t5JRfhlmf1T477SklNi
   Cf0TDAFmo0inF61uURwNd7WJHJuuKKkG0na/Dw7N/nxwEgFedL1yLvxlv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="380707659"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000";
   d="scan'208";a="380707659"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2023 23:51:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="746303083"
X-IronPort-AV: E=Sophos;i="6.02,243,1688454000";
   d="scan'208";a="746303083"
Received: from vcouthon-mobl1.ger.corp.intel.com (HELO [10.251.216.222])
 ([10.251.216.222])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2023 23:51:52 -0700
Message-ID: <e8880daf-8f74-4350-96c4-d625272aed35@linux.intel.com>
Date: Mon, 11 Sep 2023 09:51:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] ASoC: SOF: core: add 'no_wq' probe and remove
 callbacks
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20230830153652.217855-1-maarten.lankhorst@linux.intel.com>
 <20230830153652.217855-2-maarten.lankhorst@linux.intel.com>
 <alpine.DEB.2.22.394.2309011509200.3532114@eliteleevi.tm.intel.com>
 <4252a4dc-0cf3-4ff2-aa55-c03e56345276@linux.intel.com>
 <4d84a799-c07e-e917-7c82-2f24456e3ac2@linux.intel.com>
 <6d39eac7-06c7-45f0-0318-72be1753641f@linux.intel.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <6d39eac7-06c7-45f0-0318-72be1753641f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UM6WYC4B4NWMCZ5JYBRTJWALL27OVH6U
X-Message-ID-Hash: UM6WYC4B4NWMCZ5JYBRTJWALL27OVH6U
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UM6WYC4B4NWMCZ5JYBRTJWALL27OVH6U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 07/09/2023 20:29, Pierre-Louis Bossart wrote:
>> I think find all this very confusing, because there is no workqueue used
>> in the remove steps. The workqueue is only used ONCE during the probe.
> 
> Maybe we should just remove any references to workqueues, and have
> 
> probe_start (cannot run in a wq)
> probe (may run in a wq)
> remove (cannot run in a wq, needs to call cancel_work_sync() if the
> probe runs in a wq)
> remove_last (cannot run in a wq, releases all resources acquired in
> probe_start)
> 
> Or something similar that shows the symmetry between steps and when the
> wq is allowed.

What we have atm:
snd_sof_probe - might be called from wq
snd_sof_remove - might be called from wq (cleans up the snd_sof_probe
		 step)

We want a callbacks for hardware/device probing, right, split the
snd_sof_probe (and remove) to be able to support a sane level of
deferred probing support.

With that in mind:
snd_sof_device_probe - Not called from wq (to handle deferred probing)
snd_sof_probe - might be called from wq

snd_sof_remove - might be called from wq (cleans up the snd_sof_probe
		 step)
snd_sof_device_remove - Not called from wq (to up the
			snd_sof_device_probe step)

Naming option: s/device/hardware

However, I think the snd_sof_device_remove itself is redundant and we
might not need it at all as in case we have wq and there is a failure in
there we do want to release resources as much as possible. The module
will be kept loaded (no deferred handling in wq) and that might block
PM, other devices to behave correctly. Iow, if the wq has failure we
should do a cleanup to the best effort to reach a level like the driver
is not even loaded.

Doable? I thin it is.

-- 
Péter
