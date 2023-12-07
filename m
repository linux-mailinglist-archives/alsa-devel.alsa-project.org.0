Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7F48089AE
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 14:59:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BEA7204;
	Thu,  7 Dec 2023 14:59:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BEA7204
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701957581;
	bh=ZL90KBKrGR+vYve7LkYqfP9QR8rLyQa3bLu3xUhTWNM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=n3KIIstrfkarj2PQu2ke8z2bdVWRytlpHqohUL5hdbO+7GPozN+po5iQMzZgiRGsA
	 QmHGJR15bAXMwKjPHktmnnBnUybOf/g2aWv8g6+ipwnE1G+/OUdd9eaIexf2qbbso+
	 Uik8rgVm8rW7B/qDcF7b/9ESas6E8C2+Z0S7HNNs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFD13F8055C; Thu,  7 Dec 2023 14:59:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18FA4F80568;
	Thu,  7 Dec 2023 14:59:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91F2DF8028D; Thu,  7 Dec 2023 14:57:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E527F800AC
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 14:57:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E527F800AC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1701957457715157747-webhooks-bot@alsa-project.org>
References: <1701957457715157747-webhooks-bot@alsa-project.org>
Subject: No sound from frontal case jack AUX [MSI MAG Z690 Tomahawk Wifi]
Message-Id: <20231207135753.91F2DF8028D@alsa1.perex.cz>
Date: Thu,  7 Dec 2023 14:57:53 +0100 (CET)
Message-ID-Hash: 64DZO2ECCW6RG5BU2MHFXRZPC4RK2K6D
X-Message-ID-Hash: 64DZO2ECCW6RG5BU2MHFXRZPC4RK2K6D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/64DZO2ECCW6RG5BU2MHFXRZPC4RK2K6D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #371 was opened from ricciolino:

I posted [this](https://ubuntuforums.org/showthread.php?t=2486774) some weeks ago and I thought I had been able to solve the issue.
Unfortunately, it does not seem like so.

Summary of the issue**: attaching my headphone to the rear jack, sound is emitted correctly, whilst frontal AUX jack it just looks dead (headphone device is correctly recognized in sound system settings but no sound is emitted).

Summary of steps that brought me to the initial solution.

Check the sound card USB device with:
```
> lsusb | grep -i audio
Bus 001 Device 003: ID 0db0:b202 Micro Star International USB Audio
```

Execute the following commands in sequence:
```
sudo mv /usr/share/alsa/ucm /usr/share/alsa/ucm.bak
sudo mv /usr/share/alsa/ucm2 /usr/share/alsa/ucm2.bak
curl -L -o alsa-ucm-conf.tar.gz https://github.com/alsa-project/alsa-ucm-conf/archive/refs/heads/master.tar.gz
sudo tar xvzf alsa-ucm-conf.tar.gz -C /usr/share/alsa --strip-components=1 --wildcards "*/ucm" "*/ucm2"
rm alsa-ucm-conf.tar.gz
```

Reboot... than check:
```
> cat /usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf | grep 0db0:b202
        # 0db0:b202 MSI MAG Z690 Tomahawk Wifi
```

Attaching the headphone now sound is emitted correctly from frontal AUX jack.

After a few weeks I returned to the initial situation, the front AUX jack does not emit any sound. After a few weeks I returned to the initial situation, the front AUX jack does not emit any sound. I checked USB-Audio.conf file for being sure still MSI MAG Z690 Tomahawk Wifi MoBo is supported and output is confirmed.
```
> cat /usr/share/alsa/ucm2/USB-Audio/USB-Audio.conf | grep 0db0:b202
        # 0db0:b202 MSI MAG Z690 Tomahawk Wifi
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/371
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
