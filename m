Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4FA3E9F70
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Aug 2021 09:27:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A9F71AAB;
	Thu, 12 Aug 2021 09:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A9F71AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628753237;
	bh=dIhHqPG3f3hsBPrpcbnp62K+rmOyq+zaC2/CFusLUhU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BBWQJz2U/nDg0WckaT3NsxcEIgEv3DziGEBL5WrflcXtyoBvgUuSNU+geneWgMmsJ
	 jZGBHmzcBofpHP3WhHkn9xb1kGfwT+tX20w3685jvaFn9GgewwLmgBGyyiGi1WrbH9
	 z80Eo3HEmPYtySr3N23bD4aC5MkOhMWqw6/7CKCA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 905FAF800AF;
	Thu, 12 Aug 2021 09:25:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D1E6F8025D; Thu, 12 Aug 2021 09:25:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 26B4EF800AF
 for <alsa-devel@alsa-project.org>; Thu, 12 Aug 2021 09:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26B4EF800AF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1628753141271382093-webhooks-bot@alsa-project.org>
References: <1628753141271382093-webhooks-bot@alsa-project.org>
Subject: Filtering/manipulating MIDI messages
Message-Id: <20210812072547.5D1E6F8025D@alsa1.perex.cz>
Date: Thu, 12 Aug 2021 09:25:47 +0200 (CEST)
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

alsa-project/alsa-utils issue #106 was opened from neilbags:

Hi, I'm using aconnect to send MIDI data from one USB MIDI device to another.

I need to filter the messages, so that only one MIDI channel gets sent through, or ideally, send data that comes in on one channel from device A out to device B on a different MIDI channel.

Is there any way to do this just with the command line tools?

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/106
Repository URL: https://github.com/alsa-project/alsa-utils
