Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E868206E61
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 09:57:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF7CF182B;
	Wed, 24 Jun 2020 09:56:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF7CF182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592985425;
	bh=X/gHabGyJjIvH7klo+Z30N80BShhTBTxHAMboUHZsDw=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sz9+AmZI0WNFQCJcOpE2T08giX2VTuyKCwPx92z4Af3jNHrPICbgMsdeKGA79qMsA
	 AH1BFvG66RYXSW3sRMsWo553GfHtEa/snMIyJ60ix3CJai1WFIxbYBFaTfUzrcxTMQ
	 Mli9r26D0T3pRDgatSD9/mAikwftDxetoDHpfsGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCBADF80328;
	Wed, 24 Jun 2020 09:49:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA43CF8015B; Mon, 22 Jun 2020 16:04:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0944F8010D
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 16:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0944F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="miQD36o/"
Received: by mail-ej1-x643.google.com with SMTP id n24so18162724ejd.0
 for <alsa-devel@alsa-project.org>; Mon, 22 Jun 2020 07:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=AkXgQz4f6Jb/SfgaY94+eCp/+t+YH9GzfLxXy17qw1I=;
 b=miQD36o/JVjj5qBA3N2E8kQsw3fyaP5shHvUmpQxO/WwB1W6F7TkFAu7FqDbqJycGX
 ZbeQWR2lKhtbYP//aapUtjeRUXbixUHgYN49PT749c4rJMWYqQ94jitfnK2fNizM3qLV
 JfGYxFe2V7sES1ZDIN5R6a4kRzHwxusjH/P6ealaz9HEjzYsgvKtQT1HXe/komoioEHB
 7igQ6Lz1LBp1TXvdZnfydpnd6UVM0Gp/eqiTwXd/jzlbfJ7eAjrHAeMlcHXavgR5Zcud
 QWPbD6neGomrMu2L3fqSTWi3FZbTIgBxcBKIlQwBPnzekCnOuCr4f3M/TppY18mdfq9x
 lTgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=AkXgQz4f6Jb/SfgaY94+eCp/+t+YH9GzfLxXy17qw1I=;
 b=bGU0U+LpbpcFOSbMqsbKtuRw0TEFese4uw+8FlApYFPTCxb4g386luM92sVkxEhA0D
 lij64HgFGpfRUuTiPinHsAhbbUhV7rcGuNFM/umtua47oEi6EG7GamoUHRtyxvZzPVU+
 QjZ9wSDXFEOmu6Eijkvx8WOcIQYjPU/+NRkZT2gxAEBAbrCSdPvkSvcq6lBVP5Eoo2yd
 pdrp+w7OTRHO4eDRLBUT+E9O+wU7h7WVlVc0oiOvEHPIqyK9cyWnC32yBfB+2PjZKCZS
 RWuZEfYdRDg8dW3F3WavQxYT3XyR46i1M8127rjHdS3Jw+lMvPbxhsUEiS78DChY23/5
 7YYg==
X-Gm-Message-State: AOAM532yFuBjAcLm7/oGhdq9Js5xFXNy/94zpC11cD1wPI9/6o6t9ul/
 L0rcgaU+iIeD8yIzJZwKf5hrGA==
X-Google-Smtp-Source: ABdhPJx13jRteSsX752kFTZR7wYlw7AZQfoFikTlKm6sVUt89ZqX2jnk7bahtoLDO7GiSW+vMYhcyA==
X-Received: by 2002:a17:906:5e08:: with SMTP id
 n8mr15834673eju.132.1592834658428; 
 Mon, 22 Jun 2020 07:04:18 -0700 (PDT)
Received: from [192.168.2.2] (ppp089210109128.access.hol.gr. [89.210.109.128])
 by smtp.gmail.com with ESMTPSA id
 w18sm1217980edv.11.2020.06.22.07.04.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 07:04:17 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 1/2] dt-bindings: sound: Device tree bindings for the
 apq8039 sound complex
From: Pantelis Antoniou <pantelis.antoniou@linaro.org>
In-Reply-To: <20200622134145.GJ4560@sirena.org.uk>
Date: Mon, 22 Jun 2020 17:04:16 +0300
Content-Transfer-Encoding: quoted-printable
Message-Id: <8C9C4D5E-D92B-426D-A597-C784D1611967@linaro.org>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
 <20200619193831.12528-2-pantelis.antoniou@linaro.org>
 <20200619214126.GA1251@gerhold.net>
 <2070B433-83E0-4ACE-A470-36401934FC5A@linaro.org>
 <20200622120409.GD4560@sirena.org.uk>
 <519B5FAC-4DB8-4968-B9D4-96E376D74F1E@linaro.org>
 <20200622134145.GJ4560@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Wed, 24 Jun 2020 09:49:29 +0200
Cc: devicetree <devicetree@vger.kernel.org>, alsa-devel@alsa-project.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Matthew Porter <mporter@konsulko.com>, Shawn Guo <shawn.guo@linaro.org>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



> On Jun 22, 2020, at 16:41 , Mark Brown <broonie@kernel.org> wrote:
>=20
> On Mon, Jun 22, 2020 at 04:32:46PM +0300, Pantelis Antoniou wrote:
>>> On Jun 22, 2020, at 15:04 , Mark Brown <broonie@kernel.org> wrote:
>=20
>>> No, you're encoding use case decisions into the DT here - for =
example
>>> your example will break use cases like ring tones and shutter sounds
>>> which should play through both speaker and headphones.  It's also
>>> setting volumes which may be inappropriate or may be not and =
interferes
>>> with userspace using those same physical volume controls.
>=20
>> It is completely optional whether you use this functionality or not.
>=20
> It's optional for whoever writes the DT and flashes it, it is not
> optional for whoever's doing the OS configuration - these may not be =
the
> same people.
>=20
>> In that case you don=E2=80=99t use the automatic routing you merely =
set it to off
>> and everything works as before. Or you merely use the route setup for
>> the function from userspace.
>=20
> Userspace shouldn't have to be fighting with the kernel for control of
> the device.
>=20
>> The device in question is not a mobile phone so there is no =
requirement
>> to have speaker and headphone active at the same time. It is possible =
to
>> create a function that would be headphone+speaker active at the same =
time
>> for that case.
>=20
> That may be true for your OS configuration but that doesn't mean that
> some other user of the same hardware won't want to do something that
> needs both simultaneously.

Let=E2=80=99s step back a bit and let me present the problem and what =
this is about.
Disregard the automatic function selection using external state inputs.

The problem is that for sound card that is composed of a number of =
component
like this one a pretty non trivial setting of controls must be done.

Tt is not atypical for a card like this the set of control being a dozen
or so, with some requiring even more.

Someone has to do them, be it the kernel or userspace.

Instead of having userspace do it, bundle everything in DT so that =
everything
can be set in one go, and without having the user-space engineer read =
the
a few 10-100 pages of reference manuals.

This is arguably a hardware setting (eg. the set of configuration =
parameters
that enables routing sound to speaker).

Now this is not going to perfect for all cases; some cases are very =
complicated
and indeed user-space has to be engaged and perform the configuration.
This mechanism does not preclude it.


