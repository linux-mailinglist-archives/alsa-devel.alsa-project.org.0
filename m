Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABEC59E97A8
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2024 14:47:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 517F6B6A;
	Mon,  9 Dec 2024 14:47:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 517F6B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733752060;
	bh=OWK9BmtU8SoylfONS5umnJSsgPj9CZ1NuxrjE2vmeD8=;
	h=Date:To:Cc:References:Subject:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f1oVsLGKPsWFiTwBcGAKUpbie/sb2FNiW2PXYfEtOVSNO6YKBOIDc8AcxdySSo808
	 hIcdbyvxgU1Ad9gg8it9Fut+saxtUYIIId9bg04pyY8Dr0bbKDuV7jMZqx+MMymLZV
	 54hxgAOemg8+WXb3AYIcwWld699LlnYg9UrrMq5k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67456F805C7; Mon,  9 Dec 2024 14:47:08 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AB12DF805C0;
	Mon,  9 Dec 2024 14:47:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD44FF80482; Mon,  9 Dec 2024 14:47:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC6FDF8032D
	for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2024 14:46:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC6FDF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=web.de header.i=markus.elfring@web.de
 header.a=rsa-sha256 header.s=s29768273 header.b=AepJ/Y+J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1733752008; x=1734356808; i=markus.elfring@web.de;
	bh=RJ7S6xkYcjMsl89YuTBAOu/UbbpWls5LjLBD4ZsW4Ac=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AepJ/Y+JEKo/4vyZzGM4THxUIJCrxKCWBek2wL2JRIoMrwN9g4z0ad7UwtbGQ7nd
	 FOn2XeApR8zpGdq11M3F/3R2+6txmzCHOuLpOQRFrAZLyg8pDddWGMO8Y5jwd6F4Q
	 iVHHIBOZrrwExiDe2UDpz0TYgZX1aWxW44ZSZE3ixhsDdWloUdj53I1/0chnFDkpP
	 RtCrclbbAsuBe6pg9utZcTobdcDxpWzQOJ+UHYLrXMWcGpYOjcJv8K1m4BQALq7BG
	 L7wcwvPnA3DjjuA7XzKB0Ej1ZQ3xdyMIxewVVSKUEK2rzt1KQyLfEfZdX5aOB7kx1
	 XeAnuWy7/zXTIj0rHg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MD5jp-1tTgef2WNV-00HCGs; Mon, 09
 Dec 2024 14:46:48 +0100
Message-ID: <cabca893-74f3-441a-ad27-9589819cb1f4@web.de>
Date: Mon, 9 Dec 2024 14:46:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
Subject: Re: [PATCH] ASoC: amd: yc: Fix the wrong return value
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241209101320.970571-1-venkataprasad.potturu@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dGgUdE03nz5a1Q2rmEDXGkDahfBzqXKiIuduBiULxsxXBJ4DeI7
 /9CfE2YeBKXU4249i5wn18PJ1x7f7E3xxZ/pAQtXpUd3vhhrD30S6m9rTZnCRgp/5kUYJ/Y
 xhOsj0BimHALxUY25jalsrjDnBCZX8/BftXS7bWsERAA56MMfUTPDXC4sUXg/RPpqt3ixk6
 tYFJd85nx/RFMjvbdgQgg==
UI-OutboundReport: notjunk:1;M01:P0:/tAO+DmNoTc=;d+/h+8iVKrYO6oBbOOOvsmhy1Ef
 l+HuJCZpztCumPqKBQWd6fXl7FdG5C9i1HdufeKajQbxtzpRP5YY+f+hs1mpOf0AW1M0EbhZe
 Woq8elam2WcvWJrKUlXI05NZPYleYvBpcKNqsPEW0fs2LpnOlTeOkmuT7/YcpQN3NCu+Rkh+e
 ZAOiqeY1R5J5StLWq9Y+gsmq4JTSmlwxSgTD4nubJDUG/yg6PDgGiWv6Ex30fh43bb4tswhTT
 kufeoBuaix31G4CBbSZQzTpzUlzFmzIJETEJ7DVfFYRf2qk0hoQFrvREr+SM56AEnCP0i1iZP
 RsTybgNs/IDihW84IsCvlzVRPboOXYanhp4lQnwVg5ONMDKZxeqOh0xEqWbGaPQ5ONjspqL1N
 gZe4dqbr77j1oS3guCmU45GcwrcfIMAgpez64UcioZvEZHHa3lFWkaQypfC1U+64BifqnwmgI
 93Lb8Y9VDOIRdqxmkihe8AEiG7j/3Omm/Q7Ds9Kx/RrLS/BCpm5K0WfJT4jR1+kwXB1rvsu2F
 i4Z+j0pMnyK2OypmKxZ/95sSgOjhc7ZwAWOBO5I7yGWBjJCRKORbNLsPcUNR6/TPlsNk7Qg5B
 oRP6a/6SFBu7MLn1J9xTAf9zYdMi2g3D4UIVtQUpwfr9nFjk7p64KRdCWokhyYtSquHfpFmVR
 739TIULKb560JBkpQPyupIye3b0LEvzmWBxMJs7baexYktrV5YOK0LQhzBcbeAsbRdGlNZx2Z
 L+FRdp5kKdtZoRK/boP1bUkRaL+sKGs8biFwXyfQ6WFQIZh6qyU2Eu82cNseGEhb2xh4poAVy
 EjEASy1sOxR7yyLI11UX45qRBjeLla0cLcxe2cSgToOSTUQ0E7bjgzAezozaLlp7Zd2tsQXhd
 4teXkxAyctQJh59Zh+qtwwt9CcSr0aujDHbaBm+COf7flrP4hbRRXNBHC5kheQcNnaXdTPNDL
 cbXVyC1fETLhWmtrDL9ScYtBC0LcrUKrEV/8fPy8OdCAzid7QE7wnAKLjG9+r+HeuEdlUslL1
 HC1jd+QAsS2pbd3z08VI7BOViUjDTvQOadJOTT7xwSrfHHhemSkOsuLGNAVFCN/n2zz8wXCdM
 1GqF9JU/k=
Message-ID-Hash: UXWCXG6VN5Q7XLGPGDZLLA3TPMWPZM2W
X-Message-ID-Hash: UXWCXG6VN5Q7XLGPGDZLLA3TPMWPZM2W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXWCXG6VN5Q7XLGPGDZLLA3TPMWPZM2W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

=E2=80=A6
> Add a condition check to jump to check the DMI entries
> incase of ACP driver fail to read ACPI _WOV method.

  in case?             failure?


=E2=80=A6
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -578,14 +578,19 @@ static int acp6x_probe(struct platform_device *pde=
v)
>
>  	handle =3D ACPI_HANDLE(pdev->dev.parent);
>  	ret =3D acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
> -	if (!ACPI_FAILURE(ret))
> +	if (!ACPI_FAILURE(ret)) {
>  		wov_en =3D dmic_status;
> +		if (!wov_en)
> +			return -ENODEV;
> +	} else {
> +		/* Incase of ACPI method read failure then jump to check_dmi_entry */
> +		goto check_dmi_entry;
> +	}
>
>  	if (is_dmic_enable && wov_en)
>  		platform_set_drvdata(pdev, &acp6x_card);
=E2=80=A6

Is there a need to adjust another condition check accordingly?

Regards,
Markus
