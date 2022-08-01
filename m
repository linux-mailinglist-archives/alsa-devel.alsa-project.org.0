Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2509586F0E
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Aug 2022 18:56:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CAED1614;
	Mon,  1 Aug 2022 18:55:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CAED1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659372977;
	bh=wVbiGbZK5XIvlunQfbrhk3/s93NQhYYUIWyDokkx6UA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NQrK7OQVFDgagJTytMigJjPvv0NDaK8GyR7EW3xcUNi8mIrLJsdSujASgn/IfVUmI
	 iLoJeruxIQj7pNyJS02NPL4iqkv8No55TtdYnPJAhDe4J+G6kDsvE5jHaUN0qAO0GJ
	 070L9wL5SwhiABILyGzg19n2JCLMfphP6RWqckE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99423F80548;
	Mon,  1 Aug 2022 18:54:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C3F7F80152; Mon,  1 Aug 2022 18:54:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79751F80246
 for <alsa-devel@alsa-project.org>; Mon,  1 Aug 2022 18:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79751F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ULbKMEjY"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="99sp9JAx"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C2882353BF;
 Mon,  1 Aug 2022 16:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659372863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ev/5kuqmUfNZO1ZLi8Bh0Dy/x5ToGjqe34xqKz3w96M=;
 b=ULbKMEjY2ddR/41i/b3wvBcNJXKUa5HwlQSCHOvTtghtopINTsQLfqCULHYAgIkKgn4ZWg
 +oFSEHl9SUtfBUCG/lH26OZBUH5r4bDMaUW/LPEG/fV8l49jTOyCftao7eS6XMUN3XfNsJ
 mmwi18LQp/vF0dguJUjY13dzE9MtW8M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659372863;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ev/5kuqmUfNZO1ZLi8Bh0Dy/x5ToGjqe34xqKz3w96M=;
 b=99sp9JAxXskOs3RjIISNOYhAxJBGMlUUINvR3h6LXcyPLWv+Qinc9mKpJsx+TuMHgcmHT+
 1OM6f74267YJ78Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8BED313AAE;
 Mon,  1 Aug 2022 16:54:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8xhYIT8F6GL9GQAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 01 Aug 2022 16:54:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] ASoC: Fix theoretical buffer overflow by snprintf()
Date: Mon,  1 Aug 2022 18:54:17 +0200
Message-Id: <20220801165420.25978-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 alsa-devel@alsa-project.org, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

this is a patch series to paper over the theoretical buffer overflow
that might be caused by snprintf().  snprintf() is notorious for its
behavior and the usage of a safer version, scnprintf(), is
recommended.


Takashi

===

Takashi Iwai (3):
  ASoC: Intel: avs: Fix potential buffer overflow by snprintf()
  ASoC: SOF: debug: Fix potential buffer overflow by snprintf()
  ASoC: SOF: Intel: hda: Fix potential buffer overflow by snprintf()

 sound/soc/intel/avs/pcm.c | 4 ++--
 sound/soc/sof/debug.c     | 6 +++---
 sound/soc/sof/intel/hda.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.35.3

