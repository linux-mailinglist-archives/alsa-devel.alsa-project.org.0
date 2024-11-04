Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C009BAFC1
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2024 10:36:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 119B685D;
	Mon,  4 Nov 2024 10:36:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 119B685D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730712987;
	bh=OZU7EisROitQm9UKkAKn6cyUaMVFwrs2M+6wFnp01/Q=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GgZOonwHTnFSnR20Ge5df3aNWgtxqNppSdc2uZZMQWJlt4DfnnqCaIM3K9NbQvRt/
	 sEmp2IJNUVMermdClISvhboUAPgDWjj3sAKwxbukewxSYb5oE7bQqQCbPDpq79n+lS
	 trLUnkS1JSJu2mx5v/MqqjZcduzbgF/lJ6wYke6E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 193B5F805AA; Mon,  4 Nov 2024 10:35:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72F3BF805B0;
	Mon,  4 Nov 2024 10:35:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BE01F8026A; Mon,  4 Nov 2024 10:35:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E7075F80104
	for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2024 10:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7075F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=d9FQ15s9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1730712935; x=1731317735; i=markus.elfring@web.de;
	bh=OZU7EisROitQm9UKkAKn6cyUaMVFwrs2M+6wFnp01/Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=d9FQ15s9wCk8mgTbgGwrPDKx6h2mFTz4PtwupuQRPe5CFu1bnsQLJTo4WzFuhf1U
	 u5wGWUwDsDA1n1w3C2gaC8RtwNNCSgxqgmC2GNTIrZ+/GYNj0EKNdFsT/RVKmbsPl
	 WZg4kJfggvkkCTUf6RP7xAU0svK94SAnubVKwBdE8wTCTLjRJm9RtXWIdooWYfrTJ
	 ZBIBvrD8Ql/I6q7RYxILXTxzAvWNbG8PTjvZ0kuWId872VN0ZbB5BQVjKR17IhOio
	 KFo/5y0mYE6cDHhFHgJcpOqxKtIYpRtCD7yFXtQYrQT8020OywEHrUnKN2wLInnxP
	 Uk6YILANqF16QUbEvw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MGgNU-1t440L0IOQ-0043na; Mon, 04
 Nov 2024 10:35:35 +0100
Message-ID: <e1ac11b3-b746-4564-8daa-3527aa13e348@web.de>
Date: Mon, 4 Nov 2024 10:35:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Basavaraj Hiregoudar <Basavaraj.Hiregoudar@amd.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Emil Velikov <emil.velikov@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
 syed saba kareem <ssabakar@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
References: <20241104091312.1108299-1-venkataprasad.potturu@amd.com>
Subject: Re: [PATCH] ASoC: amd: acp: Fix for ACP SOF dmic tplg component load
 failure
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241104091312.1108299-1-venkataprasad.potturu@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:t147qZrJLa7AZUH9g3WArVAjME+fFuU5SLNNeXrUy5CyR7KC/0q
 13dGdV5l3Wtxp+pBeckAoYriBuRraampOJgd+09FsuQtzRUR7imp5sNBY7p5MU9oqkeiGnn
 WmyFVQxZQ5ZJz5MdnP1BjyVgCbQVmHeBZnF+CICS1961SVTjojfC+PYqDFI9/c1KHxWZo6r
 FB2rCuDCo9NEjQzWh/0Dg==
UI-OutboundReport: notjunk:1;M01:P0:Iea/YmE1kSY=;gVxxXN+WQbtUWzm8KB/OPkIBUzQ
 IsoFhOMRzEP/cbXJV3hbF6DxZjnbAzJTZ++yN3kNrIu67qXHS/cZmc+H6pbFzNbGx535rUm1W
 lH/tRWVlntQff5dy42GrJsplSgDTni2+t6aFxRjR108EeDGUXLJiCY+Eol5bg8fZcw0CqoSFZ
 gkcd37r1mjS2CX+gfAi50nqUoMCUCod3ujsC9G7VnbUwU8zWQZKaXG+Zmpc8Eh0tmr+tjWinz
 Bshafa3Xd2KAf7ZaUL4Y/jdk3YWEXmmPDJKEZpJICTPAqVTxf7YnLrAcIZZqP2QXkRN27grAp
 1A25LkSO/Jg17ROCFe9HQNlj8K5LgNaC/NJOthP8YSmUpKnJTSnCjhZmRut3kLO3V07In4xUH
 Z7YMwc4q3rWdC/pr+poef2amGE3OvIAepHueCI7ICjtAkS3Mh+jhozbW9Cqj5E/7TGwRunyUH
 iWSohZNcqeRfrYHBPZEyJFvU1PaGempmw01PhwPHCuP0UP05LSQ1/VxlIY7rOZEgSiMbjh45N
 nAweqyt7L1cZPoVHTUmw9F6X7OUFtvJPX8p6V5WVN4n6cW1F69DNZRJDXIVcTLt/tsEco1K2r
 FZQoNg2Qa0TRAfPpS27o1KfJdHW34QPN4xiGI6RNpcwW3JG1/af00njjT3x4SL9lgMpKTKoDS
 RDJwIRivSc6UKLFehoF58XacEGtend7WTXk5UUv7KRvAW8yWiyFFZSA5TkigZjLI3HuLCZXnG
 0ZF13E4tAGE7GLwM8GdAy6cLpTfnaeCndgEfgHRcEPOowlEyx/hFqbNaUFK24BYHeyF00eooG
 rd9UZS1R9n56omaiWcytNLbw==
Message-ID-Hash: 6MA7X42PSG47QEZ6N5PPATCHBANG2J4Q
X-Message-ID-Hash: 6MA7X42PSG47QEZ6N5PPATCHBANG2J4Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MA7X42PSG47QEZ6N5PPATCHBANG2J4Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=E2=80=A6
> As SOF framework assigns dailink->stream name, overriding stream name
> other than link name causes SOF dmic component load failure.
=E2=80=A6

Will another imperative wording be helpful for an improved change descript=
ion?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.12-rc5#n94

Regards,
Markus
