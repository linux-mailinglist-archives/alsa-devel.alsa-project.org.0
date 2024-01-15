Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F5782D545
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jan 2024 09:46:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4EC5210;
	Mon, 15 Jan 2024 09:46:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4EC5210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705308409;
	bh=PIqk6Aizz2qzpZT41U6jEldossrxAZfT+hNQVMkyc5k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=B2tiQCpcLfGp3AWLAKvPpNVC5bFevQQZ3bnyQfemkaAVuAhf0SCTqL3Wykifo5u1k
	 xM6DHL16fZApG42PcPZhlieVbSbenTPn32jUruuNmNvCKrsjbgSUUTY2ss2YC94YJQ
	 zbiFBeoYQgkZy9NhGtUj3pmv7mJepvLJOK/UejKc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A01A0F8057D; Mon, 15 Jan 2024 09:46:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25B6EF80587;
	Mon, 15 Jan 2024 09:46:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E71AF8028D; Mon, 15 Jan 2024 09:45:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 341A7F800C1
	for <alsa-devel@alsa-project.org>; Mon, 15 Jan 2024 09:44:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 341A7F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=O6uXJF9n
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a28ab7ae504so800824766b.3
        for <alsa-devel@alsa-project.org>;
 Mon, 15 Jan 2024 00:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705308297; x=1705913097;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C76vN2UDn6EUDP01K9KG9fUM6gU4ZfDAK5/kbr9SnI=;
        b=O6uXJF9nECLt3lpK7sr8fO/+b5adce80regnvPTndYA664tN6a/hU5J+mV14wtHSV2
         bOtuweh5zakfKBL3KtEBhOw2PiqIUReCBMFDl1L/eH3cXOaL9OjTfJQLe+bIUwD8dNR1
         WnUvISJeTCHVWZjZTsm++E172T9Llp/xUnYMpNS1x2G3r+USzLu5+Blyu+8S9qJd4LOT
         dEDLV8ap782FVQrb/i/SqCPV5CT3Evc0+zyvrfBU8GUPO+vYsmZTyv3WlX8f/AwGUHQa
         VXDg8Go03i15rTX7PbdFBMMXf/k+RpK0UhB5HijJOJF9LTxEQwoq2Qq3SzrHt76vie5R
         TYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705308297; x=1705913097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0C76vN2UDn6EUDP01K9KG9fUM6gU4ZfDAK5/kbr9SnI=;
        b=iuwP5ADNZDAXexGs6+ZmiH3A3lkS6VJzhBOUvYGL0QUewYYCbuuD6zJ61mkgmLba8m
         N/YSjshXODuaRERei8JFFDdcgrys7YY1u8XyAMRcFTF0pJvg3yogE0H1sa4mVm/5E66f
         kag4OWk/kjSdfLR1nIzgibwDL9J+sdK7EVS3CUidfmqfm+Us43P5pgSaq0XDeWo6wcWK
         VICLO+wZMFN9TDVFcBAjWr4CUue235XunxWM01BthpzIaN+2xdeaXNvSLzhOAxDXkeDz
         tZDIUo2d85Lyvwhv51wGaNeF5LhPCTdC7KU5o5GqeBpYtc45DA1BYMD7drqn8MEwu+ep
         vyxg==
X-Gm-Message-State: AOJu0YxgC1rM6xYHEn9Q0UVEtr3DlOu7fF/g40Q1W4TENjMrC/ZBrDMp
	5GZcqqYjNhDuNwrNDyYCuetg6UiJBQLvbrqxUiQ=
X-Google-Smtp-Source: 
 AGHT+IH7nvS/JdO/EzfUQDdzm0WV8ZdWqB1u3wrr0534j/vihMpugOZn083H8/xbA9kXJqWmr0IeLilNh0zeciM1Nsg=
X-Received: by 2002:a17:907:a80a:b0:a2c:aff6:f6a9 with SMTP id
 vo10-20020a170907a80a00b00a2caff6f6a9mr2469795ejc.150.1705308296578; Mon, 15
 Jan 2024 00:44:56 -0800 (PST)
MIME-Version: 1.0
References: <20240112054331.3244104-1-chancel.liu@nxp.com>
In-Reply-To: <20240112054331.3244104-1-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 15 Jan 2024 10:44:44 +0200
Message-ID: 
 <CAEnQRZCT31ti278aLqh1QtTQ33fJU6xnb_qoVMRooBi7WsJ6Yg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] ASoC: Support SAI and MICFIL on i.MX95 platform
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VP4VWJUP52QXMINANJEDNHYFEDK22RBF
X-Message-ID-Hash: VP4VWJUP52QXMINANJEDNHYFEDK22RBF
X-MailFrom: daniel.baluta@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VP4VWJUP52QXMINANJEDNHYFEDK22RBF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jan 12, 2024 at 7:44=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> Support SAI and MICFIL on i.MX95 platform
>
> changes in v2
> - Remove unnecessary "item" in fsl,micfil.yaml
> - Don't change alphabetical order in fsl,sai.yaml
>
> Chancel Liu (3):
>   ASoC: dt-bindings: fsl,sai: Add compatible string for i.MX95 platform
>   ASoC: fsl_sai: Add support for i.MX95 platform
>   ASoC: dt-bindings: fsl,micfil: Add compatible string for i.MX95
>     platform

For all patches in the series:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
