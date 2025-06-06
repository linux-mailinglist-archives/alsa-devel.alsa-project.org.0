Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE1ACFC0E
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jun 2025 06:51:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E753F60190;
	Fri,  6 Jun 2025 06:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E753F60190
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749185503;
	bh=uuLyg76SpeFYkli4UzfVYTXhsR1q/1pKy+fMm/bhj/8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=M5BD8r24qYpSWbl26C/kowy6ASi0RtNXk/uj1gYk2wdtjft0sIghatdpfrgYY9IAR
	 gqpGXXoWoAfp7t/7wW20J74OovB3YBnD688OCGC81QNV2ExbUaXz8di5GE4PAWfHba
	 c/9IIZTsf4ROD3Qhg3Fr+Sx1XQhBy14iprPfu4pI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10A4EF805B3; Fri,  6 Jun 2025 06:51:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD4A6F805B3;
	Fri,  6 Jun 2025 06:51:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DAE8F800F0; Fri,  6 Jun 2025 06:51:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id C9A66F8003A
	for <alsa-devel@alsa-project.org>; Fri,  6 Jun 2025 06:51:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9A66F8003A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18465ae94a86fe00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/573@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/573@alsa-project.org>
Subject: ucm2: sof-soundwire: add rt712-vb device
Date: Fri,  6 Jun 2025 06:51:05 +0200 (CEST)
Message-ID-Hash: LGJ254GFIVRSDWM622N42WVDQPNGSESF
X-Message-ID-Hash: LGJ254GFIVRSDWM622N42WVDQPNGSESF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LGJ254GFIVRSDWM622N42WVDQPNGSESF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #573 was opened from shumingfan:

This patch supports RT712VB device integrated with DMIC in one Soundwire interface.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/573
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/573.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
