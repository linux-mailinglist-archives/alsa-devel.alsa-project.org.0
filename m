Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A16FD718
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:34:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 592F21054;
	Wed, 10 May 2023 08:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 592F21054
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683700495;
	bh=N6+9eSRuDcM+2LktAXFA6WrQd6lk1RtZMVvU2vNTpB0=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lGXVNCB3W/4Qx7coPTsFxUq0k5HtSP+AqEV5n128wdZObUyMi3LtufQWrnnB4y5/z
	 Svfdr8orPZa0+SFhdCKN3qPAmVrX/06QRg9njsvYwcKDVilUikMfOlORS3uYujmYMg
	 kSroBqA7ElXdG2XPsWMRXAUKpvvB15282nsw36xE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6C8CF80580;
	Wed, 10 May 2023 08:32:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 544AFF8032D; Tue,  9 May 2023 11:07:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2F1EF8014C
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 11:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2F1EF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LB5O02tN
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f1950f5628so55622505e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 09 May 2023 02:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683623237; x=1686215237;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlZTPdckZBfMkSfDWWxdgwam/c6cJ1kKCtZOHi20Sao=;
        b=LB5O02tNG4cpJDDD+nlRElHlkqW+EMQGIds7DI/MTS0bU1Dkx8aV4GMXjkuyuydSsx
         9oELVaBsmpYmj3A/h8W0JHgDaaj9tXA0yF/NU69dRpY623lsw/n1EUgMDOtRCMqTubdz
         I8Rm9K/1448M+PIqkzbqF1KKIUImxWR1siubAyxdJkQG/nASj/UwEiTkHsM9d/xlIwwx
         aYSuxL+837ZEcxhTWlBYig6CLB8M4COQFh4KEsYKRR0y2wFKAkKsq33WJRKX2Amjb4w/
         9hYymrm+sz/fYdsWvBo/kLISjbJLsKGieEjV/82yE1W5a7eKKalc4AigKHOP39BO9XW1
         xreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683623237; x=1686215237;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VlZTPdckZBfMkSfDWWxdgwam/c6cJ1kKCtZOHi20Sao=;
        b=kREa4IVZlcVJwYhtno/7HQwB62NA6rTJEeFHhZQT70abOfVbUj3NNenhV841efP7DB
         KvhBDHS7Na5R1dI/2yq3YKPwbfp6cH2D24iA6XyAwutDfESt8RzLlf2xGZZPh30kTFSP
         aqBV85RX0GAVg8CPwELm72yIq83KfHQ4zoogKzQvGq+pEI6YIV6BdWhtszqFK0b0eaB/
         /FnbVGPXI8iP2D4ptcHc8Q/tTJjhF4vsdmEseaq4bn7ZTnI4ixoxLqpCtrmJwbjZ5TxM
         XHrpSuKpid6GtsiLXFKa7FMIZOLnpimAERBrE1dwss2Ro0AiOWKokYXCxcidzHMJfLix
         rQxw==
X-Gm-Message-State: AC+VfDwHbJOiw4J1/EjHMVpy5vPoTkQDrAzb4UmnyqeLgJ1OmzC5Pkor
	JdoKfl3FgagHFb5ZhgLsmUTR2Q==
X-Google-Smtp-Source: 
 ACHHUZ7iJXBAdt8ysM3IiR8hzOEKnnYDA8+73kBAPfQIC0Q88i49UGx4gyd+FA0kAyPxAnLxdCb6/Q==
X-Received: by 2002:a1c:f202:0:b0:3f2:5be3:cd6a with SMTP id
 s2-20020a1cf202000000b003f25be3cd6amr9406111wmc.4.1683623237391;
        Tue, 09 May 2023 02:07:17 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 y21-20020a05600c365500b003f42cc3262asm762152wmq.34.2023.05.09.02.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 02:07:16 -0700 (PDT)
Date: Tue, 9 May 2023 12:07:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH] ALSA: firewire-digi00x: prevent potential use after free
Message-ID: <c224cbd5-d9e2-4cd4-9bcf-2138eb1d35c6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 2WZM7TZS4JPO4H3UMU7ZJ6ZWDPRQRMNX
X-Message-ID-Hash: 2WZM7TZS4JPO4H3UMU7ZJ6ZWDPRQRMNX
X-Mailman-Approved-At: Wed, 10 May 2023 06:32:17 +0000
CC: Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WZM7TZS4JPO4H3UMU7ZJ6ZWDPRQRMNX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This code was supposed to return an error code if init_stream()
failed, but it instead freed dg00x->rx_stream and returned success.
This potentially leads to a use after free.

Fixes: 9a08067ec318 ("ALSA: firewire-digi00x: support AMDTP domain")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/firewire/digi00x/digi00x-stream.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/firewire/digi00x/digi00x-stream.c b/sound/firewire/digi00x/digi00x-stream.c
index a15f55b0dce3..295163bb8abb 100644
--- a/sound/firewire/digi00x/digi00x-stream.c
+++ b/sound/firewire/digi00x/digi00x-stream.c
@@ -259,8 +259,10 @@ int snd_dg00x_stream_init_duplex(struct snd_dg00x *dg00x)
 		return err;
 
 	err = init_stream(dg00x, &dg00x->tx_stream);
-	if (err < 0)
+	if (err < 0) {
 		destroy_stream(dg00x, &dg00x->rx_stream);
+		return err;
+	}
 
 	err = amdtp_domain_init(&dg00x->domain);
 	if (err < 0) {
-- 
2.39.2

