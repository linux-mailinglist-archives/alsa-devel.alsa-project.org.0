Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C7DC3A8E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 18:31:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D50FD167A;
	Tue,  1 Oct 2019 18:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D50FD167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569947499;
	bh=jNnL45RQ73c6RkRFitqvOnKrKxMZmx9rvMbxqzzJnPk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PGEtgfFiPxoeVM0W/EIJU2k37vZh3H8ZBpOVeWRHeQKSxCUaSDny+BPQammX0qLfN
	 JWB/za3BJnoHoFAFowyimfIS3X1Hv582ObR4jbuTwjyj8RPlOfb2jb9ZPqQP2ioswI
	 5U2ceCFNzxYnKB86nOIVfkiMJcQ69/O9PJnXknu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9462F80519;
	Tue,  1 Oct 2019 18:29:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C7D9F80506; Tue,  1 Oct 2019 18:29:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 617CBF800D0
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 18:29:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 617CBF800D0
Received: by mail-qt1-f196.google.com with SMTP id j31so22390825qta.5
 for <alsa-devel@alsa-project.org>; Tue, 01 Oct 2019 09:29:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0zO73icoSPJ3pNVWiNNF9L9OEEbriWKwEbaN0EtJRPI=;
 b=HMr/xjJ+f3EuVMIa8FGFEvUSQnuZ520/gqdsdbDHb0OM2kQWqsFARHLwAZWRi8NS1r
 9tT8fdQtYK9BDW6RtntaAiuN510itVBxgdtGpjzAIt/bQkQT15oDRTmS/gTL6RJ1wm5+
 j5hbtvq5ElRr+kZ9cipumoAjZRrwykqrPqoE7AWhp/V4d3rMzfcHwNADweUDBdFRTyC+
 INcw0IG3lbfmw5axmevQ61uGpzn5kc35o4IgsaSOVbHoQ4aThwY/EtH86ojhcDMkmuUe
 v6OixiR1PlXjUsBRXsbNc4LHWMlNBfP0CECbxMvprsSneis/2P0EZKj/DntwriCqIZ90
 HmYQ==
X-Gm-Message-State: APjAAAXz51khEXQNDuZtUusl1wvMW+B1DFwVJ6j6H1+arqzsuhLKTeNc
 7e4SM+GAqRpgR11CWO8DoFDSnuf47Ko9et72jVw=
X-Google-Smtp-Source: APXvYqxkgIX2gcVaLjsRtcgaC+7CiGnoTPy8gmARgU5xbBtCjA5leLB24V7ISErrIwWtMs8YA3rGRE+qoQ6Sf7PgVcI=
X-Received: by 2002:ac8:1a2e:: with SMTP id v43mr31469917qtj.204.1569947386677; 
 Tue, 01 Oct 2019 09:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20191001142026.1124917-1-arnd@arndb.de>
 <bb58c7cc-209d-7a2f-0e5b-95a9605ffe7b@linux.intel.com>
 <CAK8P3a3Js2dNhnRhP7PLadWZ69DZr1mz6DowN9HDJL4CFDAAFw@mail.gmail.com>
 <e4b90233-846c-bfc1-68a3-a7b7c28b60bd@linux.intel.com>
In-Reply-To: <e4b90233-846c-bfc1-68a3-a7b7c28b60bd@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 1 Oct 2019 18:29:30 +0200
Message-ID: <CAK8P3a1vHECVV86JHxEZmo7jQOosHO=H33v784keqLMNiiHSxA@mail.gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Hulk Robot <hulkci@huawei.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: imx: fix reverse
 CONFIG_SND_SOC_SOF_OF dependency
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

On Tue, Oct 1, 2019 at 6:03 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> On 10/1/19 10:41 AM, Arnd Bergmann wrote:
> > On Tue, Oct 1, 2019 at 5:32 PM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:

> >
> > The same could be done with a Kconfig-only solution avoiding
> > 'select' such as:
> >
> > config SND_SOC_SOF_IMX8_SUPPORT
> >           bool "SOF support for i.MX8"
> >           depends on IMX_SCU
> >           depends on IMX_DSP
> >
> >   config SND_SOC_SOF_IMX8
> >           def_tristate SND_SOC_SOF_OF
> >           depends on SND_SOC_SOF_IMX8_SUPPORT
>
> Ah, nice, thanks for the suggestion! That would be my preference, we
> have a similar select for PCI and ACPI parts in sound/soc/sof/Kconfig
> and I was looking for a means to do this more elegantly.
> I can submit a new fix or let you sent a v2, whatever is more convenient.

Ok, please send a patch then, I can add it to my randconfig test tree to
make sure it covers all corner cases.

    Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
