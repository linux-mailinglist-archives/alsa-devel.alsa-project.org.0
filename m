Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09638258C94
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 12:17:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA6111797;
	Tue,  1 Sep 2020 12:16:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA6111797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598955453;
	bh=2jwMG1eSEm68j/iDhSAUfMG3iMsKfWRveyX8PRt7vyQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SpxoqeVu/cN1DyzNJdJ1bdZfqsEyI3ECqGNAQ2aJTO53InW6QJ3l+9+tFNPNf/c06
	 peapVu7++sKoLfzW/qx/UF00dwPPoERhdiTbobBK+CQ52aQowsuxMWzzLDQHbnDO1Z
	 WUeWkn5DKPalGbcQ9bbk7Jn6ih481h7EMb8kIVcI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFCCDF800BA;
	Tue,  1 Sep 2020 12:15:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 644F2F8025A; Sat, 29 Aug 2020 04:50:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,FROM_LOCAL_NOVOWEL,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EA611F8012E
 for <alsa-devel@alsa-project.org>; Sat, 29 Aug 2020 04:50:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA611F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GO5xF9C/"
Received: by mail-lj1-x242.google.com with SMTP id t6so904805ljk.9
 for <alsa-devel@alsa-project.org>; Fri, 28 Aug 2020 19:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eXF1rOFuCr3upnhNqTnjSrFjSuVCSRU/UPn3kL/3JLM=;
 b=GO5xF9C/82hbVlcWwH7u8XM1zbiWqZnbLEEO/zkuR58wfbviBVgMGdG+HP47S9CQRE
 HYPhM81j3VGo3Ya8I/pqRaMsmxyQAlTCMokvA42f0Wj1Em33siYrKhEwuL49FDbExgMh
 NIeRu7NfzbRXLUnITTXW3e05ywpp4oGmhX3rK9z6u8rxCmMsQTA8WYnCTxvLXmaLc4Py
 Sla8s92HaYvfiAABoZMhWRxovWZmRSZsRrWH0Oa5yi0RiYwP1uN3/0ibGE2XlOpYh6+D
 ba93Yjym83rg1YwRdVeJNWsSEcKX4PiBri+iXKE32Gtt/nlVoJCGnFD/KCm4pFA1zjIz
 kubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eXF1rOFuCr3upnhNqTnjSrFjSuVCSRU/UPn3kL/3JLM=;
 b=fi1eTZk1gcwvLmNuU87svRl56Uhlp+Rt89risAEJ8zaInlCmX6Dkq4tSeGa3nE80Wb
 TfXmG2TZohn6GjQpN2dSgNH/93PwtAe+9pcYtp8S+3ZR8k1oAh2Sx0Z1AzatCf665m/2
 bZ2HQCTq3AbzpVohTPyUxGkcXdGlvJiGeKBCSy4b1FxfmlZ2Vp9gPP35N0+0Jbm60Qq6
 JpsmAer5AAcAf/UMfK49PrBvMEzCK061Zv6qS0wX1sVvDW11iJiSUtPMZR5RWrcvNpA9
 PsCzReie8BY3CZvAQ8ujjM2Ct9HxKZDpTwkLniPAqbthS6qQgOhCwAou3RnYjyubiMSk
 J6BQ==
X-Gm-Message-State: AOAM531+iR9UU1gXMbq8IsdGeg0a7W6FS0zztZ7l42OgavNImSH1MYHp
 /1PQFEXSn9JHgg6pl1TI1vw=
X-Google-Smtp-Source: ABdhPJx9M52yBfWstyboe2DL1nMa9c7HTffEByyRLokHMLfNrhdwIshhk5FIaUbaTjla0ovxm+yQHg==
X-Received: by 2002:a2e:730f:: with SMTP id o15mr637875ljc.297.1598669413163; 
 Fri, 28 Aug 2020 19:50:13 -0700 (PDT)
Received: from localhost.localdomain ([178.73.195.107])
 by smtp.googlemail.com with ESMTPSA id i20sm217069ljb.90.2020.08.28.19.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 19:50:12 -0700 (PDT)
From: Dan Crawford <dnlcrwfrd@gmail.com>
X-Google-Original-From: Dan Crawford <dnlcrwfrd@gmail>
To: tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] Fix silent audio output and corrupted input on MSI X570-A
 PRO
Date: Sat, 29 Aug 2020 12:49:46 +1000
Message-Id: <20200829024946.5691-1-dnlcrwfrd@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 01 Sep 2020 12:15:51 +0200
Cc: Dan Crawford <dnlcrwfrd@gmail.com>
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

From: Dan Crawford <dnlcrwfrd@gmail.com>

Following Christian Lachner's patch for Gigabyte X570-based motherboards,
also patch the MSI X570-A PRO motherboard; the ALC1220 codec requires the
same workaround for Clevo laptops to enforce the DAC/mixer connection
path. Set up a quirk entry for that.

I suspect most if all X570 motherboards will require similar patches.

Related buglink: https://bugzilla.kernel.org/show_bug.cgi?id=205275
Signed-off-by: Dan Crawford <dnlcrwfrd@gmail.com>
---
 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index a1fa983d2..a52d8640e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -2474,6 +2474,7 @@ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1462, 0x1275, "MSI-GL63", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x1276, "MSI-GL73", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x1293, "MSI-GP65", ALC1220_FIXUP_CLEVO_P950),
+	SND_PCI_QUIRK(0x1462, 0x9c37, "MSI X570-A PRO", ALC1220_FIXUP_CLEVO_P950),
 	SND_PCI_QUIRK(0x1462, 0x7350, "MSI-7350", ALC889_FIXUP_CD),
 	SND_PCI_QUIRK(0x1462, 0xda57, "MSI Z270-Gaming", ALC1220_FIXUP_GB_DUAL_CODECS),
 	SND_PCI_QUIRK_VENDOR(0x1462, "MSI", ALC882_FIXUP_GPIO3),
-- 
2.28.0

