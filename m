Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C97DF1322DF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 10:48:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FD2A1828;
	Tue,  7 Jan 2020 10:47:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FD2A1828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578390498;
	bh=s+zO32lC7HyTp4lgNbIkwZK9nz4RHuXbZOYFcCitqnI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZgsdX7BSRYjuSBjP3kgNdu+/XICZvWa2RcoscuXTwO+OiNq5aSuDbAXTZUVKGUDn4
	 Vgwjl1ecbyrUP/9wasVINtwVXO+xbVfsUncDr26Y2pt7XJb5w026MZcDKSwvo9Safd
	 PC9mavOJMbZpcmgW4d7BF+c0yqQYv7mwT5Um4z1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8049F8010D;
	Tue,  7 Jan 2020 10:47:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39651F80172; Tue,  7 Jan 2020 10:47:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D497F80140
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 10:47:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D497F80140
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cjBKRspf"
Received: by mail-lj1-x242.google.com with SMTP id u1so53996768ljk.7
 for <alsa-devel@alsa-project.org>; Tue, 07 Jan 2020 01:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GKAgR/S5tBz772raWFJYIXfn8TDQH+brFFCBErQ1zuE=;
 b=cjBKRspfACIPeQVMLJLGEfJDGZNyVnna+Twaa3iVAAHS8U+oy2m9Nb9/ySkIfP+83o
 6Nd+hf5KKEqfByAC7lMtKr9MvuGv4ZYfIANPqsQW1zPiN5oxYMfRen8GL8vHrREQCf5P
 fYFZ94xQTN2WhdOAGXCHEi1T/VuirSxPZ6wRmCw0bCG5HY6x4Sze6nl/zikjeqkOFPAg
 UbCPoMUGD0dJ2CrJo+iVFMjdnIbuI1koYD3fO6igDmWt304aS6EprJ/qmbHAXwZABxbW
 oJaq9ofupn1axmEw/P6QHZ/7dsm+wYsFMYfHNSOgbT6x3HPRZCo0hphOZb+D2FfMEDmI
 Ml6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GKAgR/S5tBz772raWFJYIXfn8TDQH+brFFCBErQ1zuE=;
 b=GcahdPqruaq76HAhvTHmQn9X7xHjP3vvkNfSsWCom7U+BQyQOEkgUXcFc5cha88ev/
 S5czdX/nGq+mzbSowxv+QJjItcKhojIdtarbvUNqa03r5ZsR2D/ThyVI9bP66p6slb7y
 Lt0Gph+AD4UL+jReSZF0h4qjtVRWV9vSNCLOiPxq//pk3ElU07ZDm+Zz9QSgfd5bwX1h
 sNCRaKNszPvLMPdwz48Lba/MogMIH8s+x3t94Y+bv4G9wlOSpNx+7SyviU+mhK/DCYv3
 +0Rgn0yfHF0ZD7B5B95qlNCm8COirguVQhU8sHtlFYY6WRFbes1JWG7Ld63jw4BJ58aW
 0qGQ==
X-Gm-Message-State: APjAAAW/cGz68hzmfOzMMULZRuqaZQqzvOVwqamHAIrl5GT0XmLUZWQ4
 YCetrRXkQEGiV5PiCJuwhYUPPdf0RtRGIzOlqPOuYA==
X-Google-Smtp-Source: APXvYqz0CNhEmsacDTRcEPmfxQ/oGL27kQqghbLjNnpafVZ5FskeP2/QqmHESgY8kC+PmcK3Ux3RyArBjry1NP4YanU=
X-Received: by 2002:a2e:85cd:: with SMTP id h13mr61135533ljj.191.1578390438453; 
 Tue, 07 Jan 2020 01:47:18 -0800 (PST)
MIME-Version: 1.0
References: <20191219103153.14875-1-srinivas.kandagatla@linaro.org>
 <20191219103153.14875-9-srinivas.kandagatla@linaro.org>
In-Reply-To: <20191219103153.14875-9-srinivas.kandagatla@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jan 2020 10:47:07 +0100
Message-ID: <CACRpkdYc-kB4Kx690FnU=3CwnjFdQhdxofGguFAAs_j==C=nmQ@mail.gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, bgoswami@codeaurora.org,
 Vinod Koul <vinod.koul@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, spapothi@codeaurora.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Subject: Re: [alsa-devel] [PATCH v6 08/11] dt-bindings: gpio: wcd934x: Add
	bindings for gpio
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

On Thu, Dec 19, 2019 at 11:33 AM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> Qualcomm Technologies Inc WCD9340/WCD9341 Audio Codec has integrated
> gpio controller to control 5 gpios on the chip. This patch adds
> required device tree bindings for it.
>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Tell me if you want me to merge this patch through the GPIO tree.

Yours,
Linus Walleij
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
