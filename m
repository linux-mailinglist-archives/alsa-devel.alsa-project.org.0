Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E067A13284D
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jan 2020 15:01:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E3EC1843;
	Tue,  7 Jan 2020 15:00:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E3EC1843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578405690;
	bh=m8ywg2aciBspDv0Wzcel6mfQGwYivwT/gyUbXWoFJ94=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lSOUz0kNJdsrxX63MhdyJXgRukt2cRsjwgb3xIFMzpxCv01as7CoFNai68IagNsDI
	 RdHu05X9yXx6OeXe60FzSdIYqUgCIzwwkF6s6GD8ofh9onYUpSHwJTVf6rnQTUyzxn
	 IvwX6sMaRfCaVBnI2iEF2B5fZ84GXkz+k0pvrOeY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78FBDF801F4;
	Tue,  7 Jan 2020 14:59:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4542F80172; Tue,  7 Jan 2020 14:59:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDB80F8010B
 for <alsa-devel@alsa-project.org>; Tue,  7 Jan 2020 14:59:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB80F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="dzWB/EoS"
Received: by mail-wr1-x443.google.com with SMTP id q6so53959910wro.9
 for <alsa-devel@alsa-project.org>; Tue, 07 Jan 2020 05:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJmNVKXw+jiEBav45JwHqYwIUD6qRkoNmzlqiHhZXYw=;
 b=dzWB/EoSgTtmZS1jRRfaw4IcwicuhDGrosyvacgu2jkF+h/IfS5yQYJY01DWCHUUSU
 gGP0q6UXuKwkB2e6oLl3YAoofIyuiMzUCpTzOyST9sxlWL7QfCYT99Pcp6+F2yRFvk+u
 Zc0GGLDshOrLpAQoktXKD8Pjmv77edZmY7z4A+kWoHfu96Xp2RoCbvY6bqzw2YuHcOQp
 tUOH0lXahsvIPP+gF2z6TUVJGjsy6xBtQ4rXOcwvwOr7+OrlduDcaoMAIh+acCCK/iAv
 wdbvSE63om3/bHkhlqwDRfFvUd3MAKeANfPumdX6rG/bjofkpYMPFcLdR+ptINWce6bI
 SeFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qJmNVKXw+jiEBav45JwHqYwIUD6qRkoNmzlqiHhZXYw=;
 b=nH8SiRKqzXhqTft6Smeu5HweL7MgboGSVJAYMb1crdk1vAtPfKe3L40Kdcvu+QxyA1
 bYV8ZaSxosMJ8lx9MfPxmxUQothEeCtDSPTefWVF5g9zLDRWiVkhzaOqQH2f+TdH5KFo
 nOJKVhKUBqyaGq1VOIVGTbHdMEvzY9BhCtMqWO2W590UQ8gdVx92Qf8eOSaf5qpV12pS
 Zm1UUZeALccUn7Un//Qs04Vc6VODAT98aKsZV2YVLNl8GeV8ghLz9HI22P+9Ud3WV2Uu
 lKXIiFYqnijoYF6inzjnTi7ob4chgFYvRtrhJV+ezQ3GQmpOIlldU+GzHWWSPZi9u9OO
 J/zw==
X-Gm-Message-State: APjAAAU5qWnGvrkh393uDG1cY02QWbZFrPuac669CxgCjfnNsNuamAsk
 +N/IfRxFH1tufone4LGqkk2Szw==
X-Google-Smtp-Source: APXvYqyxSzAza5WFSSlVKXrVP4+KymJQ53g9SeWnOUt+23LI/w627bfnQoXLtv0cPoaP3f09YW/qGw==
X-Received: by 2002:adf:db84:: with SMTP id u4mr111565552wri.317.1578405581838; 
 Tue, 07 Jan 2020 05:59:41 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id t190sm26769617wmt.44.2020.01.07.05.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 05:59:40 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Date: Tue,  7 Jan 2020 13:59:27 +0000
Message-Id: <20200107135929.3267-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: robh@kernel.org, alsa-devel@alsa-project.org, bgoswami@codeaurora.org,
 spapothi@codeaurora.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, vkoul@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [PATCH v11 0/2] ASoC: codecs: Add WSA881x Smart
	Speaker amplifier support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patchset adds support to WSA8810/WSA8815 Class-D Smart Speaker
Amplifier which is SoundWire interfaced.

This patchset along with DB845c machine driver and WCD934x codec driver
has been tested on SDM845 SoC based DragonBoard DB845c with two
WSA8810 and Lenovo YOGA C630 Laptop based on SDM850 with WSA8815
speaker amplifiers.

Most of the code in this driver is rework of Qualcomm downstream drivers
used in Andriod. Credits to Banajit Goswami and Patrick Lai's Team.

TODO:
        Add thermal sensor support in WSA881x.

Thanks,
srini

Changes since v10:
 - Add check in hw_free for prepare status

Srinivas Kandagatla (2):
  dt-bindings: ASoC: Add WSA881x bindings
  ASoC: codecs: add wsa881x amplifier support

 .../bindings/sound/qcom,wsa881x.yaml          |   68 +
 sound/soc/codecs/Kconfig                      |   10 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/wsa881x.c                    | 1185 +++++++++++++++++
 4 files changed, 1265 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa881x.yaml
 create mode 100644 sound/soc/codecs/wsa881x.c

-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
