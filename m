Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C324014AE11
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 03:25:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 325E715E5;
	Tue, 28 Jan 2020 03:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 325E715E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580178323;
	bh=rN5qn72nVfglzvMa6TBMMkSK0KzpiL4AJzpWRUGz3Qc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XVEkgSyGegJCGbFuIWvzW6gv0MTavY3EwD5+WjpIFqaPN8y7R0Wb5D2NhZVV8hcDI
	 BcOKbQkoeYj/LRFvD4zwL/iKbOgxVbggpbX0x8h9Q8esrt+WL+pOaQauX3ugFe++MJ
	 wWJuMTHfbCQOjBNZ4zJOQpqcoBavDoTIT6ya7hwo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38055F80082;
	Tue, 28 Jan 2020 03:23:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72614F80150; Tue, 28 Jan 2020 03:23:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CAD1BF800FF
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 03:23:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAD1BF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="R876tFyb"
Received: by mail-io1-xd33.google.com with SMTP id e7so12479642iof.11
 for <alsa-devel@alsa-project.org>; Mon, 27 Jan 2020 18:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CGcQOGjif5h+ArGxp28rlx2IpIpKuGx7laRvJxrHzVU=;
 b=R876tFybsE6gWCdiJjxxz8uWntjVOQxS14gzwfx30/tvxK3oDOpfJQ+fV/afzFgITi
 aFg7vmnkppgnZ8kZjBKMRNq0RL831ZqnQem7uy4x0FRkE6LdTijKe2Q+HLush5zDUFSs
 M7Mb66C7IAN7mg2w9vrin087byN5RKYN4998Nx1L0U92Qk5ye+qw2CXKUf/b+5uFxopX
 ryAnQ9GxpTt1xVUXOGyMOM7X4Sjwu05NerOJk4iEh0lGiPpzsSTud98JF9Gg1jSvoNQI
 dYrAjDnfHVRiwjP+0rT5u2XpqXcaIf1yoqbfpqqHRYNPVXN+CJ5kCsGOWvJ83oHHD/OM
 32HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CGcQOGjif5h+ArGxp28rlx2IpIpKuGx7laRvJxrHzVU=;
 b=iir/Hdgl5wUT2HqWuWgTzElgvhshscSZh5iRKEINuQ/KUpFknUNj7PKWtNlyCAhqsp
 YdYosll5HlBihBLw6Qxq7EAyeG7wwFwxTPX58stXlnSowjCIt8/naczk2Oh9gRJlMHAC
 qjfWkdmGpthL2RnK8SLHPGI0p9YtYYCR+wPxJMNx//aRBeahZzD5vXGAgBDZZzvY60Z7
 W3WQRcxYtTTm6RAKaDSSiM+DswI838q/jff8B8hCu/scuywTq1G3Cl6+DUZxaf5fA1wj
 BRuMYKTudqnU+9UvuOqIa/CEcq01nyrtWkR9LIUP3rHFSprmHEYUiEcXt4isRBSkW3yW
 3TkA==
X-Gm-Message-State: APjAAAXsEg6xgevbJ+66snRM+xXuE4JHpJlRsZXn1/pvvVDK7k33nbto
 BkBfzRbAoi418PVyK4HUWVfBRTTutSNH57wSeZoPEA==
X-Google-Smtp-Source: APXvYqy3XyzenDWZv/fVy6jNqyhZJlu3NHES/7gjKFMWqQARwvX9fVY6IDsrlBuuTjYo/UWy3A0t14tIiy2CwmT0btc=
X-Received: by 2002:a6b:600f:: with SMTP id r15mr14490485iog.54.1580178209480; 
 Mon, 27 Jan 2020 18:23:29 -0800 (PST)
MIME-Version: 1.0
References: <874kwg4b21.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874kwg4b21.wl-kuninori.morimoto.gx@renesas.com>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Mon, 27 Jan 2020 18:23:18 -0800
Message-ID: <CAFQqKeWCyV2jWFipHZvG4HZSFwLQo96697TDQcJ7Drhch0bBrA@mail.gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH v2 0/7] ASoC: soc-pcm cleanup step2
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

On Mon, Jan 27, 2020 at 5:38 PM Kuninori Morimoto <
kuninori.morimoto.gx@renesas.com> wrote:

>
> Hi Mark
>
> These are v2 of soc-pcm cleanup step2.
>
> Kuninori Morimoto (7):
>   ASoC: soc-pcm: add snd_soc_runtime_action()
>   ASoC: soc-pcm: adjustment for DAI member 0 reset
>   ASoC: soc-pcm: add for_each_dapm_widgets() macro
>   ASoC: soc-pcm: goto error after trying for_each_rtd_codec_dai
>   ASoC: soc-pcm: goto error after trying all component open
>   ASoC: soc-pcm: move soc_pcm_close() next to soc_pcm_open()
>   ASoC: soc-pcm: tidyup soc_pcm_open() order
>
V2 looks good! Thanks, Morimoto-san.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
