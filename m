Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF49716E1F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 21:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82E681E3;
	Tue, 30 May 2023 21:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82E681E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685476318;
	bh=ICAyyY/G2neb8xYlcuJNszwGs48m9YnxEHhqOcYCTFM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p4uOKWPnbeTA4Ou+B154NOYJVFMr0iPKD81mAJJlB3o/Dv+54BjK3wmkGvawM7F4N
	 4j8C/JDQsbNGYQH+hpbWLW84s97MqYcSth/rpcVLjEv7uHUWilV7G4t1c2i3C3QG7v
	 RfpuUNsRu+uY6b5Tv+D4zLNaDJxTbRDi3vknfIkI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25C56F8016B; Tue, 30 May 2023 21:51:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BB4BFF8026A;
	Tue, 30 May 2023 21:51:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48185F8042F; Tue, 30 May 2023 21:51:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 626D2F8016B
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 21:50:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 626D2F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ibhafh5x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685476258; x=1717012258;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ICAyyY/G2neb8xYlcuJNszwGs48m9YnxEHhqOcYCTFM=;
  b=Ibhafh5xiLT4OhYk+h5vHu3lOnW1Q4nTdJIDCVX8CJMz0lJPQ4zx5tlk
   4JO2VRwAeCsza+jqDY+A7KS6UFtx4ZZpYMcOAejHCB5HKBAtqL6rRi7Io
   VkchKNdTj6oAirDdOj0uQl8qr+x+GtmX9fYpDOMlzq08uBmYwT9PiazVX
   YcdwmEeJ7kpNoPdb/J+eXcaOwwBZ8Q+0zvmWoDfYoD3zzCg0KwWP3LRHT
   K8+3f3YYHSBKq2RQ6h8genmTLm7ZmaDBuayKYPicieovrHGKDvBa6iHp9
   U32UeNTLw6WMD6OcU9keEbqGd23MUsGag5AMjMp/Z6NvoK2CqDIH5EJjT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="358286130"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400";
   d="scan'208";a="358286130"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 12:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="706566180"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400";
   d="scan'208";a="706566180"
Received: from crkwon-mobl1.amr.corp.intel.com (HELO [10.212.250.160])
 ([10.212.250.160])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 12:50:53 -0700
Message-ID: <c1c55305-127f-f100-5372-03e84293c0d5@linux.intel.com>
Date: Tue, 30 May 2023 14:50:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 0/5] ASoC: minor cleanup for soc_get_playback_capture()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
References: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PQWOUMJEU35V5SA5ICBOOKDN7OI3MY7U
X-Message-ID-Hash: PQWOUMJEU35V5SA5ICBOOKDN7OI3MY7U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PQWOUMJEU35V5SA5ICBOOKDN7OI3MY7U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> This is minor cleanup patches for soc_get_playback_capture().
> 
> Link: https://lore.kernel.org/r/87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/87353uqjiu.wl-kuninori.morimoto.gx@renesas.com
> Link: https://lore.kernel.org/r/ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.intel.com
> 
> Kuninori Morimoto (5):
>   ASoC: soc-pcm.c: indicate error if stream has no playback no capture
>   ASoC: soc-pcm.c: use dai_link on soc_get_playback_capture()
>   ASoC: soc-pcm.c: cleanup soc_get_playback_capture() error
>   ASoC: soc-pcm.c: use temporary variable at soc_get_playback_capture()
>   ASoC: soc-pcm.c: tidyup playback/capture_only at soc_get_playback_capture()

Very nice cleanup, thank you Morimoto-san for splitting the steps in
different patches to make the changes simple to identify.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

FWIW test results can be found at the following link (no new issues
found) https://github.com/thesofproject/linux/pull/4392
