Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6075C914612
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 11:19:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82088852;
	Mon, 24 Jun 2024 11:19:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82088852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719220764;
	bh=8z0Me58ofAkCeMYK+RbmJRN1l1eSvoaq0OwoETOXuEI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CglWti3pg+d4ktEwxOM1mwMMsvq6rYPDDNgoySlmkzJ+KVAmC+GxX4uB4MbvUobcD
	 LpThP6v9DsTP1aoDaP3Kv7B7OmHiiNlXlrTtXjAbAv+Mfbn99SQwPHc2thkRqBv7UT
	 SEG4RwumexjW5cEVUpg6+EbqWeilqfgs4Qvh63NE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6389DF805BD; Mon, 24 Jun 2024 11:18:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 26143F80589;
	Mon, 24 Jun 2024 11:18:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D698F80423; Mon, 24 Jun 2024 11:18:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25305F800E4
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 11:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25305F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=dQMmv2nS
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B63739C3240;
	Mon, 24 Jun 2024 05:18:39 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id HR5yBegFxqJ5; Mon, 24 Jun 2024 05:18:38 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 492A09C5B61;
	Mon, 24 Jun 2024 05:18:38 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 492A09C5B61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1719220718; bh=4JOrFwNYAzMjJc3yCOi7qIx5d2JoABbFOVFqt1WuodE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=dQMmv2nSrtJBDMOLXfbnYdr0xEsQ+JPCN2ISsqaHfK0rFiK0iVxB7g3L69NRikKSF
	 tFs9D3pn8s8IrJT0B8gBXrghZesBG0biCOcu54hq0wciU5P0mB0DqJzghiLCD4GHdP
	 AMp+VJD/fXUB64TKqeZowTL1e2NWWAuHvxalaXKz4yMRxBqj6XRpaaeL019JzRMbrc
	 Xt8NUIaDhSAFLqFQU9ufuJqullhXIzBF96BK6f0WwRh5+a+5XdxVEesD20tbVhIBld
	 Lafq1lysngw69xaWD5/bUlPMWd5pYLunOPrmkZ7Vg8a9GBKgukkSz1IH2wvpn6Cm74
	 c6Y3zVSYLCvIA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id VquOXrQmnN-2; Mon, 24 Jun 2024 05:18:38 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E46679C3240;
	Mon, 24 Jun 2024 05:18:37 -0400 (EDT)
Date: Mon, 24 Jun 2024 05:18:37 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	shengjiu wang <shengjiu.wang@gmail.com>,
	Xiubo Lee <Xiubo.Lee@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound <linux-sound@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>, imx <imx@lists.linux.dev>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	alsa-devel <alsa-devel@alsa-project.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
Message-ID: 
 <1048207382.1714780.1719220717882.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <42b32958-89ee-43b6-96d1-f3e18c7d8955@kernel.org>
References: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
 <20240620132511.4291-8-elinor.montmasson@savoirfairelinux.com>
 <17a0efe3-72fa-4d13-b3b0-90e6640308f3@kernel.org>
 <1566099232.1714447.1719219107779.JavaMail.zimbra@savoirfairelinux.com>
 <42b32958-89ee-43b6-96d1-f3e18c7d8955@kernel.org>
Subject: Re: [PATCHv5 7/9] ASoC: dt-bindings: imx-audio-spdif: remove
 binding
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112
 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: dt-bindings: imx-audio-spdif: remove binding
Thread-Index: ewOgNpthlCv+G0hUX/mmtwgvLix7HA==
Message-ID-Hash: HSIYQYQDQD7Z4BAGWXB3SDLVWRKRA3VA
X-Message-ID-Hash: HSIYQYQDQD7Z4BAGWXB3SDLVWRKRA3VA
X-MailFrom: elinor.montmasson@savoirfairelinux.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HSIYQYQDQD7Z4BAGWXB3SDLVWRKRA3VA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Krzysztof Kozlowski" <krzk@kernel.org>
Sent: Monday, 24 June, 2024 10:55:31
> On 24/06/2024 10:51, Elinor Montmasson wrote:
>> From: "Krzysztof Kozlowski" <krzk@kernel.org>
>> Sent: Sunday, 23 June, 2024 13:09:33
>>> On 20/06/2024 15:25, Elinor Montmasson wrote:
>>>> imx-audio-spdif was merged into the fsl-asoc-card driver, and therefore
>>>> removed.
>>>
>>> So what happens with all existing users (e.g. DTS)? They become
>>> invalid/not supported?
>> 
>> 
>> Next commits, 8/9 and 9/9, update all DTS files that currently use
>> the "fsl,imx-audio-spdif" compatible.
> 
> You mean in-tree. I mean all users, in- and out-of-tree. Other projects.

Oh you're right

>> From the users point of view, currently configured spdif audio cards
>> will behave just the same.
>> 
>> 
>>> After quick look, I do not see backwards compatibility in the driver and
>>> above commit msg tells me nothing about ABI break.
>> 
>> 
>> For the next version I will state in this commit message the upcoming
>> modifications to DTS
>> and compatibility, why it will be done, and that support for existing DTS is not
>> dropped.
>> 
>> Previous `imx-spdif` driver used the dummy codec instead of
>> using declared spdif codecs. It was discussed in previous version of this
>> contribution
>> that using the dummy codec isn't good practice. So one to one backward
>> compatibility
>> isn't really possible.
> 
> Heh, that's not good. This is improvement, cleanup. While it is
> important and useful, it should also not break existing users.


Should I introduce then the use of the dummy codec in `fsl-asoc-card` to
assure backward compatibility at least for a time ?
With maybe warning messages in code to indicate that spdif codecs drivers
should be declared and used in the future ?


Best regards,
Elinor Montmasson
