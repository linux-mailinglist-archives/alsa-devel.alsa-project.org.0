Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E3D21CA0D
	for <lists+alsa-devel@lfdr.de>; Sun, 12 Jul 2020 17:56:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 434CD1669;
	Sun, 12 Jul 2020 17:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 434CD1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594569367;
	bh=IjsFFLXJSesLITw99QtzW0y+oYF4uDfY6SqamD0JPsI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SBhxOWFhIx2t39QoHd9NLIy0MyjleqZlNiS0wrCW3zW415hcDbZdlT3WweCK6xYck
	 W+U7d8uVUeLDUeecID2hd2kV/Ioj4DfeH6tRXLNXyoSvv7rLpxrvQO0HePofyxtd01
	 hmJYgZUXeFmjao+B8OiqxwTqzbNB4PYk+PZqBd7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 556C3F801EC;
	Sun, 12 Jul 2020 17:54:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E044AF800B2; Sun, 12 Jul 2020 17:54:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1D71DF800B2
 for <alsa-devel@alsa-project.org>; Sun, 12 Jul 2020 17:54:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D71DF800B2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1594569257036328077-webhooks-bot@alsa-project.org>
References: <1594569257036328077-webhooks-bot@alsa-project.org>
Subject: alsactl do not save all the parameters
Message-Id: <20200712155420.E044AF800B2@alsa1.perex.cz>
Date: Sun, 12 Jul 2020 17:54:20 +0200 (CEST)
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

alsa-project/alsa-utils issue #46 was opened from alemirandap:

Hello everyone, my laptop need to mute the speaker for the full sound experience, when I configure alsamixer with all the levels and mute the speaker I execute "sudo alsactl store"  but after rebooted all the levels and configuration are saved except for muting the speaker. I made some tests muting the master or the headphones and the executed "sudo alsactl store" and these are saved.

I have to manually in every boot mute the speaker, I 'm under arch linux, with others distros doesn't happen, can you give me a hand with this?, thank you
[alsa-info.txt.](https://github.com/alsa-project/alsa-utils/files/4908789/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/46
Repository URL: https://github.com/alsa-project/alsa-utils
