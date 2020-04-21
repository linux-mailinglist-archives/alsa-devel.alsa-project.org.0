Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3321B2FD7
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Apr 2020 21:11:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED24616CA;
	Tue, 21 Apr 2020 21:10:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED24616CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587496263;
	bh=sHNV34f2TnYC0QVTxy3qae7aOFe7LrRkFtUbvcjpn8s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ik2lXrX8dLxqSYqAoF8QHKkYqIkMCQHWMbeiUJ39OQnrYkpYTIlaqJ9swDr3/TZD9
	 e6NTFDfXtnIOhPbD+UTEEw3UpJZJbGkGev06t7B3tlDdRdpMF9DU0FftkPyPtTQWEN
	 1WOkcEg0aBm5Fmb5PLvjKfJ1bM5X0rdQhb8kJDRY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB88DF801EC;
	Tue, 21 Apr 2020 21:09:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4861CF801ED; Tue, 21 Apr 2020 21:09:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from puleglot.ru (puleglot.ru [IPv6:2a01:4f8:1c0c:58e8::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D24DF800FF
 for <alsa-devel@alsa-project.org>; Tue, 21 Apr 2020 21:09:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D24DF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=tsoy.me header.i=@tsoy.me
 header.b="cG3qHcm3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tsoy.me;
 s=mymail; h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RziaXoEWEFWUfkCMAJgLZXIlOskLdwPRWX1GIx+6Sl8=; b=cG3qHcm3YM/rUCz0x0jnyV2vD4
 Y7EX8q9peRBhS7ROkZhQCUZk5BlkV1B/b91h5vnUe94lb9tSfJ0uEDQLOkv+nMHsQL6W5srZDWYF/
 esY9F3O/U/SW/JDvw5ACMjUqZ05oh6vj6fZn7+lzDyC9ACiXdbvkrzA1b3VWuGknky08=;
Received: from [2a00:1370:8125:3f98:890:f100:d37d:7ada] (helo=home.puleglot.ru)
 by puleglot.ru with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <puleglot@puleglot.ru>)
 id 1jQyGb-0009YH-T1; Tue, 21 Apr 2020 22:09:09 +0300
From: Alexander Tsoy <alexander@tsoy.me>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Apply async workaround for Scarlett 2i4 2nd
 gen
Date: Tue, 21 Apr 2020 22:09:08 +0300
Message-Id: <20200421190908.462860-1-alexander@tsoy.me>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>
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

Due to rounding error driver sometimes incorrectly calculate next packet
size, which results in audible clicks on devices with synchronous playback
endpoints. For example on a high speed bus and a sample rate 44.1 kHz it
loses one sample every ~40.9 seconds. Fortunately playback interface on
Scarlett 2i4 2nd gen has a working explicit feedback endpoint, so we can
switch playback data endpoint to asynchronous mode as a workaround.

Signed-off-by: Alexander Tsoy <alexander@tsoy.me>
---
 sound/usb/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 6c2dfd3bfcbf..351ba214a9d3 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1806,6 +1806,7 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 		 */
 		fp->attributes &= ~UAC_EP_CS_ATTR_FILL_MAX;
 		break;
+	case USB_ID(0x1235, 0x8200):  /* Focusrite Scarlett 2i4 2nd gen */
 	case USB_ID(0x1235, 0x8202):  /* Focusrite Scarlett 2i2 2nd gen */
 	case USB_ID(0x1235, 0x8205):  /* Focusrite Scarlett Solo 2nd gen */
 		/*
-- 
2.25.3

