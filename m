Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F587B803A
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 15:08:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D6A684B;
	Wed,  4 Oct 2023 15:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D6A684B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696424895;
	bh=a2fdMuntzv5YAth2tcOATyGOhQ50h9WmHxxpzK4g3gM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AW9ouePAN8BqW0wD+YPjXtx0nX0wbOfb53i5jNdkL0nIxrgZ23T3eIdLzMNLP1CEU
	 w8dTxWwJlO0SM/Gm6GE/0uC2MyU02tvBze1+8O/uZnUCqwjfylJpNU5BbP5Ni0F2yZ
	 rVWFL+W66uGJlzU+21KOWLxwNcqn35IT3P+wOfSs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74ACAF80558; Wed,  4 Oct 2023 15:07:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25392F80310;
	Wed,  4 Oct 2023 15:07:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14615F8047D; Wed,  4 Oct 2023 15:07:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C59DF80130
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 15:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C59DF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Qx2//NFp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696424837; x=1727960837;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=a2fdMuntzv5YAth2tcOATyGOhQ50h9WmHxxpzK4g3gM=;
  b=Qx2//NFpn7pkU05DB7WtYQArSzVRZAiDwEAabOtgjfNt0xHoGjRaXYBS
   LFe3B/3+dW91UuKL3jv/lKaosMrc4pphGmAl4D5NbjZ1xqr3FqdokIwIM
   T2p35eTACJ2a1zX0Xh0/l06xaWF79MU71s4g9pc0SlFXeJ2HxLEHUoPB4
   JwDfutsYkyBnCwEM7qAPEMFnM89SVsfYHN1GNYRoGumZct8ElqRXlUA9c
   cbIL+Ot9J+P6x4VpXf9PT07T9jxZb/dRpC43b8qGEmXNhOYhudiV+ke60
   3+YF645nWhq0qsn2BPmdWaDCx5H0eRrhewakGGc0TQP7mD/nw7by54ihU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="414080588"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200";
   d="scan'208";a="414080588"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 06:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="744966509"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200";
   d="scan'208";a="744966509"
Received: from mfmousa-mobl1.amr.corp.intel.com (HELO [10.212.98.56])
 ([10.212.98.56])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 06:06:49 -0700
Message-ID: <6c249580-ccdd-453f-9051-ca2a32dc4189@linux.intel.com>
Date: Wed, 4 Oct 2023 09:06:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: soc-pcm.c: fixup validation check of multi
 CPU/Codec on soc_get_playback_capture()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Jerome Brunet <jbrunet@baylibre.com>
References: <87il7mg69z.wl-kuninori.morimoto.gx@renesas.com>
 <87h6n6g69d.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87h6n6g69d.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2QIGAYB4VM3UK5VI6K3MHBAPYZA3L555
X-Message-ID-Hash: 2QIGAYB4VM3UK5VI6K3MHBAPYZA3L555
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2QIGAYB4VM3UK5VI6K3MHBAPYZA3L555/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Morimoto-san,

> Current soc_get_playback_capture() are checking validation of CPU/Codec
> like below
> 
> 	static int soc_get_playback_capture(...)
> 	{
> 		...
>  ^		if (dai_link->dynamic || dai_link->no_pcm) {
> (X)				...
>  v		} else {
>  ^			...
>  |			for_each_rtd_codec_dais(rtd, i, codec_dai) {
>  |				...
>  |				if (snd_soc_dai_stream_valid(codec_dai, ...) &&
>  |				    snd_soc_dai_stream_valid(cpu_dai,   ...))
> (Y)(a)					has_playback = 1;
>  |				if (snd_soc_dai_stream_valid(codec_dai, ...) &&
>  |				    snd_soc_dai_stream_valid(cpu_dai,   ..))
>  | (b)					has_capture = 1;
>  |			}
>  v		}
> 		...
> 	}
> 
> (X) is for DPCM connection, (Y) is for Normal connection.
> In Normal connection (Y), it is handling CPU/Codec, and it will set
> has_playback/capture = 1 at (a)(b), but it means today is "at least one
> of CPU/Codec pair was valid" in multi CPU/Codec case.
> 
> This is wrong, it should be handled when "all CPU/Codec are valid".
> This patch fixup it.

I knew this code looked familiar and sure enough we've been there before
in 2020. This code was introduced by

4f8721542f7b ASoC: core: use less strict tests for dailink capabilities

the initial stricter tests caused a number of regressions reported by
Jerome Brunet so we lowered the bar from "all dais" to "at least one
dai" to be backwards-compatible.

I don't think we can revisit this without hitting the same sort of issues.

Regards,
-Pierre
