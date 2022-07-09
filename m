Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 618B056C92E
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Jul 2022 13:20:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A11371E0;
	Sat,  9 Jul 2022 13:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A11371E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657365628;
	bh=P9qXaIhxFC6+8fTvyYkeE1kTylV+p63686gjULLpVls=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bc22yqkOrMmNNsR8P2zdeWhdYFK38Hy9prGBmLYaTeBVUyE8AJb6kjA9L9spqafzN
	 DP7mUKbXpLNaaVJ/s+RqVJDQOVb028v+X/k+qe3+8hcBi8bTrLIbOf4KS/7JYct9q5
	 GgR+M+w+sTmE9iIKYnlnP/G2f4pO0cYi+q2PYt2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25E9DF8027B;
	Sat,  9 Jul 2022 13:19:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 970C1F80245; Sat,  9 Jul 2022 13:19:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ACC9F80158
 for <alsa-devel@alsa-project.org>; Sat,  9 Jul 2022 13:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ACC9F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NuHnaQrW"
Received: by mail-pl1-x62a.google.com with SMTP id m14so827798plg.5
 for <alsa-devel@alsa-project.org>; Sat, 09 Jul 2022 04:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E0U2f8AlutwheN7//h+zggScNcjOdKkreAo98lrJZVg=;
 b=NuHnaQrW8P4ZdBQT2RtPxt8rWe7940nmw9arHjIH4shbwGVFtcV3eapuSmDPfHLdSC
 +asCfSO1jjgSLJnD7DIRlL/avEZ1/UGIOjsmMv/5CPTy/hr6KWZFSTNHIIKU+lZkAtfN
 HDqv7TSAQzgnVhX1i3k/OlppdHXedQuiBUm8wfckKmOdNpm6AV9udg7GMwTOfz/5cKUx
 RS2NaBRh912pG5IBgoiHqeoIPUtrWUm8obeTErCFIPecxAmaPpXnwb4BH2iq8JUxnED0
 hKsS9zV3Zg41HgjPjVnkN3ThM3XDaj11neyZQN9xE79FjBCmHI30SlhNcUzOoHZHmFcY
 Z5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E0U2f8AlutwheN7//h+zggScNcjOdKkreAo98lrJZVg=;
 b=OVIS8m0nQJdqUmHOPtiWE5WeaW7QjG/beLgO7CYlM8kTxw7eiAoJNW7rHc6gulZ5xp
 SCOxmBiN6488UkNs9ruPASNO3bfqQbi4gmUJvQ+JgngcnZTtAoOwunGqDCJbdOLb5BvN
 xNsGW9dy1LzYFoS6bS1SXcUHnpg9v6b+xenG3FfSkDI+RXOpWBsVNXYY8py4OGWOqs9f
 yyMniCCPnKPcPHeXzIMJtfABAbO1QzpiehKGAIctaRgH0DrNbZ/q9plkJNVgmhgfwQIR
 L187e3jAuKRmXwmuXOCyrqA7nQi9LMxt8V863iSJXg5m4llisV6OW9v3cz3AaZIuIXgF
 40pQ==
X-Gm-Message-State: AJIora8iZFYpIGA0pFI2qIGGTNmzOCYGnQiu1D5XSEKAzu4BHx1ZshUX
 Ct7Ma4RUJU4XIYtPGXdlT6NnKjFXzvHdyKBFM74=
X-Google-Smtp-Source: AGRyM1ujT+o8J49DlFm0byoNCrJ0dLzk2zmVutb9HlZqCklms4gL97JzrsZjHSfkyqiWim+Gte0J0r1+Yjflwq8bvuo=
X-Received: by 2002:a17:902:f609:b0:168:dcbe:7c4d with SMTP id
 n9-20020a170902f60900b00168dcbe7c4dmr8463609plg.169.1657365560394; Sat, 09
 Jul 2022 04:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <CADs9LoPZH_D+eJ9qjTxSLE5jGyhKsjMN7g2NighZ16biVxsyKw@mail.gmail.com>
 <15259e38-eccf-d294-a330-a48b5bbbdedf@linux.intel.com>
 <CADs9LoN-L0X1Dr1sP2K7xrcWm7dpHW6MhF47c2eBB0moLNnPRQ@mail.gmail.com>
 <18d3e724-e43f-c166-e322-26cc5e3890b7@linux.intel.com>
 <CADs9LoOZjK=cUuNSEELtgxYoA+yHVFKM_Y9YLcY74smqx8XsjQ@mail.gmail.com>
 <c554b69c-0c73-158d-85d8-95a0375babeb@linux.intel.com>
 <CADs9LoOOOXVC0p8R=b1y+Kfb1+ESEyMaVe9eoW=F5gdp0_GitQ@mail.gmail.com>
 <c4d32547-5f99-595e-21d3-fdb22a1af237@linux.intel.com>
 <CADs9LoNMuwbiSfgF1buDoY6=ecpR-BuZvTgXbFxe3qyL1=roUQ@mail.gmail.com>
In-Reply-To: <CADs9LoNMuwbiSfgF1buDoY6=ecpR-BuZvTgXbFxe3qyL1=roUQ@mail.gmail.com>
From: Alex Natalsson <harmoniesworlds@gmail.com>
Date: Sat, 9 Jul 2022 14:19:08 +0300
Message-ID: <CADs9LoOJu-NYxPhDL+N+xBtocPNw2y0nRHbSaO-NmGO284GPfA@mail.gmail.com>
Subject: Re: Sound not working after commit
 bbf7d3b1c4f40eb02dd1dffb500ba00b0bff0303 on Amlogic A311D device
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.de>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

> > +       if (!fe_substream) {
> > +               dev_err(fe->dev, "%s: fe_substream not initialized\n",
> > __func__);
> > +               return -EINVAL;
> > +       }
> > +       if (!be_substream) {
> > +               dev_err(be->dev, "%s: be_substream not initialized\n",
> > __func__);
> > +               return -EINVAL;
> > +       }
> > +

Will be this in upstream or needing bugzilla reporting message?
