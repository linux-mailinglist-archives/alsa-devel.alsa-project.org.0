Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7477E0F52
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Nov 2023 13:25:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4C66828;
	Sat,  4 Nov 2023 13:24:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4C66828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699100719;
	bh=hTBWud1WiUKp6Avuu9voneiNNJXiv6jNooi+NDU8PLM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ilsYnsZ1qVgjUKsyV7YgWS0WCqbA9SRM02lF46qmd7Gn8RbAwLJL63eJV8ZHeRc22
	 HajPi7uSrRsxuhaSPcr4MglniA6kvNmM+hnJojxiA1Ka5oa3qScQDrAzmvCJcw0rHk
	 Y6hbDGDg/HB6KLLtGaVbZaN9pCQba4gJD/THZApA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43DE4F80425; Sat,  4 Nov 2023 13:24:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB4F2F80152;
	Sat,  4 Nov 2023 13:24:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B64EF8020D; Sat,  4 Nov 2023 13:22:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C02FF8014B
	for <alsa-devel@alsa-project.org>; Sat,  4 Nov 2023 13:22:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C02FF8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1699100536390785456-webhooks-bot@alsa-project.org>
References: <1699100536390785456-webhooks-bot@alsa-project.org>
Subject: [dmix] time for a default up to 8 channels?
Message-Id: <20231104122220.2B64EF8020D@alsa1.perex.cz>
Date: Sat,  4 Nov 2023 13:22:20 +0100 (CET)
Message-ID-Hash: ODUED4HKCXFWXWKATJSLNXL4JEXPE5VN
X-Message-ID-Hash: ODUED4HKCXFWXWKATJSLNXL4JEXPE5VN
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ODUED4HKCXFWXWKATJSLNXL4JEXPE5VN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #362 was opened from sylware:

Isn't the time for dmix to try to configure by default the audio hardware with as many channels as possible up to 8 (at min 48/44.1 kHz, 16bits/float32)?

The channel map should be fine nowadays, shouldn't it?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/362
Repository URL: https://github.com/alsa-project/alsa-lib
