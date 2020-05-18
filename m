Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3CB1D706C
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 07:42:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE5FF16B8;
	Mon, 18 May 2020 07:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE5FF16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589780543;
	bh=PJzSwtcwzc3nyfrEFsOqEU4Y9oHXTUK3buTLzjUsONk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NkZim8jvVhC7ZmDhn3J79TxoFPz6z+hqUL6naLICzVlvFZbqCbjQOF1ZImedcMrtA
	 bN3TnLN4woNs8Vt2Ctq46jKFRPW/tHmnpoVsFbHRYRBMGxExpMfaH7ApgiOMkCXQq/
	 xi7nTVneMTk3BjNq1xEEsQOO3TpzBSzLHnUslHRo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3D00F80213;
	Mon, 18 May 2020 07:40:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BC09F801F9; Mon, 18 May 2020 07:40:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92CC5F8015C;
 Mon, 18 May 2020 07:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92CC5F8015C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BWbKsITb"
Received: by mail-wr1-x443.google.com with SMTP id e1so10224066wrt.5;
 Sun, 17 May 2020 22:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MMjdutDALIvUMNOO7cn1LHe7cERFsIE93IZCcxogKmw=;
 b=BWbKsITbbG866jhVuiZepJkHVHJOaUij5ISLXVpxTxg43x/HutmxHTwsvztFoW4oWG
 nMgHkfnZT2QmDPL0cQGLGaFkTfDcmQrvIlfXsGekYzv8Zzh4/rFUCxdyjJuR0Pu/ogUy
 5eBvnwI9oVp3A2b1csE72HZEy+S/hHPY9sPZ8VC/BcIvKc29BmibhuVFw/jKVZyKNzVn
 VzLxRykordK+Y9xUTf04UKsMXZYrs6C2VdvKaYsnF0Oc57UWkyYTngAIRif5m5Pf5O/b
 GKtt2JURlSmjhcW7qYdYD4rmw9cWWhC3TImQnhCiqHaPQ43cdHkFl89vz4Z/AIpwqL71
 M7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MMjdutDALIvUMNOO7cn1LHe7cERFsIE93IZCcxogKmw=;
 b=VHCF3IKwDnTBENjm+7W/MUbs+NXib1YaFrHOPPFCCcIbIHcX+2Bz0DbZqNCOBCyD2a
 lP6UeRIbCSg1iv4EmjZ7T1vQOMbZ7qAC185i8t8umjackPbzQD/dCqF9vnVpcY2mt7Kq
 eDkJa4YLes4+YK8azzcv8CQ9sdpFXiTwe5JxtapzffDFadrXvG8a05wc40Tnw2WRjMUu
 RZYCUPHdmNtNPiRiaJZ+gmTHu53Xa8jyMQkgYiv6Qx+DnJY5vrxVXY1Ox+ztUADvwo16
 F2oL+qgQe7fUu+dKmVOUCPmLfHFd0YfSzp5foXq2QB5xV/i+eXtLqttjhwtwq3NH5jZz
 FxMw==
X-Gm-Message-State: AOAM530gPhGTeQfN9JkvLfBn4UVTN7L9g5BDsBKlK2VNY1TJFFfs+ACB
 acsDFv4VeJMdvkCIdJb+ihhFqME2RyU=
X-Google-Smtp-Source: ABdhPJyAFR8sIj+RWb8fxtbh0zuEGOHKesXlOWZ3ydOzH2ChVJpz1b1krsWqNbdokP5bFXOF3omzBQ==
X-Received: by 2002:a5d:65d0:: with SMTP id e16mr14220592wrw.371.1589780430165; 
 Sun, 17 May 2020 22:40:30 -0700 (PDT)
Received: from cosmos.lan (84-114-134-91.cable.dynamic.surfer.at.
 [84.114.134.91])
 by smtp.gmail.com with ESMTPSA id q14sm15410069wrc.66.2020.05.17.22.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 22:40:29 -0700 (PDT)
From: Christian Lachner <gladiac@gmail.com>
To: patch@alsa-project.org
Subject: [PATCH 0/1] Fix silent output on Gigabyte X570 Aorus Xtreme
Date: Mon, 18 May 2020 07:38:43 +0200
Message-Id: <20200518053844.42743-1-gladiac@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Christian Lachner <gladiac@gmail.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, linux-kernel@vger.kernel.org
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

The Gigabyte X570 Aorus Xtreme motherboard with ALC1220 codec
requires a similar workaround for Clevo laptops to enforce the
DAC/mixer connection path. This patch sets up a quirk entry for
that. It was successfully tested by a user on BugZilla (see BugLink).

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=205275

Christian Lachner (1):
  ALSA: hda/realtek - Fix silent output on Gigabyte X570 Aorus Xtreme

 sound/pci/hda/patch_realtek.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.26.2

