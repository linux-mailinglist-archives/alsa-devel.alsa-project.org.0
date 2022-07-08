Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9163F56BE5A
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 18:53:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F121183D;
	Fri,  8 Jul 2022 18:52:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F121183D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657299226;
	bh=8K5Ogw41nMH5eAaVwuRakPZpwEVH+oq2WUfL0plnyXc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B5onolkewhG3UdE21xi4AWLcZzy36C16AHynS+8etSbng0wRDJ/8IvC8UpglDiM3D
	 0jHPVKR+XjcdFshh5g9XlnTNjm2tTtUnxl4gu0Byyu8QssgDO5ezJMgrPc1g7/ayOZ
	 WUmW7JTaNOxEtFbUvni20uXPCW8lES+Br/tsLE48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EE37F80166;
	Fri,  8 Jul 2022 18:52:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4975BF804CF; Fri,  8 Jul 2022 18:52:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0333FF80166
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 18:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0333FF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dWLlQ1yy"
Received: by mail-ej1-x62b.google.com with SMTP id sb34so38608169ejc.11
 for <alsa-devel@alsa-project.org>; Fri, 08 Jul 2022 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8K5Ogw41nMH5eAaVwuRakPZpwEVH+oq2WUfL0plnyXc=;
 b=dWLlQ1yydSoGV/onW98bsgX35+vMSlNMsket/8Fyvc8SrE6hn740hXzGV95JLJA6tA
 k8yWVE+6rzac12IUsPfv6jg2UnIPG9ImaPqwihUwRrqGoGOccgYaYL7evSXCwGlHbdoc
 ObNLwhypzlNCHvPLRgcgcjphwCMjF65xIr9MmeLnTwnbjHLSTohwXEB585pdbdImVOye
 RUU3W+1ZZJjdT1AtHq3SiI2+Zn/QYSqdbElsYsy5VkT4I9wwvz9eLevZsMJkBDAT7FUC
 4sRjWcyJZQl8y2sNT8aeJx5Ql4FKsU9soxSehP5YrCxca/3ymAlRd3CEddmUEXV/6cU1
 Fs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8K5Ogw41nMH5eAaVwuRakPZpwEVH+oq2WUfL0plnyXc=;
 b=uwSfSxjn8CUK+DwyVwG6Mb3W8pSIASQOC9YX/tZKa//pzPjFY40zDQqT6b+5+A8aYe
 UYRtssZRd7a82CqcXHQqqI+ICZJMuv2HZd2ODT+wB3j/DAivW80fsPmSYzHbh8DQarfa
 GnwkCaE+v6CnnxGeXb9911IJsmWCQFCRmNc5RJWzYrODqgfau7TLR5yFWbaS6JwT9TF2
 njg74D7P/wc+84tnXwL7RnS4eyds9VyfpqhAXZvpMtbtdxJzxeDJbwH6UEL8APIBSR4R
 RhKdjBcOFShlKPMqv7qX4wB5C7TLXivYUSoR7vExwfSXRCJOXLT7DzVr4KPVfB6cK0D/
 a/Gw==
X-Gm-Message-State: AJIora/hR2R8+PLlVhsecaI4OtYwlnF5+ma/qxVUgaLP8G0XKRzmdCc5
 AXz7TAJAk50b1JtnX1IGtBg=
X-Google-Smtp-Source: AGRyM1teGdrjWgVIBtYPOIVjKMgc0MrMFUoul1cut9eS4Urax2mFKBTuoI3djwJtCIBUSKRFquznxw==
X-Received: by 2002:a17:907:16a2:b0:726:abbc:69bf with SMTP id
 hc34-20020a17090716a200b00726abbc69bfmr4341349ejc.363.1657299153059; 
 Fri, 08 Jul 2022 09:52:33 -0700 (PDT)
Received: from kista.localnet (213-161-3-76.dynamic.telemach.net.
 [213.161.3.76]) by smtp.gmail.com with ESMTPSA id
 y20-20020a170906559400b00722dcb4629bsm20667163ejp.14.2022.07.08.09.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 09:52:32 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Samuel Holland <samuel@sholland.org>
Subject: Re: Re: [PATCH v2 3/3] arm64: dts: allwinner: pinephone: Enable
 internal HMIC bias
Date: Fri, 08 Jul 2022 18:52:31 +0200
Message-ID: <2758935.Y6S9NjorxK@kista>
In-Reply-To: <13043007.uLZWGnKmhe@jernej-laptop>
References: <20220621035452.60272-1-samuel@sholland.org>
 <20220621035452.60272-4-samuel@sholland.org>
 <13043007.uLZWGnKmhe@jernej-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

Dne ponedeljek, 27. junij 2022 ob 22:53:05 CEST je Jernej =C5=A0krabec napi=
sal(a):
> Dne torek, 21. junij 2022 ob 05:54:52 CEST je Samuel Holland napisal(a):
> > Revisions 1.0 and 1.1 of the PinePhone mainboard do not have an external
> > resistor connecting HBIAS to MIC2P. Enable the internal resistor to
> > provide the necessary headeset microphone bias.
> >=20
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>=20
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Applied, thanks!
=20
Best regards,
 Jernej


