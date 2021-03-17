Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0688133EBD6
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Mar 2021 09:50:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 916DB18DE;
	Wed, 17 Mar 2021 09:49:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 916DB18DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615971026;
	bh=8mxDD/W1aV9HJ28LxFk8Y4PycNt3mrnUso9sEsG8vSI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Epxm8xjGNMODO+nozr/S0wdzF04ak+AdQ/f+31xnxj4u/sd6o5P7AkYSazSM/T3jt
	 uHDfBZ3Vls3/vVqgqkmjwDa2+xNVqpGoZeGqT+mxWupWlcWKflkoEfrf7s1baDMdT4
	 bURsMCtGyVoyQY8OyCfuSsqbNJ9OSY44qKee89U8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F39CF80124;
	Wed, 17 Mar 2021 09:48:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4395F8021C; Wed, 17 Mar 2021 09:48:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 624F6F80124
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 09:48:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 624F6F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mnAGudcJ"
Received: by mail-wr1-x434.google.com with SMTP id v4so918419wrp.13
 for <alsa-devel@alsa-project.org>; Wed, 17 Mar 2021 01:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VBpt3cP49rkhcN1HDm3Z0MkEX5WMSS3fRvn/Ddo7Grk=;
 b=mnAGudcJmPDXj3PsCg383Zafr1alCSpuwgLfOQu4c4uXl480/f/Jb9eoNmwq1ZRCZW
 gSOPiEy0VwEc4Lp6MTCzjzfT+Ns/8saO+vDxOzk7kmx6vyXn7glnU6SOxKdZAyp0qytw
 ZJDJpVoZg75JxMwsRT2VPGJlePl1T5OlBzw2cDic7ZjhInRw4mxei0z0YVyIwsjNNiQn
 ikyF3KhIsF0kN1bpamn9xQwg5RNz7X97CaAfdzpK7cKg42IsEhN3SFxj1NVmv2XRZhF0
 Ps3qSAWQXWAZ/qAt1XBYGxeJfnuelMKXcVWWLXiofD0P4XxrimOfgoSlRL7rDa180oJo
 Y6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VBpt3cP49rkhcN1HDm3Z0MkEX5WMSS3fRvn/Ddo7Grk=;
 b=QJXNYcUCmq9IwSQM5YHyNVqa749Lf4CqXvLDvzB1zBE2HJ2M4xxbbggzh2T/8idJH9
 +gCYimp0GYqJWhmz9ejxgZ7yuRXJXxZ24MyVtiR72lSxnIkN9nigvko8/sEYb+12gfXP
 VgkRKiB2lx35vQqU/DOC//Ih3/9V3zTLPWDcSCH+8ZlQNoN/PQE1lHDCaNVGSTMn8rz+
 FTUpmanYfeONAd1B2aAl6eNyabcORWre4QqPmg7m9UJdp1Y/x8ZsUZXBsgJIj+t3tO3e
 tlrOKBiVWcGzO+UJDIYTUlSAKCtEMbtQBkq/B+Ush54XqUu3kibyUqhPy4bXIgq5aTYc
 g0HQ==
X-Gm-Message-State: AOAM533thB1t6FFLZ4X7W1KVgGN7WyYoWJ9uM6cz9cidGm9R6ea8d6Ye
 PXmB96ZUdzn63ACdTl4cciK3ITgTAOWzko4ZRCQ=
X-Google-Smtp-Source: ABdhPJwNbkasdtkhEZRdHf63ZqK5QSWkTi1rSy/5Vg7bz4EmHLSj2PEtEu5k8z2p7n7pWIUZG0FutNwXSSTIiLXKnis=
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr3264627wrn.174.1615970925417; 
 Wed, 17 Mar 2021 01:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210309082328.38388-1-daniel.baluta@oss.nxp.com>
 <20210309153455.GB4878@sirena.org.uk>
 <CAEnQRZB_VgsEPYgxtWQWUgs2+noRt1AMMHf2crJ_9Hg7s7NJ0Q@mail.gmail.com>
 <20210312104931.GA5348@sirena.org.uk>
 <CAEnQRZDe_Q-N7L_7z7aVz1o3guKd6R+WFrOfT9KPbggJP8SPZw@mail.gmail.com>
 <20210312115748.GC5348@sirena.org.uk>
 <CAEnQRZAAU34YS778WJVD6uubSwQxjA-5LTG9g0CvSdSZOuO+tQ@mail.gmail.com>
 <20210312142300.GG5348@sirena.org.uk>
In-Reply-To: <20210312142300.GG5348@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 17 Mar 2021 10:48:33 +0200
Message-ID: <CAEnQRZB7BDA7gdiWH1PR_=XDiFiDW0=tPH4xY2D98=s_-mV7nw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: core: Don't set platform name when of_node is set
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, dl-linux-imx <linux-imx@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

On Fri, Mar 12, 2021 at 4:24 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, Mar 12, 2021 at 02:37:30PM +0200, Daniel Baluta wrote:
> > On Fri, Mar 12, 2021 at 1:59 PM Mark Brown <broonie@kernel.org> wrote:
>
> > > No, just the opposite!  If there's an explict name configured why do you
> > > want to ignore it?
>
> > Because the initial assignment:
>
> > dai_link->platforms->name = component->name;
>
> > doesn't take into consideration that dai_link->platform->of_node is
> > also explicitly configured.
>
> But why should we take that into consideration here?
>
> > dai->link->platforms->of_node
> > configured and we hit this error:
> >
> > soc_dai_link_sanity_check:
> > /*
> >  * Platform may be specified by either name or OF node, but it
> >  * can be left unspecified, then no components will be inserted
> >  * in the rtdcom list
> >  */
> > if (!!platform->name == !!platform->of_node) {
> >     dev_err(card->dev,
> >     "ASoC: Neither/both platform name/of_node are set for %s\n", link->name);
> >     return -EINVAL;
> > }
>
> OK, but then does this check actually make sense?  The code has been
> that way since the initial DT introduction since we disallow matching by
> both name and OF node in order to avoid confusion when building the card
> so I think it does but it's only with this mail that I get the
> information to figure out that this is something we actually check for
> then go find the reason why we check.

I will enhance the commit message and send v2. Hope to catch all the
inner details.
