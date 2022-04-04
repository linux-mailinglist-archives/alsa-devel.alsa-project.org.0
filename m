Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE88F4F1DE9
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 23:44:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55906169A;
	Mon,  4 Apr 2022 23:43:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55906169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649108650;
	bh=Mr13sTe9S5P+5Fhg+wh22VL3ia9fpyUX966OBWfTLkc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MPvdGAChHkpQDonrXX4tN9MrDsjLxozUGMAFOtlCTVAJdhnSiUaq+3MgJPYqYym6X
	 fLYg+qu4J+53IP7yRtPfHS5KomeBxscuq73hv+PGwuycLVem3pzRDEvL53zyJCIm0Q
	 3rDrsbCqv8hKpuqme96w9HcokiMGMktph0afXGMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2C60F8010B;
	Mon,  4 Apr 2022 23:43:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CD10F80162; Mon,  4 Apr 2022 23:43:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7C32F8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 23:43:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7C32F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="oYZ8dVpT"
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2e68c95e0f9so116356837b3.0
 for <alsa-devel@alsa-project.org>; Mon, 04 Apr 2022 14:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mr13sTe9S5P+5Fhg+wh22VL3ia9fpyUX966OBWfTLkc=;
 b=oYZ8dVpTOFeU7D+TM02AN6Wr769JI0IIjpYWeqQ+Z3SGqPZywVpsTsHx6BmT4To0GA
 MTCmL6WOm3FUQxWUYlYYJDouiyVvKjXb+uSAzWriVCAm8BvxKmxLEJ0BjsL+NDYgjynE
 DDBjsZU1pQ1KUiUzEsLXM6gUhXdVrLYiXRxq7RkCasuovcw4YlKqDB2AIUlABGaZ4hzo
 HtEqyCLYYhunnCWZ/1JMpRiOOL4VsmDInF+XNSjxH8iZjCttPCdrl/zvHUP3qJ+K68Z5
 7RIIAyLsx38vl2myRcoO6cZKIdiSBTJ67WaHGesIPR+39IkAhf0/JuhEDYhC50lYpQMN
 QEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mr13sTe9S5P+5Fhg+wh22VL3ia9fpyUX966OBWfTLkc=;
 b=vpJK9mUPagyA8tcmRpJ204hPEZJhS7eYusf+yfnKj8FbI4j5uFuFrC4zDIWQaRA4Uz
 bHQ/jbDrf2YRcpPngOhzmIQAB2Vg6EsrfKEshZQo97XMsLE3wXYrD2cpaWWYgm+Ufj1T
 lthaeBxBNlABt3zzenSLShh1QZTTlpuPx9yXzlwRSBIcFVpD/2Jb0bnPRGkc4fW+5U5U
 WTJQQgQa/OWTM9WDmiP0qJ9xLeAHhbxiaB9AcoYedVolg0NiYAll7Rse+XMDkaaPVJJK
 h6eL1T9SEGmEpk6axonsQhLsim3x6XfgYINJluBrfwfZkQksXcEeX5glw4lpaRQ87Ak0
 yisQ==
X-Gm-Message-State: AOAM5319zA4Z59+PUUiSopJ3KRSEAiIAYRS5vMljDU7j+PnduZrGAh4y
 2bt2YdvIQelqmMaHLvNPM+zJIg2NCbZYhbVPq3F32w==
X-Google-Smtp-Source: ABdhPJzt85GxkABljpdoViylC1cpfWRSKb9qPQ1y+8bvWSMoJfBDA7k01Qotg3Ej9T1lzLK5pHJX09a0DIOLJBz0yD8=
X-Received: by 2002:a0d:e616:0:b0:2eb:450c:940b with SMTP id
 p22-20020a0de616000000b002eb450c940bmr133822ywe.114.1649108580856; Mon, 04
 Apr 2022 14:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
 <Yh+QeWEufbp2JLo+@matsya>
In-Reply-To: <Yh+QeWEufbp2JLo+@matsya>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Tue, 5 Apr 2022 03:12:23 +0530
Message-ID: <CAMi1Hd0ZCM8nVXTyWYkZgk9LMXcKZGBVAJ9LxEj1LR1px+bmFA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] soundwire: qcom: add pm runtime support
To: Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 yung-chuan.liao@linux.intel.com, quic_srivasam@quicinc.com
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

On Wed, 2 Mar 2022 at 21:13, Vinod Koul <vkoul@kernel.org> wrote:
>
> On 28-02-22, 17:25, Srinivas Kandagatla wrote:
> > This patchset adds pm runtime support to Qualcomm SounWire Controller using
> > SoundWire Clock Stop and Wake up using Headset events on supported instances and
> > instances like WSA which do not support clock stop a soft reset of controller
> > along with full rest of slaves is done to resume from a low power state.
> >
> > Tested it on SM8250 MTP and Dragon Board DB845c
>
> Applied, thanks
>

Hi, this patch series broke audio on SDM845 running AOSP. I can
reproduce it on both DB845c and PocoF1
https://www.toptal.com/developers/hastebin/raw/rodazupayu. It is not
100% reproducible but can be triggered on every alternate reboot or
so.

Regards,
Amit Pundir

> --
> ~Vinod
