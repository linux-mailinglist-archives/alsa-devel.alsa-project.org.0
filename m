Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE427CFC3E
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:14:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A546CEA5;
	Thu, 19 Oct 2023 16:13:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A546CEA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724889;
	bh=rF7rIz1f/QEiyO6v0Vryz/jvMIQi/aUw6w9eMbVqRbM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A6MHHggSJVnm7vWWhqAa3rFUzcQFGTw+Xexf84/2UcAnhlwr22ZK42qaM3/vFEtpZ
	 fQpOe/0Il2aYnGAkI1UklbHqwDnRDUBc//ONT1mhh45jw+WrRvEiQO+PH1dGZJKRa2
	 pxkWQ6WT+6a+bL8GSdYgi4HJsaCSB3zojtcVgW0Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6317F8060B; Thu, 19 Oct 2023 16:11:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51C89F8055B;
	Thu, 19 Oct 2023 16:11:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8690EF8027B; Thu, 19 Oct 2023 12:03:37 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C824EF800C9
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 12:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C824EF800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com
 header.a=rsa-sha256 header.s=20230601 header.b=R3m/ihmW
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5a1d89ff4b9so4651246a12.0
        for <alsa-devel@alsa-project.org>;
 Thu, 19 Oct 2023 03:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1697709810; x=1698314610; darn=alsa-project.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UU8vhdLUhYxlnnYBEzixYEgfIvwEt4jjeyXiSasM6l8=;
        b=R3m/ihmWA4O9MHm5n7vk20Kanqt4MAWUn1QMfqJ3uX2qIXSADJNalJ2SU//+rbG7kS
         4w0cdNlbnWilW7yPGQ9pxcuClSMannOg5/mFahe7wF65yBpkTYjuu5nXx/JLgs5jvxUq
         jyD5YW9zW5pNvnVk5dmcCVokGQSQBsyfu+/Ed3b2CHYvel/QssBZ7NqZaPzoh71OADAQ
         m4tSMf3guc4I6J/Xn+ElI8mLG32L0uvGqnVqn/zR6+bRaIDHHbfQVVQTWmXFfAVm/cAm
         7KNT9bd40sKXXbdSyE0NuyIQ1pKPAcEkTZtykafq6KsIa0ibeda2YqtkRFN1VRcUle8v
         xT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697709810; x=1698314610;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UU8vhdLUhYxlnnYBEzixYEgfIvwEt4jjeyXiSasM6l8=;
        b=jXDR+85BstT8mS3pzkwVEjiX9f4tE76Q6vMU8IpvTMDT+XJN1GRud5Z+y7R0+7kQNX
         sWwx6DVqWqo8FZGbndPngSZJb3KKNOqsutTiTvkt8Zz2p0DofOQKfB1J1pYOJUcmfAsw
         4MHC8BtvHouu4gp/uSn9JzDF0C0sAiqHu6kikfQT9UdsGNu9QhS9d4FgsRIqSbvpNQ1F
         KsfABcL3ft7/wXS74O4GgBODXmSlqvHJeBQTUXeG0gDjdNLBHPQmn7282ugK5GVbwTwq
         4gFAekj8mGm3CE4nASNJDy7B0k7JvQe55i0DC+gQEVm59NIODkV2AVfQHiA6jNnUEu4c
         p67g==
X-Gm-Message-State: AOJu0YwZVk7jJLlrl5iW72UUd8D1rRt42PiII6KTVP/6NbGvhHQ8pBcB
	4nQwtEo4MmF6FZe1so1f22v4iA==
X-Google-Smtp-Source: 
 AGHT+IEeGCaPrMRLEd/eYvzO7rYsrCN4rtp0TdL8fRpUOBjF1tKZHCq9s97A9r8OreSdHjdDgpaw+w==
X-Received: by 2002:a05:6a21:1ca4:b0:17a:e79c:c5ab with SMTP id
 sf36-20020a056a211ca400b0017ae79cc5abmr1340158pzb.48.1697709809581;
        Thu, 19 Oct 2023 03:03:29 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id
 o9-20020a655209000000b005b46e691108sm2606680pgp.68.2023.10.19.03.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 03:03:29 -0700 (PDT)
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
Subject: [v2 0/2] ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650
 support
Date: Thu, 19 Oct 2023 18:03:20 +0800
Message-Id: 
 <20231019100322.25425-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: xiazhengqiao@huaqin.corp-partner.google.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: KUVD7ZHZAUAU6BLYQXXSFM2Y3YHJDJRR
X-Message-ID-Hash: KUVD7ZHZAUAU6BLYQXXSFM2Y3YHJDJRR
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:11:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KUVD7ZHZAUAU6BLYQXXSFM2Y3YHJDJRR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To use RT5650 as the codec and the amp, add a new
sound card named mt8186_rt5650.

Changes in v2:
- PATCH 2/2: Modify the code format in line 1058
- Link to v1: https://lore.kernel.org/all/54ec6435-e69b-444a-a31a-c878a4b3564a@collabora.com/
              https://lore.kernel.org/all/8de0772b-3145-44e3-8174-702c7dc729bb@collabora.com/

xiazhengqiao (2):
  ASoC: dt-bindings: mt8186-mt6366-rt1019-rt5682s: add RT5650 support
  ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: add rt5650 support

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |  1 +
 sound/soc/mediatek/Kconfig                    |  1 +
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 44 ++++++++++++++++++-
 3 files changed, 45 insertions(+), 1 deletion(-)

-- 
2.17.1

