Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC29750FA1A
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 12:18:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56F9C1713;
	Tue, 26 Apr 2022 12:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56F9C1713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650968309;
	bh=g6+7cXF3JT196WzugX+OIzHx1jFxWvUU/Q4olOqgGug=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ftRuCYvun+Cqv3Zu3nERXN+HtB0q9KXHH4gaS5X7lEWW5ifHlPQMEP/tWDHgvkRie
	 eWFpyvMXMCcnHkcJB9J41tHG6f/M6KUeG/In9SsTu9LjY6U95BEegdNIBLAZt0qZCm
	 NSUjwLxaqlN5zXYLjvTy+RYmrd7p8G7RH6WuhLZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B23D7F80171;
	Tue, 26 Apr 2022 12:17:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFE6CF80152; Tue, 26 Apr 2022 12:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mxout02.lancloud.ru (mxout02.lancloud.ru [45.84.86.82])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C8B1F800AE
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 12:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C8B1F800AE
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 8F9C620C0892
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH v2 2/3] ASoC: sh: rz-ssi: Propagate error codes returned
 from platform_get_irq_byname()
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
References: <20220426074922.13319-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220426074922.13319-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <5bb82736-50bc-eafd-7d68-df1ed966d572@omp.ru>
 <CA+V-a8s=7nDHEE=kcdqcyM5SurY9KwteNwnc7PZ4xiqGQFvY=g@mail.gmail.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <fb6b6a4c-d184-8c26-ac25-4afbacf3d534@omp.ru>
Date: Tue, 26 Apr 2022 13:17:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CA+V-a8s=7nDHEE=kcdqcyM5SurY9KwteNwnc7PZ4xiqGQFvY=g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Cc: alsa-devel <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Liam Girdwood <lgirdwood@gmail.com>, Pavel Machek <pavel@denx.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Takashi Iwai <tiwai@suse.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 LKML <linux-kernel@vger.kernel.org>
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

On 4/26/22 12:55 PM, Lad, Prabhakar wrote:

[...]
>>> Propagate error codes returned from platform_get_irq_byname() instead of
>>> returning -ENODEV. platform_get_irq_byname() may return -EPROBE_DEFER, to
>>> handle such cases propagate the error codes.
>>>
>>> While at it drop the dev_err_probe() messages as platform_get_irq_byname()
>>> already does this for us in case of error.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>> v1->v2
>>> * No change
>>> ---
>>>  sound/soc/sh/rz-ssi.c | 9 +++------
>>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
>>> index cec458b8c507..d9a684e71ec3 100644
>>> --- a/sound/soc/sh/rz-ssi.c
>>> +++ b/sound/soc/sh/rz-ssi.c
>>> @@ -977,8 +977,7 @@ static int rz_ssi_probe(struct platform_device *pdev)
>>>       /* Error Interrupt */
>>>       ssi->irq_int = platform_get_irq_byname(pdev, "int_req");
>>>       if (ssi->irq_int < 0)
>>> -             return dev_err_probe(&pdev->dev, -ENODEV,
>>> -                                  "Unable to get SSI int_req IRQ\n");
>>> +             return ssi->irq_int;
>>
>>    Why not:
>>
>>                 return dev_err_probe(&pdev->dev, ssi->irq_int,
>>                                      "Unable to get SSI int_req IRQ\n");
>>
> That is because platform_get_irq_byname() already does this for us [0]
> (also mentioned in the commit message). In case I keep the
> dev_err_probe() I'll get two prints for each error.
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/base/platform.c?h=v5.18-rc4#n471

   Ah! Sorry, didn't read your commit log... :-/
   More shame on me as it was me who added dev_err_probe() call there! :-) 

> Cheers,
> Prabhakar

[...]

MBR, Sergey
