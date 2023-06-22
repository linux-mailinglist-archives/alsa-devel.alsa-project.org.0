Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0F173A2AF
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Jun 2023 16:10:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B283836;
	Thu, 22 Jun 2023 16:09:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B283836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687443024;
	bh=bAtPTyoV3UhGL+5nkAK0G/poQIs7q3wI78CdBfj2Pgc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n2Z5OVPSvjBqwkkT+TAIO6NE32S/4HW1DdPj6c+KQQ5+5iBE2MqCqin6qNRrI29nb
	 En4rY4sIwAdjqzVY7TU5ZCH/dTh3qX1MOZCL8yNx5+29mJgf/sktmVIw6BaNMcTaIt
	 KdIjD/aUx8AdMqmfUapaMaEX1l3yQoW+PxbOSl60=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58E8BF8051E; Thu, 22 Jun 2023 16:09:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2C38F80132;
	Thu, 22 Jun 2023 16:09:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81CC0F80141; Thu, 22 Jun 2023 16:09:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3167FF8003A
	for <alsa-devel@alsa-project.org>; Thu, 22 Jun 2023 16:09:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3167FF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=JTLG41Ac
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-988c495f35fso557842566b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 22 Jun 2023 07:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687442957; x=1690034957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAtPTyoV3UhGL+5nkAK0G/poQIs7q3wI78CdBfj2Pgc=;
        b=JTLG41Ac/dzcege4isOrjYrzeaRKZUIGevjdcyPM/ypROXoxCNvPhxgyEmmpxKWQh6
         v1Kz4TMyJgI9ERmsXewOUzibglaWyWCx8MMGh1krnU+I9Z8B1VmxUzDU7cNcY3//fH79
         kakxVxAIak+hA9+UPnQQythBaEhUB0MJ0w65mZQiRcLl8OMryN4vyjzh9WnhQVWplKsT
         DzjUvka8R/33H12jho5SqV17Fzqxvd/A8nf76Z3PFk5T68ByhT8G2tm60JHY0UQnbCg/
         +zbJpX/947puBDenS2opHNCnjtWdrVWjjvUHm3AH9Km0f14sLVSGBXcPU3EpCcI3BRSj
         7CZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687442957; x=1690034957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bAtPTyoV3UhGL+5nkAK0G/poQIs7q3wI78CdBfj2Pgc=;
        b=REdgb+sLtE30ORcDfd0OBHyNsJ+uHOF8Y3siO1QpHZn1ccyAbKZPh6mXz7u9TLYKeY
         jHBNnF4hvLCP9ADBRLbEkex8QHLk/e9Y8MgFRPG46O5a1hLyr3wgrmp2xrJ8Ya5JOx0q
         p0/OLGnm2J5+WN3XU3SiLfUKb+rL3xkyPaiq4vLbKU0HxZwQa5C8emP1XiVLajKlNRqO
         jEGl/BnC8R47q4KTnJpJgYw1js5HeJh+G0UDCmI2FgpBIcbaxrmBOfaEQIC+83faTMcE
         h+aPnFdNkAQ/Nw5SciwwBNgz7gURc1QLaavwfBL/uCgDYuGrnN8aO3cxYt+GP01BQSUZ
         qb7A==
X-Gm-Message-State: AC+VfDyBGu1fGOCuqBQVNE0lXeYbpGZ3ri3zPAOesoM1ZziRRpQytW+p
	itc9Z6cITfDy0nd9Z55bI89aauZYkSFjb4dshY8=
X-Google-Smtp-Source: 
 ACHHUZ5pzjeQRJqs/lr8FYXwqoFgoRFaBJky8QvaNPcbryNKOQtG5+vu148+3/ZqjIPWF2Qvr6fC4rt3h7fCW6Ov3t0=
X-Received: by 2002:a17:907:2d88:b0:988:56d1:10ca with SMTP id
 gt8-20020a1709072d8800b0098856d110camr13336128ejc.66.1687442956463; Thu, 22
 Jun 2023 07:09:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230615152631.224529-1-herve.codina@bootlin.com>
 <20230615152631.224529-8-herve.codina@bootlin.com>
 <70697b976107473b8779eea7d6c8a189@AcuMS.aculab.com>
 <20230622143233.7300a813@bootlin.com>
In-Reply-To: <20230622143233.7300a813@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 22 Jun 2023 17:08:40 +0300
Message-ID: 
 <CAHp75VfNdTwQ3Y5Q=uUaaJuFAm4iqj6cQZ-axOfLkfv9NoAqHw@mail.gmail.com>
Subject: Re: [PATCH v5 07/13] minmax: Introduce {min,max}_array()
To: Herve Codina <herve.codina@bootlin.com>
Cc: David Laight <David.Laight@aculab.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5XZIWMQ7TCDMIM2N43IBHQSYG3HX7VIV
X-Message-ID-Hash: 5XZIWMQ7TCDMIM2N43IBHQSYG3HX7VIV
X-MailFrom: andy.shevchenko@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XZIWMQ7TCDMIM2N43IBHQSYG3HX7VIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 22, 2023 at 3:32=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
> On Tue, 20 Jun 2023 11:45:01 +0000
> David Laight <David.Laight@ACULAB.COM> wrote:
> > From: Herve Codina
> > > Sent: 15 June 2023 16:26

> I didn't plan to change the {min,max}_array() macros in this series as yo=
u
> suggest.
>
> Maybe min()/max() is too strict but it's a way to be sure about the type
> used. Also the current version doesn't need any extra cast to get rid of
> the integer promotion as the integer promotion doesn't occur.
>
> Is it ok for you if we keep as it ?

I think the current verison is good enough, and as Mark said we may
update incrementally if ever needed.

--=20
With Best Regards,
Andy Shevchenko
