Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 649CE7C93C6
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 11:28:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51A2D1F3;
	Sat, 14 Oct 2023 11:27:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51A2D1F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697275707;
	bh=TMz6D1ym4Zp2ZhQVY0RLRvSOPvyWKRZOANfx9ZyRtz4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SJXvuA0Rf2pjbZadH6AxL8XIu9IkOOB7JdV1YrOKCxqZGaE0rXTxSBkXiqE0yNjDg
	 kCmd1fgN273N2GwfVnUd96DYJe5iXG9f/FmehOOqQcsR452ckBgDKqvLzAjRgdK9YU
	 lwDlVSR6qpy9IcQmVrgho6pKaWXKSWyCCajp2iDU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 163DAF8055B; Sat, 14 Oct 2023 11:27:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0C5BF802E8;
	Sat, 14 Oct 2023 11:27:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C7DEF802BE; Tue, 10 Oct 2023 04:37:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F6E1F8019B
	for <alsa-devel@alsa-project.org>; Tue, 10 Oct 2023 04:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F6E1F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=2aFbSJAA
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5859b06509cso3192843a12.2
        for <alsa-devel@alsa-project.org>;
 Mon, 09 Oct 2023 19:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1696905469; x=1697510269; darn=alsa-project.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwMzGrLMGnIP6xTSJsnj/5QIc3+rjUCw5fQXzXRcINA=;
        b=2aFbSJAAYFJ/PmCvxLSiLK+gFC/JKqPQMBvIUS3uVzdk5RE5UfCJj5oVhE5xmD9vk7
         /x1UZXaJuIHjJDg6/RBQaYGKSfsf1CqsF+fkIZhbmUr/TW8wj7YQSLG/aZYSSqp8QlYP
         8wi/i1E29yu1iuMSsoeSIM2NdDHOeUhfdBcy58jhT/wyIezK+F/y/gYkzccrDOKUUVpT
         GubMJHQumZuKMX6WrTNwHFWfZfcDAsqePRxXXi9K7fpEyRxad7ykKrdWN0bKOzklbLHN
         ipm+Isd+bkrGoeTV6EStgqO4YQFU2mpIXz9sSC4AR/3kmdUtwnG5Ab70C+llowPnnXUM
         svWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696905469; x=1697510269;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwMzGrLMGnIP6xTSJsnj/5QIc3+rjUCw5fQXzXRcINA=;
        b=TSBtsMIJHZUh2enBpzk/QZ3uPzwIYeQjJY7U4omAs+OBzqsFJtlcrwHjYSDB5ZODkM
         bOE4iSFU7MKXvEMG8RV88VyWdTkIHSyeiG+30gWPlnWezwS5Wz75jC2GIHSVTZZJOYeT
         7lhD+5hOpgrLDt4aDBCfTU1Cxsxn0QOEBiTsVkSMv7NCZkxSp8DX+s27MXnCxWa2r5Pc
         iWUJXqL+35sYmqLJ27EFBsQty+zWTwC/P5RBSgHkdNasgFiJwaeInAeYIXr0cojmyEAp
         ORtP95eapsIlw5U0uyPW+QX3GFtldeF6NwkNujNjE2PdZ6czYxONdSd4iP9EDhWIcUGM
         1wJw==
X-Gm-Message-State: AOJu0Yz1oTyKhpOIGmVBCFTsmB9OgRhD7hXLSIZL7q293fYTJohxfpWA
	U8RIdtMKcmnKtOCrjq1Nppme7A==
X-Google-Smtp-Source: 
 AGHT+IHSUXpQekZePLA7IXZaVAW51VjZy1d1Xx5XdaJ+xX3W8eIPKm5wLCDKyhQk4zQTrVQpb/XnCA==
X-Received: by 2002:a05:6a20:8e29:b0:15d:684d:f514 with SMTP id
 y41-20020a056a208e2900b0015d684df514mr17489451pzj.6.1696905468506;
        Mon, 09 Oct 2023 19:37:48 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 e1-20020a17090301c100b001c613091aeesm10269039plh.293.2023.10.09.19.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 19:37:48 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	trevor.wu@mediatek.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v5 0/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Date: Tue, 10 Oct 2023 10:37:36 +0800
Message-Id: 
 <20231010023738.8241-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: J3WPH6VQZEQKRKBZTZG2REFBU7YQYYOU
X-Message-ID-Hash: J3WPH6VQZEQKRKBZTZG2REFBU7YQYYOU
X-Mailman-Approved-At: Sat, 14 Oct 2023 09:24:38 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3WPH6VQZEQKRKBZTZG2REFBU7YQYYOU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To use RT5682S as the codec and MAX98390 as the amp, add a new
sound card named mt8188_rt5682s.

Changes in v5:
- PATCH 2/2: modify asoc_rtd_to_codec to snd_soc_rtd_to_codec and make it consistent with the latest revisions
             remove common struct definitions like rt5682s_jack_pins,mt8188_rt5682s_widgets 
             and mt8188_rt5682s_controls.
- Link to v4: https://lore.kernel.org/all/9c28b84e-2d4e-7bc2-88f3-ad5b30d2c727@collabora.com/

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
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 122 +++++++++++++++++-
 3 files changed, 122 insertions(+), 2 deletions(-)

-- 
2.17.1

