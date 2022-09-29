Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D9E5EEF38
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 09:38:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64C7C1638;
	Thu, 29 Sep 2022 09:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64C7C1638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664437083;
	bh=dzaBnOALlS3CAG+weQxNWWRnBcnW5YCaePpnpXn89aY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oFj+z3RI2r132XRQpoxpUOuBg2sdXXnyCwuWF4X7N+CFeUqlC57jj9bXOViMrpqCA
	 zu66EF7yO+N/f1yfiIyseM7uMRq80FswWXxKexHt4Hj2KGMsBX8iURGERv7Fcz0Eqm
	 2XvsMzh2FsLLFznkq3sjYpXhqcBMRP+SIx68UEco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93154F804F1;
	Thu, 29 Sep 2022 09:36:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F1A1F8053D; Thu, 29 Sep 2022 09:36:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEA59F803DD
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 09:35:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEA59F803DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="bmdt/b9g"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="iYOB022E"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6D1531F8D7;
 Thu, 29 Sep 2022 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664436956; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BtegpzIETTorYe7aMC8jbbXSjGnrxW9s0rmHtCYork=;
 b=bmdt/b9gF7ml51+6OeVgV32Zad6CVZwkDKj3eheCRCo+OQWUgUwGXtEyS9FE+c9uLfLOEJ
 0GjN/U2/X8Jn8cjLGzxGYPVLatl+jvrNjCC5Zvj3rqwNiJiXbI7jMYc5enm1316J9zh9OP
 1+Cy00t3wmUlD0wVDRbxbXqnKFRG/dk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664436956;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+BtegpzIETTorYe7aMC8jbbXSjGnrxW9s0rmHtCYork=;
 b=iYOB022ErMDglceiHPYl+O6HMEivXhtIaespaMO1ZA9InB8mUxm6fzeCn/MYBuQqYIapgg
 1TT/EdSF5VPM3wBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CDA61348E;
 Thu, 29 Sep 2022 07:35:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yAgYEtxKNWMFfQAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 29 Sep 2022 07:35:56 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 8/8] ALSA: doc: Explain more about model option
Date: Thu, 29 Sep 2022 09:35:45 +0200
Message-Id: <20220929073545.1085-9-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220929073545.1085-1-tiwai@suse.de>
References: <20220929073545.1085-1-tiwai@suse.de>
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

Add a bit more explanation about passing the snd-hda-intel model
option at the right place.  Also, a brief description about the new
codec model option is added along with it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/hd-audio/notes.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/sound/hd-audio/notes.rst b/Documentation/sound/hd-audio/notes.rst
index d118b6fe269b..dc84be14273b 100644
--- a/Documentation/sound/hd-audio/notes.rst
+++ b/Documentation/sound/hd-audio/notes.rst
@@ -226,6 +226,22 @@ model=103c:8862 will apply the quirk for HP ProBook 445 G8 (which
 isn't found in the model table as of writing) as long as the device is
 handled equivalently by the same driver.
 
+The ``model`` option of snd-hda-intel takes an array of strings,
+applied one per PCI device.  When there are multiple HD-audio
+controllers and you want to apply a quirk for a certain one, you have
+to pass the option carefully at the right position.
+For example, when an on-board analog audio with a Realtek codec is
+found at the secondary PCI slot while the first slot is for HDMI/DP
+controller, you'll need to pass the option like ``model=,foobar``
+(note the comma before ``foobar``), so that the first entry is
+skipped.
+
+For making this complexity a bit easier, since 6.1 kernel, codec
+drivers may take also ``model`` option, too. It works equivalently as
+the model option of the controller driver.
+In the example case above, you can pass the option to Realtek codec
+driver directly; e.g. ``snd_hda_codec_realtek.model=foobar`` on
+command line.
 
 Speaker and Headphone Output
 ----------------------------
-- 
2.35.3

