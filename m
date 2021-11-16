Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D803B452B38
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 07:56:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CDE81686;
	Tue, 16 Nov 2021 07:55:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CDE81686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637045799;
	bh=wZj1P4/7kWYfIf///cWJHzArqGu5tpaLeG839E2uUb8=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p3xiGF3t1gMvu7/l1chzTqkNHMSuEqWr6V2+Ei+JkwYNmHqZZ5MG6XD/NjX8AJw4O
	 QNy0v4VOsw1P/+LmeqXhhDuWZ9cUmi8jDd+eEHLX6BzsfMQxvNJEP8ZXbHzo+fNRnq
	 xi8kFmfXuq6DbU2RNEW6D5pB9BZ1K6Hs2GAdWdpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A30BF804F1;
	Tue, 16 Nov 2021 07:55:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C485F80089; Tue, 16 Nov 2021 07:55:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 932CAF80089
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 07:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 932CAF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="WPND9wUU"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="x8kvpU0B"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 7FBA0212C0
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 06:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637045658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HLezaAvvwgsJCm7sZxO8v+CnepYGFU4dEBnG8IgutVg=;
 b=WPND9wUUUEIJBkwEBI6KOYJ6+uo0QPEptS/N0aE2r72dxF71yUXhWpdPyYqpP7Ht8iHZZR
 R0TXGRHTMoCprbn9Rmyz7SuAP7MwkBEo5Blyvxa8IaObdhNJlXmGqg0pIqqN0Hk7OFlt7R
 +wu87BUFkBau60aiFkhJgVBvIzEnON4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637045658;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HLezaAvvwgsJCm7sZxO8v+CnepYGFU4dEBnG8IgutVg=;
 b=x8kvpU0BEaBA0Ome/Wi0zmQX14bz0cXr56hfDA4mTtH26wX5Vvy19cok0DzG9FrAU8/EQn
 D90s/CfaAzIZAPAg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 6DAA8A3B81;
 Tue, 16 Nov 2021 06:54:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ALSA: usb-audio: dB mapping fixes
Date: Tue, 16 Nov 2021 07:54:12 +0100
Message-Id: <20211116065415.11159-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

here is a small patch set to slightly extend the dB mapping table in
USB-audio driver to add the support for minimal-mute.  The feature
itself is already present in the driver, and it's a matter of addition
in the mapping table.  This is used in the quirk for Bose SoundLink.


Takashi

===

Takashi Iwai (3):
  ALSA: usb-audio: Use int for dB map values
  ALSA: usb-audio: Add minimal-mute notion in dB mapping table
  ALSA: usb-audio: Fix dB level of Bose Revolve+ SoundLink

 sound/usb/mixer.c      |  1 +
 sound/usb/mixer_maps.c | 17 +++++++++++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.26.2

