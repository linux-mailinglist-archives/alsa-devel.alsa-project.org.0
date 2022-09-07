Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB1B5B0E6A
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 22:45:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB4201693;
	Wed,  7 Sep 2022 22:44:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB4201693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662583512;
	bh=N5wDyyqjX4tWH26xwbt6Omacneqdv3oL5unYetnFxY8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W0L3Ck3rHX0XvasmbbONy8ucFZNHtJDtTQsYlfKs9M0wXSbmOzfZDdLfblSdJFjHt
	 CSSoGUrp1jixkzNILXNcmRrlufjOF5W22Wbb1WpOarjsCLzDIceNFWWRkj3h2wGfbt
	 +s3vqk0VQCNycMElqpYSxVuul50K4lzkqvxXjyRc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38A37F80423;
	Wed,  7 Sep 2022 22:44:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BACA6F8028D; Wed,  7 Sep 2022 22:44:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C613DF8011C
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 22:44:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C613DF8011C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1662583447176352978-webhooks-bot@alsa-project.org>
References: <1662583447176352978-webhooks-bot@alsa-project.org>
Subject: Some Motu M4 have a different usb device ID
Message-Id: <20220907204410.BACA6F8028D@alsa1.perex.cz>
Date: Wed,  7 Sep 2022 22:44:10 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #212 was opened from Big-FG:

I just wanted to draw some attention regarding the Motu M4 UCM2 profie

currently USB-Audio.conf has the M4 with usb id 07fd:000b

```
if.motu-m24 {
	Condition {
		Type String
		Haystack "${CardComponents}"
		Needle "USB07fd:000b"
	}
	True.If.M4 {
		Condition {
			Type String
			Haystack "${CardLongName}"
			Needle "MOTU M4"
		}
		True.Define.ProfileName "MOTU/M4"
		False.Define.ProfileName "MOTU/M2"
	}
}
```

but mine is apparently different with 07fd:0008

`Bus 003 Device 002: ID 07fd:0008 Mark of the Unicorn M Series`

after adjusting the USB-Audio.conf with my usb ID the profile loads and works correctly. Im not sure if mine is just a weird one or how many people this may be the case for. Im fine with modifying the conf myself for my card if this is just specific to me as my unit wasnt purchased new but was a used one so Im not sure what might be different.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/212
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
