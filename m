Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEED41C0E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 08:14:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E46E172D;
	Wed, 12 Jun 2019 08:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E46E172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560320058;
	bh=/y47vVox65wUnn2yNdevqFYpI+iQZYHpIbpWPMrDDd0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kq5rFBuQdWYMIX8Ss0BEH+UJIWCZ3W3d6m4oPMqHGcrFtZG2gjkXBdKpZ13SmExxt
	 sXkSpQbVe3HJgJaPwYkI6f19QO03m9/jDNcKS0tLgxFFujcT25/6Dk2v2WYmKZ0/ha
	 emHJMiCpc8m7kcpOV4Rfj5o7Fv4wBCTu+mgy5/0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5015EF89753;
	Wed, 12 Jun 2019 08:09:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8054AF896E0; Wed, 12 Jun 2019 08:08:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEA3CF89730
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 08:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEA3CF89730
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com
 header.i=@mforney-org.20150623.gappssmtp.com header.b="yVrgdpui"
Received: by mail-pg1-x542.google.com with SMTP id f21so2301217pgi.3
 for <alsa-devel@alsa-project.org>; Tue, 11 Jun 2019 23:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V+VNU+D3EMt1ZKQJ1gtO8cAhGrcfJA/jcc+BCEhVMMU=;
 b=yVrgdpui2Ey6vZ/WsKeiS3ubu+zQ0iUiEuVfLh8y4FRx/q7uWaNIDxbLqnskDjvpzp
 kgRs1CzXIrmaAGBRw1MjsRcrPbOvFUyoOg0lT3aOr7UET3vr+JhOMOeJ3D1bwTtEIZuK
 AsHUcrS4dXbP3CDk6JseLUuGT9YDGYIN+Mfhk4MPBJlqv/IuEceHBiPkSdR28x50G+Sx
 9cT+DhCzmvKAFC2jo9TusxKqXpGQ1cNFD0ErNt5gHJj/1dQifwe3kX9KTgy8LfW5Qw2u
 W4Q26NG9kI6jZovSgfNSlIcbaKJJlkLszF1N94VQnG2ddHxISou5vcA4HOq6rFFngUJd
 nQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V+VNU+D3EMt1ZKQJ1gtO8cAhGrcfJA/jcc+BCEhVMMU=;
 b=re6pZx6D2sdUbuyc8Zv01NLaAByLV4XjYRTq1QFgV2ntLNSXoR6xAfOnYNvRzkqqNS
 Zk7porNCF+/vxQcd6Zafe/SMxWBE+atwCdmOcYmWx1GOjzvu/BNDh2VFaopV8WphNi2N
 ImeNxYzvAITbO/pbYvWqUTtlcgrLf9KgLTNOrXyl+kFJHGSwMHPD/fjzoT7ghlaaw/O/
 fZmB52Kp5cavB3a8o9mgZu8d1btScoKICYIE8Xlquw6m2WNEEpsLFezzs1emCxR8XC/r
 xTj6hh/tkC/ogmedBRtzEGMyHeP6uOzgrJJbiNOX2xTVPQZfjRaSKNX273LpGm42nIPW
 T/Mg==
X-Gm-Message-State: APjAAAVyKBsJbjacy28xW3FEEDh+6PIZbBaen4fF/rbTcJoflAOCUEgj
 YLfy+AWQAtS1stL+O3SCQKFHhw==
X-Google-Smtp-Source: APXvYqwM2QeM/Iun3fKrTulDX4B+lAtP7nX/Erz0uKh6cw2moiJMaQdmN8v0jgtU11+rQdrInHu8FQ==
X-Received: by 2002:a17:90a:25e6:: with SMTP id
 k93mr10095408pje.100.1560319701873; 
 Tue, 11 Jun 2019 23:08:21 -0700 (PDT)
Received: from localhost ([2601:647:5180:35d7::cf52])
 by smtp.gmail.com with ESMTPSA id b66sm19487630pfa.77.2019.06.11.23.08.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 23:08:21 -0700 (PDT)
From: Michael Forney <mforney@mforney.org>
To: patch@alsa-project.org
Date: Tue, 11 Jun 2019 23:08:13 -0700
Message-Id: <20190612060814.13534-6-mforney@mforney.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612060814.13534-1-mforney@mforney.org>
References: <20190612060814.13534-1-mforney@mforney.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 5/6] Remove unused empty struct
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Signed-off-by: Michael Forney <mforney@mforney.org>
---
 src/pcm/pcm_direct.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/src/pcm/pcm_direct.h b/src/pcm/pcm_direct.h
index a71aab13..221edbe1 100644
--- a/src/pcm/pcm_direct.h
+++ b/src/pcm/pcm_direct.h
@@ -186,8 +186,6 @@ struct snd_pcm_direct {
 			mix_areas_24_t *remix_areas_24;
 			mix_areas_u8_t *remix_areas_u8;
 		} dmix;
-		struct {
-		} dsnoop;
 		struct {
 			unsigned long long chn_mask;
 		} dshare;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
