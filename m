Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D79A90AE01
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 14:33:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02CA9DEE;
	Mon, 17 Jun 2024 14:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02CA9DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718627588;
	bh=SZu+21b3EOadKSJGfSaiut50TflCHmgMEiyIEWkOcys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z3bwZnTKkHxkC6NNyrPWvv+avi5Hw/JGXGcU6Z9ALIcMSS5+yxJF0eBDB6/TBOKDs
	 34CUGc+lL2kF/96upr6rfLCHgzm2Jm8a2CWVu7Q5EU4QpRJkIt2eLwT+Uqr/6TGpoy
	 C1Gi0dvu7kRcTaxVzoLIaWiooyhq4zmPkx3wkorg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7F19F8058C; Mon, 17 Jun 2024 14:32:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDE94F80154;
	Mon, 17 Jun 2024 14:32:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DB13F8023A; Mon, 17 Jun 2024 14:32:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02DD3F80154
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 14:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02DD3F80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=C897/DBW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718627543; x=1719232343; i=markus.elfring@web.de;
	bh=SZu+21b3EOadKSJGfSaiut50TflCHmgMEiyIEWkOcys=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=C897/DBWZf1CbuvUCm5dAxJ9NPEVeHtsXU29NX/+eMumtMjGnJJ7Wp6HuVzQAq40
	 Wiu81HXcYrjpcDpccoFpEGHJfR4KiuA4KVwsewC63ogy8KloBcVm6AlTUamov/EFr
	 HvSdrAygEjibnlT0lfrw0jZrB2CmENTj60JUcgyMXygW7FtdDNf7x+4flTJ4RbXFs
	 6xscsA4pT03Z67Nr4J6uwyH0IJg3UOlriA6LUJZUHgVhH9rxP64u13EmOBLcjyWKe
	 SVGCe2MP9s6CkNwmfI+4EJGP2SX2vLQShjoWgW+8LKgjLExaJXvAeTX3pt3oJo8Ct
	 oKPBPKH6i7yScmVjXA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MZB07-1roiM21AYL-00OQmw; Mon, 17
 Jun 2024 14:32:23 +0200
Message-ID: <919c9f61-f884-4aae-9dca-9e0d863c34a8@web.de>
Date: Mon, 17 Jun 2024 14:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 3/7] ASoC: codecs: wcd937x: add wcd937x codec driver
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
 Banajit Goswami <bgoswami@quicinc.com>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>, LKML <linux-kernel@vger.kernel.org>,
 Rohit kumar <quic_rohkumar@quicinc.com>
References: <20240611074557.604250-4-quic_mohs@quicinc.com>
 <6e1dd5d1-8c5d-44f5-99e8-f42cfbdeee04@web.de>
 <a6d17f27-51f4-47a5-8798-37bcdf3b103d@sirena.org.uk>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <a6d17f27-51f4-47a5-8798-37bcdf3b103d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oDEJkjUPAIlsV7AVUDwOgL/buRmui/li+1rQnY3ZUutBcaSilQa
 2PfoBEenwXHssLsnbrpNbLdar/Mh6Eyngc73oReWAS965iNWMFL8SBi3iVl0l87RkJz+kS6
 ctOUUlfrXcboE7cb8AVxQj4+PTqAN+UwCfe/7LIgsXEgWjBWtAnqpC2ostWXFjToXgEjSJM
 5v4DO/wWq0aITpIRWIBcw==
UI-OutboundReport: notjunk:1;M01:P0:4GwFPzN+sU0=;S6bpsAzm4afugR5kRmJsyhi4MIJ
 n1RZ4mG0AsibYjNbATV4nsOoT25bKJS5170HqLLv0LLZBk10lDjvgU8LJJAFZdCeFtDUxyY7t
 wtM/XUhgAz4G8YX5A4doawtftrHLxkuB0gbw9mCP90sK/2IamTq/E48T0E/jkP4YZtv1qLrrA
 yEdDTCIkPEe0AEjm2l0grxbF8SqMKIquUD+8UevdHBk8HW/0cztWcYD0WK98UzddwivzXdrP3
 XCiUoxIHZU7FsLFIDG1a9aE1IdN+25v/pNO7HRPMU4hhq/F9OW5GIzKdGFknqYshV0wgoHROL
 77G6uHZTMyexC5BoE1cL50Wd4ni7Ty/Ok6rWUbvgoA8LiKSQslhu7Za7evqNlpcfT35jgqORX
 olGEsb9DdFat/UNzy79AWCjtMWI9cxh6/8YMrnoFW5BpKPmhn57MVTOEIOi8d/fJp3jvVv27r
 TnBM8cS/XMrAKX9D3EGIPZNoa8s6vL3zBTrs4IppxxsesONmlO55aZiNGYzyuHK+Q1UJMValC
 3jRpGJoNxmhf8ia54hZhs2/MkO+rK3Ebq4ZbRbmySIP8WDvTGVCQz5/uPRnZmimrbMydkT7rW
 AoUe2wRX5VF77w6Z6rYVpZ8KeARR6vUJBLA64HdakIaLOrZQOnwFRDPkO8IWSl3sVHGpTco5m
 y+JeUuyv1toUR/CWEH+XAakZ6mBkB2DIVbIgu+AxHtaT3kSJXo9xEtzAjxoOaQSxjMppzkXVn
 46KSqGnSxiRBZflddVv9HIXTPgPtu6DEU2BNsAVfiQ9h1umsmJ3ApumRj3jX0Zv/ew4+ncYzB
 C0auqCReTkzFbFksOdhFdZBg0qyVOJlhXRwdFvWfuGFEU=
Message-ID-Hash: KTDHCQHKEY5CKNJG5XHGAJY3QLGAJ6YT
X-Message-ID-Hash: KTDHCQHKEY5CKNJG5XHGAJY3QLGAJ6YT
X-MailFrom: Markus.Elfring@web.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KTDHCQHKEY5CKNJG5XHGAJY3QLGAJ6YT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>>> This patch adds basic SoundWire codec driver to support for
>>> WCD9370/WCD9375 TX and RX devices.
>> =E2=80=A6
>>
>> Please improve such a change description with an imperative wording.
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv6.10-rc3#n94
>
> Feel free to ignore Markus, he has a long history of sending
> unhelpful review comments and continues to ignore repeated requests
> to stop.

Does such feedback indicate that you find advice from the referenced infor=
mation source
also questionable anyhow?

Regards,
Markus
