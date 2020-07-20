Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0983F225582
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 03:37:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A09911686;
	Mon, 20 Jul 2020 03:37:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A09911686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595209073;
	bh=qBVKTzJy4bm2MZJDx2w3CHjCF1hDguq09RQDpDWArNo=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SVjSXe3N3RC9I04fa9dIk0OIhbv5g6Ptcy7oxkty0aDYFhcqG16udDmyLXHraju/v
	 R4WBgnMLRQw8qybTVFs3EfeS7SEOuz7QQ99jEO/7Yh/G7aLtbrgwJ6yo4qCaTqD1vV
	 8D237Gs8MrpkYrqCr4ah4cy3LIoFtK9QqTF7ybE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34A64F80290;
	Mon, 20 Jul 2020 03:26:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9000DF80290; Mon, 20 Jul 2020 03:26:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7A4EF8028C
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 03:26:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7A4EF8028C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="mYO0qP11"
Received: by mail-qt1-x849.google.com with SMTP id l53so10931753qtl.10
 for <alsa-devel@alsa-project.org>; Sun, 19 Jul 2020 18:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=N1R7Iv8+prmRawftnwOZRGmqcEKKQhaOMggPSM9IpoA=;
 b=mYO0qP11CQFDqUisgUr565rOMN289t4gYQ6xFU9DbQ8JlAK1HdOn2zwcso09gNeb5e
 szZnwZu4zHh3sh6jol7eHy4u/7O0DIF8YAPTHtCEJmp6Pc4COXwnwAcCSfbFJin0H1cr
 787tIICATs0EMXTz8+SQsfyNQPJspwtXUxLbT7ZwCaUibzPGImmec6HX6KvdiH+BgAPI
 /Cg76GvFPdQJnvkVFtK9OZv4OnYC33ZEo02FChSnPm6BLUDaZRSwOEV3CIk+BL8HV2XP
 eJsiVyui+UAuczN5o0y7TYC8OUNt2s44UNBgHfrbyi1e6L0mMNmdZ2CxeYyrakvdoOtg
 zayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=N1R7Iv8+prmRawftnwOZRGmqcEKKQhaOMggPSM9IpoA=;
 b=jyELXxsomFdbSgqhatJ2egjn9N5iPRUwPUl6DaTXNdsghLsdlvNPz5hBMVmcaTEwcN
 fracVBcjgd4MdFp9eo4vlIkNOjcSePKpJk7N3a/bnfC9u7eHxaIViM0x9BBm/IVWa3BY
 BbDXFMdLHAgJX0TToRQkDsmmQ8/rRbY0PXulDd/GSrnitc+pyK3Di7OKzrJILaHbkyqn
 QmIbabeQC4OLBCI0RfpExw+44o4PRPGhaWqG5nb4LjoFKiA5mSVTxs8AiMxskSrlwQZ9
 hb5AyQXMwhc53ctd5rHzvoR1cgG5lPZ2afGr1CtxZpLVqLt+dv2o6RpiG2a+UOKsHMFD
 cAHw==
X-Gm-Message-State: AOAM531DXTlThNWfzNSNJpU+Te0yl24gsCx3NukqtQqNrxyUNc/km1vU
 LNFztJEubgVCDCZ+9fOf8zYq8WlPCgQ+
X-Google-Smtp-Source: ABdhPJzYDlHDcoZiUMRRm+hOvmdWgycdFdnKZ6MtUrwV0mbo8VmLsG6dzhrO2WHp9Kgqxd+KyDTa5/u7IIvt
X-Received: by 2002:a0c:db8a:: with SMTP id m10mr19568282qvk.21.1595208371892; 
 Sun, 19 Jul 2020 18:26:11 -0700 (PDT)
Date: Mon, 20 Jul 2020 09:25:58 +0800
In-Reply-To: <20200720012559.906088-1-tzungbi@google.com>
Message-Id: <20200720012559.906088-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20200720012559.906088-1-tzungbi@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH 2/3] ASoC: dt-bindings: mt8183: add compatible string for
 using max98357b
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

Machines with max98357b should use the compatible string
"mt8183-mt6358-ts3a227-max98357b".

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
index 5e455129eb96..235eac8aea7b 100644
--- a/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
+++ b/Documentation/devicetree/bindings/sound/mt8183-mt6358-ts3a227-max98357.txt
@@ -2,6 +2,7 @@ MT8183 with MT6358, TS3A227, MAX98357, and RT1015 CODECS
 
 Required properties:
 - compatible : "mediatek,mt8183_mt6358_ts3a227_max98357" for MAX98357A codec
+               "mediatek,mt8183_mt6358_ts3a227_max98357b" for MAX98357B codec
                "mediatek,mt8183_mt6358_ts3a227_rt1015" for RT1015 codec
 - mediatek,platform: the phandle of MT8183 ASoC platform
 
-- 
2.28.0.rc0.105.gf9edc3c819-goog

