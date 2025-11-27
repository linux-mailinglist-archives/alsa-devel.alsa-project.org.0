Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2125FC8CDD1
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Nov 2025 06:17:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6364A601F8;
	Thu, 27 Nov 2025 06:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6364A601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764220654;
	bh=rleIKtICGZTXq0m68TGvpwtIXZMzhYdBIwPMgVFw0Tc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qVoMW2TrYSv0JOC8sqeMk07sdGFvJ2c+rQRjY95ffA+MwnljDJc6tgaeDv9ejMfXA
	 Rcc8rBunW4e+dncpo92VTbIactsEWb42ku+ThYaYkSDVDjFc36l+MhFuXyrjVxeA8e
	 BmppRdfQ8IbkhhoESM2mP5cPotjH3Khvxa4WturU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4FFFF805D4; Thu, 27 Nov 2025 06:16:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 653CFF8047D;
	Thu, 27 Nov 2025 06:16:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91EB4F80551; Thu, 27 Nov 2025 06:16:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 7997CF80087
	for <alsa-devel@alsa-project.org>; Thu, 27 Nov 2025 06:16:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7997CF80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187bc54bf1527e00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/650@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/650@alsa-project.org>
Subject: USB-Audio: Add jack controls for HP Thunderbolt Dock G2
Date: Thu, 27 Nov 2025 06:16:51 +0100 (CET)
Message-ID-Hash: OVDQ6AURMHA5QAVKRHQAGGDIYHBRINLE
X-Message-ID-Hash: OVDQ6AURMHA5QAVKRHQAGGDIYHBRINLE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OVDQ6AURMHA5QAVKRHQAGGDIYHBRINLE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #650 was opened from tatokis:

Similar to the Dell WD15/WD19, this allows for jack detection (headphones/headset) on the HP Thunderbolt Dock G2.

Link: https://lore.kernel.org/linux-sound/20251126003805.2705503-1-tasos@tasossah.com/T/

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/650
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/650.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
