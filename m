Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A15AC2CEF
	for <lists+alsa-devel@lfdr.de>; Sat, 24 May 2025 03:30:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A156601EC;
	Sat, 24 May 2025 03:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A156601EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748050243;
	bh=sCSwnpkTY7FdvP3cwIBYR0j75kTI00Ttzr+6qqpxaQ0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PP+Pe+7I697gTQJejEigBIdvmHnjtRHSazMHvuAhNEqwhRWM1vRksG8riJxlWj7pP
	 iFggu86qiFHa6C5l/aX3xGAgJSGBoBgMWeXXAHWj5JwyqrN8bZKbUoIJEqhC4+31tN
	 GMC+Q3iGCsmbAaVWSndUOOhppTFZjJmuNK2XDU7s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08855F805C0; Sat, 24 May 2025 03:30:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D34B8F805BB;
	Sat, 24 May 2025 03:30:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0641F8026D; Sat, 24 May 2025 03:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B503F80246
	for <alsa-devel@alsa-project.org>; Sat, 24 May 2025 03:30:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B503F80246
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18425265c7c8fd00-webhooks-bot@alsa-project.org>
In-Reply-To: <18425265c7935500-webhooks-bot@alsa-project.org>
References: <18425265c7935500-webhooks-bot@alsa-project.org>
Subject: ALSA UCM error (ssl2)
Date: Sat, 24 May 2025 03:30:04 +0200 (CEST)
Message-ID-Hash: HA2DCOFJG4XA2ZHBBRIK4WYNU5ARZ375
X-Message-ID-Hash: HA2DCOFJG4XA2ZHBBRIK4WYNU5ARZ375
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HA2DCOFJG4XA2ZHBBRIK4WYNU5ARZ375/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #565 was opened from dddobriak:

Hi,
I had to change my config to avoid the following error:
```
If.ssl2 {
    Condition {
        Type SubStr
        Haystack "${CardComponents}"
        Needle "USB31e9:0001"
    }
    True.Define {
        ProfileName "SolidStateLabs/SSL2"
    }
}
```
I replaced Type String with Type SubStr, and everything worked fine until the next update.
Could you please fix this?

Thanks!

[alsa-info.txt](https://github.com/user-attachments/files/20420260/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/565
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
