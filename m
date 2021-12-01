Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DD746509F
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 15:57:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A70E12598;
	Wed,  1 Dec 2021 15:56:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A70E12598
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638370623;
	bh=ioD6aEdkt9xalIIIzvIj6JLuBpGEhq/fUyh5xDv77n8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WgMHEFtAPV1/CmUn+HKGFbteZreQuD82ay62D6PUmChxdfSC5KZReQpqh50xNjEJi
	 LGnJqqqG4ydKEQox2zz5fOTY2SnWRsbzHo5p+E3F4x9qtoOqR0Qhiwly0TSJdT3QoX
	 JHU4dOdon9XkxfTiTwaOUm8Yd+t8P7N77/jdfRfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F210F80217;
	Wed,  1 Dec 2021 15:55:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4BAEF80246; Wed,  1 Dec 2021 15:55:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FAB0F80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 15:55:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FAB0F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tph+3nrF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 46D49CE1F4F
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 14:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99684C53FCC
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 14:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638370531;
 bh=ioD6aEdkt9xalIIIzvIj6JLuBpGEhq/fUyh5xDv77n8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tph+3nrFuOwCpE8ZL1xjF9oRPK/5EsKPKHZtVVn6hwHhReeZVU6DQWlgMNNT/lnqp
 SnPBBFKAYQf5DtCBH5M4I8AAFDd2+ETrBh3Gl54GwehWm+z6cfYzQwZz+Jn/jRWsjl
 X6H8Ek+ptJ6HpKIcL+5V5rS+Q80a7RAI+kk6jN/ymmqtdn6sGHrLld7ubLfDXRCmts
 e8wcNi4b/Cyjw1ywf5t/1rITQkSlA1uvOKca45GbI89InBHjaXAR4XQY3Zni4XMvcN
 ivtdTtCfoYBujtvJ2U80zrKzjtpeL7xurynsjHq7mRRSkQCd+vbGS1UVnj896FR/5E
 ie3Y65Pa1LuQg==
Received: by mail-ed1-f52.google.com with SMTP id x15so102658988edv.1
 for <alsa-devel@alsa-project.org>; Wed, 01 Dec 2021 06:55:31 -0800 (PST)
X-Gm-Message-State: AOAM530E6RWe1/BTXdtM1ySZhgt3gh3zECA8kgbjh2lGOHADo6eCl/WT
 VLu3ZZ8V0kq9AYiL0xh0LTsPtaGTgRs7La/w1w==
X-Google-Smtp-Source: ABdhPJz0qIYQVkXhjFgvV8FlUiZ0WNuOVlgvrWYaU156d6p8wlg0vfTdutuXHpwLAZO05kWysT77rltc8z+AanyP4Ak=
X-Received: by 2002:a17:906:bccc:: with SMTP id
 lw12mr7616289ejb.128.1638370529859; 
 Wed, 01 Dec 2021 06:55:29 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2112011341340.1159@lnxricardw1.se.axis.com>
In-Reply-To: <alpine.DEB.2.21.2112011341340.1159@lnxricardw1.se.axis.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 1 Dec 2021 08:55:18 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLLeSRKmjowWdSHLBiewChRjVzvEn0M3t4_MA5GtAvkZw@mail.gmail.com>
Message-ID: <CAL_JsqLLeSRKmjowWdSHLBiewChRjVzvEn0M3t4_MA5GtAvkZw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: sound: tlv320adc3xxx: New codec driver
To: Ricard Wanderlof <ricardw@axis.com>
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

On Wed, Dec 1, 2021 at 6:44 AM Ricard Wanderlof <ricardw@axis.com> wrote:
>
>
> DT bindings for tlv320adc3xxx driver, currently supporting
> Texas Instruments TLV320ADC3001 and TLV320ADC3101 audio ADCs.
>
> Signed-off-by: Ricard Wanderlof <ricardw@axis.com>
> ---
>  .../bindings/sound/ti,tlv320adc3xxx.yaml      | 137 ++++++++++++++++++
>  include/dt-bindings/sound/tlv320adc3xxx.h     |  28 ++++
>  2 files changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
>  create mode 100644 include/dt-bindings/sound/tlv320adc3xxx.h

DT patches need to be sent to DT list for automated checks and to be
in my review queue.
