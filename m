Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B590B6FC6F9
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 14:44:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A2E210EA;
	Tue,  9 May 2023 14:43:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A2E210EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683636281;
	bh=c2hS3grDLZK4vLLQ8P+F0hl+vjx2yr7oMZH4xBHKBns=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BW6/wJDXCIocYIDCeXzYmBd0NhXWEf2s0Rd0I6a0FT+9GNXeh97ZgfNTaaRIzAwf5
	 cxwtEN8/GSgFAoxnKKZH52LCHPyE80Bpl0bKAvz70jgDrmkS/NUe8Tjj7ZniT7J2c9
	 m8UFl5UGr8Mi2QJhfwvBGpt8oAE1p7e8idUzzF4k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F614F8052E;
	Tue,  9 May 2023 14:43:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA49EF804B1; Tue,  9 May 2023 14:42:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25617F80217
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 14:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25617F80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=mEu7EgzD
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f42711865eso13983175e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 09 May 2023 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683636164; x=1686228164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LNn6nFKtK6r2VL4gNamF8ksWMIm4Y9cfvJCgSo1awo=;
        b=mEu7EgzD3/wxi5z97BM9R3EjmlIs19wq/1FfH07l2LsO5IkpZQ4l/tM4OlRkLZ9JDw
         eUL0X6Tvu1vXGGcximjiZvAuzwh4Vbh6GDqhOEVihYT257kztfihiZbhAbVgx/vo+/sp
         DixHzNs3pZSUgi7Vm67heH0Ykzl+/VLRxsVsVFoH+gAKnbxYr4Qdp5Nk3IYbBwnLSh6+
         whJXIpx7zZevmEWsn43U5IqzIFxtkMsFu4gaLq/xLA4EDTKn0kUnitRodUufZbcVQBG8
         zEG2G9YqY1tL7WV7VmKkGzrA6DXucS4JDQifN+Qs3bSgPpbTwF5T6bVSn4kzhxvI3+bn
         u4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683636164; x=1686228164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LNn6nFKtK6r2VL4gNamF8ksWMIm4Y9cfvJCgSo1awo=;
        b=Ws5MiiqoWNmjJpYbXLnVceWZNuP7l0PxHqfQudGisAMI3UqXo7NxxOVA6whkaBipU/
         1vvm+xaasX76TPoGIl2rD6xJHRht4r3IAm230PnAObNSeLhRjA5PW2E9unjJlOjmROei
         lO4DaZ2yE7TYVbSykxHC2eg2TJvqhlJ50E/jWiJg1wZ4VzUCWruxD/Z4SNVgret9iwta
         fHBhd3LyuyRUoqcWoiwf/rsVFgyFoJJk2YyalWkzOgyCS0mZMlNXpIjzUYp1dMdmI1Ut
         7vGk49UIAWqYmyisJbMktEgy0GLpicsXWc0IEi0UyV28syriTTTNdZje7Y/PvNXosdQK
         NurA==
X-Gm-Message-State: AC+VfDxDbLD0ZAq/Pl/NFX9ulg1pyPAdU1/6mtTb0R3CFi0uVUvcrCRp
	NbHoWFcqeCKu/LzuElJP3MU=
X-Google-Smtp-Source: 
 ACHHUZ5v4zQ40dlTx6mNXK3VeBezN6RIEaQg7NiPAb4m+jPXMkfP5lNtAmdu9LWsI8jYR7LsFZ/pgg==
X-Received: by 2002:a7b:cd99:0:b0:3f1:6757:6242 with SMTP id
 y25-20020a7bcd99000000b003f167576242mr9518973wmj.27.1683636164205;
        Tue, 09 May 2023 05:42:44 -0700 (PDT)
Received: from localhost ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id
 s2-20020a5d4ec2000000b003063a92bbf5sm14401481wrv.70.2023.05.09.05.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 05:42:43 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	paul@crapouillou.net
Subject: [PATCH v1 2/3] ASoC: ingenic: Add compatible string for X1000 SoC
Date: Tue,  9 May 2023 13:42:37 +0100
Message-Id: <20230509124238.195191-2-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20230509124238.195191-1-aidanmacdonald.0x0@gmail.com>
References: <20230509124238.195191-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YK7GSGWB2ITXDSI5WCZC6K5TOBTUZYMV
X-Message-ID-Hash: YK7GSGWB2ITXDSI5WCZC6K5TOBTUZYMV
X-MailFrom: aidanmacdonald.0x0@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, tiwai@suse.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YK7GSGWB2ITXDSI5WCZC6K5TOBTUZYMV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The audio controller in the X1000 is similar to the JZ47xx SoCs.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 Documentation/devicetree/bindings/sound/ingenic,aic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
index c59a7cd9eaa9..d15c000f14e1 100644
--- a/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
+++ b/Documentation/devicetree/bindings/sound/ingenic,aic.yaml
@@ -23,6 +23,7 @@ properties:
           - ingenic,jz4760-i2s
           - ingenic,jz4770-i2s
           - ingenic,jz4780-i2s
+          - ingenic,x1000-i2s
       - items:
           - const: ingenic,jz4725b-i2s
           - const: ingenic,jz4740-i2s
-- 
2.39.2

