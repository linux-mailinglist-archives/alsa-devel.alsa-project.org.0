Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FF48C683F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 May 2024 16:05:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FA92EC0;
	Wed, 15 May 2024 16:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FA92EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715781937;
	bh=Is9J5YRpNzvklFE+cfQ23ylGaJ3nXqCLhHCxIrAy0f4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b1PbHG/pSB6uyUyGufsHAzgs8gctHyB2CAE/JHs9o4+qXZMem7hr62WTPWqJy6TXp
	 Ox1nlLMmvacYPhj4UGUTg0NJ/KMWt0/NwX+ia//TjW4zhP1+C7xf7EtkfXg+h+fcVm
	 8GdxgNJTWSbN0PBFvrlduJhImqEEoaPtdzay+FR4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9963F80580; Wed, 15 May 2024 16:05:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05C74F80579;
	Wed, 15 May 2024 16:05:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63741F80224; Wed, 15 May 2024 16:04:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F29DF800F5
	for <alsa-devel@alsa-project.org>; Wed, 15 May 2024 16:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F29DF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KhgEh1OD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715781895; x=1747317895;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Is9J5YRpNzvklFE+cfQ23ylGaJ3nXqCLhHCxIrAy0f4=;
  b=KhgEh1OD7mUd3XezCCRFjN2uG8gbY9YbWPSDpohucxHQN58/kKcJvENX
   FA7FKjdPykNRGYdbkjkMXBD3guJ54kgaE+kdUEj33vH3UpBcBH6Q5E9xS
   eSnddCuOaXF1MLTS09n4denVzxyW+gbw6u8C6aa8/0L9zvtAk71t03Dfr
   q5An+XmtCc7URGE7vTcV/S1H7DryNfbKpDACubMK1ujjn1ivurxFtp1In
   pIJwe86lXa9/4TCKf3meA1fnKpELSgRowYooFEc2wDPwFBJD2AsswKfM2
   E3BSzk/GAbRn0XPhe9QznEL5N3/XI7qcNc8bo8EhSV95tU8VzeRARzmVi
   Q==;
X-CSE-ConnectionGUID: 14KkgDB9QRaQ/Evc0KmnuA==
X-CSE-MsgGUID: 5W3kCZrfSkOwp2LeB+QAzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23234030"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000";
   d="scan'208";a="23234030"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 07:04:44 -0700
X-CSE-ConnectionGUID: ureli23YTFOv+UNUpcaPtw==
X-CSE-MsgGUID: 4mxvp+5zQbCHGtglpG+BDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000";
   d="scan'208";a="35778478"
Received: from wtcline-desk12.amr.corp.intel.com (HELO [10.125.108.49])
 ([10.125.108.49])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 07:04:42 -0700
Message-ID: <4170720a-f7bb-484e-9235-a8720cec92c1@linux.intel.com>
Date: Wed, 15 May 2024 09:04:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
To: Jaroslav Kysela <perex@perex.cz>, Shengjiu Wang
 <shengjiu.wang@gmail.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.de>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
 <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk> <20240430172752.20ffcd56@sal.lan>
 <ZjGhPz-bokg6ZbDJ@finisterre.sirena.org.uk> <87sez0k661.wl-tiwai@suse.de>
 <20240502095956.0a8c5b26@sal.lan> <20240502102643.4ee7f6c2@sal.lan>
 <ZjRCJ2ZcmKOIo7_p@finisterre.sirena.org.uk> <20240503094225.47fe4836@sal.lan>
 <CAA+D8APfM3ayXHAPadHLty52PYE9soQM6o780=mZs+R4px-AOQ@mail.gmail.com>
 <22d94c69-7e9f-4aba-ae71-50cc2e5dd8ab@xs4all.nl>
 <51408e79-646d-4d23-bc5b-cd173d363327@linux.intel.com>
 <CAA+D8AM7+SvXBi=LKRqvJkLsrYW=nkHTfFe957z2Qzm89bc48g@mail.gmail.com>
 <cd71e8e8-b4dc-40ed-935e-a84c222997e6@linux.intel.com>
 <CAA+D8AMpLB0N++_iLWLN_qettNz-gKGQz2c2yLsY8qSycibkYg@mail.gmail.com>
 <2f771fe9-7c09-4e74-9b04-de52581133fd@linux.intel.com>
 <CAA+D8AMJKPVR99jzYCR5EsbMa8P95jQrDL=4ayYMuz+Cu1d2mQ@mail.gmail.com>
 <28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <28d423b1-49d8-4180-8394-622b1afd9cd9@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JHB3RYKNHT4HABW2BHEYK6PXIREC4K7V
X-Message-ID-Hash: JHB3RYKNHT4HABW2BHEYK6PXIREC4K7V
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JHB3RYKNHT4HABW2BHEYK6PXIREC4K7V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/9/24 06:13, Jaroslav Kysela wrote:
> On 09. 05. 24 12:44, Shengjiu Wang wrote:
>>>> mem2mem is just like the decoder in the compress pipeline. which is
>>>> one of the components in the pipeline.
>>>
>>> I was thinking of loopback with endpoints using compress streams,
>>> without physical endpoint, something like:
>>>
>>> compress playback (to feed data from userspace) -> DSP (processing) ->
>>> compress capture (send data back to userspace)
>>>
>>> Unless I'm missing something, you should be able to process data as fast
>>> as you can feed it and consume it in such case.
>>>
>>
>> Actually in the beginning I tried this,  but it did not work well.
>> ALSA needs time control for playback and capture, playback and capture
>> needs to synchronize.  Usually the playback and capture pipeline is
>> independent in ALSA design,  but in this case, the playback and capture
>> should synchronize, they are not independent.
> 
> The core compress API core no strict timing constraints. You can
> eventually0 have two half-duplex compress devices, if you like to have
> really independent mechanism. If something is missing in API, you can
> extend this API (like to inform the user space that it's a
> producer/consumer processing without any relation to the real time). I
> like this idea.

The compress API was never intended to be used this way. It was meant to
send compressed data to a DSP for rendering, and keep the host processor
in a low-power state while the DSP local buffer was drained. There was
no intent to do a loop back to the host, because that keeps the host in
a high-power state and probably negates the power savings due to a DSP.

The other problem with the loopback is that the compress stuff is
usually a "Front-End" in ASoC/DPCM parlance, and we don't have a good
way to do a loopback between Front-Ends. The entire framework is based
on FEs being connected to BEs.

One problem that I can see for ASRC is that it's not clear when the data
will be completely processed on the "capture" stream when you stop the
"playback" stream. There's a non-zero risk of having a truncated output
or waiting for data that will never be generated.

In other words, it might be possible to reuse/extend the compress API
for a 'coprocessor' approach without any rendering to traditional
interfaces, but it's uncharted territory.
