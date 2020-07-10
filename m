Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D778621B3EA
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 13:27:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 630F015E5;
	Fri, 10 Jul 2020 13:26:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 630F015E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594380442;
	bh=pwbQA70yAKzHCHiLm4J+ZYBmnMngvsopuQgL1aenr1k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bOEf15UnHtMETaO4j1b1VTI2232tGOXk9t7doGnrIrp2GWb9QtmX/FdWyGQvGXqvk
	 juQc2fhKgj+OpwqWsRJHmmqeKkYOdZXkG34/lSvf9D8rQ4r1sPf7z+6rTY9OozdXIs
	 jbO5pXxt2rQCn7ny5SfBFPl0KzR9/tKEno3CGSok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D464F8015C;
	Fri, 10 Jul 2020 13:25:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC3A9F8015A; Fri, 10 Jul 2020 13:25:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 35FBFF8011C
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 13:25:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35FBFF8011C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1594380326597882032-webhooks-bot@alsa-project.org>
References: <1594380326597882032-webhooks-bot@alsa-project.org>
Subject: Feature request: volume parameter for aplay
Message-Id: <20200710112538.CC3A9F8015A@alsa1.perex.cz>
Date: Fri, 10 Jul 2020 13:25:38 +0200 (CEST)
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

alsa-project/alsa-utils issue #45 was opened from flatsiedatsie:

I am currently in a situation where I'm trying to play a notification sound when a privacy friendly voice control system hears its wake word. Specifically, it's the [Voco addon](https://github.com/createcandle/voco) for the [Mozilla WebThings Gateway](https://webthingsgateway.com/), an open source smart home controller.

Up till now I used `aplay` for this. But I need/want to support a ReSpeaker USB microphone, and that device doesn't have a simple volume control. Unfortunately addons are not allowed to make changes to asound.conf (which could add softvol) or install something like Pulse audio to mitigate this situation, as those changes could affect other addons of the system.

My current solution has been to switch to a different available audio player, `ffplay`. It has a `-volume` parameter.

Having a `-volume` option actually works out quite nicely, as it allows sounds to be played at relative volume to each other. For example, I can play a music stream at 40% volume, while setting the audio feedback from the voice control to be louder so it can always be heard over the music.

The downside of ffplay is that it's slow to start up. It can take up to a second or two. Aplay's responses were pretty much instant, which I now realise was really valuable and important.

I'd prefer to switch back to aplay, but I'd need to somehow get aplay to output audio at a relative volume.

Is this possible somehow? And if not, would it be an idea to add this feature to aplay?

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/45
Repository URL: https://github.com/alsa-project/alsa-utils
