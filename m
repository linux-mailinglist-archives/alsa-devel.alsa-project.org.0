Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C39C5312053
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Feb 2021 23:43:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C4CE15E2;
	Sat,  6 Feb 2021 23:42:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C4CE15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612651389;
	bh=o+RhNnlQvP2IHwNRRuN4OOD+W74eOPTxDoTOUAYhdnk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=taOQdChfxnFOlLXo7P+co7SIwr1+RGaABFigXducduj9gmaW3YEgjK7yPs4HUpkDp
	 7UnbgxO8JtoR4E79xKLyDXV3Q9UVBODHF3s021Z0g8WZCwapU5x1a+rf55spVu8TOB
	 2l4F8db72cLo/uj66rVjw/2JS5fTmx3jqTAhIHRg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3562F801F7;
	Sat,  6 Feb 2021 23:41:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B465F80171; Sat,  6 Feb 2021 23:41:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 74494F80139
 for <alsa-devel@alsa-project.org>; Sat,  6 Feb 2021 23:41:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74494F80139
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1612651281048146009-webhooks-bot@alsa-project.org>
References: <1612651281048146009-webhooks-bot@alsa-project.org>
Subject: alsamixer: use background color instead of COLOR_BLACK
Message-Id: <20210206224135.0B465F80171@alsa1.perex.cz>
Date: Sat,  6 Feb 2021 23:41:35 +0100 (CET)
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

alsa-project/alsa-utils pull request #77 was opened from r-burns:

Hi! I have a cosmetic "improvement" I'd like to share. Scare quotes because this is possibly opinionated, but I'd still like to know what you think.

I think on typical terminals, COLOR_BLACK is the same or quite similar to the background color, so this does not make much of a difference. But on "solarized" color schemes and similar, the COLOR_BLACK may be quite different from the background color, so in my opinion it looks odd to have the alsamixer panel stand out this way. For example, I'm using the "Nord" color scheme on a pitch black #000000 background, and here's how the mixer looks with/without this patch (blank terminal, htop, and ncmpcpp also provided for comparison):

![image](https://user-images.githubusercontent.com/52847440/107131140-dbf46500-6888-11eb-938a-9a3258bf7184.png)

As you can see, the current alsamixer in the center looks a bit strange and sticks out against my chosen background color and the other TUIs I'm using. Htop and ncmpcpp agree on using the builtin `-1` background color for their own backgrounds, but alsamixer uses COLOR_BLACK which stands out from the actual background. The alsamixer on the bottom right is using this patch, and blends in seamlessly.

Again, this is just my opinion! Feel free to close if this is wrong or superfluous. Nonetheless, I thought I'd share this patch, in case anyone else feels the same way.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/77
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/77.patch
Repository URL: https://github.com/alsa-project/alsa-utils
