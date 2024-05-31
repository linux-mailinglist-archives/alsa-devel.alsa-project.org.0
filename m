Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 091558D64C6
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 16:49:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 141F8857;
	Fri, 31 May 2024 16:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 141F8857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717166939;
	bh=qjG5sk5AW4DnjPOlkdayQAmvAKdwXxis0W1RtTvM0YY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rZMjN1mb4WdK0oAoimN2lZaLFoHpfCnEhXMdq1A3j2rJeHhrs1BHESbxVBtOFHuUo
	 koj8IijW21nbPbpjJ2qzCedmp3f/FyGoV7BDveB+Kb6LDdhWmhLfR6CLYd+s0WvSDP
	 PJos4xIKi7m6YWaJTVshVDX4Aw+w22nDx2lG5Xes=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E12CF80587; Fri, 31 May 2024 16:48:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B68DF80589;
	Fri, 31 May 2024 16:48:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D1AFF8047C; Fri, 31 May 2024 16:48:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BEAE5F8003A
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 16:48:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEAE5F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=SdiCNzQZ
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 652479C584C;
	Fri, 31 May 2024 10:48:15 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id X9AwXBwr79HS; Fri, 31 May 2024 10:48:14 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id CA82F9C58D5;
	Fri, 31 May 2024 10:48:14 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com CA82F9C58D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1717166894; bh=kchiTinbtwESPzQeP7Vb31GmvIj0rK/lVr0ouZd4gSo=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=SdiCNzQZ1hd90TLzQQg+YhNcEKlzhtyi0dMmWZsuakVAg4zC8oa8Ln/wuzFtjnZK6
	 umuqOtoS5gkAHEBujnoCEOKYsXDvBh7k4WB/XCvwIBLWucfTHY73fNM4O9rU+BqSur
	 biWGtwErgzOoA/ZiQJHHv24hgOQZUfQtinNump2ygkCTh6ox6DlEHxwE85rJMdAjBk
	 cj9wBia7YVfb9fgXSVg18pbAViYC196NYW9D6jWI18BvnfTAn9m4XWsvWiwaGZEBGM
	 NVyq3W/ZG6KUkux0S4tKghCh9c2/NGndA3PTc151uQ9mRgg9k7xn+nLrLuDs/1Kzb1
	 s9Ne6y55WTWOg==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id f6p0tkYRN10f; Fri, 31 May 2024 10:48:14 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 8F58C9C584C;
	Fri, 31 May 2024 10:48:14 -0400 (EDT)
Date: Fri, 31 May 2024 10:48:14 -0400 (EDT)
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
 <1220272166.706254.1717166894551.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <291daed8-a2e1-44d4-9a71-5bca2c585720@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
 <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
 <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com>
 <500db9de-6113-4e73-ba92-6e52ea292b32@sirena.org.uk>
 <1598202415.701258.1717159684103.JavaMail.zimbra@savoirfairelinux.com>
 <291daed8-a2e1-44d4-9a71-5bca2c585720@sirena.org.uk>
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112
 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: dt-bindings: fsl-asoc-card: add compatible for generic
 codec
Thread-Index: fUODjmUMbozLiD+24hweZL0h4n337g==
Message-ID-Hash: 5JW3XLSUTEXECNBY6B7BJUO6OF5F4E4Z
X-Message-ID-Hash: 5JW3XLSUTEXECNBY6B7BJUO6OF5F4E4Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JW3XLSUTEXECNBY6B7BJUO6OF5F4E4Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Mark Brown" <broonie@kernel.org>
Sent: Friday, 31 May, 2024 15:14:13

> On Fri, May 31, 2024 at 08:48:04AM -0400, Elinor Montmasson wrote:
> 
>> Then maybe it's not be a good idea to make this compatible generic
>> for this contribution.
>> The original intention is to bring support for the S/PDIF,
>> so maybe the contribution should focus on this use case?
>> In that case, would changing the compatible for "fsl,imx-audio-spdif-card"
>> be acceptable?
>> "fsl,imx-audio-spdif" is already used for the `imx-spdif.c`
>> which does not use the ASRC.
> 
> Why not just use the existing compatible - why would someone not want to
> be able to use the ASRC if it's available in their system?

That's true but it will be a problem if both `fsl-asoc-card.c` and
`imx-spdif.c` drivers have the same compatible, and they don't
have the same DT properties.
