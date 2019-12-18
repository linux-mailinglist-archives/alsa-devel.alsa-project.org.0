Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B34C9123E04
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 04:38:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 366DF1616;
	Wed, 18 Dec 2019 04:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 366DF1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576640310;
	bh=SeaR6grgd2pkVi+IquIn25Xri39jspFr7f0x8jlAJCE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t66LYFA6Zl6IlfioiTmQsGhvcRP00+eKqqFXPhVGC6S/fPfLOae3ICNZWLxEYeex6
	 l6Tv+QHWyogHh1K4bQOVcRLkWDTe1DjjfHTUWGTQW8UYXUkuaABefck2IlMZC29jn4
	 3L1v87rtE81GoE33M8TFKiY2N8dyRNGxgkBwctsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2DEBF8015A;
	Wed, 18 Dec 2019 04:36:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B5E5F8022C; Wed, 18 Dec 2019 04:36:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B859F80088
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 04:36:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B859F80088
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="vF21/TtM"
Received: by mail-il1-x143.google.com with SMTP id z12so441446iln.11
 for <alsa-devel@alsa-project.org>; Tue, 17 Dec 2019 19:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CnYTb+9t2ovGeaxGLwF94Dm7GkR19rJnLOt2oiTdReg=;
 b=vF21/TtMZNi/ZMyQixM/mpn5QWfIfv3gUc01VuMmHrOUhSWzTfupltCRSfgn5ew4Lz
 wg7pNhtGUOYsFO6V7jj4EumB4Wl3XnKKuA8pPLN/iQb5WMegNf5kQGGLb1DkA04RfSxx
 Fjqi/JDWFPALBagpjeqS/GnGW298TsoNmC4MJitqsAO6JiLcizBy5YzhpdbUfoDlJzRo
 MOA+MoN4NPPkBqIcU8uodurYe58MCa8I0dO3C0KYsYKK7Mkh+gZ+o5D33AKCd5ZfrqHl
 7yXRgdgp6RWkJhw3F2Xj9xOBWizxo2zA0c9GaywajJx7+E9c4Jyp+MAdelPKsxXF5lsL
 ODTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CnYTb+9t2ovGeaxGLwF94Dm7GkR19rJnLOt2oiTdReg=;
 b=lO7DBdskXWwW4EslBn0La+KcDr0I6zGzHbfI+CMA694+F/dMIF4E7Fync2iqvYbyE3
 Px90UNVXF+QtALpAfNmYNL64+Jjw7spnExDUP071hFT79zXOinhBZuURgW2IMpXZcKi9
 2v+iS2an4w9XJHj52BHyR3hmwM7FLVsY2tVFNvW2a/+gkqS4dhiyF/1ey+B0etYkfz14
 j6baDa46vcbIqXV+v24zjL9x1DZkryj+H65AyTgZ9TERz5qgHZlzLG3C+JzkANTRoFZT
 KRcS5NVQ0vRdFTdc1F5DAw0M/X+IQE0RcN0WSTF8AvNxzYBc7ZsFyRXbxsXFvXfpBlit
 Mj2Q==
X-Gm-Message-State: APjAAAUF8reyziBvbkTiQrVTq60RVdscN2YUgunPwV4/9NxXS0L3CR+S
 GI8pvFzL5M+428zsC4e8DAe909BEnIG5F2xioYP5YIyI
X-Google-Smtp-Source: APXvYqyhg7Edjg1U802yWyhdI3xf9sJxivcUaWTy8r62ElO8qg6yIsh0Djlm+GfI9ig8ND17rG9MWGQvz7TL4YQcYi0=
X-Received: by 2002:a92:911b:: with SMTP id t27mr1203934ild.142.1576640200841; 
 Tue, 17 Dec 2019 19:36:40 -0800 (PST)
MIME-Version: 1.0
References: <87r212jqt1.wl-kuninori.morimoto.gx@renesas.com>
 <87o8w6jqrk.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o8w6jqrk.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Tue, 17 Dec 2019 19:36:30 -0800
Message-ID: <CAFQqKeWWdwCMEO9idW4sANYio3y1ye3Q3okbOEd=zwYrRXDSYg@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 2/7] ASoC: soc-core: care
 .ignore_suspend for Component suspend
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Dec 17, 2019 at 6:47 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Card dai_link has .ignore_suspend, and ALSA SoC cares it when suspend.
> For example, like this
>
>         for_each_card_rtds(card, rtd) {
>                 if (rtd->dai_link->ignore_suspend)
>                         continue;
>                 ...
>         }
>
> But in snd_soc_suspend(), it doesn't care about
> it when suspending Component. This patch cares it.
>
Morimoto-san,

I am a bit skeptical about this change but I could be wrong. I am not sure
if the ignore_suspend field in the DAI link definitions was meant to be
applicable for the components as well.
Mark/Takashi would have to confirm this.

Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
