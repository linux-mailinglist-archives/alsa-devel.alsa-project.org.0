Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 494188CA3D9
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 23:39:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A380DEC;
	Mon, 20 May 2024 23:39:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A380DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716241181;
	bh=yw2rCIrCQibFXCP4yX81inyprqmfwEEpDAwGlUMhIJY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vNSBg1hKABGf3Mp4fCFYAWmGaDqXufFoqESLP/Egm0Slh3qEo5Q2UNhW24eVB3TG4
	 DGZEz6eK/nbkDMwcCB4m2Qb139Tk8yLajLJWQY2xidFWYOxBWBZ66mdbtyeB8i38T/
	 JeW5onnR186YIoJ/OROJleOKJrtVthCDydQjDXS4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3F1DF80589; Mon, 20 May 2024 23:39:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06369F805A9;
	Mon, 20 May 2024 23:39:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21346F8026A; Mon, 20 May 2024 23:39:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD0FAF800BA;
	Mon, 20 May 2024 23:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD0FAF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=JPZzBhbs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716241142; x=1747777142;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yw2rCIrCQibFXCP4yX81inyprqmfwEEpDAwGlUMhIJY=;
  b=JPZzBhbsgkOIOM+C+390sXaMChV0BS0bwRiYDhAFMayLWCzWIk+Rx6Jg
   9nAtliRueVmhG8lmRn2QCCBylH6SsvlJGC8fP7RBQOcJqF2uRr8gOa8hL
   pzaAf5tPRRpZDSzp7mI4PsaB8HEmJ6GcMoRnkPsC38NaHz0CNyE1FsHx6
   ukZcGkVVJu/LoP9r/rJWOale7a5fYT8SKH95m9GCiNsafe4XV5ZDqMrQM
   wfGp/ZUOBFM9Z7o4+aSiUYiitDuKoPHL4WLvOD58Sx/ZDseRiPGoLlfLb
   L/guKdtJ4szJDIMMmfU2gAh/51pal+CPoZac730Dr/a8mZ0Bwc4FkeqI/
   A==;
X-CSE-ConnectionGUID: U2zJd2EpRM+BlUkO0rjqsg==
X-CSE-MsgGUID: v1cMma4fRwa5EH+TY5y/PA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12585213"
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000";
   d="scan'208";a="12585213"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 14:38:56 -0700
X-CSE-ConnectionGUID: DGQ7yuvzRpeP50GVaMCv6w==
X-CSE-MsgGUID: 0MqdF6MhR2ehoTcJGZj5ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,176,1712646000";
   d="scan'208";a="70084551"
Received: from daliomra-mobl3.amr.corp.intel.com (HELO [10.125.109.51])
 ([10.125.109.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2024 14:38:55 -0700
Message-ID: <c683b42c-f75c-427e-b6b0-66babce9b55e@linux.intel.com>
Date: Mon, 20 May 2024 16:31:31 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: topology: Constify an argument of
 snd_soc_tplg_component_load()
To: Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: lgirdwood@gmail.com, tiwai@suse.com, cezary.rojewski@intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com, daniel.baluta@nxp.com,
 linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: 
 <f2f983e791d7f941a95556bb147f426a345d84d4.1715526069.git.christophe.jaillet@wanadoo.fr>
 <1fb69d24-03af-4742-9f44-5a93704f5cfb@sirena.org.uk>
 <b736e11e-430a-462b-898a-d5e1dcf7f74a@wanadoo.fr>
 <baf1789a-a573-470f-b816-ca9bb0d7f299@sirena.org.uk>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <baf1789a-a573-470f-b816-ca9bb0d7f299@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D3FUBPF5VQM3BBJUANPFD4H2PTBRCKCM
X-Message-ID-Hash: D3FUBPF5VQM3BBJUANPFD4H2PTBRCKCM
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D3FUBPF5VQM3BBJUANPFD4H2PTBRCKCM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/20/24 08:24, Mark Brown wrote:
> On Sat, May 18, 2024 at 10:34:33AM +0200, Christophe JAILLET wrote:
>> Le 14/05/2024 à 12:21, Mark Brown a écrit :
> 
>>> As mentioned in submitting-patches.rst when submitting a patch series
>>> you should supply a cover letter for that patch series which describes
>>> the overall content of the series.  This helps people understand what
>>> they are looking at and how things fit together.
> 
>> Ok.
>> I usually do, but I thought that the subjects were self-explanatory enough
>> in this case.
> 
>> Do you want me to resend?
> 
> It's fine this time.

no issues with
https://github.com/thesofproject/linux/pull/4993, so

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
