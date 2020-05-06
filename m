Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F0E1C65E5
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 04:35:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 756261778;
	Wed,  6 May 2020 04:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 756261778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588732526;
	bh=gcP618iUXG0oqvLPr7DNo5hRWczpuu2twtPmXxdhVpw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gBOeqDnAa4u5Zd7z4ES6iJi1E7jLV87D0ZhfXNQpXKz2qeZZ+KJ4y2cOiTo6PqhP3
	 dRaMRRROPrNJChBoG2BQT/7MtsqqX055V67af9nZtNjsDxlRWquVGTn1Vh+QEz00XS
	 ugP2UsooIoFZ+3c9tVxdWqJElGMK2JgOj0eCGWSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F5AAF80253;
	Wed,  6 May 2020 04:33:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B027CF80253; Wed,  6 May 2020 04:33:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EF77F800DE
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 04:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EF77F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="R1384l/6"
Received: by mail-qk1-x742.google.com with SMTP id c10so526201qka.4
 for <alsa-devel@alsa-project.org>; Tue, 05 May 2020 19:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gcP618iUXG0oqvLPr7DNo5hRWczpuu2twtPmXxdhVpw=;
 b=R1384l/6yWHB4ooeXERU+zst6yVVl4qdVKUOLKPDL0IFR5k6aI6g7gRjbAuwT4BzKA
 Z6KH+95F2q4yXt//grj2uZFTWLNoNm8Lu5dIBlqAf5q0PVULxKpDhwpgZFvf7hcM1z7o
 JWEEw5dFLm4KLFcz3u7lzAjqWTBHjwaPx8OKXuovGeWFo+iTfTDqNgZ8cVEmx2m0Vs6k
 EANIs7E1P/Hmi/gKrN2ZVtZbqWaVt+JTnGqrK3+DtfWnoQ9itU1GBE/rj7qiUUNBnx8m
 YJeMGceUIQe7nPht9WV59pnmBnFXycdSyUqerr4PwnHuvfUnVMkw7uFBR3BIpqH5dNjA
 mXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gcP618iUXG0oqvLPr7DNo5hRWczpuu2twtPmXxdhVpw=;
 b=tTt5z8ccthJMP2NBE1C/ovLE11QQl9y6ZRPv1EBkBHN7SY97IHG0p+jDolN4YZsnb+
 lxfasjMANvSyPkNBeEty8fGoA8Z3J7HWERwDmkphk8gUnfDrKf2Jkx8IQ7TgpzCpoBG/
 QgWfUBshaegxR5NlO0zbc+320T2dclxIkQ5I2z3nUPBhShHXTHYaAYqA5kGkN521e45w
 0VBP/IHs6l0tcHEfuFMMYOaeEtU0ZRaY75NbsI75r3ViAfhMQ7ElS6SS1+4uTkFWgufk
 T0jtTK5rLKmqVkLgpRUZIMVbpqLDuykq3s/oxNr541Fe4hBfGke/p9aPtjYd/JFt/TWE
 fpgQ==
X-Gm-Message-State: AGi0Pub18m2qaqNBJ/yj9m8Hyq+c6DmCNqJ5WhL6S4TNmdVPOAY3lWDa
 WvvVUzVispw9LVkGO3+EcS6ZGSG4EAFGe8ITdSA=
X-Google-Smtp-Source: APiQypKPqLRAV/6/dDdwBHpa1YXOYCMpbodQ4y1LcTQnjLMmx87XtQKGZI8fOwO9Tnx5Ay5TOzZj8htcdEBmp+Z16mI=
X-Received: by 2002:a05:620a:89d:: with SMTP id
 b29mr6804070qka.103.1588732414259; 
 Tue, 05 May 2020 19:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
 <a933bafd2d6a60a69f840d9d4b613337efcf2816.1588320656.git.shengjiu.wang@nxp.com>
 <20200501102158.GA5276@sirena.org.uk>
In-Reply-To: <20200501102158.GA5276@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 6 May 2020 10:33:23 +0800
Message-ID: <CAA+D8ANDHHejFD1rYmFOG24yivpEJa+xO-WpVr=Vzfz9yW9H7g@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_esai: Add support for imx8qm
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
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

Hi

On Fri, May 1, 2020 at 6:23 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, May 01, 2020 at 04:12:05PM +0800, Shengjiu Wang wrote:
> > The difference for esai on imx8qm is that DMA device is EDMA.
> >
> > EDMA requires the period size to be multiple of maxburst. Otherwise
> > the remaining bytes are not transferred and thus noise is produced.
>
> If this constraint comes from the DMA controller then normally you'd
> expect the DMA controller integration to be enforcing this - is there no
> information in the DMA API that lets us know that this constraint is
> there?

No, I can't find one API for this.
Do you have a recommendation?

best regards
wang shengjiu
