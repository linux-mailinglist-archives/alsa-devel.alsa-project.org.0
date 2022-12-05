Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E75436426B4
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 11:31:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6845C1768;
	Mon,  5 Dec 2022 11:30:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6845C1768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670236269;
	bh=Z6CCJ9YNKmdbvg4ggDzZNHzqzYDEoIdc5sNJ/Si1Cks=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MxV2pOxsoGzYmKvfBG1HEJ8qk+qi2MJiUVj3qsiHX96gzBoWbnM90n24UU5Hf00l0
	 ciyOKPVZhX4LLH0DrvvyUravXSaHJrBgiQUJRShYpaqjO6r6fuUBqZPFoM3xTQnlvb
	 RlvkK35WdbMeK8qTRqgvy2dCg5rtu4z81rvjDctg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E87FBF8047C;
	Mon,  5 Dec 2022 11:30:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70CF0F80236; Mon,  5 Dec 2022 11:30:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91533F8014C
 for <alsa-devel@alsa-project.org>; Mon,  5 Dec 2022 11:30:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91533F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf.com header.i=@semihalf.com
 header.b="aSGlm8gw"
Received: by mail-pj1-x102a.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso10956956pjb.1
 for <alsa-devel@alsa-project.org>; Mon, 05 Dec 2022 02:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semihalf.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pt6ey/r1Q85xspUIoNqi9Ctgej9PX93kA8uf6GD+v4=;
 b=aSGlm8gwgWPJcZANXDSQ8olBeyMxTGe5evn8SNp7K+YQ4SNTwWliF5WCZhfgr7XLrn
 9tECkbp5PDWTnF/H4l20Nyj6XeeDBrGfeal/QEZb7ZktQOl5pvEnlkzVH8CdexlU/8DJ
 bajNy76ZsDFeQihwsWRVLxNHrN8H0jp4ixgDmMvw0KN0p+6GXJy/cFMjRBANp9mEwaeH
 GJZaNE4LHOEJbZYQ0EaGnsWD68dtQtgfUNiM60fwppaM3bmHSaspw5kL8DbxVyT1wK+L
 Kxe4v0QOzTKNrhGfovJKfa3MzGCOhmSmo8O4PGpaxyc2qc7VZ1DiH1Ozo5GUCFazjoz2
 Av3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pt6ey/r1Q85xspUIoNqi9Ctgej9PX93kA8uf6GD+v4=;
 b=7xhtuZUWlVeZMjekI70xdLmykVE/L60qpbAIWv1j59V7pQ6H3w1DUGKe40RXDl8/tV
 jUlczJpMDUkHs/FjceFu8jojpUGekCZNc/PPyu/6YCfSax+iLzsEsZf+Y4a3CM03I4ff
 Dv2FTjhASzkNA0WK/aVdETDwbAJ7ccycKw/zuBz0Eyr5Y4A968RdYseN4lJU1RWku2t7
 PFqymdJrEHElNYezhviQn1P28gkAr19thUZmPUaWdYHas2XPaG3PaDW36eYsADBjQdsQ
 NIbbttCj10E0fPpjJIJAQP8jR771Zaa3H0RhRJtOf5bmNQD+Y0SJZJfSWUvekoYRy2Th
 C+EQ==
X-Gm-Message-State: ANoB5pkEEY7XucV4wBMFoEGCH4Ct0jZxm9N/x7ysKip8t5GnNmnLWs42
 TINAmwv1OWAFhKf4vbO+ptF6nY733dK9w1N1lfv6/Q==
X-Google-Smtp-Source: AA0mqf4E+fu5DLYCAioJLwWBPAu7HLWQI9QZQTW7NLaeyf9UrraSNUCjBRlZSUG+oE8MTTeYHQE9dg58qt5F9mVZOJQ=
X-Received: by 2002:a17:90a:ce83:b0:219:e8dc:879 with SMTP id
 g3-20020a17090ace8300b00219e8dc0879mr798248pju.94.1670236201109; Mon, 05 Dec
 2022 02:30:01 -0800 (PST)
MIME-Version: 1.0
References: <20221205085330.857665-1-cezary.rojewski@intel.com>
In-Reply-To: <20221205085330.857665-1-cezary.rojewski@intel.com>
From: Lukasz Majczak <lma@semihalf.com>
Date: Mon, 5 Dec 2022 11:29:49 +0100
Message-ID: <CAFJ_xbpiXknt3-D4znjiLPegUrEMqy2=gR-PignybnDEojgjGQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] ASoC: Intel: Skylake: Topology and shutdown fixes
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 upstream@semihalf.com, rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

pon., 5 gru 2022 o 09:36 Cezary Rojewski <cezary.rojewski@intel.com> napisa=
=C5=82(a):
>
> Even though skylake-driver is going to be replaced by the avs-driver,
> the goal is to keep it functional on all the configurations it supports
> until its EOL. When comparing chrome trees against upstream
> skylake-driver, couple fixes pop up that are not part of upstream
> repository. These fixes are backed up by real bugs (issue trackers),
> address real problems. There is no reason for them to stay in the
> internal tree.
>
> Patches 1-4 combined together address issue where the driver updates the
> presumably static audio format descriptions coming from the topology
> files through its "fixup" functions. As long as given audio format is
> used by a single path, nothing collides and any updates are harmless.
> However, when multiple paths e.g.: DMIC and HDMI1 utilize the same audio
> format descriptor, any updates caused by the opening of the first path,
> may cause the second to fail.
>
> The 5th change from the set fixes driver hang sporadically occurring
> during shutdown procedure. Once HDAudio links are powered down along
> with the AudioDSP, the hang stops reproducing.
>
> The last change helps survive in environments with limited/fragmented
> memory. While the BDL is small already, other buffers can be allocated
> using scatter-gather. This basically aligns the code with what the
> avs-driver does.
>
>
> Changes in v2:
> - no changes to the first 5 patches
> - added patch that I forgot to add in v1
>
> Cezary Rojewski (6):
>   ASoC: Intel: Skylake: Update pipe_config_idx before filling BE params
>   ASoC: Intel: Skylake: Remove skl_tplg_is_multi_fmt()
>   ASoC: Intel: Skylake: Drop pipe_config_idx
>   ASoC: Intel: Skylake: Introduce single place for pipe-config selection
>   ASoC: Intel: Skylake: Fix driver hang during shutdown
>   ASoC: Intel: Skylake: Use SG allocation for SKL-based firmware load
>
>  sound/soc/intel/skylake/skl-sst-cldma.c | 27 +++++----
>  sound/soc/intel/skylake/skl-topology.c  | 73 ++++++++-----------------
>  sound/soc/intel/skylake/skl-topology.h  |  1 -
>  sound/soc/intel/skylake/skl.c           |  5 +-
>  4 files changed, 44 insertions(+), 62 deletions(-)
>
> --
> 2.25.1
>
Tested on a Pixelbook chromebook (Kabylake-Y) with a looped suspend-resume =
test.
No issue observed.

Tested-by: Lukasz Majczak <lma@semihlaf.com>

Thanks,
Lukasz
