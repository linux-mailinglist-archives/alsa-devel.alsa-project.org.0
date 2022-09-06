Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4603C5AE6C6
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 13:43:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95D08822;
	Tue,  6 Sep 2022 13:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95D08822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662464603;
	bh=R/V+R3o4KPj/uydzmwtf27BdyruA9iJp8ORGPcjHQ+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZUmOCo7SZv4dPrAN6Z6UECERDsnZES+SUdCY6HT3c9kfT2HE7adO4CcfEkyiVxe98
	 hroHRc9/MeQxKiQHumYvyBGBTlZmOPMPG2x9xboYXwbM0Wzic5ekS790uU1uWzJhaR
	 SFowR5rLZGVoEmFdh10bReoTSVmZEccUxxrfsIMc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE20AF8024C;
	Tue,  6 Sep 2022 13:42:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2801F80249; Tue,  6 Sep 2022 13:42:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC4EFF80165
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 13:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC4EFF80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QkM9zo9P"
Received: by mail-wm1-x332.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso7272964wmb.2
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 04:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=yfwusrA/vHTen2gLyGVSqF1Zuxr8iDP38xL+HIoCxPI=;
 b=QkM9zo9PN2dWAiC8J4q0THRsOuX24X/0IhqXiSTaZbCTClt+1QWxnekXzhtV7mEEFC
 J9ChK+JMTerYRrKuh8XoBouBuTylZMvgrtfQtzBcGjITn4BG6SvU3D15LBV3Db2pZ8g5
 JdCmBntAE0+4+tMGV7VIz1kJ8B5+kc9UW0b/xdDxGItoeLNpy8iu8WOejf7WtyNVa4Oa
 go4po6ri4qntg4X1g6oAueCnUd/Oa5vJWJrE9mOklo1xmxDP/yrU2/ZoXNbLvpRgtlrA
 lMVf2o3F9m7pu55tTpjtoZkC1pVTLp1sER3G0gkFajOCnEuwpSYzl0n/Mo9bxCaGEGEs
 l67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=yfwusrA/vHTen2gLyGVSqF1Zuxr8iDP38xL+HIoCxPI=;
 b=tvO0L20wz3SvBX/w1J1qcrj3RMf+KgxlFNAvzkmh49zql5sFHKyo3JBJz3o3lOwHfj
 31b+N6kwOpgxEBEgJ0HgGVoGBHzO/GJZ2w4P6IDGWKjEOwNwFWt9cb8UgNr9ztxTtm90
 mnXN4s2Cjnfr0rDUoTZF18AUj0p8Q5o/Q7W9yAnxrravpx5XikpF/Tldkmv4R4eERYXL
 hED4LQG+EaxvpZXXBYZ6ePXmvZCb1Cs1hmKJ6O6YT46NKlCjai7CeZGyHo0jUGREtTxA
 UqWRH2bF0wWtN+c5/iRFQVwsXr+FuGQnB3dDeZXyOAMJSFlhibgU4PzdLe5qgc3GnQde
 RVxQ==
X-Gm-Message-State: ACgBeo0OqIln4KXFcjEew3uQjy1L0wkRClsVbW8hYeK/kHk9yk2RXmR+
 4PDtmtcRtk2AsPnMGugthUuO0SRqhjgKy7NmnSU=
X-Google-Smtp-Source: AA6agR6sJco1NZSWZTgvBaNZK+j/cMNesorrtn3LYX7TH6GbgoGfKURFhUi+BOvyvq/CTWtp6gM6quAwEjcBA4oKJrA=
X-Received: by 2002:a7b:c34b:0:b0:3a6:8516:a729 with SMTP id
 l11-20020a7bc34b000000b003a68516a729mr13865234wmj.83.1662464531080; Tue, 06
 Sep 2022 04:42:11 -0700 (PDT)
MIME-Version: 1.0
References: <1662373788-19561-1-git-send-email-shengjiu.wang@nxp.com>
 <CAGoOwPQomcnO5dhkT9DBynwJo8LfVvuuwj5AYNpv0KhAGSWLEw@mail.gmail.com>
 <CAA+D8APOL1Qx0fAhyajXXzh0_tqEmDJoDBh3Xgo6uYNhV0usBw@mail.gmail.com>
 <CAGoOwPQfkT2ptdt6mBTAgPfN0NOoR4KfdLE9B2AoL+Qn6bWdFw@mail.gmail.com>
 <CAA+D8AMYrQsu-nM_WdrBtB4iPU2UYNDhPW-zdY_Z+-9L03gu1Q@mail.gmail.com>
In-Reply-To: <CAA+D8AMYrQsu-nM_WdrBtB4iPU2UYNDhPW-zdY_Z+-9L03gu1Q@mail.gmail.com>
From: Nicolin Chen <nicoleotsuka@gmail.com>
Date: Tue, 6 Sep 2022 04:41:59 -0700
Message-ID: <CAGoOwPSOEmLN+0esj2QfoadN7JZ=TJeZymxcp3MPqP4oLok70w@mail.gmail.com>
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

On Tue, Sep 6, 2022 at 3:50 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>> >> > +       /* Wait for status of initialization for every enabled pairs */
>> >> > +       do {
>> >> > +               udelay(5);
>> >> > +               regmap_read(asrc->regmap, REG_ASRCFG, &reg);
>> >> > +               reg = (reg >> ASRCFG_INIRQi_SHIFT(0)) & 0x7;
>> >> > +       } while ((reg != ((asrctr >> ASRCTR_ASRCEi_SHIFT(0)) & 0x7)) && --retry);
>> >> > +
>> >> > +       /* FIXME: Doesn't treat initialization timeout as error */
>> >> > +       if (!retry)
>> >> > +               dev_warn(dev, "initialization isn't finished\n");
>> >>
>> >> Any reason why not just dev_err?
>> >
>> > Just hesitate to use dev_err. if use dev_err, then should return an error.
>> > May one of the pairs is finished, it still can continue.
>>
>> Makes sense. In that case, why "FIXME" :)

> Just want to have a record/note here, need to care about this warning.

"FIXME" feels like something is wrong and literally means that it is
waiting for a fix/solution. In your case, it's not waiting for a fix
at all, but just an annotation? So, shouldn't it be just "Note:"?
