Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E14D01FAADF
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 10:13:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FE53169D;
	Tue, 16 Jun 2020 10:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FE53169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592295230;
	bh=GB4/Sj2N1ynfjSqfU6MB2WMpm745vHzdCLza/zjpgWQ=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U2pHPQedk/Mb/3TPQ+On3E35NyI3qkItN/obhkq/ZDQYwzwJUvFGtz8emk5lmBzkg
	 wTO4fjAgGVVBS7xflBP1SAYqSA0frLwIBlAycnpCQcF3LnumVCVTMoU8iZdkdSWowp
	 BmTIEQr4MIytC7pRFLinV4U71SjyAqnRwTDoaZcU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7B06F80232;
	Tue, 16 Jun 2020 10:12:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61BF4F8022B; Tue, 16 Jun 2020 10:12:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dd48038.kasserver.com (dd48038.kasserver.com [85.13.164.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2824EF80114
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 10:11:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2824EF80114
Received: from meadow.localnet (x4e3034a9.dyn.telefonica.de [78.48.52.169])
 by dd48038.kasserver.com (Postfix) with ESMTPSA id A9923500085D
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 10:11:58 +0200 (CEST)
From: "m.eik michalke" <alsa@reaktanz.de>
To: alsa-devel@alsa-project.org
Subject: presonus StudioLive 24.4.2
Date: Tue, 16 Jun 2020 10:11:57 +0200
Message-ID: <1859294.RmyynjnHiM@meadow>
Organization: http://www.reaktanz.de/blog
X-Face: :Fk?kfw3:=Vz)np%nh,d4^[#)-y,9IYe:y,; }P|%`fw>/.msl.f=*6j*-f$vL09$qopvp6
 Ox|(^ge<|+0iS]{&|\<0>i7r'@'k+i=eB5y8*pO$#xT+$2uq=`
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

hi,

i'm trying to get a presonus StudioLive 24.4.2 up and running:

  https://www.presonus.com/products/studiolive-24.4.2

so far i'm partly successful -- looks like the board is automatically detected 
and supported by the firewire dice module.

however, i'm only offered 16 of the 24 supported audio channels. in the list 
of soundcards it is merely shown as "studiolive" without further info on the 
model. i wasn't able to find further info on this board's status with regards 
to alsa, so if there's documentation on this somewhere, could someone please 
point me to it?

in case that as of now the studiolive isn't officially supported or the above 
behavior is due to the fact that so far only the 16.4.2 is known to the 
module, i'm willing to help as far as i can ;) i hope that already seeing 16 
channels is a good point to start and that it's not too hard to make the 
remaining 8 show up as well...


best regards :: m.eik



