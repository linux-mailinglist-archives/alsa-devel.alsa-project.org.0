Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 167044C2D25
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 14:33:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AC4B18AB;
	Thu, 24 Feb 2022 14:32:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AC4B18AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645709598;
	bh=gMpBBCQSR4XMNNzxk5CDXFSd5bzcqR4uEf3YGZSQ2/8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R30tg+wFjLfN0vi6KbwKkJDMh0BW9a8qA9h0de4Jkomb1sWy6yzc6BBmcTTRWdNMR
	 0VvQVQkHbtE0MzVUeA7xPq2Wwfjsk3W6PKmdFbx0U/Hmz867qYodh1LWUg/WTVlZJn
	 2dd88rRxu2pv9W3wwqjL0kvJG/j/lxPjNw4zFdBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72837F80525;
	Thu, 24 Feb 2022 14:31:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15EC6F80525; Thu, 24 Feb 2022 14:31:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7420CF80169
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 14:31:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7420CF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="X+4hbVuu"
Received: by mail-wr1-x434.google.com with SMTP id d3so3089645wrf.1
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 05:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UmVaZe5WSxDiTqf74Pc2xrLlr9buKqJFnFD7mGOeeZQ=;
 b=X+4hbVuuPt44tTksNFwLknPj3qpjpjuhlAwO2hCrkvTD87j39VczB7GvnEIzthjT/e
 WOdbn8iXn1qe0tGbWLvewZ/UezZ39LrTIwtnT1f7l7F00geI/ii4e+VtMj8dUO/rhu7s
 /IgoenmAxZztegUykln+ZJHB6srH3RkMz2rRcrvuDPN2E7+NNwcwtDCeobU5bJldZ0ZX
 /Oz98ktWfKU61kq1DQfZ6s5ZoQeiScjnu1IG8zMskHj2QlS5AvBHBVTZPmdcSvPYqCSi
 ihQapqvmYJLweLPHEOO2lxc9bfnl85KgaAISDgIW/nUPH2Q6Sp9m5zsMvojK47xWkBpS
 7ZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UmVaZe5WSxDiTqf74Pc2xrLlr9buKqJFnFD7mGOeeZQ=;
 b=3Cva/xBrDWAFHXbJQG0OmUk6UIgFXaJz10yPiK4/wwD0l4HsDT3gNt7rOrNewk7M5K
 XDLbNoF8lUCKAZrlguFOh/YW8KgFSFme1Azlxugnq/aetvu57v2o27t5rGQxokTpKFXL
 wB0sZ3kfUniEIaOKjpyZF8iaCtcF71ahdE9QRfac40xkw/XHZD3NCxvShqrpQRfcFT8b
 Mc1oo9BqCiiwbE9nQJdgkQOkNGWlDlujBZ6m6LyElANW/ExbOggcoxcvGaDKEsvdgnwc
 pwgOwGqNs6dNITvI4eySXZ2pLj5CpK/DS1poGSnO3zaMyI6x3Nm6JvC/JxYuOPGM7OFR
 Ns8A==
X-Gm-Message-State: AOAM530fbt1OlD2+a6IxAtsGn5kyFPZyDAyhOdZut9PWQxG/EIfl7J0L
 wZFutwv07kofExj4Jwz6MoEeXg==
X-Google-Smtp-Source: ABdhPJzGxwrAIaDsnmbLEemWdu2TqUsgbnEEJsfcoRpGlvqbPOOKjtAfW3tLr1uHErzQNUzrhyE1mw==
X-Received: by 2002:a5d:46c9:0:b0:1ea:9cab:c2e4 with SMTP id
 g9-20020a5d46c9000000b001ea9cabc2e4mr2173369wrs.1.1645709500156; 
 Thu, 24 Feb 2022 05:31:40 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 e33-20020a05600c4ba100b003810c690ba2sm2019142wmp.3.2022.02.24.05.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 05:31:39 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: robh+dt@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH v2 0/3] soundwire: qcom: add pm runtime support
Date: Thu, 24 Feb 2022 13:31:22 +0000
Message-Id: <20220224133125.6674-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
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

This patchset adds pm runtime support to Qualcomm SounWire Controller using
SoundWire Clock Stop and Wake up using Headset events on supported instances and
instances like WSA which do not support clock stop a soft reset of controller
along with full rest of slaves is done to resume from a low power state.

Tested it on SM8250 MTP and Dragon Board DB845c

--srini

Changes since v1:
 - updated wake irq to not deal with slave pm runtime directly.
 - added delay after soft reset of SoundWire controller where clock stop is not supported


Srinivas Kandagatla (3):
  soundwire: qcom: add runtime pm support
  dt-bindings: soundwire: qcom: document optional wake irq
  soundwire: qcom: add in-band wake up interrupt support

 .../bindings/soundwire/qcom,sdw.txt           |   2 +-
 drivers/soundwire/qcom.c                      | 202 +++++++++++++++++-
 2 files changed, 202 insertions(+), 2 deletions(-)

-- 
2.21.0

