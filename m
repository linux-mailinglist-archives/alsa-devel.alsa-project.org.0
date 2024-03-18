Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AED88812D7
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Mar 2024 15:03:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6B3B22A4;
	Wed, 20 Mar 2024 15:02:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6B3B22A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710943387;
	bh=kNhMjJpwlz3byNUnufv33O0Jk3nCGQ44HS81muA0q/o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AtHvRIKH8uiRDBROZVubAIABAYiyIE/iVOAQKQExuGLkv2fybLKGlw+ulvQCeD5p7
	 TwQkMkeyr1jZdvaJ2mIps+IyXwIVStopq+8SoBMA/iYVI8qWv8barAtc1waG59iX2N
	 gQFRM2g9wQ5mCb0CoMgT4EyUGpjsDGLnDonh9vxw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CEF2FF806F8; Wed, 20 Mar 2024 15:00:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 782F0F806FC;
	Wed, 20 Mar 2024 15:00:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01A48F804E7; Mon, 18 Mar 2024 08:40:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18B36F80093
	for <alsa-devel@alsa-project.org>; Mon, 18 Mar 2024 08:40:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18B36F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R2GBtBin
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D169240002;
	Mon, 18 Mar 2024 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710747626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXBzCDL3hGWbPPUQVgvtbeEN3RCK/L6n100bBjyN8L4=;
	b=R2GBtBin6QsbFPPmS6krl6SbnxGtkvas5o7sKc99wBlrUB7QA3klh1sSAR9xPA9o6x2abm
	nqZoPMyPmppP8mKuzDHotJjTAANEAiqLMGPzrDq9md6Rs01Pyuc6J8wBR2anIOsX+bTuMs
	1DlXI1wVQrkQ9kyWm1ZpBg/d9LmeCRVBCvFgL8DtDPhc9xna7SJ+QRwNEHcdj5pKXh8bp4
	FE/dI1WLDy4f4TnvBCaDgWjLqDLpXBPFEWYIWredQr430YRa0ZPQDpGRkAN6yaLLonVgpQ
	0MbRedgxSb+H0XNZyD2LiuwpYbbNOy5jBN+C486V0+/aRQFp4flKgviirFniaA==
Message-ID: <622b8b7e-7bd1-4e88-b705-79f7077b754a@bootlin.com>
Date: Mon, 18 Mar 2024 08:40:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] ASoC: ti: davinci-i2s: Replace dev_err with
 dev_err_probe
To: Mark Brown <broonie@kernel.org>, Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Ujfalusi
 <peter.ujfalusi@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, christophercordahi@nanometrics.ca
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-5-bastien.curutchet@bootlin.com>
 <6102130b-b496-4e75-9b9f-f960484848fb@sirena.org.uk>
 <20240315152332.57c8fdc4@bootlin.com>
 <2f58922d-8964-4693-ab8a-612eb2f427e1@sirena.org.uk>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <2f58922d-8964-4693-ab8a-612eb2f427e1@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6MUIGHDYEXPWZ7F6ID6HOL7Y5VGHR7NK
X-Message-ID-Hash: 6MUIGHDYEXPWZ7F6ID6HOL7Y5VGHR7NK
X-Mailman-Approved-At: Wed, 20 Mar 2024 13:57:59 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MUIGHDYEXPWZ7F6ID6HOL7Y5VGHR7NK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mark,

On 3/15/24 15:40, Mark Brown wrote:
> On Fri, Mar 15, 2024 at 03:23:32PM +0100, Herve Codina wrote:
>> Mark Brown <broonie@kernel.org> wrote:
> 
>>> dev_err_probe() with a fixed error code doesn't seem to make much sense,
>>> the whole point is to handle deferral but for a straight lookup like
>>> this that can't happen.
> 
>> The error code is uniformly formatted and the error path is more compact.
>>    https://elixir.bootlin.com/linux/latest/source/drivers/base/core.c#L4963
> 
>> IMHO, to benefit of these feature, it makes sense to use it even with a fixed
>> error code.
> 
> I'm not convinced TBH, the fixed error code smells pretty bad.

Ok. I'll keep the dev_err() for the fixed errors then, and use the 
dev_err_probe() for the others, would that be ok ?

Best regards,
Bastien


