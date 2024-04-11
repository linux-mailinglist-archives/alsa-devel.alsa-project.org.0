Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7F88A9F1B
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 17:52:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8591420C3;
	Thu, 18 Apr 2024 17:52:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8591420C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713455544;
	bh=joMzTyz23qmG+b+PQc5HQqQmeMqXg/U9MthFl8kkmFU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Geck7vG4AdD+3mlBGhKAKnhmZkYD0WGNPEQjoaU8HE6I2UKyH790n0yjKRh902Rv1
	 8YCBQolzODJ1HJi0BnPzH3I0gXCuQq1Yv1If1z9qAMbNcdj1WeYJUjOXcHmAxk0edU
	 bcl9r/THi8lQCR6HSUW94Em/vruEFpkkmAL4z574=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B20D4F89715; Thu, 18 Apr 2024 17:47:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A9C3F89700;
	Thu, 18 Apr 2024 17:47:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D555F80238; Thu, 11 Apr 2024 09:58:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3676F80130
	for <alsa-devel@alsa-project.org>; Thu, 11 Apr 2024 09:58:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3676F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=UB9nTPxu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712822291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SqVTw0UTFVtH3IwS7qkCBECw2fl92QBlfhYoyR8m1lo=;
	b=UB9nTPxuJVLgTOmQQ5HluYz7DkVWjuuANJ7kVOhr1TQ+CWTukaAsrgZE2ovAPJyMV6/2/P
	O8VhQFk1Exa1lFYHiV5hs2d8CoV5YJ8cR4pOWv0HD5Q7K3JvkXYSBII94E0qMjgZ28Ag6/
	DT1JBPBHhHSid++sXYk7vHYVNGrS34c=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-I5FlCDVDNXmBzW1MdgAdxg-1; Thu, 11 Apr 2024 03:58:10 -0400
X-MC-Unique: I5FlCDVDNXmBzW1MdgAdxg-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-78e13eddaf3so124028185a.0
        for <alsa-devel@alsa-project.org>;
 Thu, 11 Apr 2024 00:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712822289; x=1713427089;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SqVTw0UTFVtH3IwS7qkCBECw2fl92QBlfhYoyR8m1lo=;
        b=HzgM5tb6VOW1dlMBbUQ0qsa4QVZIngCG3O12qiArEgaW7hNb67QYaQtfhpzwzn4Cz8
         APB4nIq2do2CH7oyjhE2Dn3LGiWu3Nw7vWArsgeQMESZdpJY7He74N7QOZlnua50bblf
         8LYgOAuxN1nkQ8sR6YGM0P01qWOcjRHb0bkQ7h8uEkTMGv4mGGDS5BSoWLkiyeeI1iD/
         GhhnJ3qr1EJHt4eMdwWjTXeDs5gWu93mh4Q8ObhGmdvU+yQ+pFKM7GU+/RlyFWCuap+r
         zfZ2u38wml1za/uRY/V8GB893Yp4142BYOmzEiF9LMLPOc6RDpEp/WufyFYL3yaihIRJ
         jRaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA2L3aq9/IkhIIsQiHzMat1ylhacZ3YLZAe7hR8Pp4QtrjE1NwwUQR6/5vFet483njyHe1CJxOwj6WZ4WedgLbjbQEkG50z8IgDok=
X-Gm-Message-State: AOJu0YxiYQ09trd/BZHun+u0yixtKdA7Bqs+uandxqqBg9UcGdSO1KD4
	8UonqEdm+UUj5mlYuWYrpUHXhh4TYfankMJVnAZSv6XI9IXSKvfMz8psq3AlIAQYWtCHxif9zgH
	8yVvVsTBWx+vXGcqh8ttOcIHNfhoRlEXeArfUw/Ujxd3eeterlknI8Ez+dInQ
X-Received: by 2002:a05:620a:3d0:b0:78e:ba91:a4a9 with SMTP id
 r16-20020a05620a03d000b0078eba91a4a9mr2901288qkm.33.1712822289664;
        Thu, 11 Apr 2024 00:58:09 -0700 (PDT)
X-Google-Smtp-Source: 
 AGHT+IEvSh9y4I/IGdCNvTciq7eFbqCOuLJohMuODkTcOR2jUHxmkOOxyBUfrylL1fqN6UUVEDDAUg==
X-Received: by 2002:a05:620a:3d0:b0:78e:ba91:a4a9 with SMTP id
 r16-20020a05620a03d000b0078eba91a4a9mr2901266qkm.33.1712822289235;
        Thu, 11 Apr 2024 00:58:09 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb
 ([2a02:810d:7e40:14b0:4ce1:e394:7ac0:6905])
        by smtp.gmail.com with ESMTPSA id
 bj38-20020a05620a192600b0078d679f6efesm691961qkb.16.2024.04.11.00.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 00:58:08 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in TEXAS INSTRUMENTS AUDIO
 (ASoC/HDA) DRIVERS
Date: Thu, 11 Apr 2024 09:58:03 +0200
Message-ID: <20240411075803.53657-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
X-MailFrom: lbulwahn@redhat.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: QPLRO4MECNGDHH72VKX3OLLJ76UJOZ37
X-Message-ID-Hash: QPLRO4MECNGDHH72VKX3OLLJ76UJOZ37
X-Mailman-Approved-At: Thu, 18 Apr 2024 15:47:01 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QPLRO4MECNGDHH72VKX3OLLJ76UJOZ37/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Commit 8167bd1c8a45 ("ASoC: dt-bindings: ti,pcm1681: Convert to dtschema")
converts ti,pcm1681.txt to ti,pcm1681.yaml, but misses to adjust the file
entry in TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Adjust the file entry in TEXAS INSTRUMENTS AUDIO (ASoC/HDA) DRIVERS after
this conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e5431f06ab55..d39e0f2556f7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21976,7 +21976,7 @@ F:	Documentation/devicetree/bindings/sound/tas2552.txt
 F:	Documentation/devicetree/bindings/sound/tas2562.yaml
 F:	Documentation/devicetree/bindings/sound/tas2770.yaml
 F:	Documentation/devicetree/bindings/sound/tas27xx.yaml
-F:	Documentation/devicetree/bindings/sound/ti,pcm1681.txt
+F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
 F:	Documentation/devicetree/bindings/sound/tlv320adcx140.yaml
-- 
2.44.0

