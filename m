Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3D63F45E3
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Aug 2021 09:38:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 052481612;
	Mon, 23 Aug 2021 09:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 052481612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629704330;
	bh=Zy1oU5+P62eZ9Jldi89uqUDEmQQhCMlZZVe5/8yATIU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GLbsqfluKreKciXj38fkEpxlQVfXfK2AzyFYiO+B/WGrTlXsraL2rURCCDS/hXoKC
	 yeUM7JJNJrVzXTfQdC2YZCERqPv+0zIqsXjQxyymYfg4c6PGgh42R1qniMYonH7RmX
	 71jfExSJOPRWQKiS1M7VMyoLnNTqn+7ceoSxIf5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56C31F80229;
	Mon, 23 Aug 2021 09:37:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEE31F80217; Mon, 23 Aug 2021 09:37:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18BD3F8016E
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 09:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18BD3F8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="WlG3DAJL"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="zjpBDHfX"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 394611FF7A
 for <alsa-devel@alsa-project.org>; Mon, 23 Aug 2021 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629704244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qHUdePQ2x/gaMeoKPx3LkCF/qmE7GieZua6BDdtgcb4=;
 b=WlG3DAJLJsCibgngJmohyz+3aVeDjA0q+1MDfj1MrND5V1RlhgRaMRADKJxnUee+r+sNNV
 38WKXQNB8yEjOjau3XEmHE/PxG4nCtAF+AkA3iki2TAiSJL7ak8A7jSxrkNZUS18T6Hz5i
 BgODpdvND/VK8aV2Mee4ax+gY23E+E0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629704244;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=qHUdePQ2x/gaMeoKPx3LkCF/qmE7GieZua6BDdtgcb4=;
 b=zjpBDHfXmKAUme1f35Ut+7qtN97lEbQefkhzHrUFf1oFEeXHuacIpPZzKeWL8vJjWguc9e
 1/YjC5InPB56O1DQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 29263A3BB1;
 Mon, 23 Aug 2021 07:37:24 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 0/3] ALSA: hda: SSID aliasing via model option
Date: Mon, 23 Aug 2021 09:37:19 +0200
Message-Id: <20210823073722.14873-1-tiwai@suse.de>
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

this is a patch set for enhancement of HD-audio configuration.
There are lots of cases where a quick is applied only with PCI or
codec SSID matching but no corresponding model option entry is
provided.  In such a case, user had to modify and recompile the code,
or using the early patching with patch option, both of which are
cumbersome.

This option makes it easier to apply a quirk of another device.  Now
you can pass model option string in a form of 1234:abcd for specifying
the SSID of the alias target.


Takashi

===

Takashi Iwai (3):
  ALSA: hda: Code refactoring snd_hda_pick_fixup()
  ALSA: hda: Allow model option to specify PCI SSID alias
  ALSA: hda: Update documentation for aliasing via the model option

 Documentation/sound/alsa-configuration.rst |  6 ++
 Documentation/sound/hd-audio/notes.rst     | 11 +++
 sound/pci/hda/hda_auto_parser.c            | 84 +++++++++++++---------
 3 files changed, 66 insertions(+), 35 deletions(-)

-- 
2.26.2

