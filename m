Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 811D343385E
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 16:25:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2602B16AC;
	Tue, 19 Oct 2021 16:24:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2602B16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634653528;
	bh=7PfyY+uUV/Iq/NzXsXwthKzyTThqOVK+mSufuednp4A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A2qvUATrJ3loQ2tFJrScs5hX8M36c4wdpE0RlmvU23F247k4IdJNIW9Ya6gw0pJH3
	 Sl+Wa6hK7hR8iXzhHCH/Ay7FZPR5tOrPnad/WyPAfA64ivFTC6TYUWmen/oPev1Gg1
	 EA/twK86HmM/BFWO2PL12Fza6VbemX2ifvH6azgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A656F80246;
	Tue, 19 Oct 2021 16:24:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E935F80240; Tue, 19 Oct 2021 16:24:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E826EF80155
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 16:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E826EF80155
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MzQbw-1myc9B37qq-00vNNc for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021
 16:24:01 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 y16-20020a05600c17d000b0030db7a51ee2so2122049wmo.0
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 07:24:01 -0700 (PDT)
X-Gm-Message-State: AOAM531fzQsPFGJDFdl7s+KrBhi9wQ8tjGkKQE/UWmRyqcE9WSHKkLiE
 iEXjQlo5EinedxDwnPIhaP2mPO8qbCuhpkgrjKo=
X-Google-Smtp-Source: ABdhPJwKQW7tgBaH6kTW0rrTX50ypr3eK+Ahefc5knwle6M9G57uWXIVrYYyqptMm0i3QO8nZ4vcPCD26aJqtexE85s=
X-Received: by 2002:a1c:4b08:: with SMTP id y8mr6692599wma.98.1634653441129;
 Tue, 19 Oct 2021 07:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <s5h5yu79aab.wl-tiwai@suse.de>
 <CAK8P3a0qxNLv3_RcR5COcRGPcTnYMcfbOjdWKiT2hKdcof9WUg@mail.gmail.com>
 <s5hv9277oux.wl-tiwai@suse.de> <20211008120736.GF7074@brightrain.aerifal.cx>
 <s5hsfx95n99.wl-tiwai@suse.de> <20211018144259.GK7074@brightrain.aerifal.cx>
 <s5hlf2q4byc.wl-tiwai@suse.de> <20211018150824.GL7074@brightrain.aerifal.cx>
 <CAK8P3a1RAk5WRtMjqV6QZ1eHtFu_sxhSBJn0Uv-MhRA5WGiJqQ@mail.gmail.com>
 <20211018204203.GM7074@brightrain.aerifal.cx>
 <20211019141622.GN7074@brightrain.aerifal.cx>
In-Reply-To: <20211019141622.GN7074@brightrain.aerifal.cx>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 19 Oct 2021 16:23:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0Znk6FjUnnMs0KobOBw02f_fwxapeOZH9zrx-h8=Ftqg@mail.gmail.com>
Message-ID: <CAK8P3a0Znk6FjUnnMs0KobOBw02f_fwxapeOZH9zrx-h8=Ftqg@mail.gmail.com>
Subject: Re: [musl] Re: [alsa-devel] [PATCH v7 8/9] ALSA: add new 32-bit
 layout for snd_pcm_mmap_status/control
To: musl@lists.openwall.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:TOtWe6KZEQ1rSusfN+fBFNJ6Ldh1wsQNErotCe380D385bigU04
 jNvxN1e0AQ9AmeBcRdJ28YOToAb2norbreEZDgdCbet7aXMWOgPEbmAv10aQ97EKssbLB8K
 jTBh022c3QzgQY9Zz4J05crREj+PXixQYTDQpk/K1+uEgsg99K5zUC5oO8NmA6LxFLZsCI5
 uMFKZ60gwmqSd///PaPjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:H5+hiMfT/+M=:T4NZ//cZx3vAFwgL5ge2/Z
 XBcZr+Lc4HwhI5dUkHaxCmL755A6UUwFygZ++sjQdwOJ+twrFAdUWQZbuubzSEQfzeLERpApk
 TnGb5FbsKjhzGNyqvT6RtkDIiE0TG63TofgYlRTf4gP8TvVF73Sk5mDHVrW/YaoHGKV6K8BPn
 riqXUfHAg2BgChXbxgPlYqZ/oGQ9+BkeUUrHewpa/ZyLt6KVOSqLsFNerRpJGzOaoos+ciAdg
 dcnwo1f+5j/zODu2gn+54M0uxfvUTtEmFf2mMLt8kftlg61jTnH3YIOHDbW/h//7qvQaJBc+F
 OPb2WguCFlWI5JN8BcrTGXLy1PlkrwElIRzYCJ9lbeCvvs+nQlT8hvZEETQ8bQXfKAdfrgmIR
 JPRNuOq3VgGc/qcT9zddlyu7cgVBgQk9KwWvf0xIgZfAmYKEewkoQzGH/ImlFcp+fYwREjK6R
 DPgNbO+Qxi40Hve6Mn2nJQ1lmLTD3fkDzMAhcCrWwm92yrvh+hpyIIzTVAt4UOjfoU3TAIdNq
 GAkb2U6e8LqH9P/DEwKAtHCMD+/5MIA3/YyBWrRcmgBkmVBDuspr4RcHCK7WzHzL6OohZhiDX
 soEYdMvKd5KVL9k42VNHI0VL5F+xBTGdaxiTGDhb7AhdnbNJQTpSFZ4SYQ5tWV7wo+Y2ahQVD
 /xvWrlHQ0DFaAVAiejsy1jZ0WiPnbkBOtfDFx6SwMeGGyw5YbRLebA6w5fa0SOUj7lZoeedfK
 ALjZJxhGc6Fp3A7m8ooXNMMtmSIzySkeJ5XX9MTBjTSZzyHx5t3bMg45T+gGZj1R13105qL8x
 Dz02CDb9FmMe1c62XHS9S9zGkjuCIY+W3k7yWn8pmS2/im/k3Ml6xt4o9u+LAoo/U4rbYuNdw
 N4CdMO2hVHQnVP81AVVg==
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Arnd Bergmann <arnd@arndb.de>, Baolin Wang <baolin.wang@linaro.org>,
 Takashi Iwai <tiwai@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Michael Forney <mforney@mforney.org>,
 y2038 Mailman List <y2038@lists.linaro.org>, Mark Brown <broonie@kernel.org>,
 Baolin Wang <baolin.wang7@gmail.com>
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

On Tue, Oct 19, 2021 at 4:16 PM Rich Felker <dalias@libc.org> wrote:
> On Mon, Oct 18, 2021 at 04:42:04PM -0400, Rich Felker wrote:
> >
> > Well for little endian either would work (because adj is 0 :) but yes
> > there are 3 such paddings before the second member on big endian, so
> > it should be 3.
>
> How about this? It avoids open coding the logic and handles it as 2
> 4-byte substructures with endian-specific offsets.

Looks good to me.

      Arnd
