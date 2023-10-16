Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 585337CA1A7
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Oct 2023 10:31:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEBD584A;
	Mon, 16 Oct 2023 10:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEBD584A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697445089;
	bh=CNsjuXm09X0LsVgBmQ/f7525rcIVLaobEisZC9AgWX8=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jCHMaIdtEyShwNgKTElqmbxnK/2AxAj33yk9YJtylVus9OCYnPCwxvNGjaBTkuA85
	 uQEhNM9cIe0ZPmZ/Vfov6o9lRIqcpUtrGfvl4rntMzZXeMs1Kb7EN6CDkIHwXedqBL
	 0l8kGJFsxAIJrj0b4ZH0708yZi4ZTIFsHjS3ZqR8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31C79F80553; Mon, 16 Oct 2023 10:30:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9B70F8024E;
	Mon, 16 Oct 2023 10:30:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D909F8025F; Mon, 16 Oct 2023 10:30:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FF79F8019B
	for <alsa-devel@alsa-project.org>; Mon, 16 Oct 2023 10:30:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FF79F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20230601.gappssmtp.com
 header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=vY4xoXXn
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507a772ed97so1737144e87.3
        for <alsa-devel@alsa-project.org>;
 Mon, 16 Oct 2023 01:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697445022;
 x=1698049822; darn=alsa-project.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=D8XjwDxZOZEey7Y6QYAEu1sLFbhktqi01nN1Vd7CFQ8=;
        b=vY4xoXXn2G+YVwo/wMMBoL4vjyz0O5F8zmgVFblhZWzJDX9gV/ThTcln9aJDwTBxHq
         JZYF8R2pvmbFPn/tvDG/YupHRfyS5FjECLw4gzwe2JhVCyoWlbFiM1WQKlbwSakAkC4B
         jgig0aF4dBe1WM2H6SwL8pyVnvzCnu1TQwaWBnpwXTEw6sygIyPZuSXrPjPmhkoCch9+
         dFvP8r1dgPQysxZuEt8ISlquxmrA3DyaEbd1tm2DF3r3RBmYR9QeEG7ytExWlIDxCISC
         JhqoRYPD/W9ANggCCO3tg71pKAdAe1FXZsynd31CfxQfcdYr070UuIZUq0ZgkzqBrLfa
         5eZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697445022; x=1698049822;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8XjwDxZOZEey7Y6QYAEu1sLFbhktqi01nN1Vd7CFQ8=;
        b=V53VXmd9er+0glTfOn6AOw2NKo271GpbcCGk5Xv7C3/gBTXHDttTEoD1ZLzSMMVsrv
         0ZMtUFhdWtzHnIr5a01ZfTqtemVyRKmIhWQs9orgCbmo5i/BDnH0+iKuf0BpLMfpxkCS
         bx+t+/5ye2Y9EqydvBjWYrAVp8WrmWzlZpSFN+JHKzfi5I5BiWe6VCsuyqhX4GjBn7se
         h/G3CWtEOXeAhQdCFHQzyXRsedhf5ld2g00ZOBFZxSsKujeCA+4P1WzDTG1jX9AgOIX5
         vm0p31+EDUyc9enno5N6HigUQhZADVd3RQR+bGgAyT5tQxqqy8WDqIc4CDXiDNzynwEy
         oc8A==
X-Gm-Message-State: AOJu0YyZ4GK8Etn9zS3VHC5TIu5Ptadmpc2aOg6V8GV3fOC1Tfj41iJa
	M4wLydxdK6XhcnZDmJbuWRPppQ==
X-Google-Smtp-Source: 
 AGHT+IHCIZNdpTR8OpaSokrSzuyZWQhcZfbPr+YVBhq2/WT/Vff/l3/4yw2ge4wwy/aAFBBQIkMlAA==
X-Received: by 2002:a05:6512:31d2:b0:500:acf1:b432 with SMTP id
 j18-20020a05651231d200b00500acf1b432mr32294297lfe.63.1697445022323;
        Mon, 16 Oct 2023 01:30:22 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d161:b45d:c978:eb94])
        by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c488600b00405ee9dc69esm6442108wmp.18.2023.10.16.01.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 01:30:21 -0700 (PDT)
References: <87zg0jwdnz.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.8.13; emacs 29.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Pierre-Louis
 Bossart <pierre-louis.bossart@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 bard.liao@intel.com, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
 <robh+dt@kernel.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/4] ASoC: makes CPU/Codec channel connection map
 more generic
Date: Mon, 16 Oct 2023 10:25:28 +0200
In-reply-to: <87zg0jwdnz.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1j5y37vujm.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: BITJIFKZPFT6BYJ3UFQBGTQ33WRR2ZRC
X-Message-ID-Hash: BITJIFKZPFT6BYJ3UFQBGTQ33WRR2ZRC
X-MailFrom: jbrunet@baylibre.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BITJIFKZPFT6BYJ3UFQBGTQ33WRR2ZRC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Mon 16 Oct 2023 at 01:37, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Hi Mark
> Cc Bard, Pierre-Louis, Jerome, DT-ML
>
> This is v4 patch-set.
>
> Current ASoC is supporting CPU/Codec = N:M (N < M) connection by using
> ch_map idea. This patch-set expands it that all connection uses this idea,
> and no longer N < M limit [1].
>
> Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com [1]
>
> This patch is tested on Audio-Graph-Card2 with sample dtsi,
> but needs Tested-by, at least from Intel.

Checked for no regression on the Amlogic axg-card with DPCM and codec-to-codec
links. Also checked no regression for multi-codec links with codecs
doing playback only and capture-only on the same link.

Looks good.

Tested-by: Jerome Brunet <jbrunet@baylibre.com>

Thanks for the notification Kuninori-san.

>
> v3 -> v4
> 	- add Jerome on To
> 	- add "description" on "ch-maps"
>
> v2 -> v3
> 	- tidyup comment
> 	- use more clear connection image on DT
> 	- "ch_maps" -> "ch-maps" on DT
> 	- Add DT maintainer on "To:" for all patches
>
> v1 -> v2
> 	- makes CPU/Codec connection relation clear on comment/sample
> 	- fixup type "connction" -> "connection"
> 	- makes error message clear
>
> Kuninori Morimoto (4):
>   ASoC: makes CPU/Codec channel connection map more generic
>   ASoC: audio-graph-card2: add CPU:Codec = N:M support
>   ASoC: audio-graph-card2-custom-sample: add CPU/Codec = N:M sample
>   dt-bindings: audio-graph-port: add ch-maps property
>
>  .../bindings/sound/audio-graph-port.yaml      |   8 +-
>  include/sound/soc.h                           |  66 ++++++++-
>  .../audio-graph-card2-custom-sample.dtsi      | 138 +++++++++++++++---
>  sound/soc/generic/audio-graph-card2.c         |  29 ++++
>  sound/soc/intel/boards/sof_sdw.c              |  14 +-
>  sound/soc/soc-core.c                          |  85 +++++++++++
>  sound/soc/soc-dapm.c                          |  47 +++---
>  sound/soc/soc-pcm.c                           |  73 ++++-----
>  8 files changed, 368 insertions(+), 92 deletions(-)

