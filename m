Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C91FB3F5B43
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 11:49:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FA6115F2;
	Tue, 24 Aug 2021 11:48:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FA6115F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629798562;
	bh=aH+E6gqFF5WB+prvSBU/OqI0R4zkgMhAz7Y30Ea7mC0=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=T/GuHbxIxmAm41BgVFjyBn8l6pZF3No8eUDRZqNm6MsZeL9KwNEp3QeVNuIW1XNVF
	 0JlnYaNhfdwIsdYHJy2rgdT2r+E2Kqhk5NlCrBffaf2v5bV1wuTXnT1cnmpxcU/iwE
	 pK4TUG9tQcUQv6DbhPpTJu/YKFM6r68S+m/TZYr0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BD3F4F80087;
	Tue, 24 Aug 2021 11:48:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CB06F8032D; Tue, 24 Aug 2021 11:48:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_25,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0245F80087
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 11:47:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0245F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="UmSfcr1W"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="3kEZ/RL2"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 603E72004F
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 09:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629798477; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uDUlKKBmiPzglKQFE35nTdB2ayC1Ggr2mjXMgtaBu8c=;
 b=UmSfcr1WBAFmG0SxTIR6SJzWyjTK8TyIUGE1VYU//yu2D831Q8VApqLtkpsKKOqMfKzuGC
 nt3sWZqqTVhVMlw+P2v8eWx8dNnp08wopguunuQee01THGawL6Gji4+rOGc8ntxDmdhDHp
 MjTK6Kc3b/ynSREFRaGP2aAR297yE1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629798477;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uDUlKKBmiPzglKQFE35nTdB2ayC1Ggr2mjXMgtaBu8c=;
 b=3kEZ/RL2IemTKHUJ2v0EQPE0awuZMQbozV1DeXqKVilWLIG8g3YxQDeCfu4K2smqTFgwh3
 /sIIPIuBeGBoc1CA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 502EEA3B87;
 Tue, 24 Aug 2021 09:47:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-utils 0/5] aplay: Fix bugs in peak calculations
Date: Tue, 24 Aug 2021 11:47:51 +0200
Message-Id: <20210824094756.12540-1-tiwai@suse.de>
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

The code in aplay for sample peak calculations and VU-meter
representation seems to have a lot of bugs.  Let's fix them.


Takashi

===

Takashi Iwai (5):
  aplay: Fix conversion of unsigned samples in peak calculation
  aplay: Handle 16bit sample negative overflow in peak calculations
  aplay: Don't pass most negative integer to abs() in peak calculations
  aplay: Handle upper bound in peak calculations
  aplay: Fix out-of-bound access in stereo VU meter drawing

 aplay/aplay.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

-- 
2.26.2

