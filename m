Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2DEA1ADBE
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2025 01:10:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58E096026A;
	Fri, 24 Jan 2025 01:10:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58E096026A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737677451;
	bh=YF0HSzxm87xlx201G/9YhM/qOHxQw+D4RrDPrCVXhTI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=H3CvYhiv47ecsT6Di4fFAIjpLSp/kRm04JjxYULz8BJrg8FMwTVl4f+E+UdSMKw7J
	 zk55Kmhp7VIUf4HTjbXJZNb9mx1T8aiBHgr98TPQ0MqErTm9u/ozX+UE9gX9HpxktL
	 GFZybpp2ll3uuC+0kmrW9AdDnB805ng7pPi2gZT8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3ECCBF805B4; Fri, 24 Jan 2025 01:10:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B75CF805B5;
	Fri, 24 Jan 2025 01:10:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02E78F80185; Fri, 24 Jan 2025 01:10:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id E3CFAF800ED
	for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2025 01:09:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3CFAF800ED
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1737677397498765707-webhooks-bot@alsa-project.org>
References: <1737677397498765707-webhooks-bot@alsa-project.org>
Subject: No optical S/PDIF output on Debian 12 Gnome with ASUS ROG STRIX
 X670E-A
Message-Id: <20250124001001.02E78F80185@alsa1.perex.cz>
Date: Fri, 24 Jan 2025 01:10:00 +0100 (CET)
Message-ID-Hash: KDWHTZET577GEVXBRBHSIQ5LHHOFFZ6M
X-Message-ID-Hash: KDWHTZET577GEVXBRBHSIQ5LHHOFFZ6M
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KDWHTZET577GEVXBRBHSIQ5LHHOFFZ6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #500 was opened from BGnoinski:

I am currently running into an issue with my Gnome desktop where audio from applications like Firefox is not working. I have run `alsa-info.sh` and the contents [have been uploaded here](http://alsa-project.org/db/?f=d18e76790182eaa8b63e03f435397660b5879b0e)

I know that debian is running an old version of the `alsa-ucm-conf` package (1.2.8) so I have updated the ucm and ucm2 confs with:

```
#!/bin/bash

curl -L -o alsa-ucm-conf.tar.gz https://github.com/alsa-project/alsa-ucm-conf/archive/refs/heads/master.tar.gz
tar xvzf alsa-ucm-conf.tar.gz -C /usr/share/alsa --strip-components=1 --wildcards "*/ucm" "*/ucm2"

```

I can see that my boards identifier(not sure if that's the correct terminology) exists in the ucm2 USB-Audio conf

```
grep -Hrn '0b05:1a52' /usr/share/alsa/
/usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf:58:		# 0b05:1a52 ASUS ROG Strix X670E-F & Z790-E Gaming Wifi
```

Even though the comment doesn't have my board specifically in it, looking at the uploaded package I see:

```
Bus 003 Device 003: ID 0b05:1a52 ASUSTek Computer, Inc. USB Audio
```

So my understanding is that should be fine. Even when I look at the [motherboard specs](https://rog.asus.com/us/motherboards/rog-strix/rog-strix-x670e-a-gaming-wifi-model/spec/) I see that it says it's `ROG SupremeFX 7.1 Surround Sound High Definition Audio CODEC ALC4080` so I don't know if this is different from the Realtek ALC4080 Maybe?

And the odd part is if I run `aplay -D plughw:Audio,3 /usr/share/sounds/alsa/Front_Right.wav `

I get the following output:
```
Playing WAVE '/usr/share/sounds/alsa/Front_Right.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Mono
```

And I do in fact hear audio coming from my speakers.

Looking in the sound settings it appears as if I am able to select the correct output, and when audio _should_ be playing the little blue line does go up.

![Image](https://github.com/user-attachments/assets/9e865f37-8153-4bdf-946d-3a428b561321)

So it seems like I am just missing something obvious to tie all of the components together to get desktop applications working with the correct output.

Any help would be greatly appreciated.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/500
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
