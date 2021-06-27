Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C41E3B52FD
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Jun 2021 13:22:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74476169E;
	Sun, 27 Jun 2021 13:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74476169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624792952;
	bh=LmpG7J4p+WNYQbcORcBK+AbtA4w/pjFcP88ZgU6pOD8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gTT6dGFr08H+Xx+KB2JnTo5bwu64HlV34vGsoK89/rv8fc3F7P/EZGJ7rM8FycK3e
	 f0MKvJua2Vv4YYcGV035KpIqhtPDSCQp5hIeoyyT2o29HopyN0Ofum+XkGyeT1tvI1
	 YXfd8QfKJQEOd6jg0iku6bo6C2J1Z8nsGRw9GrKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B82B8F802D2;
	Sun, 27 Jun 2021 13:21:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2DBFF80137; Sun, 27 Jun 2021 13:21:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CA46F80137
 for <alsa-devel@alsa-project.org>; Sun, 27 Jun 2021 13:20:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CA46F80137
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MWRi7-1lipLR3JYB-00Xsfn for <alsa-devel@alsa-project.org>; Sun, 27 Jun 2021
 13:20:54 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 p8-20020a7bcc880000b02901dbb595a9f1so8996657wma.2
 for <alsa-devel@alsa-project.org>; Sun, 27 Jun 2021 04:20:54 -0700 (PDT)
X-Gm-Message-State: AOAM531AoeaeAFxxu/d/+S9Ub0+pW6T2/+uoW0+0M/WdQNA0V7XArmv6
 j+MjpslnpbDDZRmPrh3odyW2clt0B7NMstLUGUY=
X-Google-Smtp-Source: ABdhPJxZSVHLa2YcD2o69/zC+6jgNUPvJfP6TcwCm5vnfW91vttdsdykMDP+9CeJMiHRKzSklxY7SYfggBl3ano2tj4=
X-Received: by 2002:a1c:28a:: with SMTP id 132mr20606943wmc.120.1624792854442; 
 Sun, 27 Jun 2021 04:20:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210627105955.3410015-1-pbrobinson@gmail.com>
In-Reply-To: <20210627105955.3410015-1-pbrobinson@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 27 Jun 2021 13:18:25 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2zkK+5x-xmJzzGa09X7tExkM1=CXAi0UbVnPz2E7E0pA@mail.gmail.com>
Message-ID: <CAK8P3a2zkK+5x-xmJzzGa09X7tExkM1=CXAi0UbVnPz2E7E0pA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: remove zte zx dangling kconfig
To: Peter Robinson <pbrobinson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:uVn2MwBYzPiDVACVxKoyVcrnLaPRqgLvO7cJoT7ZbQhcL/Qe3pQ
 hmGW8FZytA1vO24M6iQ3SVjjQs8WMpIpSVrU0vWmUCLaD137j61tX6FsdCLlkLczfEalXfW
 oRHh8nOG7t603v+NIpSIIWinEipWEbLFf0R2vQTBe8xXIG6CRXfptaI7mHNRxdxRVVe/axW
 y3sCK4lQje7C51H3sq4hA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PfTHM44wd1s=:4IxJP1pcgRwCDF8M1Cx8g7
 g9xU/33JuJ6wI1yPQ3wHbpVpOSqwuu4YL7u/FvqZUPR6tx9ng3LObmhrNN5ITn7Yu40aQYTch
 o9tl8nTPHqRCZXZM0Y78vj9ZBk5xdwfzuULT5q1sybAL1QFG7Ia0+Wb9xxP3sAZ574nl9G3Dx
 6QR6rUd6bNiV8Xx9Zf98EUW8O7TEn+wZJj6NlotO4/JyTCX3pltGquJ8dgrW4bO6Z/VY9fLz7
 GBvWaotljPAHzxtLjCUOxN1sAs4Jx6NfcXUlZd3EioS472k/n78YOT9G3UQZauYSWva7QeSa2
 2EQnWfJk20U/W8xhm+Hg7bXj6o2KadETqqieQHCAdXxwhHW6DKDVhE2BB2K4XezmH8LB9yXlV
 D7LsI93zN9u6ZnxqUv0ckaJQ6e2mQE4vRmqeYWUwegZ6QVYNOYX4eGZNfjCJbyk6awBSoMJ5l
 aa1pYVJj26p9Vqj7VsjmJo3CeCz7/8jGsCossias//dv/2AOBpNWMckXsW4HPL4+hnzXHSikC
 2SLKBRNdSJ9HnIj5h6jflU=
Cc: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>
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

On Sun, Jun 27, 2021 at 12:59 PM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> In commit dc98f1d we removed the zte zx sound drivers but there
> was a dangling Kconfig left around for the codec so fix this.
>
> Fixes: dc98f1d655ca ("ASoC: remove zte zx drivers")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Mark Brown <broonie@kernel.org>

Good catch,

Acked-by: Arnd Bergmann <arnd@arndb.de>
