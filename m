Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F32A5EE1F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Mar 2025 09:35:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39BE060361;
	Thu, 13 Mar 2025 09:35:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39BE060361
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741854947;
	bh=svCHiIU35FWLeQw6W3i0ZjFjq2K4FovNbEzLOeMtloI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kjNk8iCiyAZGXWXtISDIy7Ew6+F1VWI64Pu+P3QwSUMnoHPaI5IpBvXQwPKX4gJ8J
	 PaaBwY0MQwN2kAvK9fAjhUGdmywUVFk+hUAsNIaXc54j4hbsSR8SgyJWcAJT2+gY6I
	 NfyI6sTuMMzId5icUeZzoza5pHSR45uyM0Bn6szc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8585F80588; Thu, 13 Mar 2025 09:35:11 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32EE4F805B3;
	Thu, 13 Mar 2025 09:35:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BECDF8026D; Thu, 13 Mar 2025 09:34:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 95F3DF80095
	for <alsa-devel@alsa-project.org>; Thu, 13 Mar 2025 09:34:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95F3DF80095
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182c4fc6c4274600-webhooks-bot@alsa-project.org>
In-Reply-To: <182c4fc6c3010c00-webhooks-bot@alsa-project.org>
References: <182c4fc6c3010c00-webhooks-bot@alsa-project.org>
Subject: Dynamic PCM switching in ALSA with multi room audio sync support
Date: Thu, 13 Mar 2025 09:34:33 +0100 (CET)
Message-ID-Hash: LTIKKB5RO527XB5H4OBISCJ4TQXW2U3T
X-Message-ID-Hash: LTIKKB5RO527XB5H4OBISCJ4TQXW2U3T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LTIKKB5RO527XB5H4OBISCJ4TQXW2U3T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #443 was opened from Asikbct:

**Challenges:** 
                The PCM device is already opened by applications, making it difficult to switch to a new output seamlessly. Since most Music Service SDKs initialize the PCM device at startup, re-initializing it would require users to manually reopen their streaming app and re-select the device, negatively impacting the user experience.

**Requirement:**
                User can switch between different audio output options (Line Out, Optical, USB Out, Bluetooth, etc.) at any time. The transition to a new output should be seamless, whether the user is currently playing a song from any music sources. Playback should resume on the newly selected output without requiring the user to manually reopen the content provider app and restart playback from the beginning.

**Problems:**
1. **Reopening the PCM**
Most music services open and configure the PCM device during initialization. Changing the PCM device (e.g., switching from Line Out to Optical Out) requires reopening it, which forces music services to reinitialize. This may require the end user to relaunch the respective app, reselect the device, and restart playback, impacting the user experience.
2. **Multiroom Sync**
Many music services that support multiroom synchronization rely on Linux ALSA APIs like snd_pcm_delay() to estimate the kernel buffer fill level and synchronize audio playback across devices. Any new approach to meet the requirements, should not disrupt this synchronization.

I've tried virtual loopback, PulseAudio, and a customized dswitch plugin. While all these methods enable dynamic PCM switching, I couldn't achieve stable long-term latency on the same PCM. Any guidance or suggestions on achieving stable long-term latency along with dynamic PCM switching would be greatly appreciated.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/443
Repository URL: https://github.com/alsa-project/alsa-lib
