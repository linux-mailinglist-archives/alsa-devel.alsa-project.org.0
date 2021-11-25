Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6471A45D7B1
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 10:53:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBC0B17E8;
	Thu, 25 Nov 2021 10:52:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBC0B17E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637834024;
	bh=swg0u6f2H1HmiwrKTwvjk56qo1yt1pf1gRQ7xpKbxjI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X535+YiaoHO+sVA4Ed8izKBmsbigXd8qG8HDrWRcVPHJn85CLnCxJ7RGvxdNSmaKe
	 XODBC69Jl//S7KfuV+Zlan5EmROJQYDT2TUYSCyPGXA5hzDpIpCOSAuPrCv+DJlNXc
	 XEHC4j40Ut9xrHX2+NkNrdwsMSmEvY7vcNB8K2/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27FFAF804AB;
	Thu, 25 Nov 2021 10:52:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC70CF8049E; Thu, 25 Nov 2021 10:52:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0024F80087
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 10:52:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0024F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M49MUuzV"
Received: by mail-wr1-x42a.google.com with SMTP id c4so10285352wrd.9
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 01:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LubwOIycbs75WP/0QNBKRsHGq+GD5WppuGlmADCSChY=;
 b=M49MUuzVEN2wten8Ow2ZJxr5fn8ozedMlUDS5Vhguf7tIXQSyT1uqTEDcvSjYcByLI
 Q3gv3O5RNUO0frlPadFHGafDi5oWig+LRvD4DZgNN71igoJfB3Azr5DLhkAw+PZCYK+g
 PbQlOhXAddLIFxc7m265nk8SRdVJUa9otaqqnWgiUTGD3+oBzBKjY2bkMxf+vyhLCru9
 bMybH1rLnlwNkCqEbB0tcvlt0PCC2rgrP3YPmh68SnDp+lXVjZWW3bk8RUGZWOrXAQ0r
 5557YqH+KvpIw95HPSt2O6ju9+PL/BkO7vGxIx/NCnlbsDXwMhFZJxRB63rT0qTr9br/
 4SBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LubwOIycbs75WP/0QNBKRsHGq+GD5WppuGlmADCSChY=;
 b=zdsVtEBaWAYiC6AKfelvFhHoa0VRanQMfFlQStbwPoG7k4Yl053Mku9Z6KlXITqu8K
 1wMsos/bBaNvd1aeLTkYMy1ns+IC6GyVs4u237qxvhQLqjTrsbV2S1dgkvexd16v6E5A
 xDbRcN4Qqho+xZgi+8JnKrvd0xWqol3AkA9M5DD0KQp13O+g897rO5UKGFK/qAxpkhJi
 adRFQ+0xEuoiJynoT3FbRNE9RQaVMpOpNolU4Sybll2+hoCfmwZgnn9ZwT37C9T5rfJL
 SKUs3wcwIIaWtOXj7yQjO5UFyJzJEDO1dRbUNed2oAYvx2k/IbafWJ2q8PJWIeQXqweC
 TyFQ==
X-Gm-Message-State: AOAM532URmZ/IfpPXBv1AbFTq8yz1JcXSlCh1rXRlsCxbyuHcPqGMRh9
 l2jlf2twHB8tlRNUVkBxru8=
X-Google-Smtp-Source: ABdhPJz5zAa8xgSOacNbN1QEP4WUOE0mulQoH6wZbGntvCmTU1aJI3geojJMrx5vchJS3EnAJ8blsA==
X-Received: by 2002:adf:cd09:: with SMTP id w9mr4919379wrm.619.1637833931579; 
 Thu, 25 Nov 2021 01:52:11 -0800 (PST)
Received: from localhost.elektrobit.com (eth1-fw1-nbg6.eb.noris.de.
 [213.95.148.172])
 by smtp.gmail.com with ESMTPSA id c1sm2310853wrt.14.2021.11.25.01.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 01:52:10 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] Kconfig symbol clean-up for sound
Date: Thu, 25 Nov 2021 10:51:56 +0100
Message-Id: <20211125095158.8394-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

Dear sound maintainers,

The script ./scripts/checkkconfigsymbols.py warns on invalid references to
Kconfig symbols (often, minor typos, name confusions or outdated references).
This is a patch series addressing the issues reported by
./scripts/checkkconfigsymbols.py in the ./sound/ directory for Kconfig files,
quickly filtered down with:

  ./scripts/checkkconfigsymbols.py | grep "sound.*Kconfig" -B 1


This patch series addresses:

  SND_SOC_UNIPHIER_AIO_DMA
  Referencing files: sound/soc/uniphier/Kconfig


  SND_SOC_WCD937X
  Referencing files: sound/soc/codecs/Kconfig


This patch series does not address:

  CLK_FIXED_FCH
  Referencing files: sound/soc/amd/Kconfig, sound/soc/amd/acp/Kconfig

  Rationale: config definition has been submitted, but is still pending for
    inclusion through another tree.


  SND_SOC_AC97_BUS_NEW
  Referencing files: sound/soc/pxa/Kconfig

  Rationale: waiting for response; the kernel developer has been informed here:
    https://lore.kernel.org/all/CAKXUXMzqgyNGEnxAMQqZiXJYSK-X8uB-nxHWwPg41H6yS0GWNg@mail.gmail.com/


Both patches in this series can be discussed and applied individually. They are
sent in one patch series, as they orginate from the investigation guided by the
same tool and hence share similar topics and resolutions.

Please pick this series of minor clean-up patches. It applies cleanly on next-20211124.


Best regards,

Lukas


Lukas Bulwahn (2):
  ASoC: uniphier: drop selecting non-existing SND_SOC_UNIPHIER_AIO_DMA
  ASoC: codecs: wcd938x: add SND_SOC_WCD938_SDW to codec list instead

 sound/soc/codecs/Kconfig   | 3 +--
 sound/soc/uniphier/Kconfig | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

-- 
2.26.2

