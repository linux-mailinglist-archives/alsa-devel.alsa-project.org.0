Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A11FA6F930B
	for <lists+alsa-devel@lfdr.de>; Sat,  6 May 2023 18:19:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AD4D2A30;
	Sat,  6 May 2023 18:18:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AD4D2A30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683389972;
	bh=p62rCR7PGQx5T1QjCBdWUZZNjU3dYhuXL9MDwBsj1YA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YPPnpso7gZRh2uVYCN2+IiH18jMEvNXfc6LJnaGET3F6+kIqIMZXNLYZvjOkv3+kk
	 sJiGdBJO5ZiTeba3l270UPogOVNzujxFs4SPQpTxY5kWoVEYN1FzJDLO4g/WtnSJ0G
	 MunWPkZGpcit+60W5FbfFHO+2ZivFqBg6dgMbrO0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0EA1F80534;
	Sat,  6 May 2023 18:18:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAA78F8053B; Sat,  6 May 2023 18:18:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 52EF3F80087
	for <alsa-devel@alsa-project.org>; Sat,  6 May 2023 18:18:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52EF3F80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1683389888320667744-webhooks-bot@alsa-project.org>
References: <1683389888320667744-webhooks-bot@alsa-project.org>
Subject: Some USB-Audio speakers with non-existent S/PDIF outputs
Message-Id: <20230506161809.BAA78F8053B@alsa1.perex.cz>
Date: Sat,  6 May 2023 18:18:09 +0200 (CEST)
Message-ID-Hash: EPF2E7EBAJC4O2KBDKJJB7727HOZTHLQ
X-Message-ID-Hash: EPF2E7EBAJC4O2KBDKJJB7727HOZTHLQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EPF2E7EBAJC4O2KBDKJJB7727HOZTHLQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #315 was edited from drjhe:

I've come across a couple of USB-Audio speaker sets which get configured with non-existent S/PDIF outputs:

- **Creative Pebble V3:** USB ID 041e:3272, ALSA name "Pebble V3"
- **'Ricco' Elite Silicon-based USB speakers:** USB ID 18c3:6255, ALSA name "USB Audio Device"

The phantom output for the Pebble V3 can be removed by adding ```"Pebble V3" 999``` to the ```USB-Audio.pcm.iec958_device``` section of USB-Audio.conf.

For the Ricco speakers the ALSA name seems a bit too generic to add to USB-Audio.conf -- is there a way to achieve the same effect matching on the USB ID?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/315
Repository URL: https://github.com/alsa-project/alsa-lib
