Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 069DE5277AD
	for <lists+alsa-devel@lfdr.de>; Sun, 15 May 2022 15:07:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89D3116C1;
	Sun, 15 May 2022 15:06:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89D3116C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652620052;
	bh=rcWyG8sDcN+A/O/JcaDQqUzixyKYoAbCJdt2M1/U4BI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YjgO+Y8VonHHXZyh32Cp6nXwuQWJeMxdTIz19N9cUSh3y1WRQm/GfP2/CjwU7ahkp
	 RSO+Ooq6N7SfyuORytul3t9Ky2/VRD6cD0hBrFNP3EkT5TS6vCKRjGrNQh1Vfir4mH
	 80SSgbexWaQpJoCDEsdyH37f1SkCXAWhJQytLtmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01F9EF800D8;
	Sun, 15 May 2022 15:06:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32F7CF8012C; Sun, 15 May 2022 15:06:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1E1B5F8012C
 for <alsa-devel@alsa-project.org>; Sun, 15 May 2022 15:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E1B5F8012C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1652619988689560890-webhooks-bot@alsa-project.org>
References: <1652619988689560890-webhooks-bot@alsa-project.org>
Subject: Weaknesses in alsa_info on new Ubuntu systems
Message-Id: <20220515130632.32F7CF8012C@alsa1.perex.cz>
Date: Sun, 15 May 2022 15:06:32 +0200 (CEST)
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

alsa-project/alsa-utils issue #146 was opened from mhampl:

There are some weaknesses on current Ubuntu systems (e.g. release 22.04) where the alsa_info scripts does not deliver the desired information:

The command "tree" is no more provided by default (but can be installed in addition)
This results in the error message
"./alsa-info.sh: line 661: tree: command not found"
and causes missing output in "Sysfs card info"

The command "dmesg" requires administrative authorizations (e.g. "sudo dmesg | grep ...")
This results in the error message
"dmesg: read kernel buffer failed: Operation not permitted"
and causes missing output in "ALSA/HDA dmesg"

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/146
Repository URL: https://github.com/alsa-project/alsa-utils
