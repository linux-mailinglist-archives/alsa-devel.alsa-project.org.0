Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CFD914560
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jun 2024 10:52:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5C60822;
	Mon, 24 Jun 2024 10:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5C60822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719219155;
	bh=RejWtHxUbkZijyge52z7rC+mnFLscI0v3iUccFRy9xo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EX9Auomd8UZt2bLgiBLkpcsVAUKM7hkKUg9iDOrKnqNdT0eTL2lFTwiOj3BlOniZq
	 E7TL32PaWrFTG+uUWvLLxKTWywadpf/B4/zD3EL8qn6LKWTHREOvMAYZMmreXuoxoC
	 QdyAL0/iXQrIBisvCjrCgr+nEQBbj2kUPZ7nldEI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8574EF805B4; Mon, 24 Jun 2024 10:52:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C45FF805DF;
	Mon, 24 Jun 2024 10:52:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFA3CF80495; Mon, 24 Jun 2024 10:51:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2766F80423
	for <alsa-devel@alsa-project.org>; Mon, 24 Jun 2024 10:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2766F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=ZF75jHtR
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B13679C5B22;
	Mon, 24 Jun 2024 04:51:48 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id Yay1jmjOC1gx; Mon, 24 Jun 2024 04:51:48 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 124E39C5B37;
	Mon, 24 Jun 2024 04:51:48 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 124E39C5B37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1719219108; bh=+ewUDykI/UOo/DB+dq3CVz3C8NuvvWDy733CasIbz4A=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=ZF75jHtRyN/E+RU5Ga21+MkO2BXXJSV6H2W+pCjcTgNujcFmOIXVqY7JjqZ9vwvFO
	 M6t28Bvegah97B/e3A6ci9Tuz9FC4Fz45HTdnASJQ/UYgSECWsk9QNtKhyKmXi67QN
	 ZGHHMYMKF84OOipXbCu5stuV+2k9KLWMFKXFrRTaat2k1Py1ktCbIZ+pyBdx5RFFCf
	 r4q/lCcpIdaPfshIVVcj+KE4UhRPzv3wjWC9dxMMu4bhDseYxbJ3EdkjIpRg4jMJMI
	 m+W7Cp2+7l7erRK0wqedzzhmDLFHVkqSE+wtSjyWoEQzpPzEufpPSXy1x8m4ZTGK6b
	 B8k0VV056KtmA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id m5StIy1xy9No; Mon, 24 Jun 2024 04:51:47 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CA5529C5B22;
	Mon, 24 Jun 2024 04:51:47 -0400 (EDT)
Date: Mon, 24 Jun 2024 04:51:47 -0400 (EDT)
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
 <1566099232.1714447.1719219107779.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <17a0efe3-72fa-4d13-b3b0-90e6640308f3@kernel.org>
References: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
 <20240620132511.4291-8-elinor.montmasson@savoirfairelinux.com>
 <17a0efe3-72fa-4d13-b3b0-90e6640308f3@kernel.org>
Subject: Re: [PATCHv5 7/9] ASoC: dt-bindings: imx-audio-spdif: remove
 binding
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112
 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: dt-bindings: imx-audio-spdif: remove binding
Thread-Index: SJweIeCS/c+5zCPba7GA4ZNFgX6eoA==
Message-ID-Hash: TYXDIN3DRHGJWP6FJW6FBIWOOZZIZU7R
X-Message-ID-Hash: TYXDIN3DRHGJWP6FJW6FBIWOOZZIZU7R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TYXDIN3DRHGJWP6FJW6FBIWOOZZIZU7R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Krzysztof Kozlowski" <krzk@kernel.org>
Sent: Sunday, 23 June, 2024 13:09:33
> On 20/06/2024 15:25, Elinor Montmasson wrote:
>> imx-audio-spdif was merged into the fsl-asoc-card driver, and therefore
>> removed.
> 
> So what happens with all existing users (e.g. DTS)? They become
> invalid/not supported?


Next commits, 8/9 and 9/9, update all DTS files that currently use
the "fsl,imx-audio-spdif" compatible.
>From the users point of view, currently configured spdif audio cards
will behave just the same.


> After quick look, I do not see backwards compatibility in the driver and
> above commit msg tells me nothing about ABI break.


For the next version I will state in this commit message the upcoming modifications to DTS
and compatibility, why it will be done, and that support for existing DTS is not dropped.

Previous `imx-spdif` driver used the dummy codec instead of
using declared spdif codecs. It was discussed in previous version of this contribution
that using the dummy codec isn't good practice. So one to one backward compatibility
isn't really possible.


Best regards,
Elinor Montmasson
