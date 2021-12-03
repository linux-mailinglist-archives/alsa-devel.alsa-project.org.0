Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 210904671DD
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 07:27:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 684CC2235;
	Fri,  3 Dec 2021 07:26:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 684CC2235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638512846;
	bh=nx4Rfh8aIWeZ0IdbVM3Sa3tJKLUCSnfTHWvXcs/FmFc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=brYAIJ3HGZZqugc5LTZrpPMCw/Qdi3RG1+ruDA+qyAqDWhrzr6RVjXiD8Amqgn0g6
	 /MEYkqfywyh/CqIRHgQMDVz0S5v2SRi0HpMYrSFaIWG0/seI8yeCCbI5zfSlE+iy+/
	 k5ZXIa+w+gW/B5FtzprpKAeS8s0HPcGS5tSA6yXY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D75D9F80249;
	Fri,  3 Dec 2021 07:26:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8346EF80085; Fri,  3 Dec 2021 07:26:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6F024F80085
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 07:25:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F024F80085
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1638512753923007011-webhooks-bot@alsa-project.org>
References: <1638512753923007011-webhooks-bot@alsa-project.org>
Subject: init procedure is executed during a store and restore process when
 the final snd_ctl_elem is not readable
Message-Id: <20211203062605.8346EF80085@alsa1.perex.cz>
Date: Fri,  3 Dec 2021 07:26:05 +0100 (CET)
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

alsa-project/alsa-utils issue #122 was opened from yixingwang0517:

When i execute the following commands sequencitally,

    alsa store -f 1.txt
    alsa restore -f 1.txt

my playing volume was initialized.

After a debugging process, I found the problem:

During the "store" process, a control element is saved to the configuration file only when this element is readable.While during the "restore" process, after all the control element from the configuration file is processed, an "additional control element check" which causes a "init procedure" if the result is true is processed.

![image](https://user-images.githubusercontent.com/19835921/144555692-6b3cee21-73fc-4ade-a1f4-cc8f99679a9d.png)


Thus, if total control element count is 5 with the 5th element is not readable, then there will be only 4 control element stored in the configuration file, ranges from "control.1" to "control.4".   Then the "additional control checking" process produces "true" and the variable "err" is evaluated as "-EAGAIN".

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/122
Repository URL: https://github.com/alsa-project/alsa-utils
