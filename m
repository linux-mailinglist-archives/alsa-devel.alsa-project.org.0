Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 405FA46CDE9
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Dec 2021 07:50:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB0F822F5;
	Wed,  8 Dec 2021 07:49:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB0F822F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638946244;
	bh=jv+8XuJXbr9NzL2BkKI0rKH9ELoiGGSA68qSAxaD+CM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fbSTYa9zHcL+PREKLNwh3JtuCpr6CTd80Z0G9HOWu/oKxXTMY4Q/nmlAmgFH/My3n
	 N+v7ecAKH8NbhOie82G5OxBI+/6Yna7dJmRfBxbuzt5iaNedAkf/3OBRDWk7SVEC07
	 a7bllF52LEicxM39Sp8KJriTrNjqF10bd4ng7t3w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 263D3F804EC;
	Wed,  8 Dec 2021 07:49:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61250F804E5; Wed,  8 Dec 2021 07:49:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A41BF800AB
 for <alsa-devel@alsa-project.org>; Wed,  8 Dec 2021 07:49:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A41BF800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gH1OAMKZ"
Received: by mail-pg1-x52f.google.com with SMTP id 133so1228352pgc.12
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 22:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z1p7M/LYCK4ZSTVRRFaVS0/yRQ76HczsAM++YTNxVk0=;
 b=gH1OAMKZIbiCurLwwowWbfcMH6OFe1lcc7DRY2TXI47rbdcCKYijsRMUyJV9mN20O0
 m44aBHnbRhgYsBfQidng2wgBjSYA/a8kLEFQOv9KK99Vs7PrmwexJ41iJfnPoduNy8g9
 Ei3BNIK+8jRP4AFgYtovTr/E5+0QSKhp3LdwESCeebMgdPNBLAqtGDg5id6yi5EyiEQH
 70QPW8NvlJY+PRVYzOtioxqZwDyCnP0RPgGsFb8x1ECWXGFfRX7riZac/8bVHNAi+e+N
 XahLpYJSGOzb3cLS6GC1Dcsz0WiDqM5g+Pnk7OofoHL8r8jGmBBV7jayxzl9wqTht0t9
 QV1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=z1p7M/LYCK4ZSTVRRFaVS0/yRQ76HczsAM++YTNxVk0=;
 b=FMiwGijbtj7mDsSmgl43UH3rrPfYFaG0xvVWe0wea28oYERrb09+xDYZyOuIxJRTqp
 VTeZklS4fVGnusIyUsYt82LarPFdWxfS7UC9+vy3Ym4Tr8T1IPFqtDS82XWgYeTmLTU0
 AmDlWeDgURQ6S4LK9GX5bZNETNZv44IvhugawCJsnn5hN0rfZ46/lvF3cqTCTwd/M+eJ
 OCVBx4076JU+nnOBCarg+jqZxjWik+c+AANfK6S94PqORq52XZQ3ZIFHOa5LKrlqU/B5
 d47uWYFigSYUMfUhM1tSnt5HcR8hY5y69KsCjwR3kW6qgO3Oog+Cu/OJn+4V8AEZuCsj
 lrZg==
X-Gm-Message-State: AOAM530vDOt7L5ixlvA6jHWCkvn2xSIJlTTfWJsvVTx274xEZINmg8rQ
 OikBZqxK1YWqbezxfIdYs2Y=
X-Google-Smtp-Source: ABdhPJwIp6pPGibbmSNn5RgsgKJtj5oMsZgc1+pRk8v12IodpeiXSoONr/LaWwn11qGGttXMOXx2kw==
X-Received: by 2002:a05:6a00:cc9:b0:49f:b439:8930 with SMTP id
 b9-20020a056a000cc900b0049fb4398930mr4048379pfv.86.1638946153607; 
 Tue, 07 Dec 2021 22:49:13 -0800 (PST)
Received: from localhost.localdomain (fs76eeeb6c.tkyc601.ap.nuro.jp.
 [118.238.235.108])
 by smtp.gmail.com with ESMTPSA id h5sm2029396pfi.46.2021.12.07.22.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 22:49:13 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2] ASoC: dt-bindings: audio-graph-port: enable both
 flag/phandle for bitclock/frame-master
Date: Wed,  8 Dec 2021 15:48:52 +0900
Message-Id: <20211208064852.507977-1-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

snd_soc_daifmt_parse_clock_provider_raw() is handling both
bitclock/frame-master, and is supporting both flag/phandle.
Current DT is assuming it is flag style.
This patch allows both case.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../devicetree/bindings/sound/audio-graph-port.yaml      | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 43e7f86e3b23..7d0248be08c5 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -42,10 +42,15 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/flag
       frame-master:
         description: Indicates dai-link frame master.
-        $ref: /schemas/types.yaml#/definitions/phandle
+        anyOf:
+          - $ref: /schemas/types.yaml#/definitions/flag
+          - $ref: /schemas/types.yaml#/definitions/phandle
       bitclock-master:
         description: Indicates dai-link bit clock master
-        $ref: /schemas/types.yaml#/definitions/phandle
+        anyOf:
+          - $ref: /schemas/types.yaml#/definitions/flag
+          - $ref: /schemas/types.yaml#/definitions/phandle
+
       dai-format:
         description: audio format.
         items:
-- 
2.25.1

