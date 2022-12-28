Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D7D6576AC
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Dec 2022 13:53:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B06C2D4F;
	Wed, 28 Dec 2022 13:52:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B06C2D4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672232012;
	bh=AdsGPR2sqNF0LJSbIdnzh20MDtuPwhud5eDf5T/SVEY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sAbqKL9BzVvh91WCyy+79T3ASYFNm8L3GmYDSnzzeZe1DG8laB8D+4PS+Y8bX/IgA
	 6dTQw8JCtXtb9+nwTcNyfZe5q86oCiDa926h3NkryKoBBGqQTigB1IQIIZwpKHXBOW
	 pg1MYTeJBveGwhk13Ef5RILSCKp8afbGXmihA3Sk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67480F800F0;
	Wed, 28 Dec 2022 13:51:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D49EFF8042F; Wed, 28 Dec 2022 13:22:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDE45F80310
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 13:22:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDE45F80310
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=huaqin-corp-partner-google-com.20210112.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20210112.gappssmtp.com
 header.a=rsa-sha256 header.s=20210112 header.b=6XK8iaEv
Received: by mail-pg1-x535.google.com with SMTP id 79so10458305pgf.11
 for <alsa-devel@alsa-project.org>; Wed, 28 Dec 2022 04:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LFvhTcaRZjgL74aw0ImWpDb76fTfKVSz3niY5jO7t2U=;
 b=6XK8iaEvevvXqDOBb77pn2jRDoRsZbUa51M+NyT8XpjYcuaxY7TVVgDTdJX44JzIT1
 6vItea01ki1fvLX8FOid6Mfm9aEGnD+ivk7GAVyKN2EyZYFut5kuce2/vz/6lLVPJ7Ji
 e4xFy50sBPkC4c6aKDAgIkSv/9g69rOW5gS+8WsG1MZuW2riLAdU+2YDVbWqtWo4WB9p
 tEw3/eL6f8YWvVdn8uAJdzrITvinPwmvvPLcGpjHCY6bO8rA0ZSgLdSIbQQLkrXpPxNT
 bNWYeh3H5gY47F0u6MG4axq5XEIRinEAlW4ZjsoNZR8nQ5z4iB+aO22ksTFhdgC8Gr3a
 p3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LFvhTcaRZjgL74aw0ImWpDb76fTfKVSz3niY5jO7t2U=;
 b=cI4adTiYDJKtm9AIu0PMBudZV+lYdbHaEm6NXduUsr+0QlBF5e2vJICl3X6KfAQeTi
 bJDEEmweIGtjCkKushuTQQ7tb2IDIr9/Wvb3BQUoazAqA6ok04CohS33S/XHpqZVSIfV
 G1aNnH2RSKCj8Qi/E5afrHXPCyojXClx+RuUlDEz+ayqziGBHm1IaIa0Ux7XdVJz4Z7j
 Kxq5lee8PCTR2ohG6yjOkqel2uGG82sROOLLmZdusA8n0Gx8NQVOwQ0a1Fqvso0WO3oq
 rPibJV5x4Je/jUIMAsVIvnNr645EFWDt1SdV3HTLURyuewF46vBquqDaQaHCEvXlXNRd
 bgEQ==
X-Gm-Message-State: AFqh2koSEDNEzWs5iULqOUL4+hgadHqIfIdlF224aKgsM3Ifq83+fnIQ
 5OtrsnBSz5/w8kRtLQbhzpGcLA==
X-Google-Smtp-Source: AMrXdXuPM0D6h33ggS86tdoKbX4wsqChC1KyEbKeUzk2LWBE9WFxvgTxRvaU/KF9H7dMQzvrnz2Ctg==
X-Received: by 2002:a62:6102:0:b0:578:3bc0:57d7 with SMTP id
 v2-20020a626102000000b005783bc057d7mr24847846pfb.13.1672230159291; 
 Wed, 28 Dec 2022 04:22:39 -0800 (PST)
Received: from localhost.localdomain (202.60.225.077.static.cyberec.com.
 [202.60.225.77]) by smtp.gmail.com with ESMTPSA id
 h1-20020a056a00000100b0058124f92399sm5236074pfk.219.2022.12.28.04.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 04:22:39 -0800 (PST)
From: tongjian <tongjian@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, perex@perex.cz,
 tiwai@suse.com, angelogioacchino.delregno@collabora.com,
 nfraprado@collabora.com, jiaxin.yu@mediatek.com, chunxu.li@mediatek.com,
 ajye_huang@compal.corp-partner.google.com,
 tongjian@huaqin.corp-partner.google.com
Subject: [PATCH 0/2] Add new AMP MAX98360A for RT5682S
Date: Wed, 28 Dec 2022 20:22:28 +0800
Message-Id: <20221228122230.3818533-1-tongjian@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 28 Dec 2022 13:51:26 +0100
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add MAX98360A for RT5682S, MAX98360A works same as rt1019. So, it can
be supported.

tongjian (2):
  ASoC: mediatek: mt8186: support rt5682s_max98360
  ASoC: dt-bindings: mt8186-mt6366: add new compatible for max98360a

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |  1 +
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 22 ++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.25.1

