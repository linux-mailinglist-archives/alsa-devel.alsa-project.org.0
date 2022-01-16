Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4129648FA39
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jan 2022 03:04:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BF2117DB;
	Sun, 16 Jan 2022 03:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BF2117DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642298691;
	bh=WWvj996DJHkYdq0ay2teie3/0YF2EV2ek8GLsn216GI=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dLpWVL9CLRu49yhpGCft+1n+92YRjEwwv/JQLr4eSdhCYpGPmJd9r9cJlFIpj3Pxl
	 1INtLcU2ffouqmin5hLuLdaZd6TJc/eo0yDBqGiy4p4zwihdQsNlbLyFuEtUQaF1D2
	 EKf8AawNQcht0pKUIVRP8gN4wrLnmBm7UWXYDang=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFBD1F80227;
	Sun, 16 Jan 2022 03:03:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 168D8F801D8; Sun, 16 Jan 2022 03:03:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E208F800B0
 for <alsa-devel@alsa-project.org>; Sun, 16 Jan 2022 03:03:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E208F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.b="WyZmlmZp"
Received: by mail-pf1-x430.google.com with SMTP id 78so6408235pfu.10
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 18:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:from:date:subject:to:cc;
 bh=EQpPofv3xqVheya0dgefCVu2/vpqFU87ufMossH4bmQ=;
 b=WyZmlmZplLS8zfYwy8JZCK4zxfN773ZY67zGGv43GjSQbpeJp2sSAgI/ZzQRFrZlX8
 FLGhVsixwvrXFVgbAFnRzNE2XDpwDgL3RdJBKMrnMeX3wEy3BExHbaC0/0F8+8s/3DZH
 CTSNY4v5VwwBZ+ShgfXy//zoDrUSdpels/Of4iN1J/LeJdIhWr7KKqyWJIciF6d4q3B8
 83TePSuKskIQrH2nLGtK776rp8eH5TZo3lQPe8HP6YAJis4xdtEXw7hbw0oIAYcr0eyS
 oMFBlWLTSX2SyU2eNq+YtA3vDwzc2fJv3bZjNnhZj0rAmUs4aX+2Zu6E0XQXrTZ3oKQ3
 j/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:from:date:subject:to:cc;
 bh=EQpPofv3xqVheya0dgefCVu2/vpqFU87ufMossH4bmQ=;
 b=UOu8exGzsUya6Xjnx45o7XqH3W35xV8rW/Txa+Yz+HXZgYxTdiiDOmUCGzfUraIRnF
 KuzbTbXlgpfHBrjjqAYMDXs8DsUhnaxIeXGgRxGAZ9Jz78CTe+jTM+TQ6lKXjsMlODUp
 ahgI9+Bu3dhqZnU9MfXQvuprWNaMI+nAt8tnaVWklOC03mItVsbgBnIA4qh0WtnJys9Q
 4hEC5G4i1HluVx+vvxzltt6CXwFsbMUjNcgUrbMYmNgQkOM84KR5srovXPC2VA+x3axK
 ioqOjxPk70mnSBqKNEEShb0Wi/Yev94pJ3ieQH0xaL08JQwRpuqP4kas7b0WHlv5mE8O
 03jw==
X-Gm-Message-State: AOAM532TvUVyYvhoLc6C0nc93qs2rPl5aTqAjeGnlokgnKT9j1zPDT49
 nok4krjw5QhflkDjg4K8SBM9wPjPsKztDFrs
X-Google-Smtp-Source: ABdhPJzi4Nm0DAxYTAaquO6l69+WqV4eA7FwkV4Kp5hunLWNzSWKwTbscVwRpgaBdnUYKJtCnkMnRg==
X-Received: by 2002:aa7:9ec7:0:b0:4be:19fa:f0f3 with SMTP id
 r7-20020aa79ec7000000b004be19faf0f3mr15342794pfq.8.1642298612838; 
 Sat, 15 Jan 2022 18:03:32 -0800 (PST)
Received: from localhost ([121.99.145.49])
 by smtp.gmail.com with ESMTPSA id c10sm9761822pfl.200.2022.01.15.18.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 18:03:32 -0800 (PST)
Message-Id: <cover.1642298336.git.daniel.beer@igorinstitute.com>
From: Daniel Beer <daniel.beer@igorinstitute.com>
Date: Sun, 16 Jan 2022 14:58:56 +1300
Subject: [PATCH v3 0/2] ASoC: add support for TAS5805M digital amplifier
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

This resubmission differs from v2 as follows:

  - The redundant mutex has been removed
  - DSP configuration is loaded as a firmware image, rather than
    directly from the device-tree
  - The volume control returns non-zero when the values have changed, as
    required
  - Some corrections to device-tree example

Daniel Beer (2):
  ASoC: add support for TAS5805M digital amplifier
  ASoC: dt-bindings: add bindings for TI TAS5805M.

 .../devicetree/bindings/sound/tas5805m.yaml   |  56 ++
 sound/soc/codecs/Kconfig                      |   9 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/tas5805m.c                   | 567 ++++++++++++++++++
 4 files changed, 634 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas5805m.yaml
 create mode 100644 sound/soc/codecs/tas5805m.c

-- 
2.30.2

