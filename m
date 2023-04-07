Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5B06DAC6C
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Apr 2023 13:57:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E186EC3;
	Fri,  7 Apr 2023 13:56:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E186EC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680868622;
	bh=f3wKXbpblU6E4bD1zHeaxGZtlH12TET+6jBA8YzIDG0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vuo8UN17zzj/RmClHLDHwqPwJMchRVgLkC6no44a6uB5bL3bdxLcPcOQ3yI7bcNKF
	 HHmWks1lwQNMoI+qOHNXDsCXWwpr5PGg2CpsIP5SHL8B1AI0IVvAXYsMar018QN04n
	 kf6S2TJcI39fkpmY+q4uvakQ5CHQ9875/95x9bsE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67556F80249;
	Fri,  7 Apr 2023 13:56:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42492F8026A; Fri,  7 Apr 2023 13:56:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7775FF80149
	for <alsa-devel@alsa-project.org>; Fri,  7 Apr 2023 13:55:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7775FF80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=E3U7Wh7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680868558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n4yjwe4G2G9/env2LGiwcE/Ce2F1TWlNc2OcCX0hL4A=;
	b=E3U7Wh7ECWyrUkS6D/zbhCF147KS4jscbnVtz3mLXfthHIQSMRR6rV2zJVe3e9p8SYknAv
	GdXcUU1LZWBhjRKm/Bmcqb3OHP8rdAayLynWLjm8qNRoyJrUn4pFWwTq5KU+/jvCk4eYyT
	L+zRsZKsNjA3HRNIHphkSo0D+btH8Z0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-ZO5ovSnMOkWI1v8hxDGlDA-1; Fri, 07 Apr 2023 07:55:57 -0400
X-MC-Unique: ZO5ovSnMOkWI1v8hxDGlDA-1
Received: by mail-qt1-f199.google.com with SMTP id
 p22-20020a05622a00d600b003e38f7f800bso28431118qtw.9
        for <alsa-devel@alsa-project.org>;
 Fri, 07 Apr 2023 04:55:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680868557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n4yjwe4G2G9/env2LGiwcE/Ce2F1TWlNc2OcCX0hL4A=;
        b=6DjXvbuv6ZLZhFCE0LGYdQHo75WdHPMSKjFDOBm/nt7hVdd+K81RRGau4TkFMw4FNe
         5LQiyGejw7j2U6MofhTirUODnoUGyy8Wh+b0vJ/ZLPw16NLT0eamaXH7hvKc/HUvHo3u
         8Zs6e26nZf4CX4kxrYVUZLAzwZfGOuZ792UHZdv40sKZ1dNEf5N0XJ6hqahU22R9efgk
         QsbxHOZVELqorGebdS87dBCkkTKVUZr05U+QKfpXJQAiw382l0OqxAPUtgQw/+omUjTV
         J71+Tn6mqHtpTzBhoDdhCUewcpStopkyb+X/Xlfe8XwkpwdrPB8Y5xprwAmCk/cTXfem
         0GdA==
X-Gm-Message-State: AAQBX9ckJDeDLCfSJAmuUyCxajhT5LI8LtgVEdGByladhuQHONNpRse3
	dWgqrMHPeovyscEFOKLlWSavtaJ+XQruheHu9XcJYmDdZDvzR7f6sLEHe2svWWXhWP6e4UH5nxr
	s3GeRSOKpRT3pQusm50JQZi0=
X-Received: by 2002:a05:622a:1646:b0:3bf:b70b:7804 with SMTP id
 y6-20020a05622a164600b003bfb70b7804mr3553537qtj.25.1680868556973;
        Fri, 07 Apr 2023 04:55:56 -0700 (PDT)
X-Google-Smtp-Source: 
 AKy350bl0Z3EzCJjIcLXRO1sAvzdukxxqrzrxNB4Iggt9a8A/nFDAbH/D/tViLjUBbsmcHprRWWaUQ==
X-Received: by 2002:a05:622a:1646:b0:3bf:b70b:7804 with SMTP id
 y6-20020a05622a164600b003bfb70b7804mr3553498qtj.25.1680868556613;
        Fri, 07 Apr 2023 04:55:56 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id
 t186-20020a3746c3000000b00746ae84ea6csm1256321qka.3.2023.04.07.04.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 04:55:56 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	colin.i.king@gmail.com,
	fshao@chromium.org,
	jiaxin.yu@mediatek.com,
	allen-kh.cheng@mediatek.com
Subject: [PATCH] ASoC: mediatek: mt8186: set variable aud_pinctrl to static
Date: Fri,  7 Apr 2023 07:55:53 -0400
Message-Id: <20230407115553.1968111-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: AZ6XGDLOETWMKRWOSS4K6PKDVT6ACSPM
X-Message-ID-Hash: AZ6XGDLOETWMKRWOSS4K6PKDVT6ACSPM
X-MailFrom: trix@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Tom Rix <trix@redhat.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AZ6XGDLOETWMKRWOSS4K6PKDVT6ACSPM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

smatch reports
sound/soc/mediatek/mt8186/mt8186-afe-gpio.c:14:16: warning: symbol
  'aud_pinctrl' was not declared. Should it be static?

This variable is only used in one file so should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
index 20b9f5d810ec..f12e91cc4fcf 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -11,7 +11,7 @@
 #include "mt8186-afe-common.h"
 #include "mt8186-afe-gpio.h"
 
-struct pinctrl *aud_pinctrl;
+static struct pinctrl *aud_pinctrl;
 
 enum mt8186_afe_gpio {
 	MT8186_AFE_GPIO_CLK_MOSI_OFF,
-- 
2.27.0

