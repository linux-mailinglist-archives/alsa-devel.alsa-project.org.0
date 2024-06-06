Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E24DA8FF0EC
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 17:41:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6297DDFA;
	Thu,  6 Jun 2024 17:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6297DDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717688502;
	bh=gE1Kj3xuMoCiY4bdyzCrXSApgzBD60tymyxKW4bbTTM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qLSOOh9IEZ7B1dMG4MIsPFFAik1cs/Sy2Sxu52FXN0dTB4coBcCJdQSD2nXiAudkx
	 wel+8pSucwBiugOsGn0Qcpb97k8E2ZwKJ47YcmEtwR5OD4NK1TguFwBo4BSyflqO8E
	 bCQsZMQ4pJbCmsoNpoyuRmJnoB9S5ZantKZ0v12o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A2C8F804FF; Thu,  6 Jun 2024 17:41:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D63AF805A1;
	Thu,  6 Jun 2024 17:41:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BEC9F804E5; Thu,  6 Jun 2024 17:39:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37049F80171
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 17:39:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37049F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=MNHRvRGF
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2698D9C2AA2;
	Thu,  6 Jun 2024 11:39:25 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id HrID-BG8ze49; Thu,  6 Jun 2024 11:39:24 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 888079C5ABA;
	Thu,  6 Jun 2024 11:39:24 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 888079C5ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1717688364; bh=rYRVIIw22ZVkSQXnTBWHvN7qfAPVVfCh/LRBnQMA1mw=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=MNHRvRGFyj67QeHiozGPa24sXXRlCMyLfd7jNHNA5jveZIw1fEh2VzMUM8F1eT+rD
	 lwk4iYhNLjA70F5wA6ZGWuYV1MwyONWNZ2Q1TL0NzdGiF/A9Coxc95tA+hAB7T/QgI
	 kmBgd1NfRVqUpiQYsNGpvBhNTskeGmFZiWy5RGkC1qoLweYdojg5mUdmi+fAy0oLpN
	 M0eDRwuz8BImBwfN/U453mrzZAC6ZxfpCbriv2KLdHhPn7ez/mfuhAFaKY/4oA/lBe
	 s9Ra9Q6ckJDy1JDMXHijrmuj7Hm4RpGtGTPK5RfzonZdM6fnBRN9O9STLBPYkp7KoY
	 gbNO0HthXgqYw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id ijXDkcF8BT_c; Thu,  6 Jun 2024 11:39:24 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 457D19C2AA2;
	Thu,  6 Jun 2024 11:39:24 -0400 (EDT)
Date: Thu, 6 Jun 2024 11:39:24 -0400 (EDT)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	shengjiu wang <shengjiu.wang@gmail.com>,
	Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound <linux-sound@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	alsa-devel <alsa-devel@alsa-project.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: 
 <1976575756.1264121.1717688364234.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <47a7a618-31d5-4dfc-9b6b-9426c6409e80@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
 <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com>
 <500db9de-6113-4e73-ba92-6e52ea292b32@sirena.org.uk>
 <1598202415.701258.1717159684103.JavaMail.zimbra@savoirfairelinux.com>
 <291daed8-a2e1-44d4-9a71-5bca2c585720@sirena.org.uk>
 <1220272166.706254.1717166894551.JavaMail.zimbra@savoirfairelinux.com>
 <47a7a618-31d5-4dfc-9b6b-9426c6409e80@sirena.org.uk>
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112
 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: dt-bindings: fsl-asoc-card: add compatible for generic
 codec
Thread-Index: M+CiOw9Z1pP82SMivcOcvVDKOApGiw==
Message-ID-Hash: HQILGYOQC6BMQWEQAMMV7EHL62DQ6MVI
X-Message-ID-Hash: HQILGYOQC6BMQWEQAMMV7EHL62DQ6MVI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQILGYOQC6BMQWEQAMMV7EHL62DQ6MVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

> From: "Mark Brown" <broonie@kernel.org>
> Sent: Friday, 31 May, 2024 18:06:30

> On Fri, May 31, 2024 at 10:48:14AM -0400, Elinor Montmasson wrote:
>> From: "Mark Brown" <broonie@kernel.org>
> 
>> > Why not just use the existing compatible - why would someone not want to
>> > be able to use the ASRC if it's available in their system?
> 
>> That's true but it will be a problem if both `fsl-asoc-card.c` and
>> `imx-spdif.c` drivers have the same compatible, and they don't
>> have the same DT properties.
> 
> So merge the two then?

It would avoid having duplicate drivers yes, I will do this for the v5 of this contribution.
Thank you for the review.
