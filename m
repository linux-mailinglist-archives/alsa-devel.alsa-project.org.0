Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCE061928F
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 09:16:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7773D1675;
	Fri,  4 Nov 2022 09:16:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7773D1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667549818;
	bh=7ucb8BPK0zlQNy7Zr3kpJxiV+K4vaiF2ELEMLb9fFms=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WMnuIaGPBCDosiMQ44xhxZ4VBho3DogXQMitVkbX7iwNaCmE9G1EDA9KGq0m7KlVw
	 zKBEx7BrpZygh2YR5nMYuMYHvSTCWzxWRMVljyDr3ZBluaTu4TirCr8ppMXN6Z3jph
	 JiC806T4W248NYVn3D1N5G2fQncyRkCmRWZmuIDU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D788CF8047D;
	Fri,  4 Nov 2022 09:16:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D96DF8026D; Wed,  2 Nov 2022 21:05:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E7A8F80085
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 21:05:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E7A8F80085
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="G+FCkyDJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667419553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Uxs3/q0q6AMOjvn/NBkbxt+h2qoRa/eYcqVm0+4ic8c=;
 b=G+FCkyDJ3DQ13MikGtwBiO+dGosj9vhGgkbzbcshTw6dqRCSpclyS58bJSNQw/U8odyr0e
 5r9FRudTXrQE6hUGRrfqrLsNVYDD68RNcUC/gh2stxXORHvWHoi6k3r8XOSc9RXlfXBsMa
 QToTA6iU+ydm3AX4BSEpUlLFvkHsRm4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-ugHddEUXN9Oo8fUSZbLk0w-1; Wed, 02 Nov 2022 16:05:52 -0400
X-MC-Unique: ugHddEUXN9Oo8fUSZbLk0w-1
Received: by mail-qk1-f198.google.com with SMTP id
 h8-20020a05620a284800b006b5c98f09fbso16470512qkp.21
 for <alsa-devel@alsa-project.org>; Wed, 02 Nov 2022 13:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uxs3/q0q6AMOjvn/NBkbxt+h2qoRa/eYcqVm0+4ic8c=;
 b=StDSf9DDl1Az+1DhAIe841UsLxkwLBXSXyvmMZqdDoCx0Ep3TrUuXJ4SOKA1ZgdPJP
 6/FDyyxBug3plSOvU6ev1BPPvKM8PrKoqnmdZdDLx8uowXkD7HCy6vEsqRc8/lScnQax
 cjDXxIY0HONKV2LeowLIwTaiIvcBaJ3i03s61lfYkTYSChdODcDZzt+AYaEo7DDsse/F
 vE2kjOgMBqdUNTd6FaM5sPYD+7M1xmeyaCfWxUaUfnlgk8Ao2JTl52bNDlTauAAKqJlJ
 Ra6WGviNm5//ZszGduk3eZCb9gc7eEmMlYN7I0QoKCYVgE8eckNJTlLQCIxlr70w7fKO
 0Sew==
X-Gm-Message-State: ACrzQf2GJppXMiXENgpQlIBCutWtDI3VPSwcZTf24gc5SDvyajh5SiIX
 D4P1t/URTzhj8sD7qQRyqgukKLP65ZcnpNbVfiut9vAZLTgirUt1mOTNQGekI6Frouk8IvGqc5k
 cLomME0Jv4SPJdEaHGstTJRo=
X-Received: by 2002:ae9:e70b:0:b0:6fa:509f:cb2d with SMTP id
 m11-20020ae9e70b000000b006fa509fcb2dmr6619206qka.181.1667419551926; 
 Wed, 02 Nov 2022 13:05:51 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6CrBAmul+SCZYHBCb6wd3h5Qc27RUpezgm/1M2t7EUgGC8eesqAc8ynMlkBSqvxPbKonQmGA==
X-Received: by 2002:ae9:e70b:0:b0:6fa:509f:cb2d with SMTP id
 m11-20020ae9e70b000000b006fa509fcb2dmr6619169qka.181.1667419551537; 
 Wed, 02 Nov 2022 13:05:51 -0700 (PDT)
Received: from p1.montleon.intra (066-026-073-226.inf.spectrum.com.
 [66.26.73.226]) by smtp.gmail.com with ESMTPSA id
 br30-20020a05620a461e00b006fa468342a3sm3831105qkb.108.2022.11.02.13.05.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:05:50 -0700 (PDT)
From: Jason Montleon <jmontleo@redhat.com>
To: regressions@lists.linux.dev, oder_chiou@realtek.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] Fix kbl_rt5663_rt5514_max98927 regression
Date: Wed,  2 Nov 2022 16:05:27 -0400
Message-Id: <20221102200527.4174076-1-jmontleo@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-Mailman-Approved-At: Fri, 04 Nov 2022 09:16:01 +0100
Cc: Jason Montleon <jmontleo@redhat.com>
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

Starting with 6.0-rc1 these messages are logged and the sound card
is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
it to function properly again.

[   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
spi-PRP0001:00 not registered
[   16.928561] platform kbl_r5514_5663_max: deferred probe pending
---
 sound/soc/codecs/rt5514-spi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 1a25a3787935..362663abcb89 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -298,13 +298,14 @@ static int rt5514_spi_pcm_new(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver rt5514_spi_component = {
-	.name		= DRV_NAME,
-	.probe		= rt5514_spi_pcm_probe,
-	.open		= rt5514_spi_pcm_open,
-	.hw_params	= rt5514_spi_hw_params,
-	.hw_free	= rt5514_spi_hw_free,
-	.pointer	= rt5514_spi_pcm_pointer,
-	.pcm_construct	= rt5514_spi_pcm_new,
+	.name			= DRV_NAME,
+	.probe			= rt5514_spi_pcm_probe,
+	.open			= rt5514_spi_pcm_open,
+	.hw_params		= rt5514_spi_hw_params,
+	.hw_free		= rt5514_spi_hw_free,
+	.pointer		= rt5514_spi_pcm_pointer,
+	.pcm_construct		= rt5514_spi_pcm_new,
+	.legacy_dai_naming	= 1,
 };
 
 /**
-- 
2.37.3

