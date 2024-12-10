Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B1F9EA99D
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2024 08:29:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C3F3A4D;
	Tue, 10 Dec 2024 08:29:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C3F3A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733815763;
	bh=lJwPfASKJ4GC3o/QT5Qu5lI3X1tn+NdpZZ9ckGntbh8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S36jEeQInzQBSj5ujdA+eBZyTsqRmG2xoUUXcGepNpYtIvNSqGMObbeiJtsaUjsJC
	 VgXsApVIUaQW5/VbHqtBCzNvMgfi6CkqBa/fEuSPiJ6LuOm/wTe/5T/W4SNmCDTxzW
	 nm74qjK3WzYp/zYPqAOPwaUDJuGYcvcq0aycBs9M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A83BF80518; Tue, 10 Dec 2024 08:28:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D714F805C0;
	Tue, 10 Dec 2024 08:28:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5330F80482; Tue, 10 Dec 2024 08:28:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5006F8016C
	for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2024 08:28:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5006F8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=XkZGc5If
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1733815715; x=1734420515; i=markus.elfring@web.de;
	bh=lJwPfASKJ4GC3o/QT5Qu5lI3X1tn+NdpZZ9ckGntbh8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XkZGc5IfyRvMYvE2Z8QesN0TDuxbYOTVYJE89bOzJ5l7g01u9zMexsslgEsCjMEc
	 LILU3cUtI6u6ZwDlVnVsx25jztL97TLwnf4oxKEs8rvjjEFCcXYNPabiDh6Mle1l3
	 A/9JufRxsyNeo1hTfLSSNcOxURryiTrZR63UyI81zVjgYK/57c/7TE6Q1vDR6+wIl
	 kSI93RAlLzjo0yb9lvpqdgaSvdu40aarsLjkBjhrFbzHhlGyapRAjxfAq4KvX++lf
	 48AsmWKUT8NyPygHfObsBrPJgGtBlQtwoo8Zo8Sk7CDNilUnyMeZaudMtxxmCP3Ja
	 ccgwRfDjw14CJcn1vg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MbkSI-1tuVo528AI-00aOEY; Tue, 10
 Dec 2024 08:28:35 +0100
Message-ID: <f5442b45-7dc7-4463-b87a-91381bf28bc3@web.de>
Date: Tue, 10 Dec 2024 08:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: amd: yc: Fix the wrong return value
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Basavaraj Hiregoudar <Basavaraj.Hiregoudar@amd.com>,
 Jaroslav Kysela <perex@perex.cz>, Jiawei Wang <me@jwang.link>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, end.to.start@mail.ru
References: <20241209101320.970571-1-venkataprasad.potturu@amd.com>
 <cabca893-74f3-441a-ad27-9589819cb1f4@web.de>
 <21c58803-a8ed-44de-9211-7c8742cf5eb3@amd.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <21c58803-a8ed-44de-9211-7c8742cf5eb3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Sac6gahFNftP7xgHDq6hEb9kmKcs54d2KC/jjQotC4JH1Vxhax8
 jSNVkwNMZ9YahMCU5ePfyNNBz22LjbF3ihLW9w6ZWty0Jps4ZOxs60sN0BjYuzBKjAf83hk
 /RCVP3kF66F3HM06VJgcv0FbQsWgXoAHrymAmSvEaFtPbGXwMjZAqCU8sjwH3EvhCExCptL
 gxx/4TP4IUcX13GAioQLA==
UI-OutboundReport: notjunk:1;M01:P0:lgeYQjjr5qI=;0W7TBWtun0SUbTb9cL1D2nW19dh
 IMQovEZMcoaT6lEAzrRVXDTwffVnlXqBT8ZZdcORL+gLuY3FG8xRXMqxSxgrUVTo72kAxt9aR
 NyryGo/Yib941Th+MA0RvTKKn6ymvLLbiIQhKWh1n0tK/5HppYJkW4RP/2gTGFDRkjo5cEkZm
 k9acNqOulmyx6RbI8CyMJ9mmeVn88ULFjKN9Q6OY1uNOuoKfYAY/KvKfFGAXlNv+pKBQnTRNe
 CTdtWcgAtobW8hFhvjhQM2WUNPo8AhSe+bDwlwL4Zzf8B05x0qyfhXejT+V0b3r1G1hLcn2xj
 2QxwJLpT7809PA7eJTRnf0QCcI4J2LBgQMDSVDkTCV/lkf7heCsy6ofpVW2LB/B+MAUzf9liB
 lSMQcJDwtNVIi6g9SRLzNk/ZikxGBglxcyaDpf2ZcML3sa7DUNqmgPADv29+SysK03I87m2OR
 fhGq2x7BgMj2oOmbRdV1sbz20ZRRmVE3CccB0l+7MNQpEu3FWOG41EDBgBS4jf9ksOadJkRFi
 vfBaBoFYX7Pxaw1Y8xWQkNBZsl4suaxRCse72fuIDw/Q34+/A9ArUhSN7xEgroMVwjRFTrfA3
 Y8VVpt70kg4TP+HPK9yy5SNcKiAgZ7CVNKzNbiPUfGtUed5USIpYzbXkQaQazb9bgYz075nH0
 00KoiSekip0P6iV8TFsZ29MYbKXKzFZ0mNgXFm22JqTlO58qtwNTTFvtDA55xAveqF7tkCmpt
 NDpOT5l7ahg0oba8OHrc3lRiamIbOlcNH1lozTVWYoN/gofd3njRnnEhoeqVl/f1TNqrqEih/
 /QBZDzUwDnwp/iuwUH5s73fBbpbhrgmXcism/obtjl/vqjihh5R7Wg5plJuQXApJww6VLtD3K
 jD8dJqo9XBfuwyGfYDpTgW+eYFOzzCB8z5eOfR2GttghEj+SmXnRrDAQ/YrWeBG/V4bhapvJ0
 X8lw+miEJym80t32nJ07OKj4zEhZzRd0Bb0QygKefkpxEhcUmZ2P72ZKBI/dIQsf/T6/YKgVn
 iWMq087p8WeEaiICfGdXmFk+MIX7AsasHKnDoxK8Tgh39T2ttzGAGDOUHKzpfPtn+5Fw6YP2w
 DMs3mAETo=
Message-ID-Hash: 6THA3YVZD3JJEMULS44NJCHRTIEXKFLB
X-Message-ID-Hash: 6THA3YVZD3JJEMULS44NJCHRTIEXKFLB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6THA3YVZD3JJEMULS44NJCHRTIEXKFLB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

>> =E2=80=A6
>>> +++ b/sound/soc/amd/yc/acp6x-mach.c
>>> @@ -578,14 +578,19 @@ static int acp6x_probe(struct platform_device *p=
dev)
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 handle =3D ACPI_HANDLE(pdev->dev.parent=
);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D acpi_evaluate_integer(handle, "=
_WOV", NULL, &dmic_status);
>>> -=C2=A0=C2=A0=C2=A0 if (!ACPI_FAILURE(ret))
>>> +=C2=A0=C2=A0=C2=A0 if (!ACPI_FAILURE(ret)) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wov_en =3D dmic=
_status;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!wov_en)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn -ENODEV;
>>> +=C2=A0=C2=A0=C2=A0 } else {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Incase of ACPI method r=
ead failure then jump to check_dmi_entry */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto check_dmi_entry;
>>> +=C2=A0=C2=A0=C2=A0 }
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (is_dmic_enable && wov_en)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 platform_set_dr=
vdata(pdev, &acp6x_card);
>> =E2=80=A6
>>
>> Is there a need to adjust another condition check accordingly?
> No Markus, not required.

Can it be that the expression part =E2=80=9C&& wov_en=E2=80=9D became redu=
ndant with the proposed
source code adjustment?

Regards,
Markus
