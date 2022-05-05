Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E66751C3A2
	for <lists+alsa-devel@lfdr.de>; Thu,  5 May 2022 17:15:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3C821817;
	Thu,  5 May 2022 17:14:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3C821817
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651763729;
	bh=tc6LqsVRTi7B/SH+1s3Zz0DStlbKbQybSIqb6Fq4q9M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QjEbucn/+OPf4ExRnCYDHvOObDZ/Kpp0UinmNhu/s/AC0H/y3EfpH53AEwh80tt5c
	 utQjHwN/Ng8c5mvOqaj5dcaMya0O/ga63HgW4sLCA9WdPMfd5m/G0DzX2jCNza+AeN
	 YLNG8ZqDXTKzGxw0I5J1+tZk9QFmxQcuqzBg7CLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59817F8049C;
	Thu,  5 May 2022 17:14:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 12ED2F800BF; Thu,  5 May 2022 17:14:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0479F800BF
 for <alsa-devel@alsa-project.org>; Thu,  5 May 2022 17:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0479F800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=howett-net.20210112.gappssmtp.com
 header.i=@howett-net.20210112.gappssmtp.com header.b="HJqbB8GQ"
Received: by mail-il1-x131.google.com with SMTP id d3so3019619ilr.10
 for <alsa-devel@alsa-project.org>; Thu, 05 May 2022 08:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=howett-net.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a5fSSzXEickAUpRwYDwsAwK9QQYazjReLp0B85e6Uu4=;
 b=HJqbB8GQoy9+GAlKg+0TrZ6CEPyEOsSLY8f0gKk4Rv0gdlwYx4DCqtT559pbpkEMY9
 0/S6xukfm7M9kSP0yEm0HScWNIqBIO5E0vO/Cv5BeRE6MkCkuRLtQ8jWx41W0RMRUmKo
 Eq+YkFr4gWQsBj3deIWRSv9KPG9QxxPwSbZCP24U0Yp3aRhgqtbl9QaX0BMtukqM7Xas
 UE7IELyhbjF1w0V6xnGeUuYJFj8sl1kgg+n9Tfasa52eEVX9Jy+WVCIFlCSoY8UaBRz2
 A6Z0zO1k+UyN80sv2AG06KYNaAnIlFR9PHMy0az9f29L3sSYdYlTXjfRzq0aDE1ht6fG
 CT3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a5fSSzXEickAUpRwYDwsAwK9QQYazjReLp0B85e6Uu4=;
 b=YLI4AkR5rzgRDUdj75SHhiJMZFBl1UnG29bbLJFYmOS07Sqlj5Xq43ygjzxiT1FFvF
 C/chSdsliT+fEekhnlOIU55HwCAOGB3oTtei9bVz8/B0Nl6fKSeglQ7TJgBQXFEbrvlX
 hok6ys32V6ORngxLRHfuJdooyUXso3Mvps+/2lrQ87tRZbJ/9eTFypg2SIq1rgzQ9c0T
 EI4nT3+x2FwkmvHTsWQizvUyNR/y/rV6/5I6Us+EaV7xDC9fGUmZzU7J+OImcVjwSIbu
 56xJwlR0oJjjQlefnTzOEd71QUxK+m8YWYnj6WQMssxV8DFx0tzB/N+axpVRj0virk84
 F+Bg==
X-Gm-Message-State: AOAM532pgEoZ9ltsEGjjc/C2qBwQvv15+3aejCMt7yvZFAQp05Na435T
 M5kOWSWy8wJyj1P7CIPcLmiSghYKc28pToC/
X-Google-Smtp-Source: ABdhPJwv2VTl0kyVdvjLyHWsa5RFCPye1iGRZvhC5H/7/X/9WL2KmF0AEYGEHN8qeQdK6sYcZOwuCA==
X-Received: by 2002:a92:ab04:0:b0:2c7:aa89:d17e with SMTP id
 v4-20020a92ab04000000b002c7aa89d17emr11338438ilh.108.1651763658909; 
 Thu, 05 May 2022 08:14:18 -0700 (PDT)
Received: from rigel.delfino.n.howett.net
 (99-107-94-179.lightspeed.stlsmo.sbcglobal.net. [99.107.94.179])
 by smtp.googlemail.com with ESMTPSA id
 d24-20020a056602329800b0065a47e16f55sm500602ioz.39.2022.05.05.08.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 08:14:18 -0700 (PDT)
From: "Dustin L. Howett" <dustin@howett.net>
To: alsa-devel@alsa-project.org
Subject: [PATCH v1] ALSA: hda/realtek: Add quirk for the Framework Laptop
Date: Thu,  5 May 2022 10:14:33 -0500
Message-Id: <20220505151433.2893-1-dustin@howett.net>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Dustin L. Howett" <dustin@howett.net>
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

Some board revisions of the Framework Laptop have an ALC295 and have an
issue detecting headset microphones. The "dell-headset-multi" fixup
addresses this issue, but its application requires an end-user or
distributor to opt in.

f111:0001 is Framework's PCI VID:PID for this board.

Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 4c0c593f3c0a..a1b45c72e9b1 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9294,6 +9294,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x8086, 0x2074, "Intel NUC 8", ALC233_FIXUP_INTEL_NUC8_DMIC),
 	SND_PCI_QUIRK(0x8086, 0x2080, "Intel NUC 8 Rugged", ALC256_FIXUP_INTEL_NUC8_RUGGED),
 	SND_PCI_QUIRK(0x8086, 0x2081, "Intel NUC 10", ALC256_FIXUP_INTEL_NUC10),
+	SND_PCI_QUIRK(0xf111, 0x0001, "Framework Laptop", ALC269_FIXUP_DELL1_MIC_NO_PRESENCE),
 
 #if 0
 	/* Below is a quirk table taken from the old code.
-- 
2.36.0

