Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEB089D1D5
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Apr 2024 07:13:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F9FC2356;
	Tue,  9 Apr 2024 07:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F9FC2356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712639613;
	bh=Boc2gwSZw6t+vHyuJ3cCh0JsHiOkb/U4VAKXQs1qJL8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CdsCTr8tfSy/ckzMnj2ZtbXD7/IVgLXTR5KJq9bMIl8et9ihNbn5YBfcLQ0GviPgX
	 pWbJOvxN0GEAlw+9NNgZ4uEBQDbmsREXhbYm6caCtitFX2ohqBiKV367s16gnNnU1y
	 57bS1ZKQlGjvVDlGw6XPZ835ZY6OkUoODiRTyPks=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E793F8057D; Tue,  9 Apr 2024 07:13:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 958D2F8059F;
	Tue,  9 Apr 2024 07:12:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4F7AF8026D; Tue,  9 Apr 2024 07:10:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 44736F80130
	for <alsa-devel@alsa-project.org>; Tue,  9 Apr 2024 07:10:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44736F80130
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1712639431329867363-webhooks-bot@alsa-project.org>
References: <1712639431329867363-webhooks-bot@alsa-project.org>
Subject: aseqdump -u1 can't receive MT4 messages
Message-Id: <20240409051035.C4F7AF8026D@alsa1.perex.cz>
Date: Tue,  9 Apr 2024 07:10:35 +0200 (CEST)
Message-ID-Hash: IBVET7UCBO6MMM45HIECDEIFDJTJ4QAC
X-Message-ID-Hash: IBVET7UCBO6MMM45HIECDEIFDJTJ4QAC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBVET7UCBO6MMM45HIECDEIFDJTJ4QAC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #262 was opened from masahirokakishita:

Hello,

aseqdump version 1.2.11 
karnel 6.5.0

Sending MT4 messages from ProtoZoA to Linux PC, the command, aseqdump -u1 can't receive messages.
The command, aseqdump -u0 and aseqdump -u2 can receive these messages.

```
aseqdump -u 2 -p 24:0
 24:1   Group  1, Note on                 0, note 67, velocity 0xfedc, attr type = 66, data = 0xba98
 24:1   Group  1, Note off                0, note 67, velocity 0x1234, attr type = 66, data = 0x5678
 24:1   Group  1, Note on                 0, note 65, velocity 0x2200, attr type = 1, data = 0x3344
 24:1   Group  1, Note off                0, note 65, velocity 0x5500, attr type = 0, data = 0x6677
 24:1   Group  1, Note on                 0, note 63, velocity 0xffff, attr type = 0, data = 0x0
 24:1   Group  1, Note off                0, note 63, velocity 0x8000, attr type = 0, data = 0x0

aseqdump -u 0 -p 24:0
 24:1   Note on                 0, note 67, velocity 127
 24:1   Note off                0, note 67, velocity 9
 24:1   Note on                 0, note 65, velocity 17
 24:1   Note off                0, note 65, velocity 42
 24:1   Note on                 0, note 63, velocity 127
 24:1   Note off                0, note 63, velocity 64
```

```
aseqdump -u 1 -p 24:0
```

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/262
Repository URL: https://github.com/alsa-project/alsa-utils
