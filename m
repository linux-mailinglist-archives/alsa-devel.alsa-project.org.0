Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF7A7F1876
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Nov 2023 17:20:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0798AE80;
	Mon, 20 Nov 2023 17:19:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0798AE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700497240;
	bh=a2Uu8UI8V0vvRA3hscoyzszAisM9xQQnRCyxHTEGNwM=;
	h=Subject:From:To:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:Date:From;
	b=J1uJOgsz82qNawUVlhDX+9mPndquQkdaTVnQKH1P9MggRYJl/YoaysAtLlSVCDEy2
	 zkaN/oFvsr/u0rSi3+JKaWCA7+exCdB1m22kFEwxnxSR3BNmiLt/KfDHP/DB93wv3Y
	 6nHLX22oVPn9Qz7Fqt1jK1b5a0aAe/RYKyk8wT6k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB997F80558; Mon, 20 Nov 2023 17:17:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40993F80558;
	Mon, 20 Nov 2023 17:17:19 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 6/7] ASoC: cs43130: Allow driver to work without IRQ
 thread
From: ckeepax@opensource.cirrus.com
To: alsa-devel@alsa-project.org
Message-ID: <20231120095522.GH32655@ediswmail.ad.cirrus.com>
X-Mailman-Approved-At: Mon, 20 Nov 2023 16:17:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/62JHNZ64BZ32JRIATS2Y45AXMCZAELI4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
Date: Mon, 20 Nov 2023 17:17:19 +0100 (CET)

The content of this message was lost. It was probably cross-posted to
multiple lists and previously handled on another list.
