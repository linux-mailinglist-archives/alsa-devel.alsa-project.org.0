Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3487D3E45A9
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 14:33:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE5EB168B;
	Mon,  9 Aug 2021 14:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE5EB168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628512427;
	bh=HRJm4jkuQ4qrVTShEaavJ8byL8ltgb09xvnONldogxI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qyCE5K5LcqtR/oHsZEySt8Yyw9DoboudsENvGTzx1YXci0fBnVSvr4TNTMWlXhDEU
	 kqv6Uu6/CspkFiFs/8Y4bAIquLGpkpaiYa+LmPkr76VbEzRPtR6o8pVOEsTLe8muWF
	 2hWNujh1KEIxKuhgwr0K58T5w2R9XUnBvK9+npYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 889EDF804C3;
	Mon,  9 Aug 2021 14:32:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C04E2F802D2; Mon,  9 Aug 2021 14:32:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D01CF802D2
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 14:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D01CF802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="z6RKwVaj"
Received: by mail-wr1-x432.google.com with SMTP id c9so21161789wri.8
 for <alsa-devel@alsa-project.org>; Mon, 09 Aug 2021 05:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XU7I3Tp+UVeKAwFkjnYj14P3sdinYDnARmKFl5zq2kU=;
 b=z6RKwVajWc7JC6OWjA7B+naXi3aDImOWCrFdqJByNnAZeBjysvOUavgfHaV6PemVME
 tIzKiqJXSj8JlUEPETlmit+1/kTb31mU/2PYzLUqZkIeRLDxxAsxAzkSmF42eRLS7X1C
 Cs/7GRMle9wsBIVzP/4uxOtSsdmSITBFTeo+V9JgUsGeH3vjXLOhUW0DnlfybnYHxXYn
 0VjSCoQuzEr4HDWIjS+JGoAdu2TAPbQLNzBgEUVtmJ8KoVO02CNt5SgR+GAOzgTrBR6w
 Zqs8bxqg9zgYOhEzwUwtqENGYfubYBcTsNH9unYPvULDI3P31z2NaWxjWljqTdkLqsbG
 YIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XU7I3Tp+UVeKAwFkjnYj14P3sdinYDnARmKFl5zq2kU=;
 b=EFo7kkbKXwmuT5K0yoj2tQu9U9+11vhJQ4E+WeYfp8AhBWw0pB7heisKTq7CVyqyhS
 2bIchJNrbevgs1mL0IOjcjOc/0nPYa38qkRNWtCNy4Kc4WxGrf9FseIL84lMPe+US98f
 xrgUdgfzQR6RHB88B2VcmFdk3QZFQ8FVgV6Mk0louJBW3fQ+R04qTcUu4pnEN5WsqydN
 ox83x+gBX+VNtBbuXhf1LnNPtvP9y9jmz3VUMLr6ITmnhveq/POhl9035Ml+tVZ6pUAf
 kTqY5AdI5r1bnTfFJLbQGsrsk84yuWT+UDG05g92J02DLNvR7oxjINDgs9BVoYf7Mi75
 zIWQ==
X-Gm-Message-State: AOAM530qfG0yYRyYu9w0+YSgSkw2YP1Hg1qJ9HR01i2zbqr3fZE0XDV4
 UCK8HRX+y86zMcUQi1Nbkp1wsQ==
X-Google-Smtp-Source: ABdhPJxi9GkuVRTX5sl68pMd+yYPD0zitdCq2NY11P4JCCk8RpcF8fyQM5fPtPa7Lug35Ja20soQVg==
X-Received: by 2002:a05:6000:18a5:: with SMTP id
 b5mr24439767wri.184.1628512311881; 
 Mon, 09 Aug 2021 05:31:51 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g12sm19369193wri.49.2021.08.09.05.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 05:31:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/2] ASoC: qdsp6: cppcheck warnings
Date: Mon,  9 Aug 2021 13:31:35 +0100
Message-Id: <20210809123137.14456-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, tiwai@suse.de,
 lgirdwood@gmail.com
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

cppcheck throws below two warnings in qdsp6 code due to unnecessary initialization
of variables

q6asm.c:1631: (style) Variable 'port' is reassigned a value before the
    old one has been used.

q6adm.c:475]: (style) Variable 'matrix_map' is reassigned a value before the
    old one has been used.

These series fixes it by removing those unnecessary initializations

Srinivas Kandagatla (2):
  ASoC: qdsp6: q6asm: fix cppcheck warnings for unnecessary
    initialization
  ASoC: qdsp6: q6adm: fix cppcheck warnings for unnecessary
    initialization

 sound/soc/qcom/qdsp6/q6adm.c | 2 +-
 sound/soc/qcom/qdsp6/q6asm.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.21.0

