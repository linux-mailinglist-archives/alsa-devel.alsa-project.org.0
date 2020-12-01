Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7752CFA6C
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 09:05:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AB8A18D7;
	Sat,  5 Dec 2020 09:04:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AB8A18D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607155503;
	bh=aolf/JTFx8UwBgnU90Rlf5q5kYjL3ySZ4Yh56LQpZUk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QBpRtU08ipgfDrBEP+Mf1k+sY42S/xzRo4Lx1QcynkLgIU0Yr/55CCRnXAwID/lyS
	 0Kr/95kl9/Ao0dxlJYqADFkRaqQijuvDC4L5emSHQPB6fmjTTJ+dCxnRPilWDin6vZ
	 EM7RblMPXfP3M9vjeOrzfktx/zrVpvLYckREuhXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25086F80290;
	Sat,  5 Dec 2020 09:03:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A39EFF80139; Tue,  1 Dec 2020 10:07:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84E85F80139
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 10:06:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84E85F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.b="Xt5BMYMR"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDF5E206C1;
 Tue,  1 Dec 2020 09:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1606813611;
 bh=aolf/JTFx8UwBgnU90Rlf5q5kYjL3ySZ4Yh56LQpZUk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Xt5BMYMRdrS7+eSNdwB/ABwr1rAn1fyshUyftM4XExQiKe+Dc/EUhGkdgaGlUC9oA
 OPwYmKrb6Ku0YRRKDe2TIlwgdh/vqSZ5Vt+rDCRddkz8ZRO6af8s5K+3xFeu2BQLaC
 VLKnSmglR86RhEY6YrHqa6CeXf/sQm2s6Zla5f38=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.4 91/98] ASoC: Intel: Skylake: Remove superfluous chip
 initialization
Date: Tue,  1 Dec 2020 09:54:08 +0100
Message-Id: <20201201084659.522735398@linuxfoundation.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201084652.827177826@linuxfoundation.org>
References: <20201201084652.827177826@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 05 Dec 2020 09:03:15 +0100
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 stable@vger.kernel.org
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

From: Cezary Rojewski <cezary.rojewski@intel.com>

commit 2ef81057d80456870b97890dd79c8f56a85b1242 upstream.

Skylake driver does the controller init operation twice:
- first during probe (only to stop it just before scheduling probe_work)
- and during said probe_work where the actual correct sequence is
executed

To properly complete boot sequence when iDisp codec is present, bus
initialization has to be called only after _i915_init() finishes.
With additional _reset_list preceding _i915_init(), iDisp codec never
gets the chance to enumerate on the link. Remove the superfluous
initialization to address the issue.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200305145314.32579-2-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: <stable@vger.kernel.org> # 5.4.x
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/soc/intel/skylake/skl.c |   13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -807,6 +807,9 @@ static void skl_probe_work(struct work_s
 			return;
 	}
 
+	skl_init_pci(skl);
+	skl_dum_set(bus);
+
 	err = skl_init_chip(bus, true);
 	if (err < 0) {
 		dev_err(bus->dev, "Init chip failed with err: %d\n", err);
@@ -922,8 +925,6 @@ static int skl_first_init(struct hdac_bu
 		return -ENXIO;
 	}
 
-	snd_hdac_bus_reset_link(bus, true);
-
 	snd_hdac_bus_parse_capabilities(bus);
 
 	/* check if PPCAP exists */
@@ -971,11 +972,7 @@ static int skl_first_init(struct hdac_bu
 	if (err < 0)
 		return err;
 
-	/* initialize chip */
-	skl_init_pci(skl);
-	skl_dum_set(bus);
-
-	return skl_init_chip(bus, true);
+	return 0;
 }
 
 static int skl_probe(struct pci_dev *pci,
@@ -1080,8 +1077,6 @@ static int skl_probe(struct pci_dev *pci
 	if (bus->mlcap)
 		snd_hdac_ext_bus_get_ml_capabilities(bus);
 
-	snd_hdac_bus_stop_chip(bus);
-
 	/* create device for soc dmic */
 	err = skl_dmic_device_register(skl);
 	if (err < 0) {


