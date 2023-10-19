Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4ED7CFC39
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:13:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3097EE87;
	Thu, 19 Oct 2023 16:12:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3097EE87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724822;
	bh=nWvcTmKzcJ9ZUi7fN5yzVRw8xkEp43UfZ1HCcrAZmOI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Td0ze/4WBwJGa+iAP1229PcfU40LEV39+Hu3NvWGuuFrphSAJWwcDDGqO6dfJ00Sy
	 t5bZ3jnZ3KxTmJh0Ux4qLR8BmOGnSMiYu/EzcrQxZkW23HJprjaRkbuM2gWgLdZJfs
	 NIi6bCpVAY5V/V/ckXDzNaf9CIiEcJiCo8bLZfiM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E14FF8055A; Thu, 19 Oct 2023 16:11:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD644F8024E;
	Thu, 19 Oct 2023 16:11:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F88AF8032D; Thu, 19 Oct 2023 04:11:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CD0FF800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 04:11:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CD0FF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=CQ0X6g3f
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-6c4a25f6390so4891175a34.2
        for <alsa-devel@alsa-project.org>;
 Wed, 18 Oct 2023 19:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1697681500; x=1698286300; darn=alsa-project.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhD54Vd7XuHqS3xNEGfHS0Gv8FjFdg1pX/48Yp0FuCo=;
        b=CQ0X6g3fYFy8o8ARngEOWTrOrfFaBI0I5QmHfedAmSibqkLoJt2AdAVzJo137Lroca
         lQO0T6iPUAfLEUPGnukXzThjnoufXdMOSOEix+/LuSRhxrtp+6ces62QtxQi5OY0znLa
         mSNtxJ5If8D22RQIY9zetaJK+1xYuMqANO8C/1/2f36pNrOcm2nQqi8ms5ja+af9gOsQ
         ZJl9PtTY/QADCb8bmvJyxtTXuAi4TqmDy08eSZPsAtKxQpPQhGyLfnKpuiVIntn9toHK
         qD4WNVHND0fsldVBXk+d/GBi59qfc+IijJpHSc2IQ4ORNPRseueNz7JxF7sNDgcY9X8H
         lqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697681500; x=1698286300;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhD54Vd7XuHqS3xNEGfHS0Gv8FjFdg1pX/48Yp0FuCo=;
        b=HHuNCshAG+TI6MVDKd+M/B1ff4sM4r8IlgXgjspBrbYYjTfROHScY0vhdn0x/qB1Y4
         0PYKOevxvCqv/l2pVDFhO56OTiJtlutxgnnpKe4H9q94ESMdscXBqADvPvcWuBX+uwRX
         EKUTT4xLHYYdMwfVqaA6aP4W2JScxol2TwopZQz2Z2etyrP0ejwKH5IaMLcZaiAiMABT
         pHAOiDpypG/PETJ23dFGGWO9hAk/xM7RoC+qOAdmcLBXccHNBjzd2XpwpXSMFLPkQKvl
         CVDyP6fVqsZwW7V6QpxoQxZblS5Ap2qoBaybvjdqa0Lhhu6xH9a19U1awMcs2jrVejvH
         87+Q==
X-Gm-Message-State: AOJu0YzMygHRcwH2qUeFkeWR9UDpNlG+Zf43ZMz0kqxpUP4RYOxIj6f8
	fMgeF7buzrWdxmCNB6ItTBqGGA==
X-Google-Smtp-Source: 
 AGHT+IEIarBiMYROPVstrKrgagZnrOD+TOR6snhDlbuRvSbmOoS4FE27KeDyxjkKOS9q//75x1lJig==
X-Received: by 2002:a05:6830:1e0d:b0:6b9:cba0:93a9 with SMTP id
 s13-20020a0568301e0d00b006b9cba093a9mr945172otr.31.1697681500175;
        Wed, 18 Oct 2023 19:11:40 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 d7-20020aa797a7000000b0068fadc9226dsm3974278pfq.33.2023.10.18.19.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 19:11:39 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	jiaxin.yu@mediatek.com
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v1 0/2] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650
 support
Date: Thu, 19 Oct 2023 10:11:31 +0800
Message-Id: 
 <20231019021133.23855-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: NLDD4VRYLJXNGFEGVLSKEFFQLLR43PR3
X-Message-ID-Hash: NLDD4VRYLJXNGFEGVLSKEFFQLLR43PR3
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:11:11 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NLDD4VRYLJXNGFEGVLSKEFFQLLR43PR3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To use RT5650 as the codec and the amp, add a new
sound card named mt8186_rt5650.

xiazhengqiao (2):
  ASoC: dt-bindings: mt8186-mt6366-rt1019-rt5682s: add RT5650 support
  ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650 support

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |  1 +
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 45 ++++++++++++++++++-
 3 files changed, 46 insertions(+), 1 deletion(-)

-- 
2.17.1

