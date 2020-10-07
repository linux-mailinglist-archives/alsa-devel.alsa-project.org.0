Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F72D2858CC
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 08:51:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64C6016DF;
	Wed,  7 Oct 2020 08:50:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64C6016DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602053461;
	bh=R/vlV1PkjoJogVvT2cpqx7xt/Fn/oGLQjf0xA9cWnu4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CBVLrpzE9o0YVrcN/4a9lOVearJvQTDaKTfFGY0PtvqElEVjrdMsnAioFGsU91MnP
	 L+ajRnpEWkWvfp/zx++nCV4bb2NT2WCqv0faiS1Alzoqfq16MeKPRZbOXYtIAnKSM2
	 09a3yvUnLZCQiUbV/FM83TwaxPd403Ili2sZvU9I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BAA0F8016A;
	Wed,  7 Oct 2020 08:49:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 063D9F80128; Wed,  7 Oct 2020 08:49:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out-2.mail.amis.net (out-2.mail.amis.net [212.18.32.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BCD2F80090
 for <alsa-devel@alsa-project.org>; Wed,  7 Oct 2020 08:49:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BCD2F80090
Received: from in-2.mail.amis.net (in-2.mail.amis.net [212.18.32.19])
 by out-2.mail.amis.net (Postfix) with ESMTP id 9568180C8F;
 Wed,  7 Oct 2020 08:49:12 +0200 (CEST)
Received: from in-2.mail.amis.net (localhost [127.0.0.1])
 by in-2.mail.amis.net (Postfix) with ESMTP id 90936C9408;
 Wed,  7 Oct 2020 08:49:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amis.net
Received: from in-2.mail.amis.net ([127.0.0.1])
 by in-2.mail.amis.net (in-2.mail.amis.net [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id tUiipAm1VvNZ; Wed,  7 Oct 2020 08:49:12 +0200 (CEST)
Received: from smtp2.amis.net (smtp2.amis.net [212.18.32.44])
 by in-2.mail.amis.net (Postfix) with ESMTP id 2DF3AC9409;
 Wed,  7 Oct 2020 08:49:12 +0200 (CEST)
Received: from [192.168.69.116] (89-212-21-243.static.t-2.net [89.212.21.243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by smtp2.amis.net (Postfix) with ESMTPSA id 3643F7FD42;
 Wed,  7 Oct 2020 08:49:11 +0200 (CEST)
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: fsl: add ac97 fixed mode support
To: Rob Herring <robh@kernel.org>, Fabio Estevam <festevam@gmail.com>
References: <20201005111644.3131604-1-primoz.fiser@norik.com>
 <20201005111644.3131604-2-primoz.fiser@norik.com>
 <CAOMZO5CQkh06TfKj3qR9P+0ZQOQo07NAg8v9j==KMrLCWBn0mg@mail.gmail.com>
 <20201006215239.GA2912752@bogus>
From: Primoz Fiser <primoz.fiser@norik.com>
Message-ID: <06953039-2064-b3eb-f208-9133158b3ac3@norik.com>
Date: Wed, 7 Oct 2020 08:49:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006215239.GA2912752@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
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

Hi,

> Then perhaps it could be boolean?

Indeed, I can make it boolean.

In that case I would rename property to "fsl,ac97-fixed-mode".

Should I do that for V2?

Please advise.

BR,
Primoz


On 6. 10. 20 23:52, Rob Herring wrote:
> On Mon, Oct 05, 2020 at 08:35:58AM -0300, Fabio Estevam wrote:
>> On Mon, Oct 5, 2020 at 8:16 AM Primoz Fiser <primoz.fiser@norik.com> wrote:
>>>
>>> Add devicetree bindings documentation for operating SSI in AC'97
>>> variable/fixed mode of operation.
>>>
>>> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
>>> ---
>>>   Documentation/devicetree/bindings/sound/fsl,ssi.txt | 5 +++++
>>>   1 file changed, 5 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/fsl,ssi.txt b/Documentation/devicetree/bindings/sound/fsl,ssi.txt
>>> index 7e15a85cecd2..abc5abe11fb9 100644
>>> --- a/Documentation/devicetree/bindings/sound/fsl,ssi.txt
>>> +++ b/Documentation/devicetree/bindings/sound/fsl,ssi.txt
>>> @@ -43,6 +43,11 @@ Optional properties:
>>>   - fsl,mode:         The operating mode for the AC97 interface only.
>>>                       "ac97-slave" - AC97 mode, SSI is clock slave
>>>                       "ac97-master" - AC97 mode, SSI is clock master
>>> +- fsl,ac97-mode:    SSI AC97 mode of operation.
>>> +                    "variable" - AC97 Variable Mode, SLOTREQ bits determine
>>> +                    next receive/transmit frame
>>> +                    "fixed" - AC97 Fixed Mode, SSI transmits in accordance with
>>> +                    AC97 Frame Rate Divider bits
>>
>> It would be good to mention what is the default mode when such
>> property is absent.
> 
> Then perhaps it could be boolean?
> 
> Rob
> 
