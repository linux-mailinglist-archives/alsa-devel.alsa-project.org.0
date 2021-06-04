Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C60439B6BE
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 12:08:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E37CB171D;
	Fri,  4 Jun 2021 12:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E37CB171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622801287;
	bh=lOjQKn+NvcIgHE+7SnKAm9/JH08DXST4OGH7h/825pQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iJ6GzLAAjbk+TjIXvX/Mho5ij00b4RUT2USsgFyYvSr9SExAKNCJ/IpP+A8MBmwAW
	 eyUBY4dWjdRUGeRbLE7NBCsCnEsQjmhAlyWHgDGaYhu9ltLa6f+alE7WPIa3lgdw7j
	 6EOyFmrTtEm5JmvnI+JtWq4QU4Hr9HGPTrR6dWGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AF4FF800CC;
	Fri,  4 Jun 2021 12:06:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEEEEF802C4; Fri,  4 Jun 2021 12:06:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CD15EF800CC
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 12:06:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD15EF800CC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1622801191165927887-webhooks-bot@alsa-project.org>
References: <1622801191165927887-webhooks-bot@alsa-project.org>
Subject: hda: improve the microphone device allocation
Message-Id: <20210604100635.AEEEEF802C4@alsa1.perex.cz>
Date: Fri,  4 Jun 2021 12:06:35 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #97 was opened from perexg:

This change use the local variables for the UCM microphone
device names. Also, handle the no-dmic case for sof-hda-dsp
hardware.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/97
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/97.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
