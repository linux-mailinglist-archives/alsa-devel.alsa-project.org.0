Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 943F2150FE3
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 19:44:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14F4B1685;
	Mon,  3 Feb 2020 19:44:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14F4B1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580755496;
	bh=GgVd9AhXft2m41bV3bEXKZUAnTA6uicMBaszaGRkkzE=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nqIjrxen/6WxyGXeaFAjJ/Yv0qY6Sfw/UJqUjji3nRmjml+6dA5S1qSQP0rrYHmpm
	 XvRv6/qdkoYCkzDx31GEQkWdk2hFrorf6BbRnWIKjem1dtbxLpqfm96NPqrFdlavx+
	 k43fWISZ78Fb4P/LlS655LP7G3OyOXMD4bwTXXFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03C7BF80142;
	Mon,  3 Feb 2020 19:43:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10E33F80148; Mon,  3 Feb 2020 19:43:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 559A8F800B8
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 19:43:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 559A8F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Yo1y1Xav"
Received: by mail-qk1-x744.google.com with SMTP id q15so15223160qke.9
 for <alsa-devel@alsa-project.org>; Mon, 03 Feb 2020 10:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4PMgClN19IhUmet8zzgKP6n4a6viDIBm9kvnRUtH3mA=;
 b=Yo1y1XavCUEy1wE5P7+cmjzPnnfg1oFVKZVmBL5dtthCguCkZ1WQnpf2YAC7eHPaDm
 LAIKxbOy+zNgxZgCta9TGT+psszC8jdSUX+mmFt4blUWtcmCkMJVzzsTh65pnXnuuFti
 F2uSLrsCNrlosOXGbZRwweYEiSo/SJzkncSnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4PMgClN19IhUmet8zzgKP6n4a6viDIBm9kvnRUtH3mA=;
 b=MuioU/Z+gW3CT3XHw8AmtTA/vZFz9y7GH3YrnxNkpGD85TCOVg0tZa89N/bURBQUzS
 zXPW2xD9BbzRIKf//s7pnCaDu04arzigLg6MXCGFLSI4SsB8FSKRli+ssD0V3WLEE8eF
 QLL6tuG4Xp0jHR2hbP+O3lVfWNNiajMHqlcOG8Mat1vqItlvVJYC2oPS8B9c7Cbm3Rh3
 goqcz63In4TDeffpUj0uV0qqqH4KqhQQfPzEfwwqekUqesYSHYQq6bTVFvLqBryO/vVV
 z5+nDFF5Tq6uqRzjoee7KLoKVWZQv/KWuhJfoDg0qsZzsn6FJ7isQD6+mBmtvWtM6Nx/
 Sasw==
X-Gm-Message-State: APjAAAXaU+OgmZ1DHhzrTySKgbc/XGqoMourt4E2fj7kmI9kOBq5Ek8E
 VOO908fH/8A99J31jzh+BRJEnpZ4WMuk0AnNaP0ZXA==
X-Google-Smtp-Source: APXvYqw1bX0A3kJ4KvUVv86WXufvnleEdtH4TO5zCbHUJmtjESA5AF1NOa9A9O2Tbs2y01O4QjbPgw6zzCm91hZD6E4=
X-Received: by 2002:a05:620a:2218:: with SMTP id
 m24mr25211961qkh.442.1580755381994; 
 Mon, 03 Feb 2020 10:43:01 -0800 (PST)
MIME-Version: 1.0
References: <20200130203106.201894-1-pmalani@chromium.org>
 <20200130203106.201894-12-pmalani@chromium.org>
 <20200201110358.GR3897@sirena.org.uk>
In-Reply-To: <20200201110358.GR3897@sirena.org.uk>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 3 Feb 2020 10:42:51 -0800
Message-ID: <CACeCKaf2=_6jEaUSKgEiucmO4KNgQu7F-P2Po=UjLdfXZwm_Bg@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <groeck@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH 11/17] ASoC: cros_ec_codec: Use
	cros_ec_send_cmd_msg()
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

Hi Mark, thanks for looking at the patch. Please see inline.

On Sun, Feb 2, 2020 at 4:00 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jan 30, 2020 at 12:30:56PM -0800, Prashant Malani wrote:
> > Replace send_ec_host_command() with cros_ec_send_cmd_msg() which does
> > the same thing, but is defined in a common location in platform/chrome
> > and exposed for other modules to use. This allows us to remove
> > send_ec_host_command() entirely.
>
> I only have this patch, I've nothing else from the series or a
> cover letter.  What's the story with dependencies and so on?
Sorry about that. I will add you to the cover letter for subsequent
versions (I followed https://lwn.net/Articles/585782/ but I think it
only adds the relevant mailing lists to the cover letter...)
Just for reference, the cover series LKML link is here:
https://lkml.org/lkml/2020/1/30/802

Best regards,
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
