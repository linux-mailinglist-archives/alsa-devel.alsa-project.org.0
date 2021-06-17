Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 222283AB0E8
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 12:06:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8F4516ED;
	Thu, 17 Jun 2021 12:05:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8F4516ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623924387;
	bh=/bkh8ElBLpMZXY1g3rtqYv5ng47YtR5a7chegS0dhTM=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qr6WCDnoaV3+LCVh/ZWFuyKTiOwY+WCzqTioA9tL1szkwBWSlVM5Roq7ty/9eRYKe
	 g8dwmy8TmZGSxG30VcMPW/B0CxMK9kNexQLSYjnZxTuuqxji5xpOIxCWVx+m/dZtD6
	 94FFg4RwBbUi7CbyHJImheqcHW7IdxH3o00w2bu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82346F804D6;
	Thu, 17 Jun 2021 12:04:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92B04F8025A; Thu, 17 Jun 2021 12:04:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24529F80171
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 12:04:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24529F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="HGXuJhXz"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="5h7crLR8"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D8BF521AF2
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623924240; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eM9oT5VPctkpLs8wyJkAQlrnxlY0+48aH9uZynsuBEE=;
 b=HGXuJhXzjjSeXM15rV7JqmWPrbHYpparrIr5MM5wjRf7o3tq29A3jMpY6Al3Eke87h90fL
 WPClTu1E+KUt8WXsiWVy0Iki940LQte7C0EJNUpetyA4aA2V07QLXa7egPYJ3VqBUCHjM1
 y9nLhm33NqcirgcLXneRUPT8Hgm4hzQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623924240;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eM9oT5VPctkpLs8wyJkAQlrnxlY0+48aH9uZynsuBEE=;
 b=5h7crLR85UmpaidnwI+QI8lvMa2PrKEpnelVcp4MEFU7X4j9WDajluyb/RYtLngub64cCq
 KmgMsG+vCAPbLYAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C953FA3BB7;
 Thu, 17 Jun 2021 10:04:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH alsa-plugins 0/2] Support multiple formats
Date: Thu, 17 Jun 2021 12:03:57 +0200
Message-Id: <20210617100359.12197-1-tiwai@suse.de>
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

this is a patch set to add the multi-format support for the existing
rate plugins.


Takashi

===

Takashi Iwai (2):
  rate-lav: Support multiple formats
  samplerate: Support multiple formats

 rate-lav/rate_lavrate.c | 115 ++++++++++++++++++++++++++++++++++------
 rate/rate_samplerate.c  |  99 ++++++++++++++++++++++++++++------
 2 files changed, 183 insertions(+), 31 deletions(-)

-- 
2.26.2

