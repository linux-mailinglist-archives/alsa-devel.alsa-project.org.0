Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A051425B02F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 17:52:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4744D1788;
	Wed,  2 Sep 2020 17:51:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4744D1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599061943;
	bh=8E4aCHA8YmkfiF0hxzWcEPfncWmpAutytAuk9HQEb78=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LxvaOl3F7IC1buRfbR3PHfVj65XDzvQRlFQcfjyT/wx/P2shLorRIxzpJPf6eIKVL
	 FidtJd2/LvvKbfBWClkgF4TOKxufSFd//KbqDAPb3X+mzA1d4q6MuZGBBxlsUockiV
	 lnZSJ+mYAJdCxL/uoeSUjGgOQuJM6fiBu/r6EJjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2704F802DB;
	Wed,  2 Sep 2020 17:50:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DCD1F800F3; Wed,  2 Sep 2020 17:50:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BFF15F800F3
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 17:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFF15F800F3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1599061828596168995-webhooks-bot@alsa-project.org>
References: <1599061828596168995-webhooks-bot@alsa-project.org>
Subject: Miss mapping to unmute the middle speakers for Creative X-Fi with 20K1
 chipset cards in analog-output.conf
Message-Id: <20200902155031.3DCD1F800F3@alsa1.perex.cz>
Date: Wed,  2 Sep 2020 17:50:31 +0200 (CEST)
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

alsa-project/alsa-utils issue #54 was edited from deathxxx123:

Hi there. I want to report some bug, that is present from long time and i think that can be fixed now.
With any configuration that uses center/subwoofer, that center gets muted by default for Creative X-Fi with 20K1 chipset cards, but if you have other card, that will not happen, because of missing configuration for Center/Subwoofer in `analog-output.conf`.
The missing thing in `analog-output.conf` is:
```
[Element Center/LFE]
switch = mute
volume = merge
override-map.1 = center,lfe
```
You can see my issue and fix there:
https://github.com/gamer-os/gamer-os/issues/131

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/54
Repository URL: https://github.com/alsa-project/alsa-utils
