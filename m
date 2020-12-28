Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5002E3380
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Dec 2020 02:47:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C218717AB;
	Mon, 28 Dec 2020 02:46:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C218717AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609120055;
	bh=ay+peubD+TvKtOB29br41WlkmMswaFbX5FqO3JTGnDo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f7+0fo7JhVQlB1cgd1EqA49n+dTEFKO1MSR5LTuzL19URoCgndcu+ksosjKDE4RNy
	 Hi3zaddIsifYLawLurzeY+VYbfTG+pzUXkaIZP/EhJhkfT8MHhhIo5vW1oGYp9obwI
	 EEyqkNr6pGUMMa4hGcePQXSBa7N69FEodypikISs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54457F8020C;
	Mon, 28 Dec 2020 02:46:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F0E1F8022B; Mon, 28 Dec 2020 02:45:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17B22F80085
 for <alsa-devel@alsa-project.org>; Mon, 28 Dec 2020 02:45:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17B22F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bgrpCuz6"
Received: by mail-lf1-x132.google.com with SMTP id 23so20765436lfg.10
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 17:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ay+peubD+TvKtOB29br41WlkmMswaFbX5FqO3JTGnDo=;
 b=bgrpCuz6y8GtBm2A6A2uiGtnS6p/aGQalXW5wzI6gRoElqIaFNi9R638lG0zxDLu5P
 lB3UnMPwPF1driakDFaBzcbjTMbHufSusHgDH0HHTZTom+z5vLzr5zeuKfJ5GMZC+XX6
 DZgSh3/6krLd/wjYw5A8igEVafqxR+UVs5EgP5QjwASmB5A4bFUKx9byGxEG55LHxa3J
 b34BozptpfEKfvd6IRMP2R6OhuyC4zNIPXgSPU1IgRYpRgedBQ7WJYf6hQKu/L4o10D9
 oikdEiwQgaw6Couh/9khQFTwWPhNFjtcVfUqFBFG1/E0q+QV2SYWYgZoM4Wvw0fHPZrj
 BPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ay+peubD+TvKtOB29br41WlkmMswaFbX5FqO3JTGnDo=;
 b=cx/nL6aZlK8cwU+oEH5o91NECHw9rGQ/AkW/HW5ZgiEWE6bTNHxLJH66AVpOwScYR8
 wEAB8NIWyhoLNhRSh4kJFFNlSDF5LMuoVf0v88MnkBzoOKriDxKK04hC6CIkGfPdxuv7
 Iniuhz8/V31PajHi2hChTdmVWc9vFFhgOEcQ1rOXm+gPBlSp1AWeqreAL80VAQA4miL9
 bXYPNB6WBGBtRJXIBmQUbnNFaIfh/nrz5dw9JUkShD4mI1p+a+l4gVXeslVWCdFW/iDv
 RRyC2muWBxtVSWo1tT+Vh1LGICiPgo+TfZlLuC4O+WC3VKHxzdzvGokR9IAbYNIpreS6
 i/xA==
X-Gm-Message-State: AOAM531WQ4O8/F722gA4FucvfexWU+zlyq/XyaTIJGsQqSrZ3T8TyZVN
 BCg2E0xarfZLaU+c0WvzVUQcd0Gl8ZPwLOYnjbo=
X-Google-Smtp-Source: ABdhPJwUa1ZjTRz94TIJ4oc8GEMM7yOxD4po/N+xSV2zeAjbzdfK/+s1U3aOjVhhiG93z7u0bLwaVoV1Y9SxvwArUZs=
X-Received: by 2002:a2e:9550:: with SMTP id t16mr19361266ljh.370.1609119952149; 
 Sun, 27 Dec 2020 17:45:52 -0800 (PST)
MIME-Version: 1.0
References: <20201226213547.175071-1-alexhenrie24@gmail.com>
 <20201226213547.175071-9-alexhenrie24@gmail.com>
 <s5hy2hjejgb.wl-tiwai@suse.de>
 <f4f03e79-5e0a-a306-09f1-a3f5ef46c7b0@perex.cz>
In-Reply-To: <f4f03e79-5e0a-a306-09f1-a3f5ef46c7b0@perex.cz>
From: Alex Henrie <alexhenrie24@gmail.com>
Date: Sun, 27 Dec 2020 18:45:40 -0700
Message-ID: <CAMMLpeQRS+Q_LQb9C7qFWTqBk2oQsTRtvuK39x2S2ZnLAVJLnw@mail.gmail.com>
Subject: Re: [PATCH 8/9] pcm: fix undefined bit shift in bad_pcm_state
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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

On Sun, Dec 27, 2020 at 5:36 AM Jaroslav Kysela <perex@perex.cz> wrote:
>
> Dne 27. 12. 20 v 9:34 Takashi Iwai napsal(a):
> > We need either to handle a special error value in all places calling
> > __snd_pcm_state() or to just return SND_PCM_STATE_XRUN or such instead
> > here, IMO.
>
> I think that SND_PCM_STATE_OPEN is more appropriate here. If the state
> callback is not defined, the state management is screwed anyway. The other
> functions will return an error (because they depend on the state management),
> so it's safe. I applied this change to repo.

Thank you for fixing this properly!

-Alex
