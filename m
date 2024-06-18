Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A685490C94F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2024 13:27:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DC7283E;
	Tue, 18 Jun 2024 13:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DC7283E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718710073;
	bh=6y9EBQd9spPSlym6ahMvT//O8fjaB25I4zeYnyNC18E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LjokHXpRZ62zu67Oqg7dE8XOy+EnluYJJurmm69GU4PWPncNmXiLm1rCY3Bz1GZ/F
	 axw/fHCw4Uviy87bFRcWNy8KWe0bzXmp0cpzNgf+ECzrzIcNJWFP8vQlvDXw0moaQQ
	 HyYq/+1FMNkEPrFFV+FFd41mW2pAsBwIM9cQ13+M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84F6EF80607; Tue, 18 Jun 2024 13:26:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0804F8060D;
	Tue, 18 Jun 2024 13:26:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2A84F8023A; Tue, 18 Jun 2024 09:50:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C9D9F801EB
	for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2024 09:45:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C9D9F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=timesys-com.20230601.gappssmtp.com
 header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=H5Mda9sE
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-6b4fc2b5277so673006d6.0
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Jun 2024 00:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718696728;
 x=1719301528; darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6y9EBQd9spPSlym6ahMvT//O8fjaB25I4zeYnyNC18E=;
        b=H5Mda9sEt5Fr1gcnlzpN5T/GaPoId4D8nt606ojVtGyn3ZLcNsZdbuTHbu8c887w6q
         3yG1Vdi5TEL4qOVsMyAbkWajvs9b4dxWzRk+Q8Dk32gSojPfLMcf5YJJiqEqyrRVeOtF
         lscc6E6+K/Q+ieLgnfxVivp5iNRITZ0D13poWWfrc/RThsAEN3JmNfH9YDvJL1JSdss/
         gOvOlM+tC64r87+ljhxg3LahNKV4bUs1Q7F5fM9Q3LLPNnESWPNtCtogZroHMssz2MSm
         DWJeyGtAfbp+aggVQtAEj0NccSZVadF0Ur7YThFkNvlLb7Wfw8VX6L7n2VZE195G4fWW
         Ny0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718696728; x=1719301528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6y9EBQd9spPSlym6ahMvT//O8fjaB25I4zeYnyNC18E=;
        b=BEmL+1wAygvL2BRzcfrfDdqCY9w8ujGjTzJIuN4HYekCoeuhhEAo9obnF4JRzhf19N
         0ek3Fk2yZ8BmromP4Ga3Bi7o+R1mMnFFj55+k+ld+LsUGQ+oUkWOdoT0CTzzd5cXriOU
         2x0nEEBlkKfPUxynvt8TH2lcvxnnHAx1ZHJIIdP8SipyBMs8fSWknpCI+0eLGhZS21pL
         TPuM06SUBfZ8C1Hzz0fhxKbw7wqhm98N+k0EqGy6KRukzzY2Y3Hw7/7qxVFDoIN5FBRJ
         firZI3IS1o7z8eEA1GxBz1kVfBjXVFyEl4Qoqe4OAOm03759PktqSWzKacaOGfDItpZ1
         ZRYA==
X-Gm-Message-State: AOJu0YxBv6UzgzgcoBOYvM4PxtFfsLiibaGzeQk/Vaw6/y5xDpfVJ4Ok
	ug3tWTYTgcLjGQK170imvhXdb+W7FN8v8jVfzm3aUsqoIn7S+dTgUQXUvcfOgUFVEPRuMTceZV3
	bOBq+rhjpTtDdofa8uXTROjmG75CrXXfdQvSicQ==
X-Google-Smtp-Source: 
 AGHT+IH7+3WcSHlqSCn8E776/vDX4KlNni6h709sa81SFyuFMo7TNQZN/dD9TK/cBC9XEnkBmumnQonT9vtIqu2MJcM=
X-Received: by 2002:a0c:c58d:0:b0:6b1:e371:99cb with SMTP id
 6a1803df08f44-6b2afd7792dmr117082556d6.3.1718696728034; Tue, 18 Jun 2024
 00:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240614163500.386747-5-piotr.wojtaszczyk@timesys.com>
 <3fb7f6db-6822-413e-9aa3-953a5e3cd566@web.de>
In-Reply-To: <3fb7f6db-6822-413e-9aa3-953a5e3cd566@web.de>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Tue, 18 Jun 2024 09:45:16 +0200
Message-ID: 
 <CAG+cZ05LW5WZJqzs1yXZ3zV972iA-mE2HBtdGZPf+B0bAyWO_A@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] ASoC: fsl: Add i2s and pcm drivers for LPC32xx
 CPUs
To: Markus Elfring <Markus.Elfring@web.de>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Chancel Liu <chancel.liu@nxp.com>,
 Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
 Jonathan Downing <jonathan.downing@nautel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>, Takashi Iwai <tiwai@suse.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MailFrom: piotr.wojtaszczyk@timesys.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2TEIJZRBOBM26NOYFXGZCT7X2D3ONVQW
X-Message-ID-Hash: 2TEIJZRBOBM26NOYFXGZCT7X2D3ONVQW
X-Mailman-Approved-At: Tue, 18 Jun 2024 11:26:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2TEIJZRBOBM26NOYFXGZCT7X2D3ONVQW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 17, 2024 at 9:30=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
> Would you become interested to apply a statement like =E2=80=9Cguard(mute=
x)(&i2s_info_p->lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/mutex.h#L=
196

I take it. Thanks.


--=20
Piotr Wojtaszczyk
Timesys
