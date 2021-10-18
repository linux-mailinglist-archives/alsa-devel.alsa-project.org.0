Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E63684322D2
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 17:28:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8109317E3;
	Mon, 18 Oct 2021 17:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8109317E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634570902;
	bh=TmneheD9mfCWUrbD5Ak4jALWc92pwGekUuthuSnhsV4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S4i73TQt8BOvV3RjWNLZKL17GInvbOh5A3gv86JLm4+0Luqk0G3cA0Th9/gfPwZWP
	 u1/BJYI/PlqEcjNEAGTnMsfpB1wp635mAEZQkYrLSkU4sa4PlEw9nnTcGG5FF8Pu8k
	 0cX17hF7LAMZOzNUqGWOUAFyBV7l0+o5M7aIkH2Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC6E2F80253;
	Mon, 18 Oct 2021 17:27:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5E16F80224; Mon, 18 Oct 2021 17:27:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7607F80159
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 17:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7607F80159
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mnqfc-1n5WgI0ODq-00pIfi for <alsa-devel@alsa-project.org>; Mon, 18 Oct
 2021 17:26:52 +0200
Received: by mail-wr1-f42.google.com with SMTP id g25so42013271wrb.2
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 08:26:51 -0700 (PDT)
X-Gm-Message-State: AOAM533g4bmuNKEOyaNgodw50eqZkF4ujMAZljPgQEImIc+QeykP7wmw
 MV/UTmyI2ZsLZBySlv7MeGiB9+A6enSYiq8k8VQ=
X-Google-Smtp-Source: ABdhPJwZTryrYp+pNKyx1vAYwOjs14JDwumKgWlVCbFtT0ihV++n2REC55gSAlRYQLZatyLWyLhfYAzetvIOnch0TxY=
X-Received: by 2002:adf:f481:: with SMTP id l1mr35106062wro.411.1634570811678; 
 Mon, 18 Oct 2021 08:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211007160634.GB7074@brightrain.aerifal.cx>
 <s5hr1cw95ar.wl-tiwai@suse.de>
 <20211007165158.GC7074@brightrain.aerifal.cx> <s5h5yu79aab.wl-tiwai@suse.de>
 <CAK8P3a0qxNLv3_RcR5COcRGPcTnYMcfbOjdWKiT2hKdcof9WUg@mail.gmail.com>
 <s5hv9277oux.wl-tiwai@suse.de> <20211008120736.GF7074@brightrain.aerifal.cx>
 <s5hsfx95n99.wl-tiwai@suse.de> <20211018144259.GK7074@brightrain.aerifal.cx>
 <s5hlf2q4byc.wl-tiwai@suse.de> <20211018150824.GL7074@brightrain.aerifal.cx>
In-Reply-To: <20211018150824.GL7074@brightrain.aerifal.cx>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 18 Oct 2021 17:26:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1RAk5WRtMjqV6QZ1eHtFu_sxhSBJn0Uv-MhRA5WGiJqQ@mail.gmail.com>
Message-ID: <CAK8P3a1RAk5WRtMjqV6QZ1eHtFu_sxhSBJn0Uv-MhRA5WGiJqQ@mail.gmail.com>
Subject: Re: [musl] Re: [alsa-devel] [PATCH v7 8/9] ALSA: add new 32-bit
 layout for snd_pcm_mmap_status/control
To: musl@lists.openwall.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/AuKWgkSeDZhTCs7aV+WXVNwxMAgy/78hGUhrSeHs585Z+U7GEV
 3xK6sKNyiyEWlb3zVTYRElYIv6Fptm4SRzQIc3hjHmpmf1K40HYj7vTZ9F22cd/4KTRmVSh
 9Z51Tg6Dic10dmb+VnzwTnMQDAliTX+/moyhmdz15ReAHLIriT8SZ6uI64/J4P/pw1omilW
 abcJv0sUAAbJGb+S1+wqw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zi+U+IzLeo4=:ocs+egO7hajDW6DjRaHCgT
 5pa/wxNrSL371gTgnUxiuGvbxcqWOTiOqvJVWACAdO8Bn43+JoXCg+Tmg8jOkCJ+9XGkJLkCl
 t/RF8i/54FNmjszDrosgPFlPiXq7GUBeAvJNErvehTRWz91+2XeRZ7st+SVPvyiPBecs/mjqr
 o2fq705KKZHoQ8h2lLfiiKwqIHp98hygvA3fE727AQfuBx/+22O2wQJoyKhnQi/l9shXqmeWh
 TPKRxXwJ8V0iyFnerT8n3F4Dx00XwpfgZreWzGf8EXozKlghS6C7keLPK0p0mjvbcrpL+0jGj
 sTvLRDv6BY4Zn8RwllstzNFdGmYPpyqcriX9wlPVxlpSm4QvCHD9dS4wXugz4xYUUQ/2hTKWC
 7aVVxW8zm96QAvJjuCqdtFlyTwLNXR9F8AXsE2wQnlp/O/i1Abwx3lbMTv6Qgj6NHHXdo4qz8
 y4XP36AdxyB1RhnqJsRyp8GipB1rfRgeFHxnGJsVEmRTVlzToh5fxW9pR0LzFyy7lCFD6cizl
 rpmtGEqMQgEMALxpJpXavMQd3Xp9vG6IKd0Tnk3HpmfE5VnKWtpwwMp35lmihKH2N6iPIQ5YT
 nNNIdi5MYvLjdSwQEakDaLnrPW7TARgfGbMXOTvpKO7D/5zxyXhn7tc26uzc6MTUFeZIdYV2o
 I8j4KBgoaB/5LQLSdQSUXEErq/EZhw0hl4lr6SFTEd/TOA+74lEkhG0UIIscEvwmfzx/yk0n9
 Fq4/2bJuiLTTX6FgYl6d2+fnXX84vzF4jKPiow==
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

On Mon, Oct 18, 2021 at 5:08 PM Rich Felker <dalias@libc.org> wrote:
> On Mon, Oct 18, 2021 at 04:58:03PM +0200, Takashi Iwai wrote:
> > On Mon, 18 Oct 2021 16:43:00 +0200, Rich Felker wrote:
>
> No, I don't think so. The musl translator is to translate between the
> time64 ioctl structures and the old time32 ones for the sake of
> executing on an old kernel. Up til now, it has been broken comparably
> to how 32-bit binaries running in compat mode on a 64-bit kernel were
> broken: the code in musl translated the time64 structure to (and back
> from) the time32 one assuming the intended padding. But the
> application was using the actual kernel uapi struct where the padding
> was (and still is) illogical. Thus, nothing was built with the wrong
> ABI; it's only the musl-internal translation logic that was wrong (and
> only pre-time64 kernels are affected).
>
> The attached patch should fix it, I think.
>
> + int adj = BYTE_ORDER==BIG_ENDIAN ? 4 : 0;
> + if (dir==W) {
> +     memcpy(old+68, new+72+adj, 4);
> +     memcpy(old+72, new+72+4+2*adj, 4);

I think that should be "new+72+4+3*adj": the "2*adj" would
be what the code does already for the originally intended
format.

        Arnd
