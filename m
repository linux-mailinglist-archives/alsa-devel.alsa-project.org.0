Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D63174EBA
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Mar 2020 18:46:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDCA9168F;
	Sun,  1 Mar 2020 18:45:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDCA9168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583084779;
	bh=SENecKrurae6lKSWiN0GOfb31Upr2ZiJoGy8ntCjkzc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E8O04zQUmoK/lgb2kuSm67PNseZ/zF7YusgTbO5vFW9IsTO9HF8lgMR7xEq6AxUEc
	 U1J/JLjuoxyODaCN0mxePV6dYxlvxn+LxbPr3GA57BHThSkFhh/5J6TJEmzdUj9kdQ
	 +KFqBrMP9QwS+2B7HljR18TvcWnA41WJOqCNQ4E4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF30FF80245;
	Sun,  1 Mar 2020 18:44:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B7C8F8025F; Sun,  1 Mar 2020 18:44:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.1 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_32,PRX_BODY_72,SPF_FAIL,SPF_HELO_NONE autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id F20A5F8013E
 for <alsa-devel@alsa-project.org>; Sun,  1 Mar 2020 18:44:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F20A5F8013E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1583084674289544106-webhooks-bot@alsa-project.org>
References: <1583084674289544106-webhooks-bot@alsa-project.org>
Subject: Remove duplicate surround entries. Fix for #27
Message-Id: <20200301174437.6B7C8F8025F@alsa1.perex.cz>
Date: Sun,  1 Mar 2020 18:44:37 +0100 (CET)
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

alsa-project/alsa-lib pull request #30 was opened from DarkWav:

Try to remove duplicate surround entries to fix crashes with certain apps by changing the config a bit.
This would have multiple benefits.
1. It allows all the bonus devices (such as samplerate) gained from Version 1.2.2 to stay.
2. It still keeps surround devices around, just removes duplicate entries if they exist.
3. It fixes Issue #27 and all Unity3D-based games.
I'm not sure about side effects tho, but they seem to be reasonably low from what I've tested.
Thanks for taking a look.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/30
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/30.patch
Repository URL: https://github.com/alsa-project/alsa-lib
