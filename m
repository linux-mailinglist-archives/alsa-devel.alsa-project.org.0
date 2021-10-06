Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018142442D
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 19:29:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D882C83B;
	Wed,  6 Oct 2021 19:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D882C83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633541357;
	bh=4EiL0DxQMffQrJ/i2sPYkfj4MKjnxMjzhgv8FrSPbww=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qLBBq3+Puxg4i+6L4AOC7+XYQCMqoEUmNwM1X5ViUNVQfDZYXYmzV3BMo3Niv2/Ee
	 IB+7H1X4gfqeafpCrDIWcGLLYgkcbnAbrF7NHAPNywTgx3T7LD2fCqPP1rrGPutb6C
	 YNtOsifp8Czi23KubHRl7VqAbhX0huHkX2++acb0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E683CF8025C;
	Wed,  6 Oct 2021 19:28:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B912F8025C; Wed,  6 Oct 2021 19:27:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2680CF8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 19:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2680CF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="L/u3cCEe"
Received: by mail-wr1-x436.google.com with SMTP id r10so11051372wra.12
 for <alsa-devel@alsa-project.org>; Wed, 06 Oct 2021 10:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CLQR3ZCHgS6teLwnGcBU/nvuqIvqPuyjjVpaJ3OWZZE=;
 b=L/u3cCEe8KxiIkgo1yk9QbOW98Z3FHU79WWdMsQ8gpu7UQkwVsHvzUqzjV3UKX+/9t
 uaIelZQtY0UFb0Ezo/YWTl0TZvx1jbGeU+MUcEiJWwsGWKnF8qCu4g1eE0qVnwkqm+yZ
 KGvamehJ07Lv6UpXjWuOEhQHG/y56IbEHXFvm0AWueWQRc/mtpZzdHMBvIMmUfrUCm5G
 kYjWRPvmofeeOi732zA+1VToR9df/QE0xcMqNyRGr4TfdLVw9a5WkoOuzU7o4PF2F+LN
 2Ey6uZDVvFnhmHFSF6ioDV1nG+igE3PgO6wQVJVclBtLdj/DCAa5a53NmSFi7AG0HaUo
 ilkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CLQR3ZCHgS6teLwnGcBU/nvuqIvqPuyjjVpaJ3OWZZE=;
 b=Dz+XHEyVyCxq8+QudA5kVesEuBbHZQ22FFXlfbXILaf9cevhWQLYFVWLGmLx/OuIqO
 vsMGeePLolnRLQ8DPavL6rlA+CTGyI7AtNmYrseVti79pcXflnTx9C3lo4pFWOS5GUSF
 dJkHbngMe7RyOK1RP6bkEVX5PQZqFgq3a30kwy+nQKwic8F9og5a9Eg0gnWDzftpkl3u
 lW5sWKxKlFxE7DeetgA3h8O/h01lR9wIx1DfYXpCzMeVh2T7BrLORicM4jtIBsCAOvpx
 a43u/i7gcYmVXfKcfP0e2xYP2crquzFEOIHnf7T+x86PwwZNUKZgk+qV3oIrRForzxDC
 /I4g==
X-Gm-Message-State: AOAM5336TyhY8cSAKxnjvr/AhW4EJX9OC8A7GLwMwfKILZoQmIomKZ0a
 VMC2UGnYjfOaAf0ATN+54Vt3rA==
X-Google-Smtp-Source: ABdhPJyxTsichNl3hFKEdTa4Hs387iPUBHJJXBKainDXePRPMd7S6mG5M3CTqPDPip/MrIlhykiW+w==
X-Received: by 2002:adf:b1c5:: with SMTP id r5mr18385620wra.357.1633541273263; 
 Wed, 06 Oct 2021 10:27:53 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q204sm3976475wme.10.2021.10.06.10.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:27:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 0/2] ASoC: qcom: sm8250: add support for TX and RX Macro dais
Date: Wed,  6 Oct 2021 18:27:43 +0100
Message-Id: <20211006172745.22103-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, tiwai@suse.de,
 plai@codeaurora.org, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
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

This patchset adds support for testing WCD938X connected via TX and RX Macros
on SM8250 MTP.

Srinivas Kandagatla (2):
  ASoC: qcom: sm8250: add support for TX and RX Macro dais
  ASoC: qcom: sm8250: Add Jack support

 sound/soc/qcom/sm8250.c | 79 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

-- 
2.21.0

