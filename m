Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A56C2C6BF3
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 20:25:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD284187B;
	Fri, 27 Nov 2020 20:24:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD284187B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606505101;
	bh=UA7+ZkWeZvbmJH4gGk4vR//0E4hQWF4r4+3Q/+j5qRo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q7uebHwH360RVc9iRKxg4ELBTddsKug32dR9BKMEcUwBGpMeA6IohSupKopYiylsz
	 mi7A+rUn9zwQEXSD1wy+4zIXnKnslhL1WqjCk8nqvPX52UMMKFWBNMs9mIJS4B9QQA
	 HQag/OF0h8SIJFF+n5CQUKZ6DJUzB+wkeIz8O7Zs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59464F80218;
	Fri, 27 Nov 2020 20:23:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD2C3F8019D; Fri, 27 Nov 2020 20:23:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18892F800E0
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 20:23:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18892F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="HePpRZtA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606505000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=FE1VeygfaaIjZiXkpb2+4qiM4KZKUB7XA3OmjLaRGCo=;
 b=HePpRZtAVswy0yE9nuYCv4kSXHxdkJ9zhqN84IuOsDfdw6+F6dU9XNCrGoatxIQ5Xkesq4
 //pu+UjeDsqYgdwzcaPJI0EQW1c4hB3oMaTc3GI5wv8YlPTy+9nBU9q59Ysli4+JhDxuc5
 ODFDHAl79euyQSMywEtNSFQTRJ06CdI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-hOQvVIK7MlCoa1FwBefI9g-1; Fri, 27 Nov 2020 14:23:18 -0500
X-MC-Unique: hOQvVIK7MlCoa1FwBefI9g-1
Received: by mail-qt1-f198.google.com with SMTP id t22so3775761qtq.2
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 11:23:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FE1VeygfaaIjZiXkpb2+4qiM4KZKUB7XA3OmjLaRGCo=;
 b=PRN137ox0zfAwiu6IKDitd3tduII2rinXwa99S+WAE4u2BxfMz4Kq4NJa28i3qbqhj
 z/fuOA1UKih2KdbgVYbQ952s98HNbhhEKPOkwyFS9PzkMgMzN2zaDFcFVttoPorVSAIB
 EFiW9Xy/CrGy51j5m772hdcgwgrZiNJLqs9ThePRJxpdpVIsJtem5GhHkp3gV7TvIyTb
 8DxnyUAaHFzwI7gQI4Q1rOqtWGRMb5gyZkgQYmMwoL+1vvej7d+0Ama7GEbVwek40x+q
 ekOr1G8fdYdgZuCfGmcSVVI8st0RmfVj8ZyS+dkny+vjKaXl9W0LKq8JnOWDRe/DBzfn
 mgTg==
X-Gm-Message-State: AOAM533XNq6pgf0yq2Rld2Dm+fpEN/lI55Ep/CfPh30NBbCBBAnC3mjZ
 GlhPSmwmpuQsKZJhjMqwkUgUZkV+idsFfx+YBmZwqUwyoR1/mHH1EaR7DKMlxf1+Dv9YBG7zaT7
 m5oRvqLQShjdTB8v8Cg3X4PI=
X-Received: by 2002:ac8:48c1:: with SMTP id l1mr9740977qtr.341.1606504997738; 
 Fri, 27 Nov 2020 11:23:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzR0qnX4kmZyDLuCqAE19U8+hDWgxoJ8eomxF1lEcQxzP9PivHfRg0Vd3CT64Ey8C9K/NDDZA==
X-Received: by 2002:ac8:48c1:: with SMTP id l1mr9740954qtr.341.1606504997430; 
 Fri, 27 Nov 2020 11:23:17 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id 9sm7231178qkm.81.2020.11.27.11.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:23:16 -0800 (PST)
From: trix@redhat.com
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] ALSA: remove trailing semicolon in macro definition
Date: Fri, 27 Nov 2020 11:23:12 -0800
Message-Id: <20201127192312.2861127-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
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

The macro use will already have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 include/sound/hda_codec.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 73827b7d17e0..2e8d51937acd 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -344,7 +344,7 @@ snd_hda_get_num_conns(struct hda_codec *codec, hda_nid_t nid)
 #define snd_hda_get_raw_connections(codec, nid, list, max_conns) \
 	snd_hdac_get_connections(&(codec)->core, nid, list, max_conns)
 #define snd_hda_get_num_raw_conns(codec, nid) \
-	snd_hdac_get_connections(&(codec)->core, nid, NULL, 0);
+	snd_hdac_get_connections(&(codec)->core, nid, NULL, 0)
 
 int snd_hda_get_conn_list(struct hda_codec *codec, hda_nid_t nid,
 			  const hda_nid_t **listp);
-- 
2.18.4

