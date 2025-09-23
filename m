Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 186ACB95AAB
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Sep 2025 13:29:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 014D0601F1;
	Tue, 23 Sep 2025 13:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 014D0601F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758626965;
	bh=FzoshOnQlLs90CVOWSnglhUnEC3LVTffvKHP8scAvns=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cszWiyhnW6nrWXmDBhwizBJQGN4k8qDPDmvlOMQ8JscUDe9pBuCN/Aa42/NhcGtZi
	 QrCCymrAtdzWuj5fR097LCuzpU+3UKk7+aSwuqvNr0OiOmBHhwjbSG38dpjjc8gLW6
	 LPLFv+gJ5XZCMPlziGuI5iImoo8lS6f/M3zi4A20=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 885CEF805C0; Tue, 23 Sep 2025 13:28:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52FC9F805C8;
	Tue, 23 Sep 2025 13:28:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECDBCF8021D; Tue, 23 Sep 2025 13:28:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 21E14F800E3
	for <alsa-devel@alsa-project.org>; Tue, 23 Sep 2025 13:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21E14F800E3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1867e5dd5fd48600-webhooks-bot@alsa-project.org>
In-Reply-To: <1867e5dd5f2c7e00-webhooks-bot@alsa-project.org>
References: <1867e5dd5f2c7e00-webhooks-bot@alsa-project.org>
Subject: UCM Error for MOTU M6
Date: Tue, 23 Sep 2025 13:28:40 +0200 (CEST)
Message-ID-Hash: QTVKBEDRQZP4ECFHBTVVTONZXL33JWJS
X-Message-ID-Hash: QTVKBEDRQZP4ECFHBTVVTONZXL33JWJS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QTVKBEDRQZP4ECFHBTVVTONZXL33JWJS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #617 was opened from FreddieWitherden:

My USB MOTU M6 USB device works fine, but the KDE sound settings dialogue reports it as "M Series [ALSA UCM error] Pro" in both the Playback Devices and Recording Devices.  I've attached the output of `alsa-info.sh --no-upload`.

[alsa-info.txt](https://github.com/user-attachments/files/22492752/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/617
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
