Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F42F2AF7F8
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 19:33:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 829F41783;
	Wed, 11 Nov 2020 19:32:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 829F41783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605119617;
	bh=PHrCWG3T7Mvi1yO659CPEkwHRWUcGXtHXnVrdCs2dJs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kkaJSNihbC1MbHCrDfrGImM0KEO7EZw84pIUpfNioCclSCmePIYqPkqbeTIKWPrcY
	 I+7SRIMpejLMcG12iRuRDMkuYrqD/x2rt4IztbAKlAbULPZt4APVPPVePZsyMpR+sF
	 j7a7Sk3OTn6wyGhuIzC8WbJX3qKkhsXopr0spWrY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFD81F80271;
	Wed, 11 Nov 2020 19:32:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0888DF8025E; Wed, 11 Nov 2020 19:32:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DD2D2F800AE
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 19:32:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD2D2F800AE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605119525806600094-webhooks-bot@alsa-project.org>
References: <1605119525806600094-webhooks-bot@alsa-project.org>
Subject: Alsa Utils + Lib 1.2.2-1ubuntu2,
 1.2.2-2.1ubuntu2.1 breaks sound on HP Envy x360 (Mint 20)
Message-Id: <20201111183210.0888DF8025E@alsa1.perex.cz>
Date: Wed, 11 Nov 2020 19:32:09 +0100 (CET)
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

alsa-project/alsa-utils issue #71 was edited from kingkode1337:

After update, sound no longer works and does not pick up my sound card. 

```
Advanced Micro Devices, Inc. [AMD] Family 17h (Models 10h-1fh) HD Audio Controller
	Subsystem: Hewlett-Packard Company Family 17h (Models 10h-1fh) HD Audio 
Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

```
It now shows as a Dummy Device, under the upgrade so I have abstained from doing so.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/71
Repository URL: https://github.com/alsa-project/alsa-utils
