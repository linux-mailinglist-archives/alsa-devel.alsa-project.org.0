Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BE02FF22B
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 18:41:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D69671909;
	Thu, 21 Jan 2021 18:40:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D69671909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611250880;
	bh=JqIUWb2Vl0h5NiXpV8MmCSKhB2A6n/8Cf19sk2S2CZw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yzx7RCWi6P0/cJGHvUW2iRi94URjqB/zo7NePu7oOw/pas5VVI2HTzDAt/3twPHf0
	 rRWUsuxjYJbFywYcDAEP3/6PgleIHpj+1jWAQgU3XNxa9azUvMwmrS1WP8DlvUtyco
	 DfEAkIIq9f37xN5bIbX7pwZIjPPFeQFnshSGZQsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37199F80255;
	Thu, 21 Jan 2021 18:39:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07D7AF80257; Thu, 21 Jan 2021 18:39:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B0B8F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 18:39:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B0B8F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=semihalf-com.20150623.gappssmtp.com
 header.i=@semihalf-com.20150623.gappssmtp.com header.b="IuQLdlr4"
Received: by mail-pj1-x1033.google.com with SMTP id cq1so2096137pjb.4
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 09:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=semihalf-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=j6ZxcTRqGjbCO8Rh76YdBV9tEuh4KlqlTS43ZgxAZos=;
 b=IuQLdlr46b4DmTb4HvYsGyufqalktrFc+E7umTNNQxdGPmuPIpdiPae6lstCpAZtgv
 Prz5Pe8tQtzhy+3q+00IHkCLut1D6bqKccyvtJAG7EnCYjQBG6y+Bc+7sT5HwmHm+sea
 PNfchInCN8P2946mZEwDjkMTH77FOMBJHBd0MNeK8Umum9PtD732UKlKl1W9u8yervbP
 KXvwHQVnCqFxxlDnlWXppcfwI1CLNCwiORJ6OcXbhDo0FP3CArxglgJCp8KYDDUCgsdZ
 x2U6HUb1qiRsmr9+z7kw2OkEV1TMceWbvxMPik1hd8150eA0bjAGs8c9dFXaYLjlzCEP
 75Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=j6ZxcTRqGjbCO8Rh76YdBV9tEuh4KlqlTS43ZgxAZos=;
 b=g85/UI/7lozArnUW0P6QsA04tolfppSKtwRLsTo1M9D85fkqU2PKq2qLOUViA5ZiDz
 zMjX2QjGKWCkEu+j/uOUEFhW+6KRiXZewPkLqLTR/AhsuASJiI7NyFWXsKIHr//K0gLY
 RocaoYQ2RDves9UIfFSSCAWUKDMlYYdFlJnsfED1ZS250VWV4ysO771DY+ipEKsBUSTP
 yRN5TabxGszXp0u7rGIWBVerPh70fRh4xYCY2cGPrngnl0LniXlr5hiKAwUQ3mDWKGb7
 LXRIx41xYU29TdhyDG+rhXWpgiT9szZ9ls3QAC3uqcbOpEIWet0YYgCyI1n2WMEbPrjL
 /Gyw==
X-Gm-Message-State: AOAM531VnJAfpQPjm7p4eYCNSzGZOa4l3CY3MoVWJUfS/CRdpJY5rmGt
 6ZOiHI9RxuszbZvd8oP6OXFsJ0tIr58AGV62JYcaHw==
X-Google-Smtp-Source: ABdhPJy+c38Ko0Jal2+UKxBQhycCiPXQ9+bO+GaS7YTRFjIkrPTuac2RSOmcPsnq0BodC7Ls6J2G18vhVjH0HGC2BrU=
X-Received: by 2002:a17:90a:9483:: with SMTP id s3mr510418pjo.85.1611250775055; 
 Thu, 21 Jan 2021 09:39:35 -0800 (PST)
MIME-Version: 1.0
References: <20210121171644.131059-1-ribalda@chromium.org>
 <bb5edb634f69421a87143d3962e67d30@intel.com>
In-Reply-To: <bb5edb634f69421a87143d3962e67d30@intel.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@semihalf.com>
Date: Thu, 21 Jan 2021 18:39:23 +0100
Message-ID: <CAFJ_xbrELkcLWc4-qni7GYn_TtQKGVjKqhZspE11pNJzGOOifg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: Intel: Skylake: skl-topology: Fix OOPs ib
 skl_tplg_complete
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Thanks Ricardo - I have checked it on Eve/Google Pixelbook

Tested-by: Lukasz Majczak <lma@semihalf.com>

czw., 21 sty 2021 o 18:33 Rojewski, Cezary <cezary.rojewski@intel.com>
napisa=C5=82(a):
>
> On 2021-01-21 6:16 PM, Ricardo Ribalda wrote:
> > If dobj->control is not initialized we end up in an OOPs during
> > skl_tplg_complete:
> >
> > [   26.553358] BUG: kernel NULL pointer dereference, address:
> > 0000000000000078
> > [   26.561151] #PF: supervisor read access in kernel mode
> > [   26.566897] #PF: error_code(0x0000) - not-present page
> > [   26.572642] PGD 0 P4D 0
> > [   26.575479] Oops: 0000 [#1] PREEMPT SMP PTI
> > [   26.580158] CPU: 2 PID: 2082 Comm: udevd Tainted: G         C
> > 5.4.81 #4
> > [   26.588232] Hardware name: HP Soraka/Soraka, BIOS
> > Google_Soraka.10431.106.0 12/03/2019
> > [   26.597082] RIP: 0010:skl_tplg_complete+0x70/0x144 [snd_soc_skl]
> >
> > Fixes: 2d744ecf2b98 ("ASoC: Intel: Skylake: Automatic DMIC format confi=
guration according to information from NHL")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Thanks for the fix, Ricardo.
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
>
