Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C6770466F
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 09:32:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29256823;
	Tue, 16 May 2023 09:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29256823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684222336;
	bh=XuBbIn8p6apIyoGPDNNE8/dWSX+Sup6WUzF2Nq7UdQI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kRJDQsnpsn2spxdP8IfoFicPYb+J8DmB+9cjxXtQnXlTyKd695ccdE7m90djX2I9V
	 tgkpYtn2FnBTRffGRqjAEyNIn9ldpgfFTFHjc5rijQOFWtX+7Z/p2v27tLM4pIYUx9
	 mNVLXoC2eUUqjvKXsKyR/0Pv78JBDQEmQvYj1k64=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DD56F80542; Tue, 16 May 2023 09:30:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E762CF8025A;
	Tue, 16 May 2023 09:30:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E553AF80272; Tue, 16 May 2023 09:30:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 59148F8016A
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 09:30:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59148F8016A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1684222247343755722-webhooks-bot@alsa-project.org>
References: <1684222247343755722-webhooks-bot@alsa-project.org>
Subject: Update USB-Audio.conf for ASUS ROG Strix B650E-I Gaming WiFi and
 ALC4080
Message-Id: <20230516073049.E553AF80272@alsa1.perex.cz>
Date: Tue, 16 May 2023 09:30:49 +0200 (CEST)
Message-ID-Hash: STYMDISINTIFMWVVN3WLPWXZX3UYKNPK
X-Message-ID-Hash: STYMDISINTIFMWVVN3WLPWXZX3UYKNPK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/STYMDISINTIFMWVVN3WLPWXZX3UYKNPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #315 was edited from Sunsheep:

Added configuration for ASUS ROG Strix B650E-I Gaming WiFi and ALC4080

Edit: Added Information from ALSA Information Script

[https://alsa-project.org/db/?f=fe7e76a335dc8f1009ecaac9aa341fb68231aee5](https://alsa-project.org/db/?f=fe7e76a335dc8f1009ecaac9aa341fb68231aee5)


```
Bus 001 Device 002: ID 0b05:1a5c ASUSTek Computer, Inc. USB Audio
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass          239 Miscellaneous Device
  bDeviceSubClass         2 
  bDeviceProtocol         1 Interface Association
  bMaxPacketSize0        64
  idVendor           0x0b05 ASUSTek Computer, Inc.
  idProduct          0x1a5c 
  bcdDevice            0.02
  iManufacturer           3 Generic
  iProduct                1 USB Audio
  iSerial                 0 
```

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/315
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/315.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
