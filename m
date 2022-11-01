Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 231956142A4
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Nov 2022 02:08:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1F551663;
	Tue,  1 Nov 2022 02:07:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1F551663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667264918;
	bh=fiRfNbUxfFmfiLWtn9XSp5uwnw9vjNKsAb8ju8gDweY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JtQ6XAkhxf54lMi24C57odmkRC/4ug5agXK0GNlfjAe4QkCFWynJ8Sz0DOt12PPRp
	 697J/G8YEn8+uk9OS/bBnpZfMtvDqAuelLruTwxqtjDT0GWGwz+3xU/ZOJsHsGQeZ9
	 Vw0E8zL49jEDjwauD2+EmT/M200cKf8U9hCeEtKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17093F8021D;
	Tue,  1 Nov 2022 02:07:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C20FF80163; Tue,  1 Nov 2022 02:07:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E47F2F800F3
 for <alsa-devel@alsa-project.org>; Tue,  1 Nov 2022 02:07:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E47F2F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="KV7kD2/v"
Received: by mail-yb1-xb34.google.com with SMTP id j130so15664932ybj.9
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 18:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XmMaXP90CaIMiPtYW47n6m2G5ZMtSO1W1wgU+NyJUlI=;
 b=KV7kD2/vrb7m62VzqzYzSnWH+Ru13le5MwXLe2PxHkpYIB7UYu262mGqcarWS6abdD
 0dn/55y/MOGSm2sQV75SA1wSv0YWmvzxR9tHvFNO0eYd/p+XMjfj9QQLaHTV+LDuwnBa
 BPYazU9flaQYyJM5cVJFmzqaMfMTDnKJRRKLPjdfFZvWpny7+W8rXzheWnWWNUTD9bOK
 TSxsmi1kbswby1PBNFOEN080yKyITA6s4Pfiss8/g/nvbAUkmgenBIo/2AcTEEsTwfKc
 1i/wVL7p7lpD6Z99zf+2MtG/NrYASJpB8AdHCoT/HeVY3lxITW0aXRkgbCax4e7Pmvw6
 CjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XmMaXP90CaIMiPtYW47n6m2G5ZMtSO1W1wgU+NyJUlI=;
 b=XtMPn6lyIsF5wicM5F3TPv+BUN9TzIXSEwfF/2tjfL00oHGQ3GIdZTzP7uH3QHTkSt
 3X49wlmpidbPyX2Onp0zTc6ppZi4szoyUWQvPpIRLlKdNnupzjT9G5Y0KjWnuGjgUSkh
 ys+zBroY2oJySbmJ83SO+w34+LZD84nOv9EGzUBO7TXOjzesn6Z0PoXvjMl1LuZpu+gl
 kMzYotCuxwvFT/BxzUSeWKN1LHs7U+uAc1Ibg/hffGhBJHmwqUIXn/rO9OTjWauAKYA5
 OybTT9b3wSuNITvUj6RB1/asM6vdv8kc3HYeMYkF/B8S8gMDU3TjZGThS5uHoq+ifPF+
 jmEQ==
X-Gm-Message-State: ACrzQf3MP4GYc9gaLCWQRJWSGtrfmZy2Xd+l4eLO7m8VDv2EduIo2OrY
 iYnbvq2sPnZHNbUxdSw7dWaxXjciBqW1lcEtO/mFcw==
X-Google-Smtp-Source: AMsMyM6rZlIQZ1PYaWj2k4quC4D/+5G6Kbx8Z29PHK8evYzmyRI+sEH2P3krYmjXNk4yI5MLVy44GaA90GQxOjbPmBU=
X-Received: by 2002:a25:7055:0:b0:6cb:7973:a3a2 with SMTP id
 l82-20020a257055000000b006cb7973a3a2mr15384128ybc.595.1667264857444; Mon, 31
 Oct 2022 18:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221028102450.1161382-1-ajye_huang@compal.corp-partner.google.com>
 <20221028102450.1161382-2-ajye_huang@compal.corp-partner.google.com>
 <Y1vDYNOwZNOco1hq@sirena.org.uk> <20221031184343.GA3235956-robh@kernel.org>
 <Y2A0fdwnHTqw/NDw@sirena.org.uk>
 <CALprXBYEsB5z-iioBeyeBAwPFkOnkQn8CBbj9Di9CpdqvFFnOg@mail.gmail.com>
In-Reply-To: <CALprXBYEsB5z-iioBeyeBAwPFkOnkQn8CBbj9Di9CpdqvFFnOg@mail.gmail.com>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Tue, 1 Nov 2022 09:07:27 +0800
Message-ID: <CALprXBYrKMSx=JRft7eB+YGQc2eDY6VXSrNfuoB3aH8DApi=NQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: dt-bindings: Document dmic_sel-gpios
 optional prop for two DMICs case
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>, devicetree@vger.kernel.org,
 angelogioacchino.delregno@collabora.corp-partner.google.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
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

Hi Mark, Rob

I submitted another one to process the kcontrol in the audio machine
driver instead,  sorry about that previous non-completed mail.
 https://patchwork.kernel.org/project/alsa-devel/patch/20221031122224.1846221-2-ajye_huang@compal.corp-partner.google.com/
thanks

On Tue, Nov 1, 2022 at 9:04 AM Ajye Huang
<ajye_huang@compal.corp-partner.google.com> wrote:
>
> Hi Mark, Rob
>
> To avoid confusion, I had submitted another one for process
