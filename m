Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8AC679441
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 10:31:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAAABDFA;
	Tue, 24 Jan 2023 10:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAAABDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674552692;
	bh=zKq2cWJ07Jm1Xl6OCsQ8x5Ne2Ms3VmQjYEYEPzC1T/c=;
	h=References:From:To:Subject:Date:In-reply-to:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=neQsHkNNkpQO2gvkFN3KC/ulbsSGEK+RC+9bAUdpedjh1sc7nltlqbV8RBvX2hD0k
	 FpqGI9RjJc+oLzaDjyR7ixzZ4ZuKF0WtQOo/Amd3mTbAAlhhCDUMJCeIOdrDvbsZIK
	 LVU2VWhSeG6ZOgbs+CnD1nghAAVYtVn85qSYxho8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3858F801D5;
	Tue, 24 Jan 2023 10:30:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3472FF8030F; Tue, 24 Jan 2023 10:30:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6096F801D5
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 10:30:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6096F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=I+tuDdwE
Received: by mail-wr1-x42d.google.com with SMTP id q5so8570060wrv.0
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 01:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
 bh=zKq2cWJ07Jm1Xl6OCsQ8x5Ne2Ms3VmQjYEYEPzC1T/c=;
 b=I+tuDdwEKw+9ohkGwY3IF4uCxUk5PRjJDNBURlph8boch6UG6H0iNbzl+ejrR14Lqx
 uZF+LRaf0w287RHCjMKI8I7GRM8OnmaiusJUQCHXZ81KvcTMDn3CpHfpKF3U80HLxLil
 ulvu9yw+FqtNb22vP1SiVelwMtbPytU0KbLuZur6v3fgu3wV6k7c0e8sdKEN1xHdEg5b
 U5B1+2g0qfNBcadwDKkCyUc+USMJShKG0m4hCJh3GWs44CVVWo1+DRZJ4qOUx7iBiO68
 QWqiSqWguYc+kl+KmJ0+WD5GYRkgol8Awu0oNT6C8XX+lRxcxmSiaEfqTFeXxQb/U0Vj
 MX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
 :user-agent:references:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zKq2cWJ07Jm1Xl6OCsQ8x5Ne2Ms3VmQjYEYEPzC1T/c=;
 b=pZ/w8EBKEgUkhRS65rX8xHJ6CBK/TVqcKvianH1VUlgJYSdtDbfQ3i3V2Jk/danZIQ
 w0wV54EtEuJjCJp1J5v02svRsTIoGrKtK/Ntz7fCUVtHHOjjkYxlTkYHCX+IRjGKNeye
 ahWUcI84Cxl0QTI9gWKv5pVm3mMLJXg1HeKIz3078qiIuAbCRBtaNTpsWdQciIcOkwRp
 wlyppaXXusoUHw5+VUsyDtJfMyvKoV1lDdCR2vdAU9u0EDqdMA2ONQvy2p/HddQuRFc4
 xgtDIEUtxfKOJpaTrWkJe6yU2vrg+FScT8BskJ2AVYR+Ogl2Mo7SPqs8842FvpnlQISV
 1xWw==
X-Gm-Message-State: AFqh2kqBvdDPIlUkGWuxBVHH0hucwN5OYtaz2UfBFN1lUOl6xby8FMOc
 dzJi4y+nZvA73XvDkB4YZrkjUA==
X-Google-Smtp-Source: AMrXdXuMCqzhrMJs53QLSqksE8sdifA96ZfMslWvX8EzmPm7sCeVj1H6MGHvlCQ6DtGnK4yEgoGgBg==
X-Received: by 2002:a5d:5b18:0:b0:2bd:c2ce:dd5a with SMTP id
 bx24-20020a5d5b18000000b002bdc2cedd5amr40770157wrb.16.1674552601763; 
 Tue, 24 Jan 2023 01:30:01 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 k9-20020a5d5249000000b002bdd21f25ebsm1413017wrc.71.2023.01.24.01.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:30:01 -0800 (PST)
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
 <87cz74u1c7.wl-kuninori.morimoto.gx@renesas.com>
User-agent: mu4e 1.8.10; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Subject: Re: [PATCH v2 15/25] ASoC: meson: use helper function
Date: Tue, 24 Jan 2023 10:29:04 +0100
In-reply-to: <87cz74u1c7.wl-kuninori.morimoto.gx@renesas.com>
Message-ID: <1jmt68gu09.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, alsa-devel@alsa-project.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


On Tue 24 Jan 2023 at 02:13, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> Current ASoC has many helper function.
> This patch use it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
