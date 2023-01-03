Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3E565BD7C
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 10:54:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 448CED175;
	Tue,  3 Jan 2023 10:53:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 448CED175
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672739688;
	bh=hRZAGDL43Lg6IJQy6YngEE/NKTchUt5oxhWr3528qwE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=X5S5xsDjYIif0ap2bPNay2YEWtr+P+jvL1GawW6QZ2RynCgndzGta+fjKzRlcPQdZ
	 wgEMEPUrx+tABN+T08A1USNp/xc2+blkanS9jxQJUcB9LPxu7C7y1nghbpen6DNPlk
	 9vKEd9tifptJuwoWdRWzIrfowL38YC9LKUA//kwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82D3FF800C0;
	Tue,  3 Jan 2023 10:53:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFBF5F804AA; Tue,  3 Jan 2023 10:53:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D915F803DC
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 10:53:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D915F803DC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=Hxif4Dq8
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 81210445A2
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1672739620;
 bh=yHJKB+fSNEIK3AP5YIvFqV8vwGwGNgGxp7RxKevK/jQ=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=Hxif4Dq850RtQe/u/zmco55q/Rfo24mrhBL2Iibfzt4Z5uDu3zAZBfwsRBWl8yOJ5
 yvHQj+3WIqqaM3drrccnK1wWnnUQfqKPNGXqlzjAzmgA5asWO5e96y/8VvS3IlHTk6
 7pOd3oYvJjBpCd+Y7/jCkqH+NUwgw+axBvyTJwjlN61XB7yQcl+N43nE/0ea1GwE0C
 58aaLx4Fnzs2YKo4TPa+CYaK4/XN/1ZG3WdL6Ma8mlHMw3kOp2tf/YNloJql4+YBEE
 gIB90hYI7EE1OlWZrUIXoYL5y9urCsbXgpxrouF83zpVLEQbRfB+oahAZ7Y6oqiXf6
 ICIwkVW3lwQnw==
Received: by mail-pf1-f200.google.com with SMTP id
 u3-20020a056a00124300b0056d4ab0c7cbso13792576pfi.7
 for <alsa-devel@alsa-project.org>; Tue, 03 Jan 2023 01:53:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yHJKB+fSNEIK3AP5YIvFqV8vwGwGNgGxp7RxKevK/jQ=;
 b=bWz/m3ad1nQfC6R4iiqTOyqpp7KUnoW9vd2Xk+/6dHOsWkiKF/v7EY/kgOVv6w+87V
 mvSGHdO39UnTLYxv4dfmGNvGnpkEQkCDZKl5ML33JTQWVwtsABv/LKg/MImFi++50f1c
 wXf3Qpe3Iem+FpM3+RleTy8NStXrPbcI+zpnePvPW0xcwjwp8wlKnyIcTVYoYJO/a3Sv
 GJKj4bFxqD46uPaf7a/eFKZ08xqaoa1+aF1fNb+U6wTZirdAV8mZvtBfOMv0Qs0iToOM
 LjZfby2GOF2g2skuk7KsMMN/MCXD1fidCMwiyCsj1htpccny3V7F+gp3w++ph9nhnHqq
 Jm8A==
X-Gm-Message-State: AFqh2kpZGY4kykN1eRmAwcnUnhs3fRfZ6TbDe4viygOuRVITk32YErG/
 mkJXSty84pAGkIz9qnYt3h7nFZY16VEESs+7rDWyXsRBx8lKupnoC22JE6bogpVcNSXlbwtB1+u
 zIaFGRaRo9aDPlJNeOiS4Q0g9YF2wrasNpkiFKLdo
X-Received: by 2002:a05:6a00:1485:b0:57f:ef11:acf6 with SMTP id
 v5-20020a056a00148500b0057fef11acf6mr54271128pfu.8.1672739618889; 
 Tue, 03 Jan 2023 01:53:38 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtaPaDrufHUdaK6arDfIwoov0wJ4tFTXKqQo+uUewMj+DvO4wiTj4XJGjVUYJJYVhBM0ei7SA==
X-Received: by 2002:a05:6a00:1485:b0:57f:ef11:acf6 with SMTP id
 v5-20020a056a00148500b0057fef11acf6mr54271106pfu.8.1672739618339; 
 Tue, 03 Jan 2023 01:53:38 -0800 (PST)
Received: from u-Precision-5560.mymeshdevice.home
 (2001-b011-3817-354b-917f-f33f-4816-b377.dynamic-ip6.hinet.net.
 [2001:b011:3817:354b:917f:f33f:4816:b377])
 by smtp.gmail.com with ESMTPSA id
 x19-20020aa79ad3000000b005811c421e6csm15210748pfp.162.2023.01.03.01.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 01:53:37 -0800 (PST)
From: Chris Chiu <chris.chiu@canonical.com>
To: tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH] ALSA: hda - Enable headset mic on another Dell laptop with
 ALC3254
Date: Tue,  3 Jan 2023 17:53:32 +0800
Message-Id: <20230103095332.730677-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Chris Chiu <chris.chiu@canonical.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

There is another Dell Latitude laptop (1028:0c03) with Realtek
codec ALC3254 which needs the ALC269_FIXUP_DELL4_MIC_NO_PRESENCE
instead of the default matched ALC269_FIXUP_DELL1_MIC_NO_PRESENCE.
Apply correct fixup for this particular model to enable headset mic.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3794b522c222..f75d26acf5ee 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9239,6 +9239,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0b1a, "Dell Precision 5570", ALC289_FIXUP_DUAL_SPK),
 	SND_PCI_QUIRK(0x1028, 0x0b37, "Dell Inspiron 16 Plus 7620 2-in-1", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
 	SND_PCI_QUIRK(0x1028, 0x0b71, "Dell Inspiron 16 Plus 7620", ALC295_FIXUP_DELL_INSPIRON_TOP_SPEAKERS),
+	SND_PCI_QUIRK(0x1028, 0x0c03, "Dell Precision 5340", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1028, 0x0c19, "Dell Precision 3340", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x0c1a, "Dell Precision 3340", ALC236_FIXUP_DELL_DUAL_CODECS),
 	SND_PCI_QUIRK(0x1028, 0x0c1b, "Dell Precision 3440", ALC236_FIXUP_DELL_DUAL_CODECS),
-- 
2.25.1

