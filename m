Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B99AD2A1F68
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Nov 2020 17:05:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 531C116B1;
	Sun,  1 Nov 2020 17:04:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 531C116B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604246700;
	bh=7QD/V8+1TY1yFi/NqmtD/t2v+VoGjxZJCcCe+MXzx80=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ngujy1YrN46o6wTuKsveaNo+BT6COPpZpIcYa+i9GNgS5d/hIdEI9GGRKt+Xpfy5P
	 AA7xGZsIowPRnmH8XnrkGTys6cqinHoHB4vuwIOxusU4Y6zEUp9KydJHl9CvAlkVBZ
	 vmBkOAo/8RdsJvJ98p8qQnpnS+higlQ5fGdlmySc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A20AEF80171;
	Sun,  1 Nov 2020 17:03:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2563BF80162; Sun,  1 Nov 2020 17:03:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 882E4F80158
 for <alsa-devel@alsa-project.org>; Sun,  1 Nov 2020 17:03:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 882E4F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="D65XPG8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604246600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=IO0WphOpYfe5qfktjcb4gZWmqgtIIkYaSyI84BD9VQc=;
 b=D65XPG8+6I2/76LN4pAEPdi3ShTPKSQXnbFGolTO3JbLA0MpAO0g1uLzIdOAEYTI1V4Um7
 sFPRkWzszXm9ST9IR7qJyM7mebKaF7G/gYOfTjW0a/vUxTicC86Et69vJQ1YJ+AjK8e81Y
 YsxMRk9SBQO4TRjKWqADwZIcsab/x7Y=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-aYZdzff7OgKGuvXfp3Lrig-1; Sun, 01 Nov 2020 11:03:19 -0500
X-MC-Unique: aYZdzff7OgKGuvXfp3Lrig-1
Received: by mail-ot1-f70.google.com with SMTP id 5so5215373oti.20
 for <alsa-devel@alsa-project.org>; Sun, 01 Nov 2020 08:03:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=IO0WphOpYfe5qfktjcb4gZWmqgtIIkYaSyI84BD9VQc=;
 b=g6rQfRpwl8CCw4VF0I5lV7VWv8h6WtKAaqDVAYKPHCYoV1DdYAU1FZ5IpFlus8eKAA
 4Vp8C7iwom+tcuYHkQsNY9FRPzIG3QkcEiHkZHqLZeDe8o5/QV35lUAz3it+8HHeq9Eo
 tIdKOwsQte15J8Yny3qkVmhhaCjHYrpPJ+xGoJORtoSEWSS69q3KVI8Z7ME4M1E4oKKq
 Dle/fgwTL57hWUJoLXwsLkCI8tpb5e8oHD0UTDHaqerM9MxQKMUM+wI9bff0pQG9VRdx
 LK7zcDURUXZspb3ps+pUsdD/Ii0XycB1awt6n5QrsHkpG+Fnq0viY2UXB/I4I3CkNa5S
 JgHw==
X-Gm-Message-State: AOAM530Pa8VuCggQhhZuuABrIEk+49Zi+U5qHv2nOiOc/7H1oc1Pr6QA
 9e4cAMYVFZdxY1vjy+n58XmEO9vwBoOEXaaoHEnBtpigKDcFimJa9SQQVB9ODry9WjDmJ/NZcEH
 dMi0ugRD75vmZtf54AxG42B8=
X-Received: by 2002:a9d:6c16:: with SMTP id f22mr8504214otq.173.1604246598399; 
 Sun, 01 Nov 2020 08:03:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0NVhAd3RAFy1ChJ73q5Yk5OCmScu2Gyt/6ini7be7gafypppYbsM9VIcGjknqQa0IpZA2LQ==
X-Received: by 2002:a9d:6c16:: with SMTP id f22mr8504194otq.173.1604246598034; 
 Sun, 01 Nov 2020 08:03:18 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id m13sm2983573otn.20.2020.11.01.08.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 08:03:17 -0800 (PST)
From: trix@redhat.com
To: steven.eckhoff.opensource@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: TSCS42xx: remove unneeded semicolon
Date: Sun,  1 Nov 2020 08:03:12 -0800
Message-Id: <20201101160312.2296146-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Cc: Tom Rix <trix@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

From: Tom Rix <trix@redhat.com>

A semicolon is not needed after a switch statement.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 sound/soc/codecs/tscs42xx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/tscs42xx.c b/sound/soc/codecs/tscs42xx.c
index 3265d3e8cb28..6200fab7896f 100644
--- a/sound/soc/codecs/tscs42xx.c
+++ b/sound/soc/codecs/tscs42xx.c
@@ -66,7 +66,7 @@ static bool tscs42xx_volatile(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static bool tscs42xx_precious(struct device *dev, unsigned int reg)
@@ -81,7 +81,7 @@ static bool tscs42xx_precious(struct device *dev, unsigned int reg)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static const struct regmap_config tscs42xx_regmap = {
@@ -1294,7 +1294,7 @@ static int part_is_valid(struct tscs42xx *tscs42xx)
 		return true;
 	default:
 		return false;
-	};
+	}
 }
 
 static int set_sysclk(struct snd_soc_component *component)
-- 
2.18.1

