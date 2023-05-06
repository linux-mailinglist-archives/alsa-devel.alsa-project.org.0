Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E2A6F930A
	for <lists+alsa-devel@lfdr.de>; Sat,  6 May 2023 18:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBB9C23F6;
	Sat,  6 May 2023 18:17:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBB9C23F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683389921;
	bh=Duy0zmkNF53KLplgEPffNjGpOl5n8R4Yxir5ol04KOE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=e0Jb2UetZQyGLqInzLVGr+4M6UhHSEe6gKn6kwI92vYP2xM9EMQ7zNhKiCWp8KGfF
	 RH8wmv0RtcEpoEYS0E6nbbi0XWwQtgEy76Ggc+pM0h3Nmk+yH2eQmQDVQmrWj3X63T
	 7KkK7yXkP2j3anrtUMjD5qqihIjT81flg5+V+5rQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42957F80529;
	Sat,  6 May 2023 18:17:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB1B1F80534; Sat,  6 May 2023 18:17:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id DD204F80520
	for <alsa-devel@alsa-project.org>; Sat,  6 May 2023 18:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD204F80520
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1683389861449086666-webhooks-bot@alsa-project.org>
References: <1683389861449086666-webhooks-bot@alsa-project.org>
Subject: Some USB-Audio speakers with non-existent S/PDIF outputs
Message-Id: <20230506161747.BB1B1F80534@alsa1.perex.cz>
Date: Sat,  6 May 2023 18:17:47 +0200 (CEST)
Message-ID-Hash: YCMRL4CMZPHJDLCCXWX2QL4U2NOTYTKW
X-Message-ID-Hash: YCMRL4CMZPHJDLCCXWX2QL4U2NOTYTKW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YCMRL4CMZPHJDLCCXWX2QL4U2NOTYTKW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #315 was opened from drjhe:

I've come across a couple of USB-Audio speaker sets which get configured with non-existent S/PDIF outputs:

- **Creative Pebble V3:** USB ID 041e:3272, ALSA name "Pebble V3"
- **'Ricco' Elite Silicon-based USB speakers:** USB ID 18c3:6255, ALSA name "USB Audio Device"

The phantom output for the Pebble V3 can be removed by adding ```"USB Audio Device" 999``` to the ```USB-Audio.pcm.iec958_device``` section of USB-Audio.conf.

For the Ricco speakers the ALSA name seems a bit too generic to add to USB-Audio.conf -- is there a way to achieve the same effect matching on the USB ID?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/315
Repository URL: https://github.com/alsa-project/alsa-lib
