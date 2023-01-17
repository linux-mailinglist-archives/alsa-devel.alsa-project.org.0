Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C264F66DC1E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 12:19:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FE6A665F;
	Tue, 17 Jan 2023 12:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FE6A665F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673954353;
	bh=ot1dAG2puk6i6YlG8cyNaOEvUs1ZmRJeLIwhauFiy7k=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=je1Aopa2HkD6hNkjP2MJ4baaIoNujODmQpS7xs882/G6X/DaAmRwjL9GtGNC8qg6Q
	 YF0+l05ofp9xzMF60U3aLfMSj5GKz6gCJdCsBERs+zQtZzQ9n6orzDINx+kBsxSo7T
	 aRPkErSTCOPqBZf3IsPn5x5mZ3p9ykYW64UiyYe8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8D48F80083;
	Tue, 17 Jan 2023 12:18:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2377F8047B; Tue, 17 Jan 2023 12:18:13 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 83F18F8023A
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 12:18:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83F18F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=M5VfcbtC
Received: by mail-wr1-x436.google.com with SMTP id e3so20988143wru.13
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 03:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9F8FAq9VHh3X8R5TYntvycSxeEy9zUQAgESTqIenWBs=;
 b=M5VfcbtCsw01lCDWxI/FmN1NwPgHEaGl0oYAzM601jiZEYylOMcXYVVJhuUhmk7pjG
 QBt89h3Ns9mtXc7L+NCZzXAY7XD7Vm64GAqJJttlTNlrLiovRqG3Ymy/OnUXp05uJ0HJ
 78Kxu/Rogv1S2Ptj4YH6pdStOrJEYUSqy0EAyb106MQ+skNCOfQYNeuzAhJuz7JeiY/d
 GTDetXITOHiRaUSunYV684bH3dfhrlthbtzSQ/w6SGiJGZontYwMDMYTN2agesepRCY0
 X+pzAW8mUHHHYgxNoFE7KR/mKsmmti9I3bDqSn3KTQypJ+KiiOh3IOM6Nv/WQepZuDvl
 fHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9F8FAq9VHh3X8R5TYntvycSxeEy9zUQAgESTqIenWBs=;
 b=7KHXJVYobq6q9NVZdIkuteUCnRzZaePzC5XuN0lL4TV8asREm2PKuys17lW6JpVpR+
 p/dzIhbnLwFG6tynda8RY8JYD2Q18UvGnhMBQ+mfpF4fi/+Umlv4w7MhkfaoyA7ogcRF
 h5IGvLlPknwfvOcSQ5lsfvAS63UYmFMh6tB+21Q8gPCRoDGSe6NZ+Lg01MYON7LWGPNv
 e1hAJEcltDFoMJ27d3qfw5ZIvk3UsBgiHVTjCre8LV8bzpe7gEiJqCquN+I1YZqCuOp6
 D+mt1hTJ0a319OLVIFJGRwaKN9qPRF4fEpBai2JIEiTfx3NvVOW7W+mft2kHj23KYwSw
 yApw==
X-Gm-Message-State: AFqh2kqZVr8BxB40VUIWGYK5w0ebIOba8cgiI7LM8dcq14MgLZ3nqgW/
 3DTVSIi3fkirRNjJqozZnci8AQ==
X-Google-Smtp-Source: AMrXdXtuMwXDTKjRMyG4UHHCTHIY3tjmlqLwu/1pei9KsF5NZ+G3lpmedGWKLrTweXTxfyPz75A61w==
X-Received: by 2002:a5d:6505:0:b0:2bd:dba2:c17e with SMTP id
 x5-20020a5d6505000000b002bddba2c17emr2414593wru.12.1673954288574; 
 Tue, 17 Jan 2023 03:18:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 w10-20020a5d404a000000b00275970a85f4sm28466717wrp.74.2023.01.17.03.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 03:18:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>, rcsekar@samsung.com,
 alim.akhtar@samsung.com, robh+dt@kernel.org, lgirdwood@gmail.com,
 aswani.reddy@samsung.com, krzysztof.kozlowski+dt@linaro.org,
 s.nawrocki@samsung.com, pankaj.dubey@samsung.com, tiwai@suse.com,
 broonie@kernel.org, perex@perex.cz
Subject: Re: (subset) [PATCH v4 3/5] arm64: dts: fsd: Add I2S DAI node for
 Tesla FSD
Date: Tue, 17 Jan 2023 12:18:01 +0100
Message-Id: <167395418605.64421.15917174672513679108.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230116103823.90757-4-p.rajanbabu@samsung.com>
References: <20230116103823.90757-1-p.rajanbabu@samsung.com>
 <CGME20230116103903epcas5p2c3e87c1df31b6a53e26fb1358a53f634@epcas5p2.samsung.com>
 <20230116103823.90757-4-p.rajanbabu@samsung.com>
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

On Mon, 16 Jan 2023 16:08:21 +0530, Padmanabhan Rajanbabu wrote:
> Add device tree node for I2S0 and I2S1 CPU DAI instances for Tesla
> FSD platform.
> 
> FSD SoC has 2 I2S instances driving stereo channel I2S audio playback
> and capture with external DMA support.
> 
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: fsd: Add I2S DAI node for Tesla FSD
      https://git.kernel.org/krzk/linux/c/7f62af80dc62b82bc18f72c674e4c81c5ecbfe37

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
