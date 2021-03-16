Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D983733DB2A
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Mar 2021 18:45:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52A6C18EA;
	Tue, 16 Mar 2021 18:44:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52A6C18EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615916709;
	bh=1fBS5g9BvaOl9eQkcdb/ll2xKtMOyX0wWmhEeNzYM7g=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UlDiTZ0EsZ5n/0yuOWBohNmeqIlKCCAYv0wUvTaTzv1DikXawoFyl9gIp+JMmO6Wz
	 YKm/Ti12JzwiNP8l+/8k5UFJbLvjdxPtZZPwelKMOZWEoh3pqRLoGUB9H6HKP5LZyT
	 KDzv0bgYgNHpmOKriYbh7ydV0EsYhs/g2xD6NIok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A91E6F80137;
	Tue, 16 Mar 2021 18:43:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA9F7F80163; Tue, 16 Mar 2021 18:43:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1EF89F80148
 for <alsa-devel@alsa-project.org>; Tue, 16 Mar 2021 18:43:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EF89F80148
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1615916605202157974-webhooks-bot@alsa-project.org>
References: <1615916605202157974-webhooks-bot@alsa-project.org>
Subject: conf: No SPDIF on Plantronics 3220 headset
Message-Id: <20210316174336.BA9F7F80163@alsa1.perex.cz>
Date: Tue, 16 Mar 2021 18:43:36 +0100 (CET)
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

alsa-project/alsa-lib pull request #126 was opened from drjhe:

The Plantronics Blackwire 3220 Series headset (USB ID 047f:c056) shows up in GNOME Settings with a non-existent digital output. Add it to the list to suppress this.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/126
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/126.patch
Repository URL: https://github.com/alsa-project/alsa-lib
