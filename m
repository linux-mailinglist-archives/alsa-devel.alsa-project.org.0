Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C74258187A5
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 13:40:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19518844;
	Tue, 19 Dec 2023 13:39:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19518844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702989607;
	bh=XaIOmRUfij5POY1EoU1RG5D6zL+0FUl4oBDF+pxTgfs=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XxVAVHDNl9crBWEUpkSj6yKVh6qJrL+jgVp0NHSwW6fvyq/uhEtNv4fclmtMiqOJy
	 aL95L7OwzWCvLPVwg/gjzuz+IM6cpTxwu+RgB1mk3S1OnqjtN9t5kj1j3HPCQ2K6Vz
	 ufyYcw+nJS3hpAG9LuLyPkv2I7efHEd6T5w+xcn0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 487AEF80589; Tue, 19 Dec 2023 13:39:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 571A8F8057A;
	Tue, 19 Dec 2023 13:39:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFB69F80425; Tue, 19 Dec 2023 13:39:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [208.88.110.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 79223F8016E
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 13:39:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79223F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com
 header.a=rsa-sha256 header.s=DFC430D2-D198-11EC-948E-34200CB392D2
 header.b=OEadJyxW
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 408709C340D;
	Tue, 19 Dec 2023 07:39:26 -0500 (EST)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 2DM_gmHPgfgS; Tue, 19 Dec 2023 07:39:25 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id A897B9C3761;
	Tue, 19 Dec 2023 07:39:25 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com A897B9C3761
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1702989565; bh=g/cVYBJM0mTrIDAKscMV4//RJwixI+M9CO1ECLAAVBY=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=OEadJyxWrvdK/4xa9av6EaA9Ad+dLk8TSbIH3LDxAbg4tb9ukdFRlhOSsNjrFLpqt
	 TYGJfpKM1bwsGQA+ijXaVyEnNaeY7h9WdSB4wdrvOYSOv7dKdQy+0Sw8Pi2byHNaWW
	 KzqrkSFqEeF7RwWll93BxMQOJUk+mLllzuDaXiMjiY/MiHPwq+J7iUa1JqihdFfLHQ
	 5aHcaqc1ICWs7ATd9NiE4tht3P7l9nYkFr2zVnFJYxLG7vZwad1jaSOlzsqYFcPJBe
	 7N4Jhksc1eQ0pNsWSmMEdka8YHblpN+Q96hYtiosT64LNnnbVXPnMyWtK5O2VjgVbm
	 SpxeGERv5UUvA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id yzoH3CKJ3_Pi; Tue, 19 Dec 2023 07:39:25 -0500 (EST)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
 [192.168.48.237])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 639659C340D;
	Tue, 19 Dec 2023 07:39:25 -0500 (EST)
Date: Tue, 19 Dec 2023 07:39:25 -0500 (EST)
From: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	shengjiu wang <shengjiu.wang@gmail.com>,
	Xiubo Lee <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel <alsa-devel@alsa-project.org>,
	linuxppc-dev@lists.ozlabs.org,
	Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
Message-ID: 
 <347346270.284192.1702989565367.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: 
 <CAEnQRZAwk-USZqXwLOVuN3iTn7r-55BJH=Sqq5+2Od+DhrK0iw@mail.gmail.com>
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
 <CAEnQRZAwk-USZqXwLOVuN3iTn7r-55BJH=Sqq5+2Od+DhrK0iw@mail.gmail.com>
Subject: Re: [PATCHv3 RESEND 00/10] ASoC: fsl-asoc-card: compatibility
 integration of a generic codec use case for use with S/PDIF controller
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.8.15_GA_4562 (ZimbraWebClient - GC112
 (Linux)/8.8.15_GA_4570)
Thread-Topic: ASoC: fsl-asoc-card: compatibility integration of a generic
 codec use case for use with S/PDIF controller
Thread-Index: lu32M+7WowvRn2WxYZZGeiz9hy0xKg==
Message-ID-Hash: DNXUJR25JPZ73L54OS3QCKLK2RF73Y7W
X-Message-ID-Hash: DNXUJR25JPZ73L54OS3QCKLK2RF73Y7W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DNXUJR25JPZ73L54OS3QCKLK2RF73Y7W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Monday, 18 December, 2023 14:54:03, Daniel Baluta wrote
>
> > * fsl-asoc-card.txt currently follows the old dt-bindings format. 
> > Should we update it to DT schema format in this patch series 
> > before adding my new properties? 
> 
> I know this is extra-work but we would greatly appreciate if you first 
> convert fsl-asoc-card.txt 
> to yml format and then add your new properties. 

I will take some time next week to do the conversion, then I'll send
it in a v4 patch series.

Best regards,
Elinor Montmasson
