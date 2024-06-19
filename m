Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E3390F7BA
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 22:46:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9120BA4A;
	Wed, 19 Jun 2024 22:46:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9120BA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718829985;
	bh=pS8lzvJ4CpcgfQaJff8VtAHN+nKsoV7ysP4T1j49V98=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fgLR+bvQluRGXvgrp13KUINjJvV57j+UL44AEx/aGHjzVqc4UpnjBr/fLAqbxilQz
	 SW6mdPSzDVbEJHGVExBJqDs15l64Vxx6HSG6meBvWep2maJtp61Q9zezwSch9aFfkN
	 tAUyVTOVDRC6tO9ZsYxZ1bQD8LMYkgwn7AKQ59sM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4D230F80588; Wed, 19 Jun 2024 22:45:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE528F805AC;
	Wed, 19 Jun 2024 22:45:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 626CDF8023A; Wed, 19 Jun 2024 22:45:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from msa.smtpout.orange.fr (smtp-81.smtpout.orange.fr
 [80.12.242.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAE20F800ED
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 22:45:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAE20F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=k/LdAn48
Received: from [192.168.1.37] ([86.243.222.230])
	by smtp.orange.fr with ESMTPA
	id K2BMsLovPJk5EK2BMsLlKP; Wed, 19 Jun 2024 22:45:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1718829934;
	bh=BI0l24CYzwU9Qjet60SgYpejzTHPgIlrhe+10WvNaFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=k/LdAn48yWPg8B7gd4Cxhb1A7xM1ogt+/vJr9adNiZzIhxMLmNNnIfMZj4x5U8NY9
	 Xx3AijbEKUXvpXbt/pO94zr54rcpzJbMffEDBKMkHdrlvd08gzw0zTxiMjuOpgP1AC
	 rOrucKgnfER/GYheAN9nuUHjGpTddoHgkjC5VDq5ClmneN5YVpsneJzIer5LowCajM
	 UZhKy/yaBDj+m058Ruqc1snQc2k7uTPDGiNCzvqHlEDr++PrHANAmkLXXqShLr0KDn
	 ZWVOMu2iGceZlwq/rWcwjNornvarIBKBpwzsf81JSuePZcKt43v//hceCZDmLI3X9V
	 qqCEEyPbkp9Ug==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Wed, 19 Jun 2024 22:45:34 +0200
X-ME-IP: 86.243.222.230
Message-ID: <09ea3565-9a0d-45ea-b12c-de79d3fb5efb@wanadoo.fr>
Date: Wed, 19 Jun 2024 22:45:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
To: Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_rohkumar@quicinc.com, quic_pkumpatl@quicinc.com,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20240611074557.604250-1-quic_mohs@quicinc.com>
 <20240611074557.604250-4-quic_mohs@quicinc.com>
 <2b92c0f9-2595-4b73-8015-1abb825a61a1@wanadoo.fr>
 <f741630e-f9e8-45e1-b3e2-4866f0baeac2@sirena.org.uk>
 <288156b9-2f72-6929-3422-c3aecb9c2c07@quicinc.com>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <288156b9-2f72-6929-3422-c3aecb9c2c07@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VEQGJRFMSFEBGBNPMUQ7IX2SXDNSM35A
X-Message-ID-Hash: VEQGJRFMSFEBGBNPMUQ7IX2SXDNSM35A
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VEQGJRFMSFEBGBNPMUQ7IX2SXDNSM35A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 19/06/2024 à 13:02, Mohammad Rafi Shaik a écrit :
> On 6/17/2024 5:25 PM, Mark Brown wrote:
>> On Sun, Jun 16, 2024 at 04:54:58PM +0200, Christophe JAILLET wrote:
>>> Le 11/06/2024 à 09:45, Mohammad Rafi Shaik a écrit :
>>
>>>> +static void wcd937x_soc_codec_remove(struct snd_soc_component 
>>>> *component)
>>>> +{
>>>> +    struct wcd937x_priv *wcd937x = 
>>>> snd_soc_component_get_drvdata(component);
>>>> +
>>>> +    wcd937x_mbhc_deinit(component);
>>>> +    free_irq(wcd937x->aux_pdm_wd_int, wcd937x);
>>>> +    free_irq(wcd937x->hphl_pdm_wd_int, wcd937x);
>>>> +    free_irq(wcd937x->hphr_pdm_wd_int, wcd937x);
>>
>>> These irq have been requested wth devm_request_threaded_irq(), so either
>>> this free_irq should be removed, or devm_free_irq() should be used if 
>>> the
>>> order is important.
>>
>> Yes, this should be fixed.
> 
> okay, will check and provide the fix.
> 
> 
> Thanks & Regards,
> Rafi.
> 
> 

Hi,

just to make things explicit, in case you missed it: I sent 2 comments 
in 2 different mails.

   - the one above: 
https://lore.kernel.org/all/2b92c0f9-2595-4b73-8015-1abb825a61a1@wanadoo.fr/

   - and another one: 
https://lore.kernel.org/all/834d31cc-f4bc-4db7-a25b-f9869e550eb6@wanadoo.fr/

If you give it a look, could you please also check the 2nd one?

CJ
