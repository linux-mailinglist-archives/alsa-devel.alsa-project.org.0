Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4253E5EEF2D
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 09:36:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75F0015CA;
	Thu, 29 Sep 2022 09:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75F0015CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664437012;
	bh=hR40GrK1IkVRvSsWtdZwW7WRaEGmzyACxc6bmo5Oo4I=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Np7e51tfhrhX9du/1s5cF7u8OF9nDtVlZ63jFNz1SKUQj1FBbrNAtzvfxFsrtG1vm
	 Z44pvlPsDikPlPOhSwZqSp9tpvOILbfrzIvImmcjoKx8Rvv2w7f/cQwvG4PbsnZ0Ui
	 fiLQ1YOBlgtnL2RupMKSBKExDtAo9qF8p7MpTAQU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CECD5F804B4;
	Thu, 29 Sep 2022 09:35:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49BE2F8016D; Thu, 29 Sep 2022 09:35:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AED9F80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 09:35:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AED9F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="kVTNoVKw"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="sn2SvKXs"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EB47221C58;
 Thu, 29 Sep 2022 07:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664436950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zkPuxZ1wfhQnLcrupMqYsa/pOIl2UZ1E2r4lwI/MEFk=;
 b=kVTNoVKw5ZcGzVW4hQiTyo8rWVJ+Se3nvTzP5Efe3uqV2UKlA/fJ8cDzn5vlZ5UNQXBOGA
 YmK+U00DX1lTZrCdHbpETqKSslvdm6J33DBPG6WR/gCGoWGkAkuWtN73xeGtWxIpB24grJ
 kjBVJ6T7S1bJaz9/wqHvtUVyOsMuS10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664436950;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zkPuxZ1wfhQnLcrupMqYsa/pOIl2UZ1E2r4lwI/MEFk=;
 b=sn2SvKXsqaed3/hInNVCvGSCIuADHUAfMdeU8XZhew45qrvLfqoWFd/Ong3ZK7dP90Lmfd
 doFDy+57W1kPq6BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CDA3C1348E;
 Thu, 29 Sep 2022 07:35:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wcYWMdZKNWMFfQAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 29 Sep 2022 07:35:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/8] ALSA: hda: Add model option to codec drivers, too
Date: Thu, 29 Sep 2022 09:35:37 +0200
Message-Id: <20220929073545.1085-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi,

this is a trivial patch set to add the "model" option to each HD-audio
codec driver that works equivalently with snd-hda-intel or SOF
driver's model option.  It makes it easer for users to specify the
quirk to the right target.


Takashi

===

Takashi Iwai (8):
  ALSA: hda/realtek: Add model option to codec driver, too
  ALSA: hda/cirrus: Add model option to codec driver, too
  ALSA: hda/conexant: Add model option to codec driver, too
  ALSA: hda/cs8409: Add model option to codec driver, too
  ALSA: hda/analog: Add model option to codec driver, too
  ALSA: hda/sigmatel: Add model option to codec driver, too
  ALSA: hda/via: Add model option to codec driver, too
  ALSA: doc: Explain more about model option

 Documentation/sound/hd-audio/notes.rst | 16 ++++++++++++++++
 sound/pci/hda/patch_analog.c           | 10 ++++++++++
 sound/pci/hda/patch_cirrus.c           | 10 ++++++++++
 sound/pci/hda/patch_conexant.c         | 10 ++++++++++
 sound/pci/hda/patch_cs8409.c           | 10 ++++++++++
 sound/pci/hda/patch_realtek.c          | 11 +++++++++++
 sound/pci/hda/patch_sigmatel.c         | 11 +++++++++++
 sound/pci/hda/patch_via.c              | 11 +++++++++++
 8 files changed, 89 insertions(+)

-- 
2.35.3

