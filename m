Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D610B1DE909
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 16:33:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D07A188A;
	Fri, 22 May 2020 16:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D07A188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590158009;
	bh=zKOlB6KIiIeN+MCz7f+JddlwjKPQvXpiq2WlnNyM6fg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nM3W/j3O6Bt0JGUoQkGXwFyySNnGo28HvZsUHQuxOyZ4hhPOBp9N5WjL+L2P/L+Ge
	 6kLoiz6UkAcegfKVARK9pDq/iQlFzHreiHbBKslfeg0scCHPJGY2O41eXsds/m8Oes
	 wtem30fG2XW0+TzUefa/umF7G7lTPFkatxTtuFTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D28AF801F9;
	Fri, 22 May 2020 16:31:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48C1FF801DA; Fri, 22 May 2020 16:31:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1CB5F801DA
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 16:30:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1CB5F801DA
IronPort-SDR: 9OUV4clZJBrpdOa034lAFkcO3MLbIsWMtXmUTvFK35Vq9IcKnd9Sm7Yoftn7Rc2j8KiGSJtLZK
 xqNdYYETf0pGuI0rZD/epKrBvTlzeiGD/cN0b8Ky12FS4FXSMqN5JNPFUZngM/Ijdwl8JJG3Xd
 +RZ1pZk0uJfxgLHA44R6cxRlNavILVaqlplwpjOWBBDYPmoaCxBAwncQEx6E+x/IUBlBXI4PSM
 WypCrn2rkynN1gk80e7NrmXVc5epQ31emKVjHFb7tbRiGyR4eWE2EaJ+mRx1s7Kt0+CAaevJhl
 NlE=
X-IronPort-AV: E=Sophos;i="5.73,422,1583190000"; 
   d="scan'208";a="8756852"
From: Pavel Dobias <dobias@2n.cz>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH v2 0/2] ASoC: max9867: keep ADCs and DACs always on
Date: Fri, 22 May 2020 16:29:55 +0200
Message-ID: <20200522142957.18364-1-dobias@2n.cz>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200520130131.GG4823@sirena.org.uk>
References: <20200520130131.GG4823@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX01.axis.com (10.0.5.15) To XBOX04.axis.com (10.0.5.18)
Cc: broonie@kernel.org, ladis@linux-mips.org, Pavel Dobias <dobias@2n.cz>
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

On 20. 05. 20 15:01, Mark Brown wrote:
> On Wed, May 20, 2020 at 09:19:02AM +0200, Pavel Dobias wrote:
>> Codec requires enabling of left and right ADCs in the same I2C write
>> operation which isn't fullfilled when controlled from DAPM and
>> causes unexpected behaviour of codec. The similar applies to DACs.
>> Enable ADCs and DACs once at startup and never switch them off
>> to solve the issue.
> It will be normally when the two channels are updated simultaneously
> though that doesn't stop the user doing something to update them
> separately.  In any case this would be better handled through moving the
> power control to either supply widgets or event callbacks rather than
> just giving up on power control entirely.

I found out that the codec requires toggling shutdown bit on each change
of the power management register (stated in the datasheet). I tried
that and it worked, even updating the two channels separately worked,
but toggling the shutdown bit causes a loud speaker crackling which
can't be suppressed by muting the DACs. It seems to me that
the best choice is to avoid changing the power management register
during the codec's operation to suppress speaker crackling.


Pavel Dobias (2):
  ASoC: max9867: add digital microphone controls
  ASoC: max9867: keep ADCs and DACs always on

 sound/soc/codecs/max9867.c | 45 ++++++++++++++++++++++++++++----------
 sound/soc/codecs/max9867.h |  1 -
 2 files changed, 33 insertions(+), 13 deletions(-)

-- 
2.20.1

