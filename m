Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C159F3095F4
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Jan 2021 15:38:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BC04165E;
	Sat, 30 Jan 2021 15:37:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BC04165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612017519;
	bh=TAs+Ko98HuoLDbiVScFyi8XcwxAD5kbUQywichfnuGU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jdy+jThG5kmmANYMv3Nt9ASL+RKiAFp454TWVE0TeqXyA/bH/a1/HqZ47Q5m3fl27
	 d/qQeZUGwnJQ2MzqLz8KDo7KeH0AyFz226wQgw0iOr5PoQ+lFYWBerN6LwurVSx6hB
	 8Wf/giojYfz8BJYinq1j5OznT+guxigWWwDdmAu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4AB0F801D8;
	Sat, 30 Jan 2021 15:37:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 541D6F8015B; Sat, 30 Jan 2021 15:37:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id E866BF800BE
 for <alsa-devel@alsa-project.org>; Sat, 30 Jan 2021 15:36:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E866BF800BE
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 7768D804D;
 Sat, 30 Jan 2021 14:36:59 +0000 (UTC)
Date: Sat, 30 Jan 2021 16:36:48 +0200
From: Tony Lindgren <tony@atomide.com>
To: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCHv1] ASoC: cpcap: fix microphone timeslot mask
Message-ID: <YBVvALhY2oM/AMmz@atomide.com>
References: <YAqOSg2z24NpjKDh@mwanda> <20210123172945.3958622-1-sre@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210123172945.3958622-1-sre@kernel.org>
Cc: alsa-devel@alsa-project.org, Merlijn Wajer <merlijn@wizzup.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

* Sebastian Reichel <sre@kernel.org> [210123 17:30]:
> This is compile tested only, since I currently do not have
> my Droid 4 ready for running some tests. Maybe Tony, Pavel or
> Merlijn can give it a go using e.g. arecord.

I just tried recording with arecord -D plughw:CARD=Audio,DEV=1 | hd
but only see the header and no data.. DEV=0 won't produce anything,
maybe I have the alsamixer settings wrong. Let me know if you want
me to try something else.

I do have the pending voice call patches applied on top, voice calls
work just fine with your patch. So as it looks correct to me:

Reviewed-by: Tony Lindgren <tony@atomide.com>

