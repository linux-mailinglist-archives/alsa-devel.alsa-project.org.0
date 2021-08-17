Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09F3EEE63
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 16:22:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C75B7167A;
	Tue, 17 Aug 2021 16:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C75B7167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629210171;
	bh=enuCBv7rd7vzADHkAlqoMQ3KxWc7RRwHgQ4drB+uQvc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VE7qzJShapcfvRxGoja2J9ldaRHxI8TZv7o5IdS+pkrIYsGGesPEsFGcyhGqrJBJn
	 VSGpwEljzK96oC521o8LlG0lu0OBNhtgGGAbSGvb3SZ4+cfIFP2BZyfKnmcyFU/G4U
	 +sWBEweRByMRR2UrqzJbMw/54aFSdU+9sCUZk64k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 296D7F80301;
	Tue, 17 Aug 2021 16:21:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61D0FF802C4; Tue, 17 Aug 2021 16:21:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7137EF80111
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 16:21:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7137EF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="GYDI29rF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:
 From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Hcw0PnljLnt7s5b0Ldg8sJzFcCgnHqwlLPwwuLjQhpc=; b=G
 YDI29rFttDzaxsnVXienX29e54Ugp98xSeaD0eJRqSP50rpXCz9lw9mosxkLaPlupfOFYuW5u4LVa
 0bRRfhlp1PzMdIdTdWZQ1RDQyWg0fgtKDhATFUKQ6ZWnqao4mTh0Y0D53ErwNXF+epjjknAhHcYru
 KwVdOBxLXC4J9UkZRfRdvEVWv9jyF3QIanWyxcSYIvAanqo2QnwdE9pYClIJEwzcYTwlq2yL0f3Sl
 QuFUXGqj6WX9d+XHV4uHJZ69qXD2GY0AF/rb2i/dALXZO47gxJuva0pJIIczJUHfO+IGzGp0mw1t7
 e5Sg3IOwXJ10NbLgBR1Ji8BpE69kFbqkg==;
Received: from c83-254-143-147.bredband.tele2.se ([83.254.143.147]
 helo=localhost.localdomain)
 by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <coding@diwic.se>)
 id 1mFzxy-00EDyU-En; Tue, 17 Aug 2021 16:21:22 +0200
From: David Henningsson <coding@diwic.se>
To: tiwai@suse.de,
	alsa-devel@alsa-project.org,
	perex@perex.cz
Subject: [PATCH v3 0/2] alsa-lib patches for rawmidi framing
Date: Tue, 17 Aug 2021 16:21:11 +0200
Message-Id: <20210817142113.14750-1-coding@diwic.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: coding@diwic.se
Cc: David Henningsson <coding@diwic.se>
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

v3: Adjusted according to comments from tiwai

David Henningsson (2):
  Add rawmidi framing API
  Add test for rawmidi framing API

 include/rawmidi.h           | 38 +++++++++++++++++
 include/sound/uapi/asound.h | 30 +++++++++++++-
 src/rawmidi/rawmidi.c       | 83 +++++++++++++++++++++++++++++++++++++
 src/rawmidi/rawmidi_hw.c    |  2 +
 src/rawmidi/rawmidi_local.h |  2 +
 test/rawmidi.c              | 65 ++++++++++++++++++++++++++---
 6 files changed, 212 insertions(+), 8 deletions(-)

-- 
2.25.1

