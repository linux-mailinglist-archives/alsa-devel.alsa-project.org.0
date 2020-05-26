Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C01F41E2A3E
	for <lists+alsa-devel@lfdr.de>; Tue, 26 May 2020 20:43:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5079F176B;
	Tue, 26 May 2020 20:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5079F176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590518591;
	bh=9lVaLmGxaJOQmVpgtaJOTfV8jv/LRfgiVygmC5njkOA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fOuVUCrkuSD3+Ixj/yDrHNxN4TRJHDigOEXYlCVZli52f2mL8KIQiSNEz7imCKdBy
	 GWg09ScHOjL0QWHrdyBq0Li2lD+cm/DN71JTSdBNTlaqgYGmym5DobHH/OthfiEJni
	 pzelQnhOFY+gh5xUA0gJBI30O+jBumtLXJnFlnzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FA6FF8015C;
	Tue, 26 May 2020 20:41:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 533BBF80150; Tue, 26 May 2020 20:41:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1898CF80131
 for <alsa-devel@alsa-project.org>; Tue, 26 May 2020 20:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1898CF80131
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1590518479009105921-webhooks-bot@alsa-project.org>
References: <1590518479009105921-webhooks-bot@alsa-project.org>
Subject: ucm2: Add profile for Chromebook Asus C300
Message-Id: <20200526184128.533BBF80150@alsa1.perex.cz>
Date: Tue, 26 May 2020 20:41:28 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #26 was opened from tiwai:

ASUS Chromebook C300 alias Google QUAWKS is an Intel Baytrail platform
with max98090 codec.  This patch adds the basic UCM snippet for the
max98090 codec and HiFi.conf for this model.

Note that MIC2 is used for the headset mic.  If another model with
this codec uses a different ADC port, we'd need to create another
profile snippet and rename the device.

BugLink: https://apibugzilla.suse.com/show_bug.cgi?id=1171492
Signed-off-by: Takashi Iwai <tiwai@suse.de>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/26
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/26.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
