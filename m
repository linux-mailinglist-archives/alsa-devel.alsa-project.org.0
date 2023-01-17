Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1AB66DC29
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 12:19:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AE3A6680;
	Tue, 17 Jan 2023 12:19:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AE3A6680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673954396;
	bh=fitcpozNOUIc2/AM2soDlg0HYuHsUN3LtwXI0fNjyZY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=WOdchp9q088UirqV5cQwtaIHHmoEcOU25zkw+rDZezS7lsCYdGx0HEHDI03xhNYzR
	 eI9AGdcW+lv66yd4DAjMD64DoHPg7zNr/NweyNGmmj6ms38zEzomGhFP0NrPZkd+dS
	 TqdicKqhocEkSoCuyq9wIXzXa3hDdv9FEMnVsnCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F532F80543;
	Tue, 17 Jan 2023 12:18:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CAD7F804F2; Tue, 17 Jan 2023 12:18:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42DA6F8026D
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 12:18:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42DA6F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=w4NjWRX2
Received: by mail-wr1-x42c.google.com with SMTP id bk16so30184945wrb.11
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 03:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qzKpj6N65RyfEWZaM/311Snl/iRS/oRAMMEJaUx5YSw=;
 b=w4NjWRX2AtBqPYizk+hvep+qNr9EePwIzgjLONWI4zTERxhmzkLwwyQG47T10+ITXR
 j3ViZP81F+rWxpdsELw2Wr5nQnPRZ2m2qAfGYfKmGu2/pCqwTQvNIB6TUr52cL6L/XLQ
 vOpqIisxMxJBk8aJI5/0jPKdUDcVyCgzn67dW+DLIIVgvWETzcDnToVejAcvabZXgalf
 aLaSpjp8PdKy1r5AsCsHPcyiI/N+1lxSQ4lIlfWO7w2uEiHfkCXKdDm0O7nBbB45PRVy
 59A+tzc5l++SGLfKS5QeBVdGO6r3koEIgegNLRq0wqUATOSMx0fY/ZSQI5Hello55Tb5
 sCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qzKpj6N65RyfEWZaM/311Snl/iRS/oRAMMEJaUx5YSw=;
 b=iBWsTEeaKW9UT+xQ29ws7uYPnKIXGsjw54rS+h5//ql+Ra1tb9NTE1ZsMTIe7dXnEo
 nSqPJoD3HE726Xb8dZy3NlIADcy5Zl+G1v3xblJOMGMmffRXlhSJeeIsBLQaqLhgYNFC
 0QpYWo4zSs5QcAq7jqXkEJp5a6wC5D+dCF4Pgafti737V3HQ4+sSB8Hn2qSh2EuMfwD/
 Pwci9vzN5M1kuNTHiK+P+srocxSvQpHtCrhXRls1CQRyq2Dmw+TYqclItsaTvqHYG65D
 y/WgCMEaRttJVtbfZJde8xJZ0ALkZOcRcFJTc3MSxcBoiLq4oeCejPOs1U2jauILj3WF
 48DA==
X-Gm-Message-State: AFqh2krFVcI5HoobMcBPG1qbzZQW8aolvmDOJeambpE+u4s2JLXDVgLk
 Kq/RYxBkziPk38kJajMZNhlHTMPwC/dbAGT0
X-Google-Smtp-Source: AMrXdXvoNzN9Kcj1yCUu+9eKnZ1i5BWtuXWnAzxfExRVNV/2hW7BsH5nnVL4/jyuvP/M7RMFtGmHFg==
X-Received: by 2002:a5d:608d:0:b0:2bb:cc51:7617 with SMTP id
 w13-20020a5d608d000000b002bbcc517617mr2683557wrt.42.1673954293435; 
 Tue, 17 Jan 2023 03:18:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 w10-20020a5d404a000000b00275970a85f4sm28466717wrp.74.2023.01.17.03.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 03:18:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>, alim.akhtar@samsung.com,
 rcsekar@samsung.com, robh+dt@kernel.org, lgirdwood@gmail.com,
 s.nawrocki@samsung.com, krzysztof.kozlowski+dt@linaro.org,
 aswani.reddy@samsung.com, pankaj.dubey@samsung.com, tiwai@suse.com,
 broonie@kernel.org, perex@perex.cz
Subject: Re: (subset) [PATCH v4 5/5] arm64: dts: fsd: Add sound card node for
 Tesla FSD
Date: Tue, 17 Jan 2023 12:18:03 +0100
Message-Id: <167395418605.64421.16134681081396817546.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230116103823.90757-6-p.rajanbabu@samsung.com>
References: <20230116103823.90757-1-p.rajanbabu@samsung.com>
 <CGME20230116103912epcas5p2ae807f1b6435e103a6527332e42f03a2@epcas5p2.samsung.com>
 <20230116103823.90757-6-p.rajanbabu@samsung.com>
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

On Mon, 16 Jan 2023 16:08:23 +0530, Padmanabhan Rajanbabu wrote:
> Add device tree node support for sound card on Tesla FSD platform
> 
> 

Applied, thanks!

[5/5] arm64: dts: fsd: Add sound card node for Tesla FSD
      https://git.kernel.org/krzk/linux/c/56a14f01a54568e049e22c46ffc654602bbd01d1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
