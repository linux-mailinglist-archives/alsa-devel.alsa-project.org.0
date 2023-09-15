Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A383A7A1888
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 10:23:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE7C183A;
	Fri, 15 Sep 2023 10:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE7C183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694766204;
	bh=yPmFxqa/oDREoJOGNrmiN24unhnTilxPj/agOz4qrgw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=A7pOOqtAyIEW6g9069XsQ3JmQOXpWBIxz44owOUBeeiZvHNmCof75LC3nhMZDPgnr
	 9HkThG6c7sTxUEewHT9lhAuZA9xcIe/sV5gCuL02FohQWiZfWcKYIGkyypPko7huIz
	 3p5OF6U9CUrGfBCSVVus5lr6O08YJYmpGaan8jPU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E5DBF80246; Fri, 15 Sep 2023 10:22:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 748F3F80246;
	Fri, 15 Sep 2023 10:22:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C3DFF80425; Fri, 15 Sep 2023 10:22:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CF36F8007C
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 10:22:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CF36F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=g7dfFFhP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=4cCPHdzd
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 88CC6218E5;
	Fri, 15 Sep 2023 08:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694766136;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=o3S9DfckXdFYSaIFJXSrrtRWEgE8xTPJPA0wp0PmiRQ=;
	b=g7dfFFhPkEVMQNbmEJyRq+qBGNWqp60V6CmE3wIJDOC8+FYcB6geUkSCsf2t3oSZRbSVX1
	bxIhgj8m04nbL8ThGNHIO+BNmf/Tsn+8NgvmVJOWM/fix1cjzJhXwyEsmatQe340MIz8Y+
	xipENSMv2y65CGDCAXsXTl3zUpDrpwI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694766136;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=o3S9DfckXdFYSaIFJXSrrtRWEgE8xTPJPA0wp0PmiRQ=;
	b=4cCPHdzd6iu4JAZ9K7LcbEecWNqCmKhYAdMI6SdJv6smzZDQc8XgtqtU4xhUKigDYhc7E6
	e5DV4/mc69hJOsBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6BB991358A;
	Fri, 15 Sep 2023 08:22:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id gyGJGTgUBGWHPgAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 08:22:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: amd: ps: Fix -Wformat-truncation warning
Date: Fri, 15 Sep 2023 10:22:07 +0200
Message-Id: <20230915082207.26200-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RAZZFR3SUYHO67PM4YHPZPBS3EFFD2JH
X-Message-ID-Hash: RAZZFR3SUYHO67PM4YHPZPBS3EFFD2JH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RAZZFR3SUYHO67PM4YHPZPBS3EFFD2JH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The compile warning with -Wformat-truncation at
sdw_amd_scan_controller() is false-positive; the max loop size is
AMD_SDW_MAX_MANAGERS (= 2), hence it fits with the given size.

For suppressing the warning, replace snprintf() with scnprintf().
As stated in the above, truncation doesn't matter.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/amd/ps/pci-ps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 4af3c3665387..7e4c0ec9e56c 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -274,7 +274,7 @@ static int sdw_amd_scan_controller(struct device *dev)
 	dev_dbg(dev, "ACPI reports %d SoundWire Manager devices\n", count);
 	acp_data->sdw_manager_count = count;
 	for (index = 0; index < count; index++) {
-		snprintf(name, sizeof(name), "mipi-sdw-link-%d-subproperties", index);
+		scnprintf(name, sizeof(name), "mipi-sdw-link-%d-subproperties", index);
 		link = fwnode_get_named_child_node(acp_data->sdw_fw_node, name);
 		if (!link) {
 			dev_err(dev, "Manager node %s not found\n", name);
-- 
2.35.3

