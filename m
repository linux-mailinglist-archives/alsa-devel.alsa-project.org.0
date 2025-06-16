Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 273CEADB71D
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Jun 2025 18:38:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D4F5601F7;
	Mon, 16 Jun 2025 18:38:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D4F5601F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750091897;
	bh=89IIyECWWuXvV/lElL96HBO2v0dg5+/9NMJPNCWE/2E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ge4Ij0lO0yKuv9SSxunsqZ+NAVyfVDXVuDayYViH6b7sT+Hbz1kxOIy0gb3YEwm6t
	 bYo628EQR2u3jPMkG+73amsBCOm0ESkB/nOFUoqg2IyZjRrEedJ5MThJEPV+HO+e2g
	 kATvkWpVH87LPvvxUYlp/MN5bvgimBfKpd95mAXM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 723C4F805C8; Mon, 16 Jun 2025 18:37:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5034FF805C6;
	Mon, 16 Jun 2025 18:37:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF916F80124; Mon, 16 Jun 2025 18:37:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E03CF800E4
	for <alsa-devel@alsa-project.org>; Mon, 16 Jun 2025 18:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E03CF800E4
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18499345990fbc00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/581@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/581@alsa-project.org>
Subject: add UCM2 support for MSI MAG B850M Mortar Wifi (ALC4080)
Date: Mon, 16 Jun 2025 18:37:39 +0200 (CEST)
Message-ID-Hash: SBTHBEFHALK72GJEPETRA5C43GRX2MPT
X-Message-ID-Hash: SBTHBEFHALK72GJEPETRA5C43GRX2MPT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SBTHBEFHALK72GJEPETRA5C43GRX2MPT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #581 was opened from DanielDecker:

Solves problems with front panel audio and S/PDIF sound output for MSI MAG B850M Mortar Wifi, which uses the Realtek ALC4080 audio chip.
I also tested line in (back side) and microphone input (front panel).
[alsa-info.txt](https://alsa-project.org/db/?f=70ed25ea247c3ac8c253755a5c70e86d67501191)

Thanks in advance.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/581
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/581.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
