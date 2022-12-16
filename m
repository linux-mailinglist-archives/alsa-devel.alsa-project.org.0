Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FD964EFE5
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Dec 2022 17:58:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0273170B;
	Fri, 16 Dec 2022 17:57:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0273170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671209925;
	bh=5zhmf6Dfjb+BFJ2OR40VbH62P7bDdRoDv8HAoFwlFng=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lM8UOAH0ZxuN9EK6hzbRP68Yi8riTz6jzZ0jPTW0EWqZaYSrTx8Aouw08rs2w3eMr
	 brjnqngeoSrPpKYtsewsRso26jiZTRX6/AfHtANE1VNiHOC6X/9ygfrG+I77CQlklr
	 QQH8mZJnF0ENrfb0m28PhbiOmMKa3sClFboTmbCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F4A8F804D0;
	Fri, 16 Dec 2022 17:57:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BBA0F804E2; Fri, 16 Dec 2022 17:57:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3C5EF804D7
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 17:57:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3C5EF804D7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=HYg9RW0J
Received: by mail-yb1-xb34.google.com with SMTP id c140so3002492ybf.11
 for <alsa-devel@alsa-project.org>; Fri, 16 Dec 2022 08:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XtYFkDhReWBsCeUioaJC13GshaZLOuRIue5LEWshyfY=;
 b=HYg9RW0JMDQl3jsWznNXJ4PBNDDc8yajCgxG7D2P8HoCCU9IJSHyCYoe441jXf4b4b
 o8xQGMwsbRm0iocLcHGeP8ccR8ovbmJOWteC7WRZRYzLrW3WWVxkJlhG670C9fowh/Vn
 qN6mIsqNbHxuQEhNyyoAqo3XSla0wS9xNxKyxPL+IW45WQ5bTMUquaWaeuY2k5HIDsWv
 0X8R+Zr4W8soDrV+YOnoPDT1JBdbyPhtNNmFNneluIWGFNGsQxOrPL3f7WhnlU2D9Mwe
 dfMGwfxyiSj9TV0GQpZJLLnCFZ2oY1+P+fgr263viELuzdorUuAAXahzjcLmjPxAZweV
 07zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XtYFkDhReWBsCeUioaJC13GshaZLOuRIue5LEWshyfY=;
 b=odn/OuuugWmh+x5uUgaagZ2bYt/Us+DFqZdGYSJR/xzIq49lKuYe21LRnQ1M0zMd6u
 cm7uDoE+ZM90N9xPjDKzDs/ci8UzV/mNePSeokNsBPTAKDjDsWvOqZuQXXH9YIU/5NLi
 35bmazyiM6B1khugMI1YAk204sJ+vpuAn98fjVmt8c4YkK7+bPWb4D2eX4AYFoVqnk2T
 WZabj8Ys5cW4HOQqfmBDE1DiL5X1nvYK/MTwq1+Uhi+sO5yxmIDAeWVJjOez4FytgTbJ
 CYzKMo0oVpjM18vdktmgcCK3e9l4jeacYtjkBU/SiNAxwRHhMAwxiDCVwZ14l6C8JdVe
 MnvQ==
X-Gm-Message-State: ANoB5pkU/ousj/MynDOjvetVkHesHadu8jO9fGWgOmGAB3zvxfiIgrMJ
 aYymlo6IQVcO3yKh+30YP9VoD3Bhv7WM2RVNByNHHA==
X-Google-Smtp-Source: AA0mqf5Rrhd258RsDsUxljUaF/shuM6d9GJaesELzHST8ajJvjwROAa03gy2ef94K/ZvQcw+VVOY8FfulNKfcOHav8c=
X-Received: by 2002:a25:d4d5:0:b0:70d:f50c:29ad with SMTP id
 m204-20020a25d4d5000000b0070df50c29admr5212530ybf.265.1671209862956; Fri, 16
 Dec 2022 08:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20221216154938.9426-1-ajye_huang@compal.corp-partner.google.com>
 <CALprXBYwNaHCe+EO9G_SvWg2HNVAz62KzaaxGCb1PssJshXUzQ@mail.gmail.com>
 <f479858c-b7dd-5af6-c0f1-c119737a7cc0@linux.intel.com>
In-Reply-To: <f479858c-b7dd-5af6-c0f1-c119737a7cc0@linux.intel.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Sat, 17 Dec 2022 00:57:31 +0800
Message-ID: <CALprXBbjb8DRuKu9RFxmKJHgc57++wrWXmj_g4wdZ+YCna78eQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: sof_nau8825: add variant with nau8318
 amplifier.
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Libin Yang <libin.yang@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, "balamurugan . c" <balamurugan.c@intel.com>,
 Mark Brown <broonie@kernel.org>, Muralidhar Reddy <muralidhar.reddy@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, David Lin <CTLIN0@nuvoton.com>,
 alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Brent Lu <brent.lu@intel.com>, Yong Zhi <yong.zhi@intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

HI Pierre-Louis,

On Sat, Dec 17, 2022 at 12:06 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:

> You can add those directly in the patch, below the --- marker, e.g.
>
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>
> changes from v1->v2:
> * Modify title and add explanations in commit messages .
> * Use new topology file "sof-adl-nau8318-nau8825.tplg" instead of
> sof-adl-max98360a-nau8825.tplg.
>
>  sound/soc/intel/boards/Kconfig                |  1 +
>  sound/soc/intel/boards/sof_nau8825.c          | 23 +++++++++++++++++++
>  .../intel/common/soc-acpi-intel-adl-match.c   | 12 ++++++++++
>  3 files changed, 36 insertions(+)

Yes, it is really better, thanks for letting me know.
