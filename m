Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CAEA8A53C
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Apr 2025 19:21:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D06265AFE;
	Tue, 15 Apr 2025 19:21:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D06265AFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1744737682;
	bh=7zmxh+HzGoCjNFDBygv8YMGB3xXfTwuMeAZuMTB5W84=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JbOZ4CfONZb/FqGcK9B0ILp9qYhtQ8bN04/GeaMj7V79ckqujuJS02AxqryDyS9UG
	 7d1JUMe7orhP4bopJtNska7Lq5jg4EMXUMqFPQmezBRmdFS3wjXoUYHvpQ0G4AolUn
	 6bOjLYRt5V8fZZPUuoySNsKquqy9KoIJgoNyTHL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAD87F805CA; Tue, 15 Apr 2025 19:20:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5A1FF805C1;
	Tue, 15 Apr 2025 19:20:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8B342F8021D; Tue, 15 Apr 2025 19:20:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 28C6FF80169
	for <alsa-devel@alsa-project.org>; Tue, 15 Apr 2025 19:20:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28C6FF80169
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18368da1e5416a00-webhooks-bot@alsa-project.org>
In-Reply-To: <18368da1e537d500-webhooks-bot@alsa-project.org>
References: <18368da1e537d500-webhooks-bot@alsa-project.org>
Subject: Steinberg UR22C: Version 1.2.14 introduced "[ALSA UCM error]"
Date: Tue, 15 Apr 2025 19:20:33 +0200 (CEST)
Message-ID-Hash: 57JXPUUZU4SPSIVLJEKYUPIL2EUA5OYN
X-Message-ID-Hash: 57JXPUUZU4SPSIVLJEKYUPIL2EUA5OYN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57JXPUUZU4SPSIVLJEKYUPIL2EUA5OYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #547 was edited from NoXPhasma:

Since version 1.2.14 the `node.description` of the Steinberg UR22C shows  `[ALSA UCM error]`:

```
node.description = "Steinberg UR22C [ALSA UCM error] Direct Steinberg UR22C"
```

```
> journalctl --user -u wireplumber --boot 0

systemd[1286]: Started Multimedia Service Session Manager.
wp-internal-comp-loader: Loading profile 'main'
spa.alsa: Error in ALSA UCM profile for _ucm0001.hw:UR22C,0 (HiFi: Line 3: source): CaptureChannels=4 > avail 2
spa.alsa: Errors in ALSA UCM profile for card Steinberg UR22C
wireplumber[1359]: wp-device: SPA handle 'api.libcamera.enum.manager' could not be loaded; is it installed?
wireplumber[1359]: s-monitors-libcamera: PipeWire's libcamera SPA plugin is missing or broken. Some camera types may not be supported.
wireplumber[1359]: default: Failed to get percentage from UPower: org.freedesktop.DBus.Error.NameHasNoOwner
wireplumber[1359]: spa.bluez5: BlueZ system service is not available

```

Reverting to version 1.2.13 fixes this issue.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/547
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
