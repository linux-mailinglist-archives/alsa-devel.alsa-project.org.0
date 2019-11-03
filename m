Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 211A5ED65F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 00:21:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B03A17F7;
	Mon,  4 Nov 2019 00:21:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B03A17F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572823315;
	bh=IiRNq7lvu3GhNFtQcBn1sQyCmV+4HrnJHCy0xmkW7k4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rfnC6fj7l4BUXs1Wjw+9ofiXIUVbPaP/sQ7wdApzzdz0y5aboSldcWLP3ZIWTMRVa
	 7KBE/X23SLs4CveauP17EuqybhdjMQpeTXow70gMY+QNnrQ1RZleUJLWsNPTAaPyOx
	 JCNwGIy+dbe8HoRGiazzchYR4XENRlYjiZ4xX7Q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8159F80368;
	Mon,  4 Nov 2019 00:20:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21C5DF80535; Mon,  4 Nov 2019 00:20:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33A36F8014A
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 00:20:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33A36F8014A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="vYEVAhXl"
Received: by mail-lj1-x242.google.com with SMTP id y23so4677775ljh.10
 for <alsa-devel@alsa-project.org>; Sun, 03 Nov 2019 15:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iVpcN1vOdXs3wwhH+wrUa3RKCmoO3R8+a8ZB0f/AmFQ=;
 b=vYEVAhXlokOFcchNfSd+V2JmCbFdTJYbvhwaDedCzoFLvtj/YDjkH2J6fS4zy3hjCY
 qefgD/I7cMWurxOGbXoJERkCxJIgrE516+LJyYBlUqFQrh0cJ84nEZwuVoNtZ5ZUPPpO
 mqmECtStI09hzbCh3jYmpXbJCQMvbPG/TPUhiJ+MzdvIPR6xxCQWdjTArl89XE7eGWxI
 DCsqV9f8aY3E/lAXiwf4vcPC++iSRJ/SXB8nGa3e8MuJS56vcsrNGIUfEB6rBK1p/IRe
 UD5a/66390jHlTwMpnaM0AV/1fXQrM8Ulp6eCpL5FASsHrfuoLzHf8CjkyGG0Sp3zbZ+
 AIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iVpcN1vOdXs3wwhH+wrUa3RKCmoO3R8+a8ZB0f/AmFQ=;
 b=NqVBWWvyHMda1ivxpgfw1GNhW1dooM4qk6bOFzmMjS2ivloL7ZW40frjE9VBZoxXRw
 Xd7apnZr0PgR5zYQ7hOvwQo+N9+N78/68pEWaRMzWVmwGcKQ5/neuZYtGOTSf2b1zjRM
 gtP15i8+JKYw8basKiH1HSnO3xvi8Ep2NpmLyBD75SPcPkc5b+XoKkRMNV18RAItTARo
 1u+ffdvtEOKrDOZyJgTs97N4juCYm51vd+iP0ygf87xBsGK5c4+oWntQ3eA4VgwznpND
 NbRuwWO+94qGSNjmMs5XT9VQctYcjY5rdQ4ywIw/7pAHOd3bVQCp7P7Iq95BhIXKLxAy
 FDjQ==
X-Gm-Message-State: APjAAAVppQKcBBGoNVtJcJPpKby6pvALqHoJbxW2k3fB5RJSAoAVwfPU
 aAUouQ3MIRYJJ+XFr87ialJYo6y6QfitNQem3UIFow==
X-Google-Smtp-Source: APXvYqxTxFkdLmpGie3z+n1NoTiUXGL0EZTOt83bLBNwDXdy7iOJZES3zs0O3WqyGV8LxjgkqUR638pDafjAOULX0gI=
X-Received: by 2002:a2e:a0c9:: with SMTP id f9mr16639653ljm.77.1572823204990; 
 Sun, 03 Nov 2019 15:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20191029112700.14548-1-srinivas.kandagatla@linaro.org>
 <20191029112700.14548-9-srinivas.kandagatla@linaro.org>
In-Reply-To: <20191029112700.14548-9-srinivas.kandagatla@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 4 Nov 2019 00:19:51 +0100
Message-ID: <CACRpkdYc-3Nk7VGj8mAjaM4C0dc_X7ZOK0cptW2Sr+kKwvyFVg@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, bgoswami@codeaurora.org, vinod.koul@linaro.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, spapothi@codeaurora.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Subject: Re: [alsa-devel] [PATCH v3 08/11] dt-bindings: pinctrl:
 qcom-wcd934x: Add bindings for gpio
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

On Tue, Oct 29, 2019 at 12:29 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
> gpio controller to control 5 gpios on the chip. This patch adds
> required device tree bindings for it.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../pinctrl/qcom,wcd934x-pinctrl.yaml         | 52 +++++++++++++++++++

The bindings look OK, but remind me if I have asked before (sorry then)
does these GPIOs expose some pin control properties and that is why
the driver is placed under pin control rather than the GPIO namespace?

Sorry if this is something I asked before, I just get too much mail.

Yours,
Linus Walleij
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
