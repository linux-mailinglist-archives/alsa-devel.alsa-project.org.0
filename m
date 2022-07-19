Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F9D578FE4
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 03:35:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81111170B;
	Tue, 19 Jul 2022 03:34:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81111170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658194504;
	bh=YYfloqsq+vEbk7WHrEc4GcsJrM2Ro3rs5IgHfsewWzA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JxLKn7jty3YL8RR53JiaZ6BGt6wI0IPNud2cwLHXHyMrecYru/CMPs9EqNi7APZK4
	 YOKTllFvLDX4C/OsQRVayxxUsMDksrdjlBfjRjeS2Lrd+spjKN0mbEdc1bq9KhAJx3
	 bEXmRP+fqjhUCz6yHpEXIkXFJcAvokRHQVEF83ZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07722F80224;
	Tue, 19 Jul 2022 03:34:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0BF44F801EC; Tue, 19 Jul 2022 03:34:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 63238F80169
 for <alsa-devel@alsa-project.org>; Tue, 19 Jul 2022 03:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63238F80169
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1658194438061773062-webhooks-bot@alsa-project.org>
References: <1658194438061773062-webhooks-bot@alsa-project.org>
Subject: speaker-test channel descriptions don't match expectations
Message-Id: <20220719013402.0BF44F801EC@alsa1.perex.cz>
Date: Tue, 19 Jul 2022 03:34:02 +0200 (CEST)
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

alsa-project/alsa-utils issue #159 was opened from pfps:

The text output of speaker-test for -c6 appears to indicate that it is using 5+1 channels, with FL, FR, RL, RR, FC, LFE channels (output in a different order).  But the wav files that it uses say FL, FR, RL, ??, FC, Rear Center.  And this channel order doesn't seem correct, as the channels are not down-mixed to stereo correctly on my system with pipewire and pipewire-media-session.

What can be done to get speaker-test and pipewire to agree on the channels?

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/159
Repository URL: https://github.com/alsa-project/alsa-utils
