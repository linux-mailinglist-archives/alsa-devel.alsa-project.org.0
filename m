Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECE281DC0C
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:20:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6865AE0F;
	Sun, 24 Dec 2023 20:20:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6865AE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703445634;
	bh=LrjCYZnFSgffS/6U7CmEIZhgtWfMidINfonSB91xTFw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IFV4o2PJpvgXFLrNFd1jRWlK6zv/08EjK+1Bw4DvI/QCY31NiVtY1rtfxo8OxrI7g
	 OgiNv+YE0PSTBXE4oIIk7R//NoFAP7jNMJSuxYSLCA08saEJcR0Y+KWyII0t+bZFP9
	 KYeNlfavXSKzheyFZwwzcRMByw5QWohH/i4TIaJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 545A2F8057A; Sun, 24 Dec 2023 20:20:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 265D1F8057B;
	Sun, 24 Dec 2023 20:20:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BED83F8016D; Sun, 24 Dec 2023 20:18:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CA3EDF800F5
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:18:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA3EDF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=ZgUMQZMg
Received: by m.b4.vu (Postfix, from userid 1000)
	id 15964604B9CB; Mon, 25 Dec 2023 05:48:35 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 15964604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703445515; bh=QLLZyfnpe9U8bhEl35okB5639hIvl6fOvsNMUeOD5DY=;
	h=Date:From:To:Cc:Subject:From;
	b=ZgUMQZMgpf8bwAL1LIUPBv6/ZSq1t4FM1yj9KjBge5PBLZLmp+8hJJlHKSVeWoFiB
	 w9qTt0CQAgzIl3KZlIJAH9cU88zXhCAg3zUrPmtO+N2UczagP+Ls3DCOJotP6BreUC
	 3QFXU90UTh/+yDiyJ5RuyicrY8gzePZnF8XZOQ6Xj1/lP6cY9c+yXmtRP8u0hEwgYW
	 Dc7o3VnLAUmO+g6aPbHJKnSDkgx8NxtK4QUhpi62hpLiQuhSCqg7AOnj4fPDgmbYPk
	 2wyTVtPFhPfn7otWMvOtJwCcknvzO5w21Uggjd1nd1flzQl3t63FksMNBfToOElhZS
	 fsvIhSQuAwqkg==
Date: Mon, 25 Dec 2023 05:48:35 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 00/23] ALSA: scarlett2: Refactor in preparation for gen4
Message-ID: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: QTMJZXQASR4NCD3BBHYOUJ7F3NLA7HTR
X-Message-ID-Hash: QTMJZXQASR4NCD3BBHYOUJ7F3NLA7HTR
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QTMJZXQASR4NCD3BBHYOUJ7F3NLA7HTR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

This series is preparation for adding support for the Focusrite
Scarlett 4th Gen devices. It applies on top of the previous series
https://lore.kernel.org/linux-sound/cover.1703001053.git.g@b4.vu/
"ALSA: scarlett2: Firmware Upgrade and Error Handling Improvements".

There should be no notable functional changes in this series, just
refactoring/restructuring/renaming/reformatting.

Regards,
Geoffrey.

Geoffrey D. Bennett (23):
  ALSA: scarlett2: Simplify enums by removing explicit values
  ALSA: scarlett2: Infer has_msd_mode from config items
  ALSA: scarlett2: Infer standalone switch from config items
  ALSA: scarlett2: Check for phantom persistence config item
  ALSA: scarlett2: Check presence of mixer using mux_assignment
  ALSA: scarlett2: Add config set struct
  ALSA: scarlett2: Remove scarlett2_config_sets array
  ALSA: scarlett2: Add check for config_item presence
  ALSA: scarlett2: Refactor scarlett2_usb_set_config()
  ALSA: scarlett2: Refactor scarlett2_config_save()
  ALSA: scarlett2: Formatting fixes
  ALSA: scarlett2: Parameterise notifications
  ALSA: scarlett2: Change num_mux_* from int to u8
  ALSA: scarlett2: Refactor common port_count lookups
  ALSA: scarlett2: Remove struct scarlett2_usb_volume_status
  ALSA: scarlett2: Split dim_mute_update from vol_updated
  ALSA: scarlett2: Remove line_out_hw_vol device info entry
  ALSA: scarlett2: Allow for interfaces without per-channel volume
  ALSA: scarlett2: Add scarlett2_mixer_value_to_db()
  ALSA: scarlett2: Add #define for SCARLETT2_MIX_MAX
  ALSA: scarlett2: Rename db_scale_scarlett2_gain to volume
  ALSA: scarlett2: Split input_other into level/pad/air/phantom
  ALSA: scarlett2: Split direct_monitor out from monitor_other

 sound/usb/mixer_scarlett2.c | 1536 ++++++++++++++++++++---------------
 1 file changed, 879 insertions(+), 657 deletions(-)

-- 
2.43.0

