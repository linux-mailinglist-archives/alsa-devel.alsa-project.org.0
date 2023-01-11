Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E89A667A3E
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 17:03:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ADD2922B;
	Thu, 12 Jan 2023 17:02:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ADD2922B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673539398;
	bh=JaysTLLTmmZ+rmKDHB9Wb2u1YULU9KelOdQ8zWfkZ2w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bV5RKnj1ojNv2NlfH3JmDzrD8JnCjiKeVZ6/fgp9uOwTnIiVUWt6L6qKfEAW4M6VZ
	 Q7YYdJPfVOLxsURqeESUerl61wZKZlDEt4GXquN3M5ktnL3y7MeBs30g9E+onulATf
	 dnBmfeLsgnufF5+MQmr3UX9+Op9nNQ2hWTnG/3sw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6791EF8057E;
	Thu, 12 Jan 2023 16:59:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E83EF80424; Wed, 11 Jan 2023 12:57:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0235F8026A
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 12:57:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0235F8026A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=oJkuI5UR
Received: by mail-ej1-x62e.google.com with SMTP id u19so36150044ejm.8
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 03:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SlPEec2+IBQQ6aC/iukEfuPjA9WBYySYnbQRaQsBKTg=;
 b=oJkuI5URWqRLl3jHVvP03YHQ9LvecNmx7XwG0rN9w4u7kBLRSywu7ButBnG+YUpK9Z
 MSnYlP/yRicr4afc+HpyAAhHg+6YT3q1XKvKZDrom1UziivXN1f+LVirrmD/3DOWR7pv
 HjcZzkcK/2w6zjjsU+9gtnqIHl8Vh0jLcS1XazwPmdQDEj4Ae1Z7pxNCm6agX2jcbt/u
 gIfbt3eQ1/VaWLzcg4kppzAIJ6DCoSY4I7scxDQcYOvFrijMxPOfiDvGYr4S8ZgCq+Bo
 mVp+8FXNj6kk+PemPWHfK4maH/2/i/pnxCR+mCBh6AGwEtMl/gTw1DSRs3yYcdv84gfO
 oTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SlPEec2+IBQQ6aC/iukEfuPjA9WBYySYnbQRaQsBKTg=;
 b=rJ/RwCLIA1Kv9dnOA5p4iYjHRYpj7FR1zs3QwCaXz7QYPS/kw8CxcBAAlU2zxQLULo
 RjO3wLVvss6wcTmWPQELRHO+Tsefs7G4KUg6x0wHxUYtnjsmkqVKXQtedm4OVX15cYe4
 01NM/qR2xepMi2Ae43nfEnlAYXZjebffDSlrGbIzEMpGX6hRPkbRrdCghttXHLANwIdW
 6KBzSlIqK7KQDuXuJroRjOUD/HDPNG/vQzr7EKcsagsihLhdKFMgcQERVFM7lxpzIEXH
 ktBv4umxPbo5pwquRhMly/SlLWeTiQWYTrBxsAHqH0VzgQ1yl7avX8iqAbfzwvPFFXgt
 NmkA==
X-Gm-Message-State: AFqh2kr5SKJSRiaviAoU7ZmJEzJWLVUyln2UFKxJBPpPhfSjutAndimX
 Y4XyEcokJaZYwsqd+3oDv2vKVDd2kgb/NrhgB+g=
X-Google-Smtp-Source: AMrXdXsdOLkPZ2zynnGTQFTBw15Y/4t+YpYYlVoGFZR/IjfgU7pPf93h3T0EG5iB3TQgx+D8Rv/QnEzfBHmyagXBFNY=
X-Received: by 2002:a17:907:6746:b0:7c1:4c59:6349 with SMTP id
 qm6-20020a170907674600b007c14c596349mr6768604ejc.187.1673438219838; Wed, 11
 Jan 2023 03:56:59 -0800 (PST)
MIME-Version: 1.0
References: <MA0PR01MB7145CB5A2D487FB713CD7C01FFFC9@MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM>
 <CAEnQRZC2X5v6hh=-PRiaUgp3SZQYg1vot+4JKwEE6x5bzTKvwA@mail.gmail.com>
 <MA0PR01MB71451A4A70DBD85680E90AE0FFFC9@MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MA0PR01MB71451A4A70DBD85680E90AE0FFFC9@MA0PR01MB7145.INDPRD01.PROD.OUTLOOK.COM>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 11 Jan 2023 13:56:48 +0200
Message-ID: <CAEnQRZDowp=-Cqvy=hJzQDDN_+cEUS7Pj-GJ-0oAhqq=N2STWw@mail.gmail.com>
Subject: Re: [PATCH] Support for MAX98090/91 codec in iMX8MM evk
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailman-Approved-At: Thu, 12 Jan 2023 16:59:42 +0100
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "peng.fan@nxp.com" <peng.fan@nxp.com>,
 "m.felsch@pengutronix.de" <m.felsch@pengutronix.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "srinivas.kandagatla@linaro.org" <srinivas.kandagatla@linaro.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "Markus.Niebel@ew.tq-group.com" <Markus.Niebel@ew.tq-group.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "tommaso.merciai@amarulasolutions.com" <tommaso.merciai@amarulasolutions.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "povik+lin@cutebit.org" <povik+lin@cutebit.org>,
 "ryan.lee.analog@gmail.com" <ryan.lee.analog@gmail.com>,
 "flatmax@flatmax.com" <flatmax@flatmax.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "hongxing.zhu@nxp.com" <hongxing.zhu@nxp.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "james.schulman@cirrus.com" <james.schulman@cirrus.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "shengjiu.wang@nxp.com" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "jun.li@nxp.com" <jun.li@nxp.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

 > I have added support for the external codec MAX98091 with I.MX8MM-EVK.

Please fix your email client to start sending email in text format only.

Now, going back to the matter at hand.

I do think that for an external codec we should find a smarter way of
enabling it.

What would happen if you enable MAX codec in the dts but expander board is
not plugged in?

Maybe create a separate dts which includes imx8mm-evk.dtsi?
