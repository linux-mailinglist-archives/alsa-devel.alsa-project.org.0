Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC6672871
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 08:44:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFE40191D;
	Wed, 24 Jul 2019 08:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFE40191D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563950678;
	bh=I0cT5enm5L4mcLHXrLfFP2ma+nqhaqDa9msy8gANc/s=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=shtmQhPveyIrFnWZWscDbD6Vb7GublZiugVg8g1IxWk1EAPOd3F1pFhN29pS56gzD
	 tzTYd40uxcnqieKrqwGPaMYQ9cTQ6F/7Z4r0iiKLegvNEgEnhcNq8jRqVzSLGwHQkG
	 fWePqMH5vyF1afv3SEZWhO8cQ+BIC+h9LqCZrI9E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7602EF800E3;
	Wed, 24 Jul 2019 08:42:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16C04F803D1; Wed, 24 Jul 2019 08:42:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E97F2F800E3
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 08:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E97F2F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DWt/IW5i"
Received: by mail-wm1-x343.google.com with SMTP id p74so40622802wme.4
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 23:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yhhTks9k7nEzj+aqUPzjcgfPfrYu7EH2vLu4ISBiDtk=;
 b=DWt/IW5iTiJuFdKySxXe/u8ZM2xivsOCZIeSJPaLQseWNAb2LGlkoIeWzw4rDAztHh
 lGWzWEf5e3Xetp9zUbH80REkydjclSSLXwv5fn9dKednX+X44gs0TBvY0T4bWC2R22hZ
 rc0GxARNjAv5hZB/Xw898dmY091/0pot9hn9hMaGHeeAZNELSzvJLTuhNdblrjv25ZZ1
 /nRgFF2G7a5lm3FuKTwDZjFnFHi/6GAK2lqF0hhXJ0dUl9vCY/t3GMgYCH7PigSbAJ4h
 QxW9esCoWqGFKlASOpemnAmG90MTPBdhAIGa6VYbAlL0OuUTC87dmwXOUcbYFdmmmrw6
 DxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yhhTks9k7nEzj+aqUPzjcgfPfrYu7EH2vLu4ISBiDtk=;
 b=GGoWdMo21HX0JcA39a4u+Gj4mrUD4KCifTwHDUBSBa4vfYXN7/XvmGGxprpLzPZza5
 4GtAhdHEcQUjw3S58jt48VNMcoXNURod/vfJl1JAitv5J2YTLzXiF7Ne8H1c7yiPPOr/
 x4voBJJLboUjs3ie0Hhzj/23anjU/+3cwybNxIdzVEHw6sKuEkserC0fyVHwG7yt6KVb
 lnSQdl9Ym6F+YugDDoXn74agySqz87p+0KDv0colbdMB6Ma51cLQZqNh06e2GThxbYRI
 kKmkhssygS49n6LKwLAJFvx89/n5iU1snUKRAsjoJjsjEFwpoZ8wKbAaqpOxLA0pDjAT
 gaYA==
X-Gm-Message-State: APjAAAXWdlRIig8JFK7HXd+GDfauyzRoZpRItsN9oDcg6qBMspQimGQY
 +5rKyfbYrqJ5tE6v1ajPPQk8WMWypiKt1fkq4qw=
X-Google-Smtp-Source: APXvYqwdVUJE/2oWoyFAfBzcKEi4mRXrXogdySO7cGxwUbUTLuzL6gabc5kqGwLm/BmR7O6IXFq3v2LF0AqX/kj3+dg=
X-Received: by 2002:a7b:c051:: with SMTP id u17mr71032749wmc.25.1563950564848; 
 Tue, 23 Jul 2019 23:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-2-daniel.baluta@nxp.com>
 <20190723170035.GO5365@sirena.org.uk>
In-Reply-To: <20190723170035.GO5365@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 24 Jul 2019 09:42:33 +0300
Message-ID: <CAEnQRZC_mNnwYkpdiX2d_ccT_L-hivWdxQTMEUojjDWv+NCiQg@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [alsa-devel] [PATCH 01/10] ASoC: fsl_sai: add of_match data
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

On Tue, Jul 23, 2019 at 8:01 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Jul 22, 2019 at 03:48:24PM +0300, Daniel Baluta wrote:
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > New revisions of the SAI IP block have even more differences that need
> > be taken into account by the driver. To avoid sprinking compatible
> > checks all over the driver move the current differences into of_match_data.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  sound/soc/fsl/fsl_sai.c | 22 ++++++++++++++--------
>
> You need to supply your own signoff if you're sending someone else's
> patch - see submitting-patches.rst for details on what signoffs mean and
> why they're required.

Ack. Sorry for missing this.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
