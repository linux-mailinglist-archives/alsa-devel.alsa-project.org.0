Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE5B70E78D
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 23:41:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E059828;
	Tue, 23 May 2023 23:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E059828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684878088;
	bh=FZdWLW8r0eAmdPlNTf8hXYb7TnOegfS6aA2ozgpBELA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OM6RZVZ0gUAPSkO2gmEdZkomSiJQyJkRy7PSQDR4ux6ods86sYfCXBw4TxvQC+sOw
	 TRHt5Gt3tQZ2ikMl+ezZOWebpNabL/+Su1M6mBxO8dyzZSlwaR/8WgmR9/pUqfQnfd
	 YpbFq8IaJOvDZjUveOeg5nzO/G+aoANa1u46rjBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCC78F805B5; Tue, 23 May 2023 23:39:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BC39F805B5;
	Tue, 23 May 2023 23:39:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3674AF805AF; Tue, 23 May 2023 23:39:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C5B7F8026A
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 23:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C5B7F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=GoE+EJII
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-3980f932206so202732b6e.1
        for <alsa-devel@alsa-project.org>;
 Tue, 23 May 2023 14:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684877915; x=1687469915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZeG6tAZK19WtgOFcLJKr3rNEIZEgwi3vgrLkaNzhIA=;
        b=GoE+EJIIvySDiSJjK0WywYB9BUPC2Tr7tGgL3PQJ+xEsyp3a0K8+GDMpfCj9qjMbHn
         Xnw7V8+6MqrsjHloKTYHoZkmIu2QKwdK984nShCQnXmaWNSND0zdUCkYu5V8iEIk2T1m
         QNDfBLASJzoi/1dsqEPEPr5xSrQ256FRl5u/AKdgfgnSK4HBkofBfUhI4rjAbIz7rrd6
         V7enz6iWWftX3T7a52AVqqhUESxkmj0PjWfNIRqfLhZXderkr3+ghw9A7Y0RHUNcjoS+
         yq4PIK6Of/ucaJhl4+kScI18GnhZT0OIuHsDZuiNxUB1H+ah66q+hH/2bY9fiT9RBPH1
         GVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684877915; x=1687469915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZeG6tAZK19WtgOFcLJKr3rNEIZEgwi3vgrLkaNzhIA=;
        b=EYEFp2xfN0bdFpydlBnGY3tm6+a9JIVsgmMUbOE/5hDJAPR6b9dtayAzk5S5FX4ptw
         heoku7JcFNK3EVh8YDBVUQvbqsR1h5wTIyWc+UUj2eLlinccRHDOD6LWVNEnGQoxV4yU
         UFoo+I7OAPE0K15iBwBU+tUYSMqL0zc2JVVw/eVxaCGI4v4PP6bZFeCv516kGmG37AfJ
         sP1xmJB8k/R0MABlIaXFKxXVK+lrh+S5F8kZl74VNifIpXxQPZifXl1udKyDcTmhTehg
         SHv3aYeM37psI5wPDAivUvH4nqCxvhnKLGVbuUyIscKvNc2zrF3ooMlDrruoTrde4JNV
         hrWg==
X-Gm-Message-State: AC+VfDwBM+WX6nsIGIWQwrmadP8ZPzzz1pTMKfKtQEtfhoZTZCjQ6Aw5
	/wsvQG/RKx5JBW/qp7elo8s=
X-Google-Smtp-Source: 
 ACHHUZ65eLkVCgnWkP/23kS62FqwAKgfThDB9Z/OSIkWJe/DFkubys9nClKGd0Sk0PSjMQgOZqCRBQ==
X-Received: by 2002:aca:d0e:0:b0:398:2db1:dc2e with SMTP id
 14-20020aca0d0e000000b003982db1dc2emr1861840oin.26.1684877914903;
        Tue, 23 May 2023 14:38:34 -0700 (PDT)
Received: from localhost.localdomain ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id
 y83-20020acae156000000b0037832f60518sm4442359oig.14.2023.05.23.14.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 14:38:34 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	zyw@rock-chips.com,
	sebastian.reichel@collabora.com,
	andyshrk@163.com,
	jagan@amarulasolutions.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 4/6] dt-bindings: vendor-prefixes: add Indiedroid
Date: Tue, 23 May 2023 16:38:23 -0500
Message-Id: <20230523213825.120077-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230523213825.120077-1-macroalpha82@gmail.com>
References: <20230523213825.120077-1-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3UUAI26LZGPURBRQAFI5YLJ66GAC4IR3
X-Message-ID-Hash: 3UUAI26LZGPURBRQAFI5YLJ66GAC4IR3
X-MailFrom: macroalpha82@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3UUAI26LZGPURBRQAFI5YLJ66GAC4IR3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chris Morgan <macromorgan@hotmail.com>

Indiedroid is a sub-brand of Ameridroid for their line of single board
computers.
https://indiedroid.us/

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 82d39ab0231b..632662be6e65 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -655,6 +655,8 @@ patternProperties:
     description: Iron Device Corporation
   "^isee,.*":
     description: ISEE 2007 S.L.
+  "^indiedroid,.*":
+    description: Indiedroid
   "^isil,.*":
     description: Intersil
   "^issi,.*":
-- 
2.34.1

