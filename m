Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EC45ADD18
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 03:55:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22FB9164F;
	Tue,  6 Sep 2022 03:54:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22FB9164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662429338;
	bh=GU7Qqw7lO9awg8Ih2fW3i5q0ueFhVdf6pdbcXQ8ujZE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bno3x097q9dDZGBmmB5g9IrVc/3fVRT3SOu6+dQxT+kzu2SstV/sEqx6XGmGhwDrL
	 qiFxPC/PwyEcBB/qNC4egmyVgZOzohCaJo2GziHUN4+8gTIBq+pFFq+C92x8tVtvsy
	 Trmeib3R1Wrr5H53Fp7H+TTyWbkfpTuQoPbhEZNk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7258EF8024C;
	Tue,  6 Sep 2022 03:54:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D190F80249; Tue,  6 Sep 2022 03:54:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA42FF80165
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 03:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA42FF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lW+LPTis"
Received: by mail-lf1-x12f.google.com with SMTP id u18so2941979lfo.8
 for <alsa-devel@alsa-project.org>; Mon, 05 Sep 2022 18:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=zcTwaijpd2111xsDdervpJH9/9EDsphYRA2s0wo+LWI=;
 b=lW+LPTisK5EL83PlNfwHIRgyD85NBZqOEhnGqWrhWcjI4xy7mDs6KH+ClAngeTn3mQ
 o41+m6JMXXfnI3z7rXvvpHApZi2olOFeCTWeErVjcYbzHcnRO274gIKW9id9dk3LXBnh
 bbfcWOdXFd8ZBVd7IeBMigdDleaCs9ntPhGI05yA60yusbVBl/jJ/jUNgUFmratMpVWu
 o5+vAGEvo1bogvKe/e1urzLcG9AROxbJsvBd9Y7NGwPMgz/qKTRuHDO7U0IbosJy5W3b
 PgPP2rZdU0VwXPD/iKieDymxIIU7vbLOHdmY/5OhVO1y9fem2WppQEMcZ7nY5mXXR8kF
 K6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=zcTwaijpd2111xsDdervpJH9/9EDsphYRA2s0wo+LWI=;
 b=tl2nYz86IhGBf8vxHlpJBRgFLzLYvbZmYcuXTjWFBD5anct0x7N7t2V3M0uMAoZbyo
 LqcEMSwfQqNga7m258YAN9WuRWAxhBG2wtnvPPpwiVRBg9/p+3Z9bPpen+YCayNTPAy0
 GhZE6DIBkeOtFjwC3+ldE/CB4GnJxPw8MAwjqd9G3bcWQrvSR92x8c2n96eIRAzXEXgD
 IQhOnMu2sSDqmyjjOxbyH67pdjSaZrMl7PNXkeSmYIgK5edO3cbmvfSZhR0mPiuZgYXx
 uXRATRsRfACEVbJxrZS0DWM+reysoFTRX4tdWCYtoOu9ZPCHJ5z2oV9DckI4s+mjuD3u
 ynWg==
X-Gm-Message-State: ACgBeo05ShESpUJYisdS+lWG0MnZf0Q3KoPd3Qw4weJGv3VFbjuduIA3
 vcx90vKPOhBlt1ssAwcq3x5Zz8cFH17IG19d/EU=
X-Google-Smtp-Source: AA6agR6rpzNvrgDBOH7xaVDM/+HbHO0nMeVMUOH9wH2pSgnS+vmy/lSZkWXIl5pFi/oGBhvCu4veg5fAaBqtC69FIqE=
X-Received: by 2002:a05:6512:2211:b0:496:7767:28b with SMTP id
 h17-20020a056512221100b004967767028bmr1252696lfu.433.1662429268454; Mon, 05
 Sep 2022 18:54:28 -0700 (PDT)
MIME-Version: 1.0
References: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPQomcnO5dhkT9DBynwJo8LfVvuuwj5AYNpv0KhAGSWLEw@mail.gmail.com>
In-Reply-To: <CAGoOwPQomcnO5dhkT9DBynwJo8LfVvuuwj5AYNpv0KhAGSWLEw@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 6 Sep 2022 09:54:16 +0800
Message-ID: <CAA+D8APOL1Qx0fAhyajXXzh0_tqEmDJoDBh3Xgo6uYNhV0usBw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add initialization finishing check in
 runtime resume
To: Nicolin Chen <nicoleotsuka@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Mon, Sep 5, 2022 at 9:15 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:

> On Mon, Sep 5, 2022 at 3:47 AM Shengjiu Wang <shengjiu.wang@nxp.com>
> wrote:
> > @@ -1295,6 +1301,17 @@ static int fsl_asrc_runtime_resume(struct device
> *dev)
> >         regmap_update_bits(asrc->regmap, REG_ASRCTR,
> >                            ASRCTR_ASRCEi_ALL_MASK, asrctr);
> >
> > +       /* Wait for status of initialization for every enabled pairs */
> > +       do {
> > +               udelay(5);
> > +               regmap_read(asrc->regmap, REG_ASRCFG, &reg);
> > +               reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
> > +       } while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) & 0x7)) &&
> --retry);
> > +
> > +       /* FIXME: Doesn't treat initialization timeout as error */
> > +       if (!retry)
> > +               dev_warn(dev, "initialization isn't finished\n");
>
> Any reason why not just dev_err?


Just hesitate to use dev_err. if use dev_err, then should return an error.
May one of the pairs is finished, it still can continue.

Best regards
Wang Shengjiu
