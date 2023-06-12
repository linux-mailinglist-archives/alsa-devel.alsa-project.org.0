Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC70872C7E2
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 16:15:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E12AC74C;
	Mon, 12 Jun 2023 16:15:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E12AC74C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686579356;
	bh=tOx6mer2Y0xFwAlHeK7VBbHx/09765NLkewrCj3zx+Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hqLK1xD77A3cApQoo8cn+ADirFlyzwO91xasDvgRuAUSfZBdttA5I10qRG88VsUHR
	 aZjbgsIQLYxvXptexlDYOc47ovCm8Mvp+RNt0KyoIdW5X6r+oL7Av/cSVTuanoOnB4
	 5XAo//+KnVu5blhE4Gl8qzQTCr8BWLYrpZzl5ir0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9453F80246; Mon, 12 Jun 2023 16:15:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B1DFF80132;
	Mon, 12 Jun 2023 16:15:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2E2FF80155; Mon, 12 Jun 2023 16:15:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12FD4F80130
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 16:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12FD4F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=Xm4+EAzs
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-39c84863e34so2617308b6e.2
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 07:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686579298; x=1689171298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOx6mer2Y0xFwAlHeK7VBbHx/09765NLkewrCj3zx+Y=;
        b=Xm4+EAzsXGukgRlA9uQ7SswMSO6ou4ZbhpL0ZIA/gSytMrnxLjaA+b+tOB21QRGS0Q
         0onrjdR/+2Ce5Q7cwkUDbwf/nnkzIZeuJuY5kF+a0vcFRw3xp4PPbo3ao0SrL53rfJOp
         avC0oy/PoRms5aLTAiolXBPBlPLqfgt3gdlMDf4WERKme13KnaraXObCgqyAFYOJvsgw
         MsSWJc4G0ZlNFr1PF0pHuLplPiesuyoLh9bYkY7u7HFYKUVafmgT4XQseqHNkzYIKf0O
         3uHnrglgzdUQeKq6qFdTo7fRN6zE7kSdPRClbfZi7gJuLb8iEhkZaZ09P2LYBBLjZd8N
         S9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686579298; x=1689171298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tOx6mer2Y0xFwAlHeK7VBbHx/09765NLkewrCj3zx+Y=;
        b=X+kNS3L+cNEBWnGFC6M2MyoqIm6iBwUWuBLBn/8MNWjhTRIRnv4utJVu1m8CK3NK04
         8JyePcwLdm/6lnsDIoTcFdj96kmg8ouk9duTLRHtxvtOEOJ6WO8aI9LXoqSw8mrWNVMo
         PE9lAnBvdcKaVsYNenPNHF6xFGlwY/qFD0Zp2+8QGLprqT2WFFlNdDeQ2eBvAPqIndQ6
         1txPd2e6vse4KlZsWp62BswIaKuK1Ov7gohFJUOBYOO8m9uSznXCvDdPpf39ejpZ4Gjp
         FstXTKtC6b0rdHFdIkoaZywm/pKVZutunUDoFIMa3v071qsDgNirgKAXZTFLtrXx1kyx
         GoxQ==
X-Gm-Message-State: AC+VfDzVeX2RSo5sqd2inAActWWoqbdnaWR2eXRtGAxNR5RvoXJQOcWD
	yYbUfShQuIvoO18zAfAzQqpdUUVARsDf4tq3Qmo=
X-Google-Smtp-Source: 
 ACHHUZ6Oh7TNKalmakidfKCbkahmgvWW5tzHcVOkdNDnRMGrUcsnGhx4I0KYX7WHaFzH9cmlzGiLEvmvQfcHdSyQeQw=
X-Received: by 2002:a05:6808:1506:b0:39a:acfe:4659 with SMTP id
 u6-20020a056808150600b0039aacfe4659mr5139127oiw.17.1686579297921; Mon, 12 Jun
 2023 07:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230612122926.107333-1-herve.codina@bootlin.com>
 <20230612122926.107333-9-herve.codina@bootlin.com>
In-Reply-To: <20230612122926.107333-9-herve.codina@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Jun 2023 17:14:22 +0300
Message-ID: 
 <CAHp75VcQzo2mUmqbBtZzCX3EarSHYx6ZfPm6BR_n7Uv_tGBK1A@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] iio: inkern: Replace a FIXME comment by a TODO
 one
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: E3GLJKJQA73OUDTWGIPI7PGTS3MS5VK4
X-Message-ID-Hash: E3GLJKJQA73OUDTWGIPI7PGTS3MS5VK4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E3GLJKJQA73OUDTWGIPI7PGTS3MS5VK4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 12, 2023 at 3:30=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:
>
> This FIXME comment is more a TODO one.
> It is a note when someone will need for this currently unsupported case.

> Change from FIXME to TODO.

Suggested-by: Jonathan ... ?

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
