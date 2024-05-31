Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABA88D6227
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2024 14:48:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59C1082A;
	Fri, 31 May 2024 14:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59C1082A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717159725;
	bh=m2xAOXligU3lprYVSulk/dW89+JgHc9BI2bSgA7HNtk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MfjgyBEN1AhuYIMNNqHcESrPliRuSwZnEbTGW7SUNUcbXh8FCf0/1Zq7GMzunAis5
	 vZ8xEi7Dj53mjFNVoZZ5Di8q7DYosWM47BQUlAnWRLkzbsuuyQH0qE+s4I7dd/I6bw
	 upGrOVq6LAhMwr5VSlJhu1KekhDH9BaLnGwKhrNo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44CE4F80525; Fri, 31 May 2024 14:48:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A78AAF805A1;
	Fri, 31 May 2024 14:48:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5144EF8026D; Fri, 31 May 2024 14:48:10 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 401E9F80051
	for <alsa-devel@alsa-project.org>; Fri, 31 May 2024 14:48:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 401E9F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=jAPZBpE5
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 098449C5848;
	Fri, 31 May 2024 08:48:05 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 7N-5VYmiZOoY; Fri, 31 May 2024 08:48:04 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5AD0E9C595F;
	Fri, 31 May 2024 08:48:04 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 5AD0E9C595F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1717159684; bh=h3D/uAawc+I8RbHTAiC8n84YabIXpASHjQyR/gpbrgE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=jAPZBpE5nA8mMRoFEtnR1W6Zxjja92p20x6h8UBQhn2VAhdjUCUIE99bWFtrG1SZ/
	 2rgsowCsQ+qWOXBktjyvP8RHaKFXQcSvymNZ8xPQiwraAL7iv/ny7lk3Uw/65LmfMc
	 MWyOEp9aGhNxCeSA8Mu8btlz266RwXJsZCEdehRlne92gwvkwt4HF6araHi24pt5wY
	 hi8uxxjhd+7PJefByXIjys01r5vqtsBzJ8deyrqXfhIk/VcH8UJFnQWg/MlllBHreg
	 hhBfmUo92dFl7h6dXXi6sWAx6e2mzSubC4yWqwWg4v5D/lu4UsnKjSX+zbBbjQ0jp0
	 7b2bKmYaz/3LQ==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 14T-wh3CS_eR; Fri, 31 May 2024 08:48:04 -0400 (EDT)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 2249C9C58EA;
	Fri, 31 May 2024 08:48:04 -0400 (EDT)
Date: Fri, 31 May 2024 08:48:04 -0400 (EDT)
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
 <1598202415.701258.1717159684103.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <500db9de-6113-4e73-ba92-6e52ea292b32@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
 <ce9a87c6-4a5c-4f0a-a8df-1fdce8c1f5df@sirena.org.uk>
 <599489232.349333.1715936741672.JavaMail.zimbra@savoirfairelinux.com>
 <500db9de-6113-4e73-ba92-6e52ea292b32@sirena.org.uk>
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4581 (ZimbraWebClient - GC112
 (Linux)/8.8.15_GA_4581)
Thread-Topic: ASoC: dt-bindings: fsl-asoc-card: add compatible for generic
 codec
Thread-Index: +Nt1Jr68s5Clyi+hmHO4sX8bYCaHcg==
Message-ID-Hash: UC4HOXGOGH2PLHGHJHD3F6SIK4GH7BD4
X-Message-ID-Hash: UC4HOXGOGH2PLHGHJHD3F6SIK4GH7BD4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UC4HOXGOGH2PLHGHJHD3F6SIK4GH7BD4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: "Mark Brown" <broonie@kernel.org>
Sent: Friday, 17 May, 2024 13:11:43
> On Fri, May 17, 2024 at 05:05:41AM -0400, Elinor Montmasson wrote:
>> From: "Mark Brown" <broonie@kernel.org>
> 
>> > This description (and the code) don't feel like they're actually generic
>> > - they're clearly specific to the bidrectional S/PDIF case.  I'd expect
>> > something called -generic to cope with single CODECs as well as double,
>> > and not to have any constraints on what those are.
> 
>> I proposed, in an reply of the v3 patch series to Krzysztof Kozlowski,
>> the compatible "fsl,imx-audio-no-codec" instead of "generic".
>> Krzysztof thought it was too generic, but it would convey more clearly
>> that it is for cases without codec driver.
>> Would this other compatible string be more appropriate ?
> 
> No.  There is very clearly a CODEC here, it physically exists, we can
> point at it on the board and it has a software representation.  Your
> code is also very specific to the two CODEC case.

Then maybe it's not be a good idea to make this compatible generic
for this contribution.
The original intention is to bring support for the S/PDIF,
so maybe the contribution should focus on this use case?
In that case, would changing the compatible for "fsl,imx-audio-spdif-card"
be acceptable?
"fsl,imx-audio-spdif" is already used for the `imx-spdif.c`
which does not use the ASRC.
