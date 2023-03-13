Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DAD6B6CCC
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 01:27:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5567B1427;
	Mon, 13 Mar 2023 01:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5567B1427
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678667237;
	bh=dr8QSDKeCwn73ZpB0DDaTAXmwXaqXBGgE3waR0rTDgA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=etTn9AZ4h7WxWYHiGLgHJiT46FqbSIGmNQJ7yBpM+ch8dJA4lTbRU5ZcjmZZZCWET
	 uOopbCvtMHSNe1sZdAweRjbH1om4qmaA35IrFysKWzXpi6mN3VP2AyT1HqXFoskmCI
	 SsTJ9kehkKnjv+ce7kYOjRlqfpcbDGRvmkr5FY7Y=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7033AF8032D;
	Mon, 13 Mar 2023 01:26:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30661F80423; Mon, 13 Mar 2023 01:26:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id BC0C8F80093
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 01:26:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC0C8F80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1678667175973212957-webhooks-bot@alsa-project.org>
References: <1678667175973212957-webhooks-bot@alsa-project.org>
Subject: ALC4080 on MSI MPG Z590 Gaming Force (0db0:8af7)
Message-Id: <20230313002622.30661F80423@alsa1.perex.cz>
Date: Mon, 13 Mar 2023 01:26:22 +0100 (CET)
Message-ID-Hash: WEVDWGGT7RPARUYV2CU26WQWEX4QW64P
X-Message-ID-Hash: WEVDWGGT7RPARUYV2CU26WQWEX4QW64P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WEVDWGGT7RPARUYV2CU26WQWEX4QW64P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #290 was opened from Paris17:

I have a MSI MPG Z590 GAMING FORCE motherboard with ALC4080. Front panel audio doesn't work in any Linux distribution I've tried. But adding in "USB-Audio.conf" the device ID number (0db0:8af7) to the command for "Define.ProfileName" works in Arch, OpenSuse, Manjaro and EndeavourOS. It doesn't work in Fedora and Clear Linux though. 
Please add audio support for this motherboard in USB-Audio.conf.  Thank you.

USB ID: 0db0:8af7

$ lsusb | grep 0db0
Bus 001 Device 003: ID 0db0:8af7 Micro Star International USB Audio

Here is my alsa-info output:
http://alsa-project.org/db/?f=a5339b54ab51163373c77dc45c267bfba2507531

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/290
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
