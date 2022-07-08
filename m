Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7A456B8E6
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 13:53:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2FE4161D;
	Fri,  8 Jul 2022 13:52:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2FE4161D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657281199;
	bh=fNrdytLOkw/QsBiXS0EoJtZV5RiAT+3yJjoxQIOlITs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pWgjcJFeoZq+zvouWFc445rrYzARHhqCHYUy39tV7wweRyteSATIjt5uZwzQZaeFf
	 W0Xsi49VXHmbIpcjAGe4O3Pr0Ol6czEVNAERLR70MRD7CZgAG31tBR8qLaMNvyceUh
	 1s4F3EGrqpucZZBbKm7rcBxEmYsF7lQP3aJgz09w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34D60F80084;
	Fri,  8 Jul 2022 13:52:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C55BDF80084; Fri,  8 Jul 2022 13:52:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 898B9F800C5
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 13:52:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 898B9F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="D5y2O/kk"
Received: by mail-yb1-xb35.google.com with SMTP id 136so5598820ybl.5
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 04:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o4hzt77sanl4OybV4ll2qZvZornIpnMEtwCEQsVUpu4=;
 b=D5y2O/kkvS+CRB8fj92t7iKlVyuHdQESuCUs/p3FgADXbO6y1G3FdUfOF1yfIDuR+Z
 3WQf06bZk1iqCiBKMp5uzySzucvM6b8uW7TMGetw8P+CI2eAmsly2Ytkp7ZGtXmIC0Zq
 W21r7UU4CihtkIZHQmMrKgnA4v1T8FlbpxnTBnffXyfQXInF3p8sncPsi8JE51/dVdmY
 MZgdMyCFvXfjm20CqM7GqH12Rgg9uqK6hKzq8qhVlmlm16xtwlbFiz4q+a/bdgpuTvb9
 3J6Pj1M1X7i2Psd5XxEyPYEfbrNpPD1AH2XZTMWK46B4HX2ccgFLpdRYEMj7qp501mUW
 rr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o4hzt77sanl4OybV4ll2qZvZornIpnMEtwCEQsVUpu4=;
 b=TJm3blT6gUMIK8E9NitZm0MQxMd3XIauqpUjFc5cf7VfZ7oqSmNOBzgGyEQrIEak7+
 aRyA1FgAHcHto0fyTLl8fQKtQOUiBEZDmslXsAdR4xUvCn7Tamfq8ln8mwMt1T+DPy7N
 Us7h0SCV5WigBwgadP0QV/PiMlM4mVEiff3de2C/ow+smH3dMajXB+iUqju2uzgMKjyb
 sO1zNAJuUCwBYR52lCH9aVcGOrBb6ocCPk1LiRJXtm0RkO9Y/RA/b8K7kI5qN3G9wFeQ
 GkKb2bGRjTqdzuW7bAxqFLESkfANr/R2X6aBn/KDylQPKIP7KLV3X/OB4SWAuwODFNRD
 vXIg==
X-Gm-Message-State: AJIora/Q8+JGHViyHU1Yl2wOuLWANVSr7wChZwr5IzUbKZk/pIx5lOQO
 DOw8BrAm6atwzKvF6300ak+jczvsgj7vDFObaU0=
X-Google-Smtp-Source: AGRyM1tbQOwiUHCoYkN4fcmHSA8js0cP69cW4gnzfEMUkgBIihh1W9OirKc6KveGvY3N/3TIrYhNa8nRKpM/FxeYtaU=
X-Received: by 2002:a25:858e:0:b0:66e:4898:63e2 with SMTP id
 x14-20020a25858e000000b0066e489863e2mr3336466ybk.296.1657281129161; Fri, 08
 Jul 2022 04:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220707091301.1282291-1-cezary.rojewski@intel.com>
 <CAHp75VceKBoxXVPP4dRYb8LQqHMMDHFp6-E2iuZ-h2RTK8PWQQ@mail.gmail.com>
 <e0c7d254-ace3-625c-cc83-52ca0b45e9fc@intel.com>
 <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
In-Reply-To: <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 8 Jul 2022 13:51:32 +0200
Message-ID: <CAHp75VeC2b1PbzTHr-pnG9Z4d9CvYZvszz-7gpLZHhJiCw42Cg@mail.gmail.com>
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
To: Cezary Rojewski <cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Andy Shevchenko <andy@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

On Fri, Jul 8, 2022 at 1:46 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Jul 8, 2022 at 1:33 PM Cezary Rojewski
> <cezary.rojewski@intel.com> wrote:

...

> Taking the above into account, please try to use get_options() and
> then tell me what's not working with it. If so, we will add test cases
> to get_options() and fix it.

That said, I would probably expect new cases for hexdecimal input
along with using unsigned int * as an acceptor to see that there are
no bugs related to signed vs. unsigned.

-- 
With Best Regards,
Andy Shevchenko
