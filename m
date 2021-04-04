Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A4032353A02
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Apr 2021 23:25:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35DF316A8;
	Sun,  4 Apr 2021 23:24:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35DF316A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617571543;
	bh=oF3sOJtWGDu1vYmfiOABvtpamZhne6pWyDE/m5hScuI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MRGgatv3nToth63cs0bkY/JVdk6NFgEkC648L/+/4wzbOiuN67ZRbDevwICaXsEfv
	 m6jcM6RL99hlvnt72VVaVJSAdtVGliOI+cBWzMQdPmBQki+KTBT906pOA/ysaIfvsQ
	 y7ckQAUFxABEtwEGI56QwIOolZ4PZnmYw/DpCys8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CEB1F800F3;
	Sun,  4 Apr 2021 23:24:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2A31F8020B; Sun,  4 Apr 2021 23:24:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 592E8F80127
 for <alsa-devel@alsa-project.org>; Sun,  4 Apr 2021 23:24:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 592E8F80127
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1617571445690732956-webhooks-bot@alsa-project.org>
References: <1617571445690732956-webhooks-bot@alsa-project.org>
Subject: Front headphones jack not reporting state to Pulseaudio correctly
 (always unplugged)
Message-Id: <20210404212414.C2A31F8020B@alsa1.perex.cz>
Date: Sun,  4 Apr 2021 23:24:14 +0200 (CEST)
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

alsa-project/alsa-lib issue #130 was opened from jose1711:

ALSA seems to always report state of front headphones jack as "unplugged" to PulseAudio (related bug report: https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1180).

[alsa-info.txt](https://github.com/alsa-project/alsa-lib/files/6255379/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/130
Repository URL: https://github.com/alsa-project/alsa-lib
