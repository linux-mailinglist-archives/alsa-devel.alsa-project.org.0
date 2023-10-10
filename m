Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D697BF91A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Oct 2023 13:02:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93ADF1497;
	Tue, 10 Oct 2023 13:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93ADF1497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696935764;
	bh=6GTectLvPvyUAeR+UK3mFeleYYPacIavTIv67tqstYk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CZIr3w3w4ONNGAheMvdZe/MN9neyS02QrtNYCO01IwBn6EQ9EMA1H8bVbDPc9/lJE
	 mqHmeNoGVyfmBr4m0dKtbfiyghKXWSNo2wBbb3eL+ls8pYP9SsZ2b5mcWtjIlbgWjO
	 DvOBtvpQvx0remm9Enqun7PMNm2h0wJrcudzhjOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30B3EF80166; Tue, 10 Oct 2023 13:01:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F07AF8027B;
	Tue, 10 Oct 2023 13:01:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C891F802BE; Tue, 10 Oct 2023 13:01:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D2E3F80166;
	Tue, 10 Oct 2023 13:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D2E3F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VV5IAwGO
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5346b64f17aso9761823a12.2;
        Tue, 10 Oct 2023 04:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696935672; x=1697540472;
 darn=alsa-project.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GTectLvPvyUAeR+UK3mFeleYYPacIavTIv67tqstYk=;
        b=VV5IAwGOvSBj5Y8qsvBgPgnfphYdVsF67DKc3DqEfsDlSN5u0pQW6xnw4Vgz2ccfuV
         3/JlWNB/oCKuKxuLpAcwzrGD3Vw0lwqK62qJP7tKmUXKx0c+TJKQwEFpNTISLVbzpMZ7
         m3BFEsakVZlXBwxmDhmlTBKgfr9kQgMAPgzqabWSoarOI4mAbAjcq6Ql0iz/wNtkvgv3
         9ywqd1LbqhlqjMULglw2j5Gq0lK4+QXY17Z8IHEqpQTAXFn81kvTsLdWfkqcWPWsyOco
         rpp4/3SpBzVwmbVmijMM4dH3r0MdhJq/37CQHV6WeuaxO15+CyAAaDl4jdCbCjBJkuIz
         OkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696935672; x=1697540472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GTectLvPvyUAeR+UK3mFeleYYPacIavTIv67tqstYk=;
        b=borJP1410OMehVTA8DpITkp7lpw0J9C9KE9vX7/AwmvQXz2+2S37/ZKCep0p40fKs1
         g9mQutMZW2z7j2X70yHiyun9v4Qh6chi9Nxtfkxb/dO5JhYGWa7zT28MLfDXHKDQv/xC
         1t16pDb9xZnSMHKY+p37TXXca1OArC79qRNwOrDbh/N1cbfy5WUUzuvFkrIPT/BZ+Csl
         OiIraFeaVcMJTjzUirR6GVQ283foXiZwz5k9dCkLga75RvIT7IJnHlBVfT5L7aHmkp0q
         8ZC2RLRBMLEDgED7xPtlqQMZqR7xbfns4Jgzywmbr9iz+088dC0qyM2iQGL+uuDoIoQl
         Mdag==
X-Gm-Message-State: AOJu0YwmA4E2QumPtNMLkhgv+87DHKwDhki7ac+ibn+MmrxuXi0Sv8rt
	/OWYcA7HibCZq7CslIcLh1fhGpHCjDmmxXUB8r8=
X-Google-Smtp-Source: 
 AGHT+IEEzyWdsvC8fh+kP+bgc2U+zJJLc3nm+2dxOgBkXQWWK628e0++wSoW6/Ywrasi76fnvCKv6ghaB7r27HBWTH0=
X-Received: by 2002:a05:6402:707:b0:525:691c:cd50 with SMTP id
 w7-20020a056402070700b00525691ccd50mr16977820edx.24.1696935671648; Tue, 10
 Oct 2023 04:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 10 Oct 2023 14:00:58 +0300
Message-ID: 
 <CAEnQRZBzEfwC3kgaUWty769L4wD-LGng5yUJwQR2_C4T0oJjxA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: Convert to platform remove callback returning
 void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: EFSJGO2RSBNCQOJE7KFJFLWHZDWKKOQK
X-Message-ID-Hash: EFSJGO2RSBNCQOJE7KFJFLWHZDWKKOQK
X-MailFrom: daniel.baluta@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFSJGO2RSBNCQOJE7KFJFLWHZDWKKOQK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Oct 9, 2023 at 7:03=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> The SOF platform drivers all use either sof_of_remove() or
> sof_acpi_remove() which both return zero unconditionally. Change these
> functions to return void and the drivers to use .remove_new(). There is
> no semantical change.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>



Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
