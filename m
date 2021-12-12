Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AEED471921
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Dec 2021 08:32:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDBA91AA5;
	Sun, 12 Dec 2021 08:31:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDBA91AA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639294329;
	bh=ZCP5mNpWYay/4Z2iB13uvdNCyZzx3AIFqExvAD17uPI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VzmDRoCXHdiy81TWEU72Ax+VT4TjTraTSB7hf9xO1FNRSPFrwT0XnNxuP6f2W/ooR
	 s/vOx9F8gUSGOa66eG1wGqQysZsu9BKGnaBga2bVloTETfFiiJiCnnYbEDPkdmnOD/
	 JeZgISqfPGH7ojCzZZcOLtBgYERhFD0DKYVBSpz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BB22F80249;
	Sun, 12 Dec 2021 08:31:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FF19F80246; Sun, 12 Dec 2021 08:30:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BA516F800BC
 for <alsa-devel@alsa-project.org>; Sun, 12 Dec 2021 08:30:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA516F800BC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639294246636231899-webhooks-bot@alsa-project.org>
References: <1639294246636231899-webhooks-bot@alsa-project.org>
Subject: Add profile for Behringer UMC204HD
Message-Id: <20211212073059.1FF19F80246@alsa1.perex.cz>
Date: Sun, 12 Dec 2021 08:30:59 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #128 was opened from brndd:

Adds a profile for the Behringer UMC204HD to split a 4-channel output into two outputs, and a 2-channel input into two inputs, as per the physical layout of the device. I have very little idea what I'm doing, so let me know if something looks incorrect (there's one thing that looks incorrect even to me which I shall point out in a comment below). The config does at least work, though.

[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/7698277/alsa-info.txt)


-----

![UMC204HD_P0BK0_Front_XL](https://user-images.githubusercontent.com/5822375/145704001-5bb9b741-0d1f-4f83-8184-6335c9b53fbf.png)
![UMC204HD_P0BK0_Rear_XL](https://user-images.githubusercontent.com/5822375/145703999-918614e6-3298-4191-a7b6-7260e8eb3638.png)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/128
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/128.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
