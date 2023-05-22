Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E1070CAFB
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 22:29:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AC541EF;
	Mon, 22 May 2023 22:29:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AC541EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684787395;
	bh=06gJ26y6/+tD6/04ZXWm0S0iHd38ABjCkIpWuxdpj2I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fgDD1lfn5OARnviWYrBsBGos3re6POlA4sQ8rWTnY8z+V9zzwOTv8dAw45f93Yw7A
	 7mbEnh3ZWKWi8yahYrQZ2Mwi7KBr5DAXizJFyrDF/g3fyYSIr3UW6RuU9dLPKzc8DU
	 5bFACKTwOCO5Y/HLV5VdRpQECVesgtjnmJorSq8Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4449F80553; Mon, 22 May 2023 22:29:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AC54F80249;
	Mon, 22 May 2023 22:29:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B91ECF8024E; Mon, 22 May 2023 22:28:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E0758F8016A;
	Mon, 22 May 2023 22:28:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0758F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fB4cuQvH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684787333; x=1716323333;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=06gJ26y6/+tD6/04ZXWm0S0iHd38ABjCkIpWuxdpj2I=;
  b=fB4cuQvHVZ3QTfAdI8J7BM4DIpbQ2xT4agsZpRcIE9X51cX8L+OxWKxF
   ngmEmqOkEziSSwbKxG+7d+KgTgoNTY3xbsTe22rLIOhzwlj2Kxqno3W/4
   3pbABvH9j1yhgUyjM0/UcRNGHuFNfBJuJqNekDB/yv1GanyDdu2VEGryP
   luvtpgD3yzr6KZ0ZfVsB0h4qrqfhov3blfgs3Bbg+bPZecrzo3V+x03LH
   XP8CRvAg3IjjLeJa0MTHyn0EvMJN0tj+Rmg/hlxARZHdSw4EuHC4FfqPW
   b3Iq1nQXyj7vcyisVGLoFYTrZBDCQhFhRb8yM5XwmXWHBRb113CcqvGXF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="333396981"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="333396981"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 13:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="827824711"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400";
   d="scan'208";a="827824711"
Received: from avelapox-mobl.amr.corp.intel.com ([10.212.71.122])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 13:28:36 -0700
Message-ID: <58928aec02be483e8a188fcc6e53d805a24534aa.camel@linux.intel.com>
Subject: Re: [PATCH next] ASoC: SOF: Intel: hda-dai: Fix locking in
 hda_ipc4_pre_trigger()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, Pierre-Louis
 Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Rander Wang <rander.wang@intel.com>, Jyri Sarha
 <jyri.sarha@intel.com>, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: error27@gmail.com, dan.carpenter@linaro.org,
	kernel-janitors@vger.kernel.org
Date: Mon, 22 May 2023 13:28:30 -0700
In-Reply-To: <20230519064404.1659637-1-harshit.m.mogalapalli@oracle.com>
References: <20230519064404.1659637-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7RSJEGIJPVVTQQGQTTWXXKRE2WNJLBOC
X-Message-ID-Hash: 7RSJEGIJPVVTQQGQTTWXXKRE2WNJLBOC
X-MailFrom: ranjani.sridharan@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7RSJEGIJPVVTQQGQTTWXXKRE2WNJLBOC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 2023-05-18 at 23:44 -0700, Harshit Mogalapalli wrote:
> hda_ipc4_pre_trigger() has two issues:
>  1. In the default case, we are returning without unlocking the
> mutex.
>  2. In case SNDRV_PCM_TRIGGER_STOP: when ret is less than zero it
> goes
>     to out, unlocks but returns zero instead of a negative value.
> 
> Fix this by changing the final return value to 'ret' instead of zero,
> and initialize 'ret' to zero in the start of the function.
> 
> Fixes: 225f37b578a9 ("ASoC: SOF: ipc4-pcm: reset all pipelines during
> FE DAI hw_free")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> Only compile tested. This is found using static anlysis with Smatch.
> ---
Thanks for this fix. LGTM.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

