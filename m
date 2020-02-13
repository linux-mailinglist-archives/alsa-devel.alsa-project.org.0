Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 808F215B707
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 03:12:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31036166E;
	Thu, 13 Feb 2020 03:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31036166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581559955;
	bh=PbnbtC0nuhE3P/s0/PpMk8pSX42cvF96Cz+Evim5ZGs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gkbTo2YAf694RpsxVrDmquLI5Jstx08cCkOgl7Um9UGcAA0cBBhq4uRNYdXPoAPad
	 GO7R0aDwDKfcLM68oMGkQIyHL9wlVu+VqhIawRdrNmP6RqkNdfvOGbKGDzILneQuP3
	 lVBq9b9k8zKZp163lmkDx2cn1NGkCB/zBJpvTBng=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F821F800F0;
	Thu, 13 Feb 2020 03:10:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AEB8F80125; Thu, 13 Feb 2020 03:10:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B62D4F80125
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 03:10:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B62D4F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="B4o4H9MS"
Received: by mail-qt1-x842.google.com with SMTP id n17so3284701qtv.2
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 18:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mUdWWp+c0fomnydwOZuzDqMxQIhxsbRs6tTf2TPYRzA=;
 b=B4o4H9MS03jB3qy+5V0hztuGt3eAHe4/kGTzKfPzIWZrT6Y4P2LcjHeFf4TFYvd/4j
 c1VJvS86dpFeceOKyicjeG6kYeVBDsmpTaXrZ20HPUemdGubmkbA7sBEC6ahtejz3YAO
 cVaQ/gJ7T9m2ApmVqTSgj3VnjBCPXehozQsheNAbO72TPNNrMu7/PbSeLE1OlLLEzsTB
 z4uefz8/7cc19Ehm9ubSScg/EwOgQB7zT4isfIYAYKb8EVl8NR11BCDQkCjmPNd4LrUE
 biYkgKUS8ALiZ3ciyqkigVZnZldwIJ6DlBboH0IqE/3d4W/ufw9l2xwsxLZV41XTE03f
 uN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mUdWWp+c0fomnydwOZuzDqMxQIhxsbRs6tTf2TPYRzA=;
 b=rFGlaBRw0rDtPHoi82PByg6AA27l+UgxiPTFRT3ye0BqjgbHUdWq7Q47rzv16LYhZI
 /MzOOqQWMEfaMldCd4iAXF5lEeM4/5s7GNV9ZXdqMY+eW6mk0IZU/W6S1sWcQK2HqKp+
 tPXd9/E5A5KqRBs/atdaCZ1oFgoYoZEpUBsPSK4GZkBTKIdcSwhk4eKM8icX0bsWZQd0
 hHEo3Lk4w8+xemLhd+deE30qJyo6yXn2S718lwFK2TvEPQy8NsYU/dsoL+llVU8ssp4l
 LSE9FSfzSXQoupc1PCmvgzP2gTELok73GbZsJgtdoWSHCfPYFYygGsSkBtgMzFzG5cAz
 svCw==
X-Gm-Message-State: APjAAAVHWl2tBgtJiPVlbVlRtrs2MQdBPmUvQdVz7sQe+PLLkYRxalbE
 uCJfkrS691hDVDwuE5EGCQeMqls4VONB8dBgABc=
X-Google-Smtp-Source: APXvYqxdyDijz1rGqrbYCmLrIjViy7wgwMXb68AAZ4r2pC01PDuSdhiWq9HvmosjKuHgpR9L2JZlZb6NKQE8p5vXjwU=
X-Received: by 2002:ac8:3a27:: with SMTP id w36mr21937606qte.204.1581559847782; 
 Wed, 12 Feb 2020 18:10:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1581475981.git.shengjiu.wang@nxp.com>
 <1ae9af586a2003e23885ccc7ef58ee2b1dce29f7.1581475981.git.shengjiu.wang@nxp.com>
 <CAOMZO5Do=dzh4WXvm44mB7-PeesWuA6qRtMXwHCH9piXd1dZEw@mail.gmail.com>
In-Reply-To: <CAOMZO5Do=dzh4WXvm44mB7-PeesWuA6qRtMXwHCH9piXd1dZEw@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 13 Feb 2020 10:10:36 +0800
Message-ID: <CAA+D8ANGtnPYNA9__Zeg8MJDaiw_kVebUUgU-jPmp8GXRNX4hg@mail.gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [alsa-devel] [PATCH 2/3] ASoC: dt-bindings: fsl_easrc: Add
 document for EASRC
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

Hi

On Thu, Feb 13, 2020 at 1:26 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Wed, Feb 12, 2020 at 1:35 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >
> > EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> > IP module found on i.MX815.
>
> i.MX815 in an internal terminology. Please avoid it on the commit log.
>
Ok, will use i.MX8MN instead.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
