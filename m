Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA0C48B274
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jan 2022 17:41:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 847121A48;
	Tue, 11 Jan 2022 17:40:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 847121A48
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641919309;
	bh=zieRBNrdR4/fiCOULdSGctGfiwGGlOZ8prDYPPmKbpw=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SWM7JreGg2N2D/lRV5cf03PyuUS5HBsJ7qunUeBUw7MDHWhYqrVgQSwpR0NHMYXvB
	 jc7ZVI+LcuXsWjUnpYiTeLClbLNdGF9DRhDs0Iy6sgSUnVvg0tTjVYXk4QxIrzvdoG
	 68tF9BxWQrF8qj9Vxxz/TksWO8LBldyZq3s1V7hQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EAF6F8051E;
	Tue, 11 Jan 2022 17:38:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED49FF80118; Tue, 11 Jan 2022 01:16:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E760F80118
 for <alsa-devel@alsa-project.org>; Tue, 11 Jan 2022 01:16:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E760F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.b="lZilM5t9"
Received: by mail-pl1-x629.google.com with SMTP id e19so7894538plc.10
 for <alsa-devel@alsa-project.org>; Mon, 10 Jan 2022 16:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:from:date:subject:to:cc;
 bh=RXbgYQuhy+HAtohgMpCvhNrYOo86LBqxSJ6LSA+CYko=;
 b=lZilM5t9I6BxxLEVSWWIXV4BOAjVn1VsP7QkuuQNgIwGB1jZP2x7cdg+PjkwAvV0iR
 Qh5fhHgRamyVvNODTnjNhRWCrup8ZbPiYVotBxX717wpOUVH8HkbplJyfMHWkLn9NW3L
 B16H6WC+Vc5R+5CcND1hwq3A7ybQCf+sdgxwiNADBh/NDY44NCvlnQgrFQtXv7AZPLNP
 5DruaqQir2RB+ib+qvSIA2Ny/iSgJnVPvk90Kko+wus9g6lR40aL8igeelGoRYJVg479
 uEHicHEKCb5oEh641FGggFZQ2I4N0sA4Av7BzKK9Uf3XlKqZuYH8n7dTEdjK3agejVjk
 G3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:from:date:subject:to:cc;
 bh=RXbgYQuhy+HAtohgMpCvhNrYOo86LBqxSJ6LSA+CYko=;
 b=zIauV5CABoZWy0vHczURqw5nWKsPIWjZAaDHngYN33jvHY2MgyKcPVzl/OxEvxTp+Z
 IM/1QjgTdBMyt3Dw70nja+ytHQ+5+7+wg5ojw1a/QV9oxwR89f9L8KBMppJjANRxCMxz
 1NbTv9zl5FOuXfsxIb7/dgjKmoBi93IJ7w/8GYDjwa1U/1OeZ0b5xffogolXJ4MBCfAU
 ywbFPDW5OaxLQra2X8j8bTxrdg3a1cAriTLv7gQdqGy6qRuFymXhEHQypgS4ZRC9DK2v
 /hnDFivLVTlIjR5Hjs9zhyAPfbzCMiXLwcacBFRDDsdRLnf8SuIB3wiROIue7URUdayF
 jq2A==
X-Gm-Message-State: AOAM533hPS49acWc+sOhXdPEeoSbovS+BeKVWa3NiMasGtxt/nZuMzGy
 SjAuv/TbjhPftN3ix5pUjkFnWzj9oPpaFAtQ
X-Google-Smtp-Source: ABdhPJyx9U1ERclB311uUhn7B8cDyDV4IsIkutwp13YRPkqVKOBbirk/QdGbzFxVh74rek+hIz8M2w==
X-Received: by 2002:a17:902:be15:b0:149:a608:7098 with SMTP id
 r21-20020a170902be1500b00149a6087098mr1959506pls.63.1641860181723; 
 Mon, 10 Jan 2022 16:16:21 -0800 (PST)
Received: from localhost ([121.99.145.49])
 by smtp.gmail.com with ESMTPSA id n15sm168063pjj.12.2022.01.10.16.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 16:16:21 -0800 (PST)
Message-ID: <61dccc55.1c69fb81.77e64.0d94@mx.google.com>
From: Daniel Beer <daniel.beer@igorinstitute.com>
Date: Tue, 11 Jan 2022 13:11:34 +1300
Subject: [PATCH 0/2] ASoC: add support for TAS5805M digital amplifier
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
X-Mailman-Approved-At: Tue, 11 Jan 2022 17:38:43 +0100
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
modified very slightly from the tested version (digital_mute has been
replaced with mute_stream, and the new IS_ENABLED macro is used).

Daniel Beer (2):
  ASoC: add support for TAS5805M digital amplifier
  ASoC: dt-bindings: add bindings for TI TAS5805M.

 .../devicetree/bindings/sound/tas5805m.yaml   | 201 +++++++
 sound/soc/codecs/Kconfig                      |   9 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/tas5805m.c                   | 534 ++++++++++++++++++
 4 files changed, 746 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas5805m.yaml
 create mode 100644 sound/soc/codecs/tas5805m.c

-- 
2.30.2

