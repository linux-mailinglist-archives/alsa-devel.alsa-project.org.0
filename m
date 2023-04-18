Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 880DA6E60BC
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 14:11:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D81BE11;
	Tue, 18 Apr 2023 14:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D81BE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681819862;
	bh=7ITvubX1TCYKYf6rRAtGPEn8DjJ3XAKYFsw/WYOVIbg=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=eYN31oM2zqcr/3op4b6+zofZw9RgnlTZLxXUJmKJLgnVl520VjF9+AA3xYmvk3tix
	 pXCBns7WgZ5iBYQAUn8uXj0X1VSLaTSYapYdukBWSX6CIrHCcMdoPZVTklgq1wR1/1
	 suH9l5nmsP0uUuuiBVJaPELM/2mLJ3/O3B0jX0cU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFCE1F80149;
	Tue, 18 Apr 2023 14:10:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA3F8F80155; Tue, 18 Apr 2023 14:10:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9C02F800AC
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 14:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9C02F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=E7hykNQA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681819803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pK6/Jsd6qCRDUY6MLyVVq/KSoYjj907IkYNaHbXLumg=;
	b=E7hykNQA7g8iwt92DxydIqi8/r8MIzjnnvCkEidopak7icipV9gjk5U25IfrW1O9RsWIrj
	wlKt3a/SXH/buohllsQM5pk+fLuW5MynWKnw6R38Qo8JgFnzs8zt4uDk7PUZEiOBdBxHAa
	uv8ecu9PIyZPc7Khsjd3OBgZ6bAJ+0g=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-320-xwHCnE0pOiGsAFc38IUN-Q-1; Tue, 18 Apr 2023 08:10:02 -0400
X-MC-Unique: xwHCnE0pOiGsAFc38IUN-Q-1
Received: by mail-qt1-f200.google.com with SMTP id
 e8-20020a05622a110800b003e4e915a164so15758119qty.4
        for <alsa-devel@alsa-project.org>;
 Tue, 18 Apr 2023 05:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681819802; x=1684411802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pK6/Jsd6qCRDUY6MLyVVq/KSoYjj907IkYNaHbXLumg=;
        b=d38CdJnweDMF+CEL678yD390QDTVozoDyPRqYCsHZttQScei7+4kxGYI7hNKDUr7g4
         o8xO2NUL8maC+TYg0VZUqgqIjQ0szh8C/EIyr4COz579kDG05Wgyc6p9y/9UXciOB8EL
         etZWjeOX4g6kvOnRN5WcW9M/fXn87eARbIkf6XePuKufVA3ed42FHhu5zsnSHo3tfggK
         r/j7s7HdSzs9BW2MHjg8ozCd3sFX4JDFlpxj/S9fjbjcEglSfwp4E1G76NONioBiibIh
         X4mbbbcFmOoGaaObxEfZJrMIWQBUS/8nHh42/IUDElSn5ngoqA/af+YgwaueTNd0ZG2s
         wsrw==
X-Gm-Message-State: AAQBX9eUANmC7PPfgVx86eviQQ+GCaD+oQy5YLoBU/LM9fPjM1LjAQiw
	5yLAYQxeu1/kWyugSCROcRFzBN87FsVBABMCQkQGf/2txjCbFA44ipuqSsNGU/OHAGSZ5P17MJq
	cvteB3yL6VbomTMe1Gd3oNwc=
X-Received: by 2002:a05:622a:100d:b0:3ef:3824:b8b0 with SMTP id
 d13-20020a05622a100d00b003ef3824b8b0mr4901554qte.5.1681819801752;
        Tue, 18 Apr 2023 05:10:01 -0700 (PDT)
X-Google-Smtp-Source: 
 AKy350bOLcjSKxSHpofNzJcaPxLEh2nUi7FC1BrTGAF/mAedpATg6zJUv4zkRCxYqhwooGe4UgjcQw==
X-Received: by 2002:a05:622a:100d:b0:3ef:3824:b8b0 with SMTP id
 d13-20020a05622a100d00b003ef3824b8b0mr4901483qte.5.1681819801322;
        Tue, 18 Apr 2023 05:10:01 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id
 p129-20020a374287000000b007339c5114a9sm3875322qka.103.2023.04.18.05.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 05:10:01 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	CTLIN0@nuvoton.com,
	luca.ceresoli@bootlin.com,
	peda@axentia.se,
	javierm@redhat.com,
	u.kleine-koenig@pengutronix.de,
	ckeepax@opensource.cirrus.com
Subject: [PATCH] ASoC: nau8825: fix bounds check for adc_delay
Date: Tue, 18 Apr 2023 08:09:55 -0400
Message-Id: <20230418120955.3230705-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: TRGWZ3HTE7JSNHKOJFBCQIQRMILBO6WL
X-Message-ID-Hash: TRGWZ3HTE7JSNHKOJFBCQIQRMILBO6WL
X-MailFrom: trix@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Tom Rix <trix@redhat.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TRGWZ3HTE7JSNHKOJFBCQIQRMILBO6WL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

clang build reports
sound/soc/codecs/nau8825.c:2826:31: error: overlapping comparisons
  always evaluate to false [-Werror,-Wtautological-overlap-compare]
        if (nau8825->adc_delay < 125 && nau8825->adc_delay > 500)
            ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~

This is a bug, a logical-or should have been used.

Fixes: fc0b096c9291 ("ASoC: nau8825: Add delay control for input path")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/codecs/nau8825.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index c4389f5fe603..f4eb999761a4 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2823,7 +2823,7 @@ static int nau8825_read_device_properties(struct device *dev,
 	ret = device_property_read_u32(dev, "nuvoton,adc-delay-ms", &nau8825->adc_delay);
 	if (ret)
 		nau8825->adc_delay = 125;
-	if (nau8825->adc_delay < 125 && nau8825->adc_delay > 500)
+	if (nau8825->adc_delay < 125 || nau8825->adc_delay > 500)
 		dev_warn(dev, "Please set the suitable delay time!\n");
 
 	nau8825->mclk = devm_clk_get(dev, "mclk");
-- 
2.27.0

