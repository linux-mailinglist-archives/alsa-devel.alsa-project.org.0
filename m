Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B32F7CEC9B
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 02:11:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7BEB84A;
	Thu, 19 Oct 2023 02:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7BEB84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697674263;
	bh=E1A/UBESFW0hix0JFxpl9JRSpX67E+rrzT5iIXuz8OE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=DAbNFKJ0JdcHBJEeDr7wkEmTgMcRGqTCVrUtZeTaZYGD2wEmJ33la3gAE8X6zYgXs
	 fa9qZTATHqqOstaeA4jdhWd+k56DVOsUWtVo5BbEytsdVVkKxlmRoDlAcCD2lHj5R9
	 90f+B/F+Ez3CkrD0S/r+s1naRVxAcaQBuswyDIG4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52BD2F8019B; Thu, 19 Oct 2023 02:10:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00A7FF8024E;
	Thu, 19 Oct 2023 02:10:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8C37F8025F; Thu, 19 Oct 2023 02:09:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id DEAB3F8019B
	for <alsa-devel@alsa-project.org>; Thu, 19 Oct 2023 02:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEAB3F8019B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1697674157891312361-webhooks-bot@alsa-project.org>
References: <1697674157891312361-webhooks-bot@alsa-project.org>
Subject: USB-Audio: Add FiiO K11 config
Message-Id: <20231019000920.A8C37F8025F@alsa1.perex.cz>
Date: Thu, 19 Oct 2023 02:09:20 +0200 (CEST)
Message-ID-Hash: VPJSIKACHOHM5NKCGAPPJFJG6CWIJO2N
X-Message-ID-Hash: VPJSIKACHOHM5NKCGAPPJFJG6CWIJO2N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPJSIKACHOHM5NKCGAPPJFJG6CWIJO2N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #360 was edited from ZVNexus:

Without an ALSA config the device shows up as "Digital" and "Analog", and the Analog option has no volume control. The DAC only exposes the headphone jack in USB DAC mode, so just headphones. 

Attached some information about the DAC

[aplay-L.txt](https://github.com/alsa-project/alsa-ucm-conf/files/13035153/aplay-L.txt)
[proc-asound-K11-stream0.txt](https://github.com/alsa-project/alsa-ucm-conf/files/13035154/proc-asound-K11-stream0.txt)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/360
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/360.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
