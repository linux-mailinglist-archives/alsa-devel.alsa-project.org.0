Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 247D93F90D0
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 01:03:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C98F16CD;
	Fri, 27 Aug 2021 01:02:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C98F16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630018982;
	bh=qkleVXAKsGK3cXI3fv4tUxsZWblfyTsz4vp+O0W9nN0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jtTbdXrmHPVoajMsYki6lxsLXMiIjL2kbsReXJ8KC2f5m88a6NnQb7UjVzGwZCQUo
	 lfsS9NWljCpaQnWZT86Cgx0qgc07/fvdJwWv9gaGU8FCRS53kuTQWyVagKLZq5PX81
	 CXEOPxfwspmocYl+0mYHkZ/PBlDMgTZVFnDj9Ld4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F011AF800FD;
	Fri, 27 Aug 2021 01:01:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0C34F801D8; Fri, 27 Aug 2021 01:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BA1EAF800FD
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 01:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA1EAF800FD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1630018892825587034-webhooks-bot@alsa-project.org>
References: <1630018892825587034-webhooks-bot@alsa-project.org>
Subject: Error in recording and playing at the same time on raspberry pi
Message-Id: <20210826230141.F0C34F801D8@alsa1.perex.cz>
Date: Fri, 27 Aug 2021 01:01:41 +0200 (CEST)
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

alsa-project/alsa-lib issue #174 was opened from amirush786:

I am try to record and play at the same time. I have a speaker connected to pi via aux cable. I have to play a sound from the speaker and also re ord it at the same time from the tool which is seeed microphone tool which is connected to pi. 
I am able to do that but the recorded file has some hissssshhhhhhhh sound in it don't know why it's coming out to that way. But when I do a individual record I can hear a bit proper noise and less of hisshy noise in it. 
And also how can I check the capture sound is high or not. I followed the approach below.
 I did Alsamixer command and it's shows me this.
So after that I typed in F6 to change my card to seeed card.
Then is scroll down to seed card and hit enter. So I see this.
Then I press f4 and I see this so I don't know where should I see that capture is high.
This is the last thing that messing with me.

![20210822_200619.jpg](https://user-images.githubusercontent.com/31735000/131046816-b77895b8-f6c8-4faa-b624-283100ad00f8.jpg)

![20210822_200626.jpg](https://user-images.githubusercontent.com/31735000/131046829-fab9edb3-d9b2-4938-be84-e7dcccfb4aaf.jpg)

![20210822_200641.jpg](https://user-images.githubusercontent.com/31735000/131046851-631a8e34-33f3-4e88-b971-726b2fdd7756.jpg)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/174
Repository URL: https://github.com/alsa-project/alsa-lib
