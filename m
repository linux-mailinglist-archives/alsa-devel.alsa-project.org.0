Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9B21841B1
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 08:48:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4701417A9;
	Fri, 13 Mar 2020 08:48:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4701417A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584085733;
	bh=vuYDkC8rzmfREN5KuSojnMxn0yIi+rgOraghGSGvs/A=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JXojtUT+vA7rUMDHjjNoEhkRvjH8MvkwbT+hfnTynUCVmvwJh8FaDXfBNDHD3AnJ/
	 ITZxPJ6KA6Ht0tsTubXhV/Bb0AKBLd6YHzG0VxvL1jrjPVqHAfV9W4wUcFofAgEy5r
	 OIJu8JQ6LXO/yYznXaPa+QEdtIrgBzD+lq3Ua72M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A57EF801F7;
	Fri, 13 Mar 2020 08:47:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9311F801EB; Fri, 13 Mar 2020 08:46:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6C540F80090
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 08:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C540F80090
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1584085382060765028-webhooks-bot@alsa-project.org>
References: <1584085382060765028-webhooks-bot@alsa-project.org>
Subject: conf: USB-Audio: Add C-Media USB Headphone Set to the IEC958 blacklist
Message-Id: <20200313074618.C9311F801EB@alsa1.perex.cz>
Date: Fri, 13 Mar 2020 08:46:18 +0100 (CET)
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

alsa-project/alsa-lib pull request #36 was opened from tanuk:

Fixes: https://gitlab.freedesktop.org/pulseaudio/pulseaudio/issues/317

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/36
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/36.patch
Repository URL: https://github.com/alsa-project/alsa-lib
