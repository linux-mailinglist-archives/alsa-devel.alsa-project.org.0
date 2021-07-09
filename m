Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3F73C1D44
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jul 2021 04:10:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED1421607;
	Fri,  9 Jul 2021 04:09:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED1421607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625796627;
	bh=ZNjAXvu3IL6HdtDr7JxVJ07Dfh3t2d8YG+5buAKilNA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sswh0hwZHvSUfvtHRsJOOxpzqaucZU3Xeq9kWKUyzPVYH2Amv2Nn6cL26WGdQ/ssE
	 wUM7CfHKYK/s/LcIKzWWLt1StNIuHhvMcdGNbTap8wHhEYZAoufF8BUUiKLs4B51vf
	 FoI4maNpUU+MRY8Z/8vB3EnwERTqTr3U/LrmIYZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81E77F80171;
	Fri,  9 Jul 2021 04:09:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 263DCF80224; Fri,  9 Jul 2021 04:08:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EC71F80059
 for <alsa-devel@alsa-project.org>; Fri,  9 Jul 2021 04:08:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EC71F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="dFmK3Qig"
Received: by mail-qk1-x735.google.com with SMTP id s6so4973084qkc.8
 for <alsa-devel@alsa-project.org>; Thu, 08 Jul 2021 19:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P/0ERbBGzIyneS2vO1j+xM+9/bEQwTCuaveZZgS0gDs=;
 b=dFmK3QigIP75keveL3Tcq7IlNzDdBQseedtrx+FStZTK5l4sxfusNxR8Ak7Q8chCiO
 Jkq+XY/q+PO67ksfQ4XEWfOQb/W/yeTmHamo+Eb4npdyqT7+0xoaYim+42IzwcSv3AEm
 TMjEjYSe0hVqoiK4T1I11lbr8nM4jiVksc49ANSc2MQbNAsfX+OtYJ98pfTuX3iPvZ5p
 xJ+S3K0kyghFhUteXtiJYM5l+FkVVPSB7aIWBZvwq7+YO0J7xD6HwAABsxxoaJSlseHJ
 4fdYgI577Tkf9zsjsFTeino8k4P3TLNycz+ruzHPM27Rl/fdgUyn5YAkTY2tEWXA6v6r
 w1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P/0ERbBGzIyneS2vO1j+xM+9/bEQwTCuaveZZgS0gDs=;
 b=h2f5BxBS/RVnd60nSF6dXgFt0+pDS6F4XiRZ9hsZMYc55xNnGf5b6EG/OL+3Xej5Lg
 5Ndn0o2WIfHx4wHl3WuRFc8ikDBIFpt3UF3MyFSKCymAcFWz22nci1Lldb6EE6LZLcWN
 epL3m/kybw/DdazxglTmGH1qJlg3d3ecnB8xkJ7vuCmWyHu9BM3ADtN7Q+C18wOp+ioS
 uhXP5ZDekfAP4Lw93/9ZjAvkWV0xqIizmHO8dtOB5EoZcEDoRGpQ90V6bRYui9jT9hom
 z1T3u6+EIqR4EzfeefCP66IF8vFgpwD1v8Em5GCvyKx7PvBrL0HlonXWUrKz7YkwVPQi
 J4Lw==
X-Gm-Message-State: AOAM531hzI3xB5F8GBhfgAuiKOokQO6mavHIkjK7/izfZz3CmQVwe5XB
 LwM68FopBvHVN8BSHXlGkiJf4amcVdqKqGl1NGoc
X-Google-Smtp-Source: ABdhPJx6FQwc7egvSqXYoq7isUUDoHczhZPESZqsnwKgdS2sTsZF3gtCQA8AWynl7IS1pJ3FafB3qZc8U3GyMfXeTFA=
X-Received: by 2002:a37:8345:: with SMTP id f66mr34318319qkd.396.1625796519947; 
 Thu, 08 Jul 2021 19:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210708020815.3489365-1-lerobert@google.com>
 <s5ho8bd59q4.wl-tiwai@suse.de>
 <CAOM6g_Cv6rsLOAb0+Lr_YkjHpKfw+zvWXH0X5LKR=Z4dtXGRng@mail.gmail.com>
 <e2705267-4400-bb7f-e96a-9b103872c0a1@perex.cz>
In-Reply-To: <e2705267-4400-bb7f-e96a-9b103872c0a1@perex.cz>
From: Robert Lee <lerobert@google.com>
Date: Fri, 9 Jul 2021 10:08:29 +0800
Message-ID: <CAOM6g_D4dkwDcQza9fVXn9=uXSYTBThNVHqWb0YjLWkc_eBwog@mail.gmail.com>
Subject: Re: [Patch v2] ALSA: compress: allow to leave draining state when
 pausing in draining
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, zxinhui@google.com,
 Takashi Iwai <tiwai@suse.de>, carterhsu@google.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, bubblefang@google.com
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

Jaroslav Kysela <perex@perex.cz> =E6=96=BC 2021=E5=B9=B47=E6=9C=888=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:53=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 08. 07. 21 15:47, Robert Lee wrote:
> > Hi Takashi,
> >
> > It is a little complex to describe the design in detail, but try to
> > explain simply
> > what issue we meet.
> >
> > If w/o the change,  after user resumes from the pause, our system would=
 call
> > snd_compr_drain() or snd_compr_partial_drain() again after it returns f=
rom
> > previous drain (when EOF reaches). Then it will block in this drain and=
 no one
> > wake it up because EOF has already reached. I add this change to return=
 from
> > the previous drain.
>
> It looks like that the driver does not call snd_compr_drain_notify() so t=
he
> state is not updated to SETUP on EOF.
>
We indeed call snd_compr_drain_notify() on EOF, but after return from
wait_for _drain there is another drain again immediately.
Looks like the system queue some states change on user space and need
to drain again after resume from pause.
I suppose there is different design on user space so I add the hook to
handle diffent usage.

> > Actually, I am wondering how the pause-during-drain can keep the state =
in
> > DRAINING. It should have a different design. :)
>
> I already proposed to add a new state (because it's a new state), but the
> conservative way was elected to avoid user space changes.
>
>                                 Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
