Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CE5AE8510
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Jun 2025 15:46:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6846C601F2;
	Wed, 25 Jun 2025 15:45:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6846C601F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750859163;
	bh=NK2sMryTrJo0Qz/HXixc4QPlYahEBt1Yd8a2U9UknfY=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K5ClIzpF4KKdnqEr1gu/8wuwhpsMOnJoBitvwhog3YSZBBl68higiTByKhHW1Exz8
	 V7DyLRhN8A/xFssWszJzjYV5nBFxrM6XEXbVJpKhm9E220fJ5H/q1GUJhpzTiO/kAJ
	 59hZBgQ6plDh6JiVbbwdpqwSoUD0WFAAfmAlFhV0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8AD5F805C4; Wed, 25 Jun 2025 15:45:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9108AF805B6;
	Wed, 25 Jun 2025 15:45:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D427F804FB; Wed, 25 Jun 2025 15:45:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail.vandervlis.nl (mail.vandervlis.nl [91.198.178.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B394F8026D
	for <alsa-devel@alsa-project.org>; Wed, 25 Jun 2025 15:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B394F8026D
Received: from localhost (localhost [127.0.0.1])
	by mail.vandervlis.nl (Postfix) with ESMTP id 8680F1FD72
	for <alsa-devel@alsa-project.org>; Wed, 25 Jun 2025 15:45:18 +0200 (CEST)
Received: from mail.vandervlis.nl ([127.0.0.1])
	by localhost (mail.vandervlis.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mq8M7CIRHbax for <alsa-devel@alsa-project.org>;
	Wed, 25 Jun 2025 15:45:18 +0200 (CEST)
Received: from sioban.squirrel.nl (86-86-198-172.fixed.kpn.net
 [86.86.198.172])
	(Authenticated sender: johanvromans)
	by mail.vandervlis.nl (Postfix) with ESMTPSA id 69E281F84C
	for <alsa-devel@alsa-project.org>; Wed, 25 Jun 2025 15:45:18 +0200 (CEST)
Received: from phoenix.squirrel.nl (phoenix.squirrel.nl [192.168.1.251])
	by sioban.squirrel.nl (Postfix) with ESMTP id F0D949100AAF;
	Wed, 25 Jun 2025 15:45:17 +0200 (CEST)
Date: Wed, 25 Jun 2025 15:45:17 +0200
From: Johan Vromans <jvromans@squirrel.nl>
To: alsa-devel@alsa-project.org
Subject: Zoom R24 USB multichannel audio interface no longer recognized
Message-ID: <20250625154517.1e95463a@phoenix.squirrel.nl>
Organization: Squirrel Consultancy
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PBSDS42FJ2ZU2TYKX36GLNWTPSG5CNPH
X-Message-ID-Hash: PBSDS42FJ2ZU2TYKX36GLNWTPSG5CNPH
X-MailFrom: jvromans@squirrel.nl
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBSDS42FJ2ZU2TYKX36GLNWTPSG5CNPH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I'm new here so my apologies if I'm asking questions at the wrong place.
Someone told me this could be a regression in ALSA.

I'm running Fedora and have used a Zoom R24 as a USB multichannel audio
interface (8-in/2-out) for many years.

Recently I upgraded to Fedora 42 and now the device is presented as dumb
2-in/2-out USB audio interface.

"pavucontrol" does not present multi-channel profiles for the device.

The command "alsamixer -c 1" (to select the R24) gives "This device does
not have any controls.".

"qjackctl" also shows 2-in/2-out channels.

I use the device with "ardour" for multi-channel recording but that no
longer works, only 2-in/2-out channels are available.

How can I get the R24 fully functional again?

Thanks,
