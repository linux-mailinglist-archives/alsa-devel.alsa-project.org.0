Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A033A20C94B
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jun 2020 19:46:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37F101616;
	Sun, 28 Jun 2020 19:45:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37F101616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593366378;
	bh=Tj/fAdzMYrAERD51PwMWVDFXaCxo/hmqMcsTxE9tN9o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GYwbDwQoUWZ0yFeuqGoURI48wXYgwoEVBbjpiuk0UfaAhcE2pUlvUY7wSJn9Unlc/
	 zqiQ414tvtFb2hGl95YxjzRxASTuSmJREBuRe1UukuzCC/dI3oJFvdpH/ErGrfzK3I
	 BJTfhRrEBRYnidb1Iw4lN3/wKxgKcUlkjtqFvFPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3108CF800E8;
	Sun, 28 Jun 2020 19:44:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 406A9F80253; Sun, 28 Jun 2020 19:44:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF0D3F800F0
 for <alsa-devel@alsa-project.org>; Sun, 28 Jun 2020 19:44:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF0D3F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="fEC1Y2lM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593366268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yznV5aNZpOrT3dB2YIHfyazf6N1XRQmxi3JUsN1C7iw=;
 b=fEC1Y2lMnUvgURiVJATk9vcoBDUVpv+C2F5NxPRCT8x+R0AmXNc4ZbE5YA7PqsKyS2NUlH
 YjKKHceQ9IX4iCMwOp3hMBP4VKEYPTSRLDEtvz8coz7HIpLNJ6WKu8xPRbdihH7s+w5IMi
 Dlfp6217ZTa0cV5jgrBv2//D6graXhk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-LHeZQBUOPuGFzKHkRoI_dQ-1; Sun, 28 Jun 2020 13:44:26 -0400
X-MC-Unique: LHeZQBUOPuGFzKHkRoI_dQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77AED7BAC;
 Sun, 28 Jun 2020 17:44:25 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41DAD5D9D3;
 Sun, 28 Jun 2020 17:44:24 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org
Subject: [PATCH alsa-lib 2/5] cht-bsw-rt5672: Add Lenovo Miix 2 10 specific
 configuration
Date: Sun, 28 Jun 2020 19:44:18 +0200
Message-Id: <20200628174421.115133-2-hdegoede@redhat.com>
In-Reply-To: <20200628174421.115133-1-hdegoede@redhat.com>
References: <20200628174421.115133-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Cc: Hans de Goede <hdegoede@redhat.com>
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

By default the cht-bsw-rt5672 config lets the user figure out if a device
has a Mono spaker or Stereo speakers and which DMIC input is used.

Since this is not very user-friendly we do regex matches on the DMI derived
longname to automaticaly select the right options (and to only advertise
those options).

This commit adds support for automatically selecting the right options
on the Lenovo Miix 2 10 tablet. Since this is the first device for which
we do longname matching using a DMIC on DMIC1, this also fixes a fixme :)

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/cht-bsw-rt5672/HiFi.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ucm2/cht-bsw-rt5672/HiFi.conf b/ucm2/cht-bsw-rt5672/HiFi.conf
index dc8ddd5..94de7db 100644
--- a/ucm2/cht-bsw-rt5672/HiFi.conf
+++ b/ucm2/cht-bsw-rt5672/HiFi.conf
@@ -11,7 +11,7 @@ If.cfg-dmic1 {
 	Condition {
 		Type RegexMatch
 		String "${CardLongName}"
-		Regex "(SoMeThInK1)" # fixme!
+		Regex "(LENOVO.*LenovoMiix210)"
 	}
 	True {
 		Define.MonoSpeaker ""
-- 
2.26.2

