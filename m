Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 395E810EA46
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Dec 2019 13:58:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC9CB165D;
	Mon,  2 Dec 2019 13:57:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC9CB165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575291529;
	bh=xAbXD9+JW6h2Jh/d60aSZvVQzQtpsM71jiUjKnC3CVo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BolhNu3Ji4KV6qtvRdHKWxgbIIN11T50rKm081DAxRBsPBD5m8UAgK9fgFMLj5rGA
	 A/mDoVKGxkJzYtzaS6OeD7AurlLks96qXljWZpjF95KgJvebzzr/VOchq08uLaD4b7
	 reYunMWZDDvdGSmxCIhPubN34H7+ry9wk3z91zmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AA7DF80217;
	Mon,  2 Dec 2019 13:57:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20446F80214; Mon,  2 Dec 2019 13:57:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6621BF800B4
 for <alsa-devel@alsa-project.org>; Mon,  2 Dec 2019 13:56:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6621BF800B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UlyiU5dp"
Received: by mail-lj1-x243.google.com with SMTP id u17so12609594lja.4
 for <alsa-devel@alsa-project.org>; Mon, 02 Dec 2019 04:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qlt+/dRlgH3WSZzFFBm5SD3CiWvxcdEsgMu4Ka1X8YE=;
 b=UlyiU5dpvNruuaxcXO7dvcG62On/kdUK4obQpYfELq3M040cPWbk92RXty5c7XyxHQ
 JlwoKbkid8aIAN5Tj/Q45F++QZmZ8BDp2fKC3o0KiEOLkPMVj/sP/GA1ijguRSSyroJY
 j071GRkprPF86nKLRiFrKQr1QfIg+WOcCTwil4xkDqnRcrbJgBj574XnFo9nVQx06eqV
 kcfwKnDmvmw0gf1VF5eHPJ4eSqHqCr0YzpPxG11lmnzUjX/43McgbFIBGFt2hl0/+GAb
 ebjqRxaO1ouiLadvFFlXedasMYGwWmhPw3n5mRho5odgoUIv9cuc0UPXktHrNHYG+Tma
 teyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qlt+/dRlgH3WSZzFFBm5SD3CiWvxcdEsgMu4Ka1X8YE=;
 b=tLo2SsR4VSmwItosDCCus9w7qR1Xr4UDmQbobAjXM/hwYtqlBj1mfdW/JH//Il5Jj3
 R/fA7dAixhovz43V6d7w8pq9tbHSCQL9zLCWwLMaQpkGh26vfEbBwGAhpqNHlmbbvT5j
 DDSYn+LyrbQIZbjL8IXYPZKXyWWp1UfM92PjF/EEHDD9ICmvs4wCh4yZ/DkO5Z9lKssQ
 D9A5GwcH/Pyqjgt3ccAOD8I1fQN7eonSd4XBFLJxx57etg9GazoGL77xHWD2UXmSfX0t
 lJmQx8RqsTRIoDQpMurXKWW9rG6wrfbesUsKlNZ+aSGqFVw3iNXKKusLZWr+Bo0I9KvQ
 bHJA==
X-Gm-Message-State: APjAAAUeLKe1zbEeNU6/0T83I3NgiFOhV7+hzgt/D3mPgWHBdH/GxvBf
 N/BlIZDyK3YaO3u6GfwB6iFtEaJreYgWeKO3imU=
X-Google-Smtp-Source: APXvYqxQdPHL3wwjh1XiiAR4BKUnI9ER2eZEatvhL25goi1fFQraJN0onktSvPLymKxIx9kQLcHq96wvcClwhZw058k=
X-Received: by 2002:a2e:241a:: with SMTP id k26mr2647022ljk.26.1575291417981; 
 Mon, 02 Dec 2019 04:56:57 -0800 (PST)
MIME-Version: 1.0
References: <45ef9ee8c6265743a9c30d8e4d9dcbac1ee3aabe.1575286886.git.shengjiu.wang@nxp.com>
In-Reply-To: <45ef9ee8c6265743a9c30d8e4d9dcbac1ee3aabe.1575286886.git.shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 2 Dec 2019 09:57:12 -0300
Message-ID: <CAOMZO5AXnw7QDdfKkZ+FBwuWWvr+t0rRsHQ4muW-T00he2f73Q@mail.gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [alsa-devel] [PATCH v4 1/2] ASoC: dt-bindings: fsl_asrc: add
 compatible string for imx8qm & imx8qxp
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Dec 2, 2019 at 8:56 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:

> -  - compatible         : Contains "fsl,imx35-asrc" or "fsl,imx53-asrc".
> +  - compatible         : Contains "fsl,imx35-asrc", "fsl,imx53-asrc",
> +                         "fsl,imx8qm-asrc", "fsl,imx8qxp-asrc"

You missed the word "or" as in the original binding.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
