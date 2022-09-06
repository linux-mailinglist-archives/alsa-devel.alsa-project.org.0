Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCE85AE4C9
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 11:51:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D32C886;
	Tue,  6 Sep 2022 11:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D32C886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662457900;
	bh=ia7zMlfXBU/VPsRf3eBTAgn3ux30jsrvKTCZp2YrOgk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g/a/BULPSIyBG2kEuOz4s5ET7IANPjqLDbQu3dcrP6aSsQdR7pdgWy7NO+Ktdvy+g
	 eu9s1cfO7wgrtu0W/tRyRM2SVdwy80JlR8GFhCdtc82POK9cFBHNVmopuP29GxQNqN
	 UCybYNXdiRYFA7KU8tF9xuS6oQgpJZK7fDNbiFTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0F3CF8024C;
	Tue,  6 Sep 2022 11:50:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4E9BEF80165; Tue,  6 Sep 2022 11:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC878F80165
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 11:50:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC878F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XJXm3+AW"
Received: by mail-wr1-x42a.google.com with SMTP id c11so10353184wrp.11
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 02:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=r+ousdY1tGkO/yzh1u+RImPQAzXSy0HohJCLKxybiYk=;
 b=XJXm3+AWkaScI7PxCvoQ855MRL/3gU+oVmXA+TmaNSnrGCkp0lfnYMcUhmEa4QvBZ+
 sYaVm+qnefpABDMbdJrRDdni0Eh99VOQtMWuBGbRav13JXoztc+hfhLMaFjP8vvKQu54
 HPlkuCHjYQqAVn4ZUcS3oLedNX/SJVn8BA6ScFhLkoSk7xuCATff5Px1s+0cJDwOypE9
 aeCEGxq8ZEKZMvQG2QmfQd+hJsGRS23M3vkDrxmLEBy2IhYuHDOKnJqwq7KxWQ2futFG
 UoK/v7u/PlffiLMY82Bk6E+/SLzjX+ot28+yAWGgalHmUmRxF+byLXHYLITxie5Y85IL
 8+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=r+ousdY1tGkO/yzh1u+RImPQAzXSy0HohJCLKxybiYk=;
 b=Fkd2z5Edr7JuvXpl4aajQsMkNytVwBCaSgqs2kCnLdy8jr9P6mROohNASS0rLYqgYV
 B+kB7Mj20EdwfVDV+a4gmGondGRCTBxdAGQ3r4X2K6VaR3bSIL8JQQ/po8xP6H7kiJEG
 6wArFNLsc1OKE8cZl+Bg+d56E3zeOdvtpxCtBF8rm/J/cOSRQdWOexHgO2AIut1tmVtf
 DpGRkUZrwkZUEiMVAbLDhOktFiADSqbGiN8ejCjvsViQapXcC6nup21GF3tpjUVrMT6n
 nmh1TkHhARvrbtQUbfk/sD38WPdGgrNgenQyKddPWbfu+KsF5FslkR7pM/yKuVlE1KQf
 h0Sw==
X-Gm-Message-State: ACgBeo2/jVPAg4a4bMp2UgqwKN9djDarWvW8w0Yts6waiLfc8cM2uu2q
 5YIq+UBxdXg6wS1f+gHuAVcq0t/Td7U7wnb/YxQ=
X-Google-Smtp-Source: AA6agR7mPLP6wpNPjaOIzvnihjyEffacKop3Imfj0A1xsiYyYOOCWztLYg9Z3U3CKn5RbQNjZJyY/3sA6fQgEUOUrgU=
X-Received: by 2002:a05:6000:168e:b0:220:87da:c3e4 with SMTP id
 y14-20020a056000168e00b0022087dac3e4mr25983316wrd.559.1662457834879; Tue, 06
 Sep 2022 02:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPQomcnO5dhkT9DBynwJo8LfVvuuwj5AYNpv0KhAGSWLEw@mail.gmail.com>
 <CAA+D8APOL1Qx0fAhyajXXzh0_tqEmDJoDBh3Xgo6uYNhV0usBw@mail.gmail.com>
In-Reply-To: <CAA+D8APOL1Qx0fAhyajXXzh0_tqEmDJoDBh3Xgo6uYNhV0usBw@mail.gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Tue, 6 Sep 2022 02:50:23 -0700
Message-ID: <CAGoOwPQfkT2ptdt6mBTAgPfN0NOoR4KfdLE9B2AoL+Qn6bWdFw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add initialization finishing check in
 runtime resume
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, Sep 5, 2022 at 6:54 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:

>> > +       /* Wait for status of initialization for every enabled pairs */
>> > +       do {
>> > +               udelay(5);
>> > +               regmap_read(asrc->regmap, REG_ASRCFG, &reg);
>> > +               reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
>> > +       } while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) & 0x7)) && --retry);
>> > +
>> > +       /* FIXME: Doesn't treat initialization timeout as error */
>> > +       if (!retry)
>> > +               dev_warn(dev, "initialization isn't finished\n");
>>
>> Any reason why not just dev_err?
>
> Just hesitate to use dev_err. if use dev_err, then should return an error.
> May one of the pairs is finished, it still can continue.

Makes sense. In that case, why "FIXME" :)
