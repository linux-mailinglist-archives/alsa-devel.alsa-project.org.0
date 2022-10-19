Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DC06038C5
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 05:57:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C797A559;
	Wed, 19 Oct 2022 05:56:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C797A559
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666151848;
	bh=nS4RnTeP+I1VEB6tfHNeat1wpRNk0K2BlCQZHq/g9qo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ggvj00NT+Lu7c5sqZejd5CZjZDx/mKjClVdr5KMybYlJjMjnfn0ZaP6dSogBSltLL
	 Ki3woe6A6EVB98uD3vLcOJnfQPPO5heEvlcgGix5thpw6jv5KJauy8SX85jlEWUI99
	 kMJnxiFDbFtuO5nOfL3Mxi6Tih6g/gYex22B9UWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9646FF80087;
	Wed, 19 Oct 2022 05:56:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A28AF804CC; Wed, 19 Oct 2022 05:56:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6910AF80087
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 05:56:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6910AF80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gXpUibeL"
Received: by mail-ej1-x62d.google.com with SMTP id b2so37036128eja.6
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 20:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IXizNkH/R+e1pcdGI2c2lbV1I/baxKR1Zsps8qTE1LY=;
 b=gXpUibeLCHIQqA7BBqDECEJr8yqLLBsXJElo/a+slr6k/AMsbCRKQMhm7FfIH5j38w
 48apUQLuteTAq5izn6kTO71ajX8BhYTGN3VpkcmsAzJmZ1uErbISfqnzE58JV1ZAf+WC
 dYg+9FG90XSdNeqMFzVd7KWKhqdpxkV0mMFB7YxjSUTquUbTsanyv+LVShas5ynG6kQB
 /zxMMZEsZsSgJ4mvgMED8J5oGM9OlV/VC7f32uBY/l8s4hzcUH46x/wWYhyz4WLvyxzs
 0SIARvrOAYitMxbi0/Vy20cbQ5+AWDTlukvjj8ziCYC+PAboF13HOq6kiDEoKHNrOjVb
 Yayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IXizNkH/R+e1pcdGI2c2lbV1I/baxKR1Zsps8qTE1LY=;
 b=TbLBfr6TS5aL3rGRQn8Y3ZZkBaXLU+yMbRadBL0cM7m6sj+ZotOOGOgpge+8rtHhbv
 gLtUo1TZ66XdPBPAwmM71m23tW9tWu2OAq2snSnfP4YWH0S9udnaqxd80WKzpahOTLWl
 bIaPvpfcIEv81HjS5vrCUYh33FPQPk1NMKMH7C4exxB69a1uw3Qk9twXU1Qh04zJiuH7
 hCYWvZB3KH4Wp09qE/AGZMxS5ToDPn99j+pGsX+9YEqsxG6XZncc0hSsd9BYO4s+oHmN
 FVMi3ZG8OXKX0pOrdvm3B/RxxpHEwsQtnjIh//bcD27lP1sxyq/p2NTFMI4clLlw9iHX
 VMCw==
X-Gm-Message-State: ACrzQf3yhPuYk5G78XSN1YPCMiTZu5xtjNFadB8QRKZugPIrmINW6RZo
 m2lVLRsziVM6+6tndQjuvF8=
X-Google-Smtp-Source: AMsMyM5OM4R2vvUMIxygwEZlzJovtBMpE3TkEgi5My/X78KaifFnKstqebCkO6xhWoH4vnkCmxEudw==
X-Received: by 2002:a17:906:d54d:b0:78e:f130:7099 with SMTP id
 cr13-20020a170906d54d00b0078ef1307099mr5143652ejc.142.1666151783174; 
 Tue, 18 Oct 2022 20:56:23 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net.
 [82.149.19.102]) by smtp.gmail.com with ESMTPSA id
 ti5-20020a170907c20500b00782e9943c99sm8041009ejc.219.2022.10.18.20.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 20:56:22 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, wens@csie.org, samuel@sholland.org,
 Ban Tao <fengzheng923@gmail.com>
Subject: Re: [PATCH] ASoC: sun50i-dmic: avoid unused variable warning for
 sun50i_dmic_of_match
Date: Wed, 19 Oct 2022 05:56:21 +0200
Message-ID: <4775101.31r3eYUQgx@jernej-laptop>
In-Reply-To: <1665895524-122458-1-git-send-email-fengzheng923@gmail.com>
References: <1665895524-122458-1-git-send-email-fengzheng923@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: alsa-devel@alsa-project.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

Dne nedelja, 16. oktober 2022 ob 06:45:24 CEST je Ban Tao napisal(a):
> In configurations with CONFIG_OF=n, we get a harmless build warning:
> 
> sound/soc/sunxi/sun50i-dmic.c:268:34: warning: unused variable
> 'sun50i_dmic_of_match' [-Wunused-const-variable]
> 
> Signed-off-by: Ban Tao <fengzheng923@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


