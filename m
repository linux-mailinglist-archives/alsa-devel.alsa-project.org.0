Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78882A7563E
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Mar 2025 13:26:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA416601E2;
	Sat, 29 Mar 2025 13:26:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA416601E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743251191;
	bh=hrBk1I5S+G9BOOTuVBL3GPy4Ro2E7v8RTWcTwW45V8g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Gw42hsDOwQbbXfXcve1ITyZPzaez3SlPNWO/oyAdqK3NLJ5bG2B4jCW2cLIWUvkcN
	 G5j2tfuY1Tg6PFngwOKxr3aDbtYDX7ciNXxsaI9htwTTS94RnyIBrX8ZH4AqJDrWeI
	 ILQZKIvsJsJGN9jBJ3qoSYtkGxpfS0CWoot+mXio=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00689F805C2; Sat, 29 Mar 2025 13:25:55 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF55FF805AD;
	Sat, 29 Mar 2025 13:25:55 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CE65F8055B; Sat, 29 Mar 2025 13:25:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id DB695F80095
	for <alsa-devel@alsa-project.org>; Sat, 29 Mar 2025 13:25:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB695F80095
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <183145af172d8c00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-tools/pr/34@alsa-project.org>
References: <alsa-project/alsa-tools/pr/34@alsa-project.org>
Subject: envy24control: fix memory access errors in profiles
Date: Sat, 29 Mar 2025 13:25:51 +0100 (CET)
Message-ID-Hash: FCIZMTRRHYQY36CVY3PTZLP6OXZWF74T
X-Message-ID-Hash: FCIZMTRRHYQY36CVY3PTZLP6OXZWF74T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FCIZMTRRHYQY36CVY3PTZLP6OXZWF74T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools pull request #34 was opened from andreas56:

Fix two memory errors in the profiles parser: an invalid read and a "source and destination overlap in strncpy" warning.

When the profiles page is initialized it fetches the profile names from the profiles file. When a profile wasn't defined in the file, the parser made invalid reads outside the buffer.

Request URL   : https://github.com/alsa-project/alsa-tools/pull/34
Patch URL     : https://github.com/alsa-project/alsa-tools/pull/34.patch
Repository URL: https://github.com/alsa-project/alsa-tools
