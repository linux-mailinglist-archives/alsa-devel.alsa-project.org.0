Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EF1788386
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 11:29:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE4467F1;
	Fri, 25 Aug 2023 11:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE4467F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692955762;
	bh=YVkGggTYqSysMBCLP+AXm7JrumFEt7U/n/5sllbKTvY=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BjswJPZBPhF7bN0Uae0tFPwKK7huebWcTz4QyPzbGE9mhTyM2maIDB0EUWSz2C+SA
	 4Op52Pheco3vugsvFcIpqK/1IUdBtXVg/XT6rjPBQfgmZOEtAWit5CaOTqkBD66/1z
	 HR0MU3Az+ubkNL9V50dHTwCt+QuNQeNNHTITkOds=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90A3DF8022B; Fri, 25 Aug 2023 11:28:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20D10F800D1;
	Fri, 25 Aug 2023 11:28:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CD50F800F5; Fri, 25 Aug 2023 11:28:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 101A5F800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 11:28:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 101A5F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Rdj1nc25;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=afzlgD3M
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 635982072B;
	Fri, 25 Aug 2023 09:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692955701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=zR/jXqMNiL92iHRvl55DbA6q/2yupeCf1lNP6V7xICA=;
	b=Rdj1nc25zdDzdz7oBFoltKFuvx3L3Cnq3/eMPrt+m5dmRj+k+1bs5n3AvghUBFqQZyfFuN
	k3svnaiWeZQVs3PC+bxTzAVfv0u+f5UcEXJZhaq744As0QLVWt5RDD+jjZrVZnOZ3ToK0t
	nzwZSatsHh8T2N+lTyGewkyKM/El+2Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692955701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=zR/jXqMNiL92iHRvl55DbA6q/2yupeCf1lNP6V7xICA=;
	b=afzlgD3MbEpZ09fmQxItKxs8YlJ5YxPzlnJUsmpzc1UI8yStU03JfV7xTyzAs8doku0wbR
	ru1BraYCbzOKuPCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 45804138F9;
	Fri, 25 Aug 2023 09:28:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KFCNDzV06GSABAAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 25 Aug 2023 09:28:21 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Add missing dependency on CONFIG_EFI for Cirrus/TI
 sub-codecs
Date: Fri, 25 Aug 2023 11:28:19 +0200
Message-Id: <20230825092819.12340-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VVHKMT2SPQPCRLTAOTO4L5WFCMYWF37Y
X-Message-ID-Hash: VVHKMT2SPQPCRLTAOTO4L5WFCMYWF37Y
X-MailFrom: tiwai@suse.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VVHKMT2SPQPCRLTAOTO4L5WFCMYWF37Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The CS35L41 and TAS2781 sub-codecs depend on CONFIG_EFI, as they have
the code accessing efi variable directly.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308250621.1lwt7PtZ-lkp@intel.com/
Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 91db5f8f00b6..0d7502d6e060 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -104,6 +104,7 @@ config SND_HDA_SCODEC_CS35L41_I2C
 	tristate "Build CS35L41 HD-audio side codec support for I2C Bus"
 	depends on I2C
 	depends on ACPI
+	depends on EFI
 	depends on SND_SOC
 	select SND_SOC_CS35L41_LIB
 	select SND_HDA_SCODEC_CS35L41
@@ -119,6 +120,7 @@ config SND_HDA_SCODEC_CS35L41_SPI
 	tristate "Build CS35L41 HD-audio codec support for SPI Bus"
 	depends on SPI_MASTER
 	depends on ACPI
+	depends on EFI
 	depends on SND_SOC
 	select SND_SOC_CS35L41_LIB
 	select SND_HDA_SCODEC_CS35L41
@@ -165,6 +167,7 @@ config SND_HDA_SCODEC_TAS2781_I2C
 	tristate "Build TAS2781 HD-audio side codec support for I2C Bus"
 	depends on I2C
 	depends on ACPI
+	depends on EFI
 	depends on SND_SOC
 	select SND_SOC_TAS2781_COMLIB
 	select SND_SOC_TAS2781_FMWLIB
-- 
2.35.3

