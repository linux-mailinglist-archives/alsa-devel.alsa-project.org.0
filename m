Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E008C2521CD
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:18:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FB201697;
	Tue, 25 Aug 2020 22:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FB201697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598386716;
	bh=bbSrtAXJEKWCFXFVIVoOp6dY0U3z7kejxTxaYOapOrg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sF2Ln96hCpi10fsHn5iKkr3NGGMjcaZHOarIGnbGQHE/xDd/H+/CrQFmIC+cfbuTQ
	 xkhxhIYmDDAhSUXG/JPekKj1x1qo3Ivqus07Ie9PBvUKfwxIVU04qR9zLsfW/Y3KsZ
	 Fk7FjB98HFCquXdSSLLO8PlbrZAQRHBHVtAwwp7A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02473F80329;
	Tue, 25 Aug 2020 22:11:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC0F1F80328; Tue, 25 Aug 2020 22:11:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC7CCF802F9
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC7CCF802F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gNLeaYTR"
Received: by mail-qt1-x842.google.com with SMTP id k18so10003896qtm.10
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7joicHzwupdYBnuFsGJaO4mRul/OCWauur3CmqWFnlc=;
 b=gNLeaYTRkbkiGNwcpJ/dLe+Nu+nCW7Kp//N3Eue87gEpNJNAmbBPDmVTQZh0mxzkZa
 sb/8GQ41ja4dRa6OLkCHFGRpYljQdQR4ksG5DAvvUrweW+mDtA0T6jczrWZNTK1iV4/F
 GMyZwOIHhNB4lOonbVb6s499AFHFJfwyPsRsu0jH95zI5rvR1oJ6zxxnxjuqN9UcAmVe
 FqKCQMGcr34ZW2Quxzg6NFSnWZihVtXOjN2ug91xQ7Onr+ZZEuMUlsrqPASuKbcd3smW
 G48NEGaKR2PpfouzbIp8tSXfoJi/W2Zu7QquqcX8gRT2l0jqimI8vIH99bSGKJkivS5a
 KfGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7joicHzwupdYBnuFsGJaO4mRul/OCWauur3CmqWFnlc=;
 b=V5HnZBnmvVKpiL70qhcXslIKC91u3JIxpZ2B6N6SBXoyF9dx7r4dPMncO7SuPWXr2k
 lhuk82VheaSzDoJG5QUG265qjrPQljXR1baVqtdm1iJgq3htUL/00svkol3PwkT8jl12
 rZxIMz1N4NeD3vDgXV9P59ojSCzpAaRuXSuIRqoVl7UjV4HdSVsi+u5gr42vhUulXGMd
 CJr2z4otHS+Yu9LT0u31n1PUqfTK9ApgwmHA7nhfQQGTGuuJVIadIPJIhU/cPaNgWSub
 wfPVbsj+oSKYYR8hk6mFbXyf/jEEMlfRAjnul492ioJzNAp8rkEt47GWbC+Veo8pEyA7
 vMgw==
X-Gm-Message-State: AOAM532se4d+pH4KX7CtPlaqcrv/lkbZi5yz6EhIimDUYhtXdi4KgtTm
 gZenL9ZO/Y69qu6nzP6Ncjk=
X-Google-Smtp-Source: ABdhPJwPdoVRrJGRGUCyc1XJ80M70LBeUzfXqDK2XWbHzhrVHb5ZRn3WvirC2StImSW8jmoBgNxKmw==
X-Received: by 2002:ac8:7774:: with SMTP id h20mr10585454qtu.331.1598386278755; 
 Tue, 25 Aug 2020 13:11:18 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:11:18 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 10/20] ALSA: hda/ca0132 - Add new quirk ID for SoundBlaster
 AE-7.
Date: Tue, 25 Aug 2020 16:10:29 -0400
Message-Id: <20200825201040.30339-11-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200825201040.30339-1-conmanx360@gmail.com>
References: <20200825201040.30339-1-conmanx360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, conmanx360@gmail.com,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
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

Add a new PCI subsystem ID for the SoundBlaster AE-7 card.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 138403fd1639..284f63dc2749 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1134,6 +1134,7 @@ enum {
 	QUIRK_R3DI,
 	QUIRK_R3D,
 	QUIRK_AE5,
+	QUIRK_AE7,
 };
 
 #ifdef CONFIG_PCI
@@ -1253,6 +1254,7 @@ static const struct snd_pci_quirk ca0132_quirks[] = {
 	SND_PCI_QUIRK(0x1102, 0x0013, "Recon3D", QUIRK_R3D),
 	SND_PCI_QUIRK(0x1102, 0x0018, "Recon3D", QUIRK_R3D),
 	SND_PCI_QUIRK(0x1102, 0x0051, "Sound Blaster AE-5", QUIRK_AE5),
+	SND_PCI_QUIRK(0x1102, 0x0081, "Sound Blaster AE-7", QUIRK_AE7),
 	{}
 };
 
-- 
2.20.1

