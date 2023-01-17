Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCDB66DC28
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 12:19:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A58E6667;
	Tue, 17 Jan 2023 12:18:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A58E6667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673954381;
	bh=utjGxX5KnShJupXmJr2oXdREVXsLedngS3jGrS1gyMI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YRA2RLnYNMiveVGDZ5Qa6eY3tIzG1QDL0JilWA3ZUI9a5pDOkuPly3u6mck/ETfka
	 wcODFsD3Bn5DTC4buveKHH8JMuNUTgHNgV15aHhzIqTcloV2Vroisyddof1f2uRvud
	 biW1eGVdV8cTK+dIDNYB+ArDk0XAB1JGD3+k2c/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C16AF8026D;
	Tue, 17 Jan 2023 12:18:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58BFAF804F2; Tue, 17 Jan 2023 12:18:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57AE4F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 12:18:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57AE4F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Iyxg74bB
Received: by mail-wr1-x436.google.com with SMTP id t5so25799529wrq.1
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 03:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yNRGNwlNlCSw2219mzmzcHuVoA6n0rLRFLEvc8LW6gY=;
 b=Iyxg74bBYLWGp513et7gB2YXtL7HK3kYuRl7xNOwXLaR0QDkm7sCLEM+NWaPJW9lBm
 QQ4vUuI9S0KMD3ghyn6LJaOnJrpLD0lN4r0tTEkCTa+1SxfEOix+jowDPpRywuutMSzd
 HU55Jx5wMdWXCeLVfGIbKD8xAtFxeYKbc6MprBdj8Wv7LGvCdAKHwYpr8EiE6ohtTcf0
 PGEJtxLDbrKeMFDuRDSmJxT+Z/6cCOXebbU0texdQUj9tQoj2uQuSaBcnIlARRW4HEBs
 JLONPAuPSCH/h9MUNhrCFc2jocqEkCyLFVQ5ShH5VfqouxTQbXc9T8m1ApLc3k4JyjGR
 GSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yNRGNwlNlCSw2219mzmzcHuVoA6n0rLRFLEvc8LW6gY=;
 b=oXQkh1OgQtW8G6Rxdtqm3WNV0orgy8burJkICJ7gFGSnyTJapAXHJoBIRL/w1AMCSK
 NMz3ZLBHAUDYTFkV+Beq5ytn5Clwy7EZIEIXdZUSFxXr6aE8iWqzsfmMLr0ctIxIC+Sn
 8ojM/mk3pxaYJmaqCd5qwuYW8rGf5efaeeeJBn201yzCIk+Y90lQEa5w6+K6T9xvAlg8
 x5HIIoJNpgB77SHrFKeWDJJvbyYf/u8cKN1RinX75V1zxaW7uFy4plHA/LGKnHKc522s
 I6Ur7lPu8oWIk54NoTAiYqqs/wb8ULVTxQK9XOdHac7Asq5cRp7XZVOlhHswbe6lrUs3
 Wu5A==
X-Gm-Message-State: AFqh2kpIkv/v8hry/OJDiUJY3D44dQE0WxTA4kz6QTbxpirDVKu+Eteg
 9bweAumFgs3v067VsUbk0yB0FA==
X-Google-Smtp-Source: AMrXdXuVWtE1Ni5EZq32Gzte0bp61JbiooFjWQqGOkD1Z37NFu6Rgo4WQWMFnOMwCLhEHBq3tOmVPQ==
X-Received: by 2002:a5d:6b4d:0:b0:2bb:f88b:43b6 with SMTP id
 x13-20020a5d6b4d000000b002bbf88b43b6mr2637076wrw.3.1673954291241; 
 Tue, 17 Jan 2023 03:18:11 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 w10-20020a5d404a000000b00275970a85f4sm28466717wrp.74.2023.01.17.03.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 03:18:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>, alim.akhtar@samsung.com,
 rcsekar@samsung.com, robh+dt@kernel.org, lgirdwood@gmail.com,
 aswani.reddy@samsung.com, krzysztof.kozlowski+dt@linaro.org,
 s.nawrocki@samsung.com, tiwai@suse.com, pankaj.dubey@samsung.com,
 broonie@kernel.org, perex@perex.cz
Subject: Re: (subset) [PATCH v4 4/5] arm64: dts: fsd: Add codec node for Tesla
 FSD
Date: Tue, 17 Jan 2023 12:18:02 +0100
Message-Id: <167395418605.64421.2322020488377607185.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230116103823.90757-5-p.rajanbabu@samsung.com>
References: <20230116103823.90757-1-p.rajanbabu@samsung.com>
 <CGME20230116103908epcas5p49d65b8a38b8ecfeda508960a9543193d@epcas5p4.samsung.com>
 <20230116103823.90757-5-p.rajanbabu@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 16 Jan 2023 16:08:22 +0530, Padmanabhan Rajanbabu wrote:
> Add device tree node support for codec on Tesla FSD platform.
> 
> 

Applied, thanks!

[4/5] arm64: dts: fsd: Add codec node for Tesla FSD
      https://git.kernel.org/krzk/linux/c/be8599d07a6a184a790054b9b229c0b37e418014

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
