Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F05098BC3E
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 14:38:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3087DFA;
	Tue,  1 Oct 2024 14:38:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3087DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727786315;
	bh=YhBxDPpYQH4YqwY+Xz5yX4fHNoiBzWpOpC0HAJ/BbGk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gGMetq0LyNaY3d0Mfh1hcp9UF+vTKuxbq7o6UngrIdb3pZAYT31bEyZK9eV9GorgK
	 tWiTIovzIbTQlQ5+qcQ8OvSZoccTfYxIfbctrE4EvcGxxipdpeABxyD1Bjdk2hR/je
	 oQUvmiZ6n1lRS6IKD3gBnwMYdF9rC7uWuC3L6gHM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E60EEF8076F; Tue,  1 Oct 2024 14:35:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13F2DF8076C;
	Tue,  1 Oct 2024 14:35:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21286F802DB; Wed, 25 Sep 2024 14:41:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 21849F80074
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 14:41:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21849F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=g7wQuJi4
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a90188ae58eso842652666b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 25 Sep 2024 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727268082; x=1727872882;
 darn=alsa-project.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Izurz+PMZmOHAHw9NMc4dqCu2H1VhQy7BJX6+wDdt9M=;
        b=g7wQuJi4sWBruI4uT+CQjZKUFNtsJezP/vDHWRpTYQv/Y5/rLYOipSMocyeS1MfTyU
         gjgQ8Xja5oo7VUkud9nov9qpG+X90q0owfVAVXM5VN+as6c4RsRxIsoP/3AoPawv0WUw
         qaNfkfewKc9QZcB8nPtYCsxU7oF/yE7wZaWjTzckzS7rJVApWv4quv575sMLCdoWiu+a
         imFz0dEewGtMS5DXKNDU15mO7tzvGIK0opnvfW5V1mG1kCiq+Z4juMePvRgAf3pxvgPY
         M7aSudrMYnmFppXisbhuBGmzJQVk1xDIEBRQdjWqXwz6WrNK1qKLprYyW6JaJ1W4EQ3X
         alJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727268082; x=1727872882;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Izurz+PMZmOHAHw9NMc4dqCu2H1VhQy7BJX6+wDdt9M=;
        b=fJYh/FgRc1ca3uHwKKncK5xL7NJNO67LuN61VG18tzMfQB/RbQU/eStytUCvnND1E+
         6PmlzjBMSlLvFFxe0VjXlRa0nGsC1MWh9K2XN5QJThRsodQr1+urhYryukMmDbH3O8s7
         zzhpSjOoTS9uX5IrjU7jrDAaA3Jm7TR74A9oj9VRHQliPhz7qgGt4lbdjUoGiVM0bil+
         X8NWWKTgoCGyYpW8RZ4Vg2W7Ha8sLYyyq8e1mLovPeMXsG08EKSgNNPTrCRHC1xHje2D
         LRAKxEn3wxtaCSDsxL+zUEi1fl6Xrd06piZJ1w12ucSem1LgL98ZXQ09LO2JO1RcJTdD
         oL7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXY2shXxnK5tX5G8n9pzJFkOO/VP95tK4zIi/dVTBpHdLjc4Gk7A1iSige4ZkaGi6Hr43U102NvEgc@alsa-project.org
X-Gm-Message-State: AOJu0YwBHMO/DxMF6WYnKFuqOd6k74ilKhhy/Vmy5dDK78SwlFo9gKOO
	3GwT/NQzoKZ0fDgH7dUJdgVafoyZQFB0OOHUSVrvnvVx0Fo4PCnbeB1dqxYU7JU=
X-Google-Smtp-Source: 
 AGHT+IGWq/qS81LG8YAeWtGigBWFGSY2KUCD3wh8z6b4HsLNJ/KmQuRXg4EvkhlOqLo8SJiXSmkn7w==
X-Received: by 2002:a17:907:94cc:b0:a86:8f8f:4761 with SMTP id
 a640c23a62f3a-a93a035ff85mr249552166b.25.1727268081819;
        Wed, 25 Sep 2024 05:41:21 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cae0fsm204615666b.120.2024.09.25.05.41.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 05:41:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Sep 2024 13:41:20 +0100
Message-Id: <D4FDFLNQVSLD.3GSWD0IK7Q4FK@linaro.org>
Cc: <srinivas.kandagatla@linaro.org>, <a39.skl@gmail.com>,
 <linux-sound@vger.kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
 <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <krzysztof.kozlowski@linaro.org>, <vkoul@kernel.org>,
 <klimov.linux@gmail.com>
Subject: Re: [PATCH REVIEW 1/2] ASoC: codecs: lpass-rx-macro: fix RXn(rx,n)
 macro for DSM_CTL and SEC7 regs
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Mark Brown" <broonie@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.18.2
References: <20240925043823.520218-1-alexey.klimov@linaro.org>
 <czlx4thp7thnb6jrauilpbtzgbq637rmnwlpifxq5b5jfa3lqm@toyy3b2viscr>
 <ZvPPpfobvDmmTCfi@finisterre.sirena.org.uk>
In-Reply-To: <ZvPPpfobvDmmTCfi@finisterre.sirena.org.uk>
X-MailFrom: alexey.klimov@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: VJAZZ43QXKMU2GP4G3XUTI7MINS2XTIG
X-Message-ID-Hash: VJAZZ43QXKMU2GP4G3XUTI7MINS2XTIG
X-Mailman-Approved-At: Tue, 01 Oct 2024 12:35:34 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJAZZ43QXKMU2GP4G3XUTI7MINS2XTIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed Sep 25, 2024 at 9:53 AM BST, Mark Brown wrote:
> On Wed, Sep 25, 2024 at 11:27:54AM +0300, Dmitry Baryshkov wrote:
> > On Wed, Sep 25, 2024 at 05:38:22AM GMT, Alexey Klimov wrote:
>
> > > +#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)		\
> > > +	(0x0434 + rx->rxn_reg_stride * n + n * (n - 1) * rx->rxn_reg_stride=
2)
>
> > This is a nice hack to rule out n=3D0 and n=3D1, but maybe we can be mo=
re
> > obvious here:
>
> > (0x0434 + stride * n + (n > 2) ? stride2 : 0)
>
> Yes.  We could also use some brackets to make the + and * precedence
> obvious.

Yeah, sure. If this approach with stride2 works then I can update to:
(0x0434 + (rx->rxn_reg_stride * n) + ((n > 1) ? rx->rxn_reg_stride2 : 0))
and update stride2 to 0xc.

Looks like I can also remove:
	if (j =3D=3D INTERP_AUX)
		dsm_reg =3D CDC_RX_RXn_RX_PATH_DSM_CTL(rx, 2);
from rx_macro_digital_mute() since INTERP_AUX =3D 2 and this if-check was t=
here
to handle special offset of DSM_CTL for RX2. If RXn() will generate correct
addresses then this no longer needed. Or such kind of clean-up should go
into separate patch.

BR,
Alexey
