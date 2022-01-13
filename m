Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3CC48D3BF
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jan 2022 09:42:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B11541B67;
	Thu, 13 Jan 2022 09:41:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B11541B67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642063363;
	bh=I1+NWduqkimxdp6zBfqTLgkTr3bNtpo9tuIdwLHIK3o=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Az1qTRZDI3C6AwZWzjrd4nkF/4+1r/wWKsrR9V/LOVEZkoHA9HX6+OsljWdiBFLxM
	 DKiu8JbfI655VeMkbI9O0VkRYzc0WydY9Fha0qo7Cc6yuUnPSCI+OKiVFRnYPo+jgA
	 QGZQipJuBjtJsscFTPS7FRcWy+IKqso72IE7df/0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25DA2F8028D;
	Thu, 13 Jan 2022 09:41:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74AF5F8013F; Thu, 13 Jan 2022 09:41:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAE69F80054
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 09:41:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAE69F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.b="EuLWrAWW"
Received: by mail-pl1-x62c.google.com with SMTP id i6so8709723pla.0
 for <alsa-devel@alsa-project.org>; Thu, 13 Jan 2022 00:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:from:date:subject:to:cc;
 bh=NeKX+1gLQKYhB0X8obuHvvXl9+4b5UGzNCpMXUeeI7M=;
 b=EuLWrAWWL34z4THDqjvCl+hOYXkOn4Y5dAt7+FsPmXSAAtt7fvtA0K9qX2/Zhu/K1U
 qN8uNswHkHpRoHcIKEEzRELN+WTMlpQtgSSB9IWcCUmFsNCLPz4pMZEyMNuUBvXFWmwa
 GQ8vIGSdEsHkGGEY4Fgq3YwbU0dci8bJNJ9MyKGMWa7UUm5EOs8oNH4r1GGLw2DbJUr3
 bGLGpEWsJYar+oW9NmdrRj+8W+wYcpGGrLOgX5PGe9JHc/ZydYXStXZEIHmA1zzfUpex
 3BcpfNKiCSZv+R1fXILlooiT0mhqhPuc4yOmOOyISxcfnEIs8cIPvTkT5GKR3M+Q6vzX
 EJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:from:date:subject:to:cc;
 bh=NeKX+1gLQKYhB0X8obuHvvXl9+4b5UGzNCpMXUeeI7M=;
 b=PAQphkzlcyybrVqveeddrmNZzwOBDsE605BugtD3jyzjAWJBSWbMk9XWFW8I9YgwjL
 bZo586iUwLGH9nJkJyUIqsk7QX7vvu1lvFndx2pWXl0iXrZLNEii9OISgYMdWP5xnvzM
 w6Ku/Qd1wcwhRXb2uphJPkISSa2MzoxkehDnKVzacAgUt548RSOXFDc8oGCYoZ0qccr4
 ujZFDaM2xlCzYkYxGeKceeM6icoXxgd9Wh+ku0994irZO86DlH8yyusCJHFiso7duYfG
 9di1MKVg8IHcqcH0Gbh/fZm/Nb7GPSIPGUpiGpBHbzQXKJHVqU06iGIjMxlZB2yjRIFT
 ww5Q==
X-Gm-Message-State: AOAM531inOKvDrBTneti2OYeEdAetehhsBApOJxD2CJ0KSJHFIPzj1qC
 DuZRxOdFzY7AoSIS1jzVGcoW+34enRwiDiC2
X-Google-Smtp-Source: ABdhPJwk9ggoW0sH7LTM1lwbSOp4qCilmpuUzLoJ9HMp9f+NS1JYqbfKLULFnY4W/+uAfyCibfdT8A==
X-Received: by 2002:a17:90b:33d0:: with SMTP id
 lk16mr2452797pjb.45.1642063280574; 
 Thu, 13 Jan 2022 00:41:20 -0800 (PST)
Received: from localhost ([121.99.145.49])
 by smtp.gmail.com with ESMTPSA id 6sm1704902pgr.88.2022.01.13.00.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 00:41:20 -0800 (PST)
Message-Id: <cover.1642063121.git.daniel.beer@igorinstitute.com>
From: Daniel Beer <daniel.beer@igorinstitute.com>
Date: Thu, 13 Jan 2022 21:38:41 +1300
Subject: [PATCH v2 0/2] ASoC: add support for TAS5805M digital amplifier
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: Daniel Beer <daniel.beer@igorinstitute.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Liu <andy-liu@ti.com>, Mark Brown <broonie@kernel.org>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>
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

This pair of patches implements support for the TAS5805M class D audio
amplifier. This driver, and the example configuration in the device-tree
file, were originally based on a 4.19 series kernel and have been
modified slightly from the tested version.

This resubmission differs from the first as follows:

  - Some explanatory comments and constants have been introduced
  - The volume control allows L/R to be set independently
  - gpiod is used, and regmap is used directly
  - .trigger is used instead of DAPM to coordinate DSP boot
  - The component is manually registered after power-on, and explicitly
    deregistered prior to power-off
  - Corrections have been made to the bindings file

Daniel Beer (2):
  ASoC: add support for TAS5805M digital amplifier
  ASoC: dt-bindings: add bindings for TI TAS5805M.

 .../devicetree/bindings/sound/tas5805m.yaml   | 204 +++++++
 sound/soc/codecs/Kconfig                      |   9 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/tas5805m.c                   | 554 ++++++++++++++++++
 4 files changed, 769 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas5805m.yaml
 create mode 100644 sound/soc/codecs/tas5805m.c

-- 
2.30.2

