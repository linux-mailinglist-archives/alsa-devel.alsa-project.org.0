Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A577BE5AA
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 17:59:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9BACE82;
	Mon,  9 Oct 2023 17:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9BACE82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696867143;
	bh=h/2OGL5SMu3c1+9KuAlrZr3ary3o7VxlJJc7S34VSuI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CpcfRNTonGJSysKD1MSOl9ZVw+B3JqaocKMIO+m8io/DxkJkYBmjTUdyCvFPw2+Ai
	 NsPFFx2pdh4ANRRQ1cIa4Xsi90yr6HmRMdGQpOAO/cMqSPvwRTdDrsWzicCqz26nO4
	 p0qwKgDRkTTxh8yAgAFoEdxLctc87paSY2W356NQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB22CF80536; Mon,  9 Oct 2023 17:57:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66CBCF80552;
	Mon,  9 Oct 2023 17:57:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4044F80536; Sun,  8 Oct 2023 03:46:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89A7EF80130
	for <alsa-devel@alsa-project.org>; Sun,  8 Oct 2023 03:46:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89A7EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=nY2tveRl
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3af8b4a557dso2360450b6e.0
        for <alsa-devel@alsa-project.org>;
 Sat, 07 Oct 2023 18:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1696729599; x=1697334399; darn=alsa-project.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dn+LeH/wVxtkvKkasM+uoFktIvDnLaQJ5n5AGroHogY=;
        b=nY2tveRlSslrPNqwt3A//1/SBhdNKCOZLMSxErm8cnUPJIAIiVS6+fQCs1ncpOTrCr
         hh6MnnkyNv9AjLLBvQ/Cxb/YVVAlE6w8gpZcafti8WWY9iFNERfBwtBPz/0Xtu0Q9HZ7
         k9zdR7Nscsmgy3SI6iWPg79swu7y5Fj9y12DcFsr2kZVsDBk05FS/FBT91mhR5xRZq5g
         raOzsucv0OfnlGH6qlHgCLF4YX61pLDIhRKo1os/dthuWEN3o24uveAvNHi4Eb1KuvCS
         ZHS/9zwVD3oK8KQgrwP0pe1AxLzmT8VpDCBrHGXoxejg1PXCPPTC3mAr3hTQ6pdY9LDb
         r9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696729599; x=1697334399;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dn+LeH/wVxtkvKkasM+uoFktIvDnLaQJ5n5AGroHogY=;
        b=bKcc2DK7lmooa3NXklNe4emj119TkfgomXfysBv5PRPdC92YNaQQigVx9cg0sZjvMd
         s1cHpwu5bwH63+M6r2cQRy/qpkXHbMy4KtxVWL5cf0CcReFsDEwKtjQdOtDxjGu0CxNU
         Q/kS0z9TSQTpJw6dNvAk2cPc+ar0GjtwPzS60hwbYPVe6R5ao/5Hf3mPCdZEugBw9zfP
         Y0zCA+nRR/VAsGfabYBzatfnyZScr2IqS0/4v4zH/F/sNhB0GFq7RP+sst/v11f1bv6v
         ty0AHUgA595jnCWbmxG772Wx6rG7IbMotqz+P8EyLcgl9hbcdveUGBI7TOEBPx1G85Yd
         aYtA==
X-Gm-Message-State: AOJu0Ywo3Zq8RhFWtBi0EqTornub7V9W6zDPBTzn2RdXArLLw4VqpMkv
	UPmfqBTC6aIU6NOgkMazMlPc7g==
X-Google-Smtp-Source: 
 AGHT+IE6yFex+CBBnGk+rQNeKa/UkrEvSdChHNpjRS3shM7fIg4wakRnaXyA0jVOySczm3ooSu1FnA==
X-Received: by 2002:a05:6808:3081:b0:3af:71cf:2b52 with SMTP id
 bl1-20020a056808308100b003af71cf2b52mr17002866oib.27.1696729598914;
        Sat, 07 Oct 2023 18:46:38 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 v1-20020a63bf01000000b00563826c66eesm4888846pgf.61.2023.10.07.18.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 18:46:38 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	robh+dt@kernel.org,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v4 0/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Date: Sun,  8 Oct 2023 09:46:27 +0800
Message-Id: 
 <20231008014629.4971-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DBNPU3BPI7V5VTTRZFCQV4QWFRCQPZB2
X-Message-ID-Hash: DBNPU3BPI7V5VTTRZFCQV4QWFRCQPZB2
X-Mailman-Approved-At: Mon, 09 Oct 2023 15:57:18 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DBNPU3BPI7V5VTTRZFCQV4QWFRCQPZB2/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To use RT5682S as the codec and MAX98390 as the amp, add a new
sound card named mt8188_rt5682s.

Changes in v4:
- add more reviewers
- Link to v3: https://patchwork.kernel.org/project/alsa-devel/patch/20230927033608.16920-2-xiazhengqiao@huaqin.corp-partner.google.com/ 
              https://patchwork.kernel.org/project/alsa-devel/patch/20230927033608.16920-3-xiazhengqiao@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 2/2: modify mt8186_rt5682s_i2s_hw_params to mt8188_rt5682s_i2s_hw_params
- Link to v2: https://lore.kernel.org/all/20230926040901.20338-3-xiazhengqiao@huaqin.corp-partner.google.com/ 
              https://lore.kernel.org/all/20230926040901.20338-2-xiazhengqiao@huaqin.corp-partner.google.com/
   
Changes in v2:
- PATCH 1/2: Modify mt8188_rt5682 to mt8188_rt5682s
- PATCH 2/2: Modify all string "rt5682" to "rt5682s" and merge code 
             in mt8188_fixup_controls
- Link to v1: https://lore.kernel.org/all/20230925083847.1496-3-xiazhengqiao@huaqin.corp-partner.google.com/
              https://lore.kernel.org/all/20230925083847.1496-2-xiazhengqiao@huaqin.corp-partner.google.com/

xiazhengqiao (2):
  ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S support
  ASoC: mediatek: mt8188-mt6359: add rt5682s support

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 141 +++++++++++++++++-
 3 files changed, 141 insertions(+), 2 deletions(-)

-- 
2.17.1

