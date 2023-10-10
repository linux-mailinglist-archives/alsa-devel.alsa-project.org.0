Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 223737BFD81
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 15:30:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72B9B1507;
	Tue, 10 Oct 2023 15:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72B9B1507
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696944635;
	bh=+B4WseGrt1pWwwKou20nfZGYU2s54qm8dWwPLmdD2Ts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rx9xi49v67BBsu+BHeu7o3/RJ857xzTdv9dtssfaXynG04R2MysI6F5YAfZ0QUYZE
	 RAL/6l31yCSTPc30EdjD8GMTzEiBZH4eCEP+HEBxhMEjvAvzuE2gQWO/2qVTyMLe7l
	 vq6lo+rQ0f+ivOH5SOGW9OVTWve6Rs70zKK2s6GY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CE26F80552; Tue, 10 Oct 2023 15:29:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6471EF80166;
	Tue, 10 Oct 2023 15:29:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20B93F802BE; Tue, 10 Oct 2023 15:29:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FCEEF80166;
	Tue, 10 Oct 2023 15:29:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FCEEF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FN0cZ96P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696944571; x=1728480571;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+B4WseGrt1pWwwKou20nfZGYU2s54qm8dWwPLmdD2Ts=;
  b=FN0cZ96PwEDjNJT1wTCxIKsEpARMfuiMFiwoGNPwvZ5iFK0BziYfKGD8
   ZD0exsfLJsfk8CtVYh5y4FdjkAriR/V34X3za5ovl8bT/YSOvWPoPCXoZ
   ICD7kmMXxq4yc77qCJy3qscVZb1SFxddtR0sNprG3yhOH77JweSq03sc6
   8qWu2Xuut/8Xlsb2R/Nx70OL+SZCLWpXip7V0iNknXae/UuUF9/k/wQRx
   KfDmK+jHTubrD4nn1VQmL+5cngfUoAkz9sFsaG5Kr8F9XTTIAGV1iUljq
   FvGBwy+beJT5/YR0Acmanaq8OiFqTuia2YyZaBJA9/LUBfu4ojKBuaVSr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="384247933"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200";
   d="scan'208";a="384247933"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 06:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747071579"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200";
   d="scan'208";a="747071579"
Received: from sssodhi-mobl.amr.corp.intel.com (HELO [10.212.38.18])
 ([10.212.38.18])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 06:29:23 -0700
Message-ID: <2bac708f-40f9-4f02-a3ff-d5ab11e7ebe2@linux.intel.com>
Date: Tue, 10 Oct 2023 09:29:22 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Convert to platform remove callback returning
 void
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
 <CAEnQRZBzEfwC3kgaUWty769L4wD-LGng5yUJwQR2_C4T0oJjxA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: 
 <CAEnQRZBzEfwC3kgaUWty769L4wD-LGng5yUJwQR2_C4T0oJjxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: V5JREASDV2PI7S3V527E656TNFQB6NJ5
X-Message-ID-Hash: V5JREASDV2PI7S3V527E656TNFQB6NJ5
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V5JREASDV2PI7S3V527E656TNFQB6NJ5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/10/23 07:00, Daniel Baluta wrote:
> On Mon, Oct 9, 2023 at 7:03 PM Uwe Kleine-König
> <u.kleine-koenig@pengutronix.de> wrote:
>>
>> The .remove() callback for a platform driver returns an int which makes
>> many driver authors wrongly assume it's possible to do error handling by
>> returning an error code. However the value returned is ignored (apart
>> from emitting a warning) and this typically results in resource leaks.
>>
>> To improve here there is a quest to make the remove callback return
>> void. In the first step of this quest all drivers are converted to
>> .remove_new(), which already returns void. Eventually after all drivers
>> are converted, .remove_new() will be renamed to .remove().
>>
>> The SOF platform drivers all use either sof_of_remove() or
>> sof_acpi_remove() which both return zero unconditionally. Change these
>> functions to return void and the drivers to use .remove_new(). There is
>> no semantical change.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> 
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

FWIW I have a follow-up patch to convert the SOF remove ops to return
void: https://github.com/thesofproject/linux/pull/4625
