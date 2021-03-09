Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 036703322CE
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 11:17:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8010A17CF;
	Tue,  9 Mar 2021 11:17:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8010A17CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615285072;
	bh=BRVhD52pmWHL1HNcZmIYnvtdZYl372NJ8VdvNqRYleM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oUx2nT4Nu9NSDVhy4OPjj9LPKOe/6R9TYAcGrW0Eniuu30hveJjA6uO59wQq+62M/
	 YoccaFqeGQjLn9bjE7RL+RLkf7auMZKlaYGuICGxfwl9fdxXckbdJ5gWUAwWaEkMAj
	 SHnI88h3QZtlDAr0totE5vK1GfAPWhQ8l+uym/u4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAA12F80276;
	Tue,  9 Mar 2021 11:16:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5ED6F8025A; Tue,  9 Mar 2021 11:16:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0C66F8014E
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 11:16:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0C66F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="wx8qqAH5"
Received: by mail-wm1-x333.google.com with SMTP id
 r15-20020a05600c35cfb029010e639ca09eso5574371wmq.1
 for <alsa-devel@alsa-project.org>; Tue, 09 Mar 2021 02:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h7PtkbsEWdkuJd/mmYpJAYKJMOfm44GbXmX9GIVF+Uo=;
 b=wx8qqAH5D94zcPZhTci5hev6TaMVBRkTx/B9T8R2RCHadUoOcTgCEgY2J/0ylwWSqh
 qFsWCkng5osHQRgET9sguzMMOYiBxrpzSK6F3JiwxBy7Ij+i9n8XSo5sBk8CKhZftY6Z
 a9rwcCh27dXbLnjJflxEBNFjQ816PbAc32fcGC3FNnLaObGcbos7cwL6UtqZ2QB6q1C0
 jUcqcTDRpuZEjg427XPr1YVSq7qDdEB/DE4HXvQkWeiAeuc2YXQc1a27QoaRrTYhB+Wh
 eGbXyW1RkvDfDr4BJODy3d5yiJW1HLuTTcIFYnOIQdHsnQ7p99AbAiUiwUipxZ3sMmM3
 QIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h7PtkbsEWdkuJd/mmYpJAYKJMOfm44GbXmX9GIVF+Uo=;
 b=YVdlzdsRFdnsfaTzwxQrtTNd/Rnx5nb8AKOgJMc5FihSoAe+su6qtvyClY4yLc4Fuq
 nJRyph1tah1WLwoOzHTlZw9huBHkVsFK8E1ZabnfnP1vK0Izc3YeC719C9vg6qy+9iu3
 TGwWvX+OYJXKDiZGuMT9Tix7CNWsQVknaIrgP3omjvk5uU7EvVwbKpucHu4YXE4Dzhi2
 PFxHyBCQhOtqesrBPX9uPQSMXerkKIZpkGK3fWel+btzd983RKI6HDtEO0epl6RHr3xV
 4sGZutKEj1qC8wqa+gD7/3Am0XxONqeBixnYZZi4gRk25hKkzvAT+qfKWZ2cNZtaSS0q
 xnIg==
X-Gm-Message-State: AOAM531cWLNNAvl8FAl/uy6dYAV/yJbQ6QBQwK/eW+2NjVLYtVZklat0
 uEs4JQiFYL9Fdb7t71fyDAG+nA==
X-Google-Smtp-Source: ABdhPJwyT3j3Xfd3tolLUlZDCHTHVfr30U9H40Y0ozNmW0iEDfz/gVEPVyODJb3UTTeAt6ehMHGJeQ==
X-Received: by 2002:a7b:c1c4:: with SMTP id a4mr3240872wmj.122.1615284975651; 
 Tue, 09 Mar 2021 02:16:15 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id r2sm22552248wrt.8.2021.03.09.02.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 02:16:15 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/3] ASoC: sdm845: array out of bound issues
Date: Tue,  9 Mar 2021 10:16:10 +0000
Message-Id: <20210309101613.25995-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: amit.pundir@linaro.org, alsa-devel@alsa-project.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 john.stultz@linaro.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

During testing John Stultz and Amit reported few array our bound issues
after enabling bound sanitizer

This patch series attempts to fix those!

Srinivas Kandagatla (3):
  ASoC: qcom: sdm845: Fix array out of bounds access
  ASoC: qcom: sdm845: Fix array out of range on rx slim channels
  ASoC: codecs: wcd934x: add a sanity check in set channel map

 sound/soc/codecs/wcd934x.c | 6 ++++++
 sound/soc/qcom/sdm845.c    | 6 +++---
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.21.0

