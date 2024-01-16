Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D6B82EE01
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 12:42:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CE60202;
	Tue, 16 Jan 2024 12:42:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CE60202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705405376;
	bh=3ETa/IB76FnSUzUMCNIjO0OPtMyIpkffhHAQmKw0f14=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g5oSDnB7peOX2n8w0emZLhuOAWZk1zCQv3NZw+dYX1g/xO/ZJO+iLIS2cUpDOhs2Y
	 wFqG7PNcYqTgjGvotjn1BN3J32MuEMM8SpXewc+zpD1ail+Qh1orpFi/IMO/rVUO8F
	 h0alen7fap3dlVIREH+ZbOXkJly+5PeeG+M4Lgb8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62B7AF802E8; Tue, 16 Jan 2024 12:42:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD5B2F8057C;
	Tue, 16 Jan 2024 12:42:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73C0DF801F5; Tue, 16 Jan 2024 12:42:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDAECF80074
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 12:42:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDAECF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=A6zsvrer
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a28b2e1a13fso1013927066b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 16 Jan 2024 03:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705405328; x=1706010128;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ETa/IB76FnSUzUMCNIjO0OPtMyIpkffhHAQmKw0f14=;
        b=A6zsvrerh6+FxjX66UKwX/8BAb/+ro758fQd5zVxt8kmwp87cOQlLA/FY6z6aib+8w
         NB1w80USfWpyVagOg1cSSQ4M8Ds0tztfw2znBarZOh0a1Dst/onxlG9Vh4DsKhuzOXE4
         ra1QdQfcJYl74ZsIHWxr2h7uQX7T8cjkYuGnFSi57T9D/Ug4MAuvLb/YP4Wz+oI79/Mq
         3Lk/sdOwnppoCO7wNGE2LT/9aDeI3lLtJZuESYPIglvmDJW3remD5on76wd3AhKK5ytl
         GkquCmOHAZSo5s06d2n46uTMSD5w77fAR9E5D/tlupaR9OiVtA9q2CW3nuSxTOiFN0wt
         7jZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705405328; x=1706010128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ETa/IB76FnSUzUMCNIjO0OPtMyIpkffhHAQmKw0f14=;
        b=O5UirqI4d645XomIl94Ed61HmNtOzKDzXuNtZP0nQgGgK2L1ZqSIHw/Ludqrkr9Rnl
         TsarZ4t8j/gNUPHK7c0lfCjA4RIHHRUZHbf5bNIgD8CGi5cp6i5KJbuLjz9SDFZB1f/V
         IZwKPQRlfZ89EL5VyQrug3gVa18Y7MU4+JLvFJHHXp9a8imroyY1h0Ky6ODvo4IuSQQY
         pJNFkd41sSL7ofvNCEkUtnorj95aYB+CZWFNEhqizajUUR0kr6aG/awO/k40bAmIxt/6
         mRpo4aGJasYALcqnS0msTm+WxW2S+iWFrNACV2qdBWrrKg7rNOubROXmkgt3ak9Mgmwc
         1QYw==
X-Gm-Message-State: AOJu0Yyrj43fGsLvqIKd6LnParuS/3ZFBV5JSYwx2dGc3jvokY6MOig9
	bcDCADVl9WzAGmyE1Olx41wgDiCQK2i7+LkYsXQ=
X-Google-Smtp-Source: 
 AGHT+IFIdXVTOsU0yGpd1l5hqqYw5SvEntjk0/FMvYbowcSgHq4IbAXkUksATwXJ85XfgfUxAQrwrtF3G0v3Xv8URCg=
X-Received: by 2002:a17:907:8b93:b0:a23:4e3f:a2fd with SMTP id
 tb19-20020a1709078b9300b00a234e3fa2fdmr4050086ejc.5.1705405327664; Tue, 16
 Jan 2024 03:42:07 -0800 (PST)
MIME-Version: 1.0
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
 <CAEnQRZAwk-USZqXwLOVuN3iTn7r-55BJH=Sqq5+2Od+DhrK0iw@mail.gmail.com>
 <347346270.284192.1702989565367.JavaMail.zimbra@savoirfairelinux.com>
 <361044647.7067.1703857544284.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: 
 <361044647.7067.1703857544284.JavaMail.zimbra@savoirfairelinux.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 16 Jan 2024 13:41:55 +0200
Message-ID: 
 <CAEnQRZDaGazi8j4LYEoWmSTORET89DVjEwD+2EdTizKGFp0CAg@mail.gmail.com>
Subject: Re: [PATCHv3 RESEND 00/10] ASoC: fsl-asoc-card: compatibility
 integration of a generic codec use case for use with S/PDIF controller
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	shengjiu wang <shengjiu.wang@gmail.com>, Xiubo Lee <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound <linux-sound@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
 alsa-devel <alsa-devel@alsa-project.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>,
	"S.j. Wang" <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: Z3JCEZKSPFTJVWYRJIUKJMXFBI4RVYSU
X-Message-ID-Hash: Z3JCEZKSPFTJVWYRJIUKJMXFBI4RVYSU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z3JCEZKSPFTJVWYRJIUKJMXFBI4RVYSU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Dec 29, 2023 at 3:45=E2=80=AFPM Elinor Montmasson
<elinor.montmasson@savoirfairelinux.com> wrote:
>
> Hello
>
> On Monday, 18 December, 2023 14:54:03, Daniel Baluta wrote
> > I know this is extra-work but we would greatly appreciate if you first
> > convert fsl-asoc-card.txt
> > to yml format and then add your new properties.
>
> DT schema must have at least one maintainer in the "maintainers" field.
> Who should I put for fsl-asoc-card.yaml ?

I think it should be Shengjiu Wang, if he is OK with that.
