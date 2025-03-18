Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61406A6770A
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Mar 2025 15:58:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35486602D6;
	Tue, 18 Mar 2025 15:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35486602D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742309907;
	bh=/CXgSOwPKD1eexEg3G/oMOA0stT9maRhTuilcigUZbw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CvQHu2xfN/0n86VYKFHthu3YtCF2k6wYBKerofSM7nCLW86t1gUqk4kvWHgd+MTx4
	 w88EX5PNHEnRzzy7Gi2renfCGtrQU4Z178EIS0Gogrj5ieyzmg5JbQxogXc9nPFOBf
	 maA4xP4/jF6vmDW0rYsd1m/7CkDRQIPyo3U2jrFI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17F1EF805B0; Tue, 18 Mar 2025 15:57:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB8BFF805B1;
	Tue, 18 Mar 2025 15:57:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 27000F802BE; Tue, 18 Mar 2025 15:56:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FA94F802BE
	for <alsa-devel@alsa-project.org>; Tue, 18 Mar 2025 15:56:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FA94F802BE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182ded85b0661d00-webhooks-bot@alsa-project.org>
In-Reply-To: <182ded85af275c00-webhooks-bot@alsa-project.org>
References: <182ded85af275c00-webhooks-bot@alsa-project.org>
Subject: Unable to attach an LED to headphones without HW mute ALSA Control
Date: Tue, 18 Mar 2025 15:56:39 +0100 (CET)
Message-ID-Hash: 37PJID5SOZ7P3KCEHAALIGJUAZDW4VA3
X-Message-ID-Hash: 37PJID5SOZ7P3KCEHAALIGJUAZDW4VA3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37PJID5SOZ7P3KCEHAALIGJUAZDW4VA3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #527 was opened from stefdb:

I have a laptop with a CS42L43 Codec which supplies the Headphone Jack.
I'm trying to attach the mute state of the Headphones to the Speaker LED.

However, the issue is that the CS42L43 does not possess a Hardware Mute ALSA Control which could be attached to the Speaker LED.

I first tried to use the Volume Control to attach to the LED, however, that was a non-starter because the Mute is software controlled, and thus muting headphones did not touch the Volume Control.

I then tried to add a new control using cset-new, and link it to the Headphones device ([0001-sof-soundwire-Attach-cs42l43-Headphone-Switch-to-spe.patch](https://github.com/user-attachments/files/19321741/0001-sof-soundwire-Attach-cs42l43-Headphone-Switch-to-spe.patch)), and whilst that worked with the LED, the mute no longer actually muted the Headphone, since there was now a "real" control to set the mute which did not actually mute the Device.

Other things I have tried include mapping the Volume control as a Switch, but that does not work, I assume, because the switch control needs to be Boolean.

Is there a way to create a new control to track the LED status, whilst also ensuring that the Headphones still mute?

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/527
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
