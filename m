Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FE84C71D7
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 17:40:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B20A11756;
	Mon, 28 Feb 2022 17:39:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B20A11756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646066443;
	bh=0+DE4Y4zkqTSqcuTcUgN91hRbSGG9ohuLmjbjc9w170=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iiWc60lbb/6qiLWMU51+aQdmEA0gq33I+WAKpaLzXzfNapg7lG7ld/rPV+35LZ/ma
	 iq059upcZWD1fjarL8pdZmC8BDJ1fMbfG5OVL3H4nj67P5WA9LC2MKBhNprF3EO9zE
	 HdaoD69nbDty6TAxQQSr6IE9UMXPhRRTK2n3TGeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 102BFF80154;
	Mon, 28 Feb 2022 17:39:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C92B3F8013C; Mon, 28 Feb 2022 17:39:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from relay4.hostedemail.com (relay4.hostedemail.com [64.99.140.35])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B12FCF800F8
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 17:39:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B12FCF800F8
Received: from omf02.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay09.hostedemail.com (Postfix) with ESMTP id DC0A623715;
 Mon, 28 Feb 2022 16:39:23 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf02.hostedemail.com (Postfix) with ESMTPA id 5F7028000F; 
 Mon, 28 Feb 2022 16:38:49 +0000 (UTC)
Message-ID: <1760d9be590e18b5cccceef6e049651c69556c37.camel@perches.com>
Subject: Re: [PATCH v4 2/2] ALSA: core: Remove redundant variable and return
 the last statement
From: Joe Perches <joe@perches.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Mon, 28 Feb 2022 08:39:21 -0800
In-Reply-To: <s5ha6ebrnbl.wl-tiwai@suse.de>
References: <20220228050253.1649-1-tangmeng@uniontech.com>
 <20220228050253.1649-2-tangmeng@uniontech.com>
 <e5c1ba2f7db29b78066d12dab812b7a1c0a37a81.camel@perches.com>
 <s5ha6ebrnbl.wl-tiwai@suse.de>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Stat-Signature: dtaitigs3myn5hecefhi3rzmhzwsmi5t
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 5F7028000F
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/cTFZr/pNsYnF7B693HsSfdXRXrxvc6LM=
X-HE-Tag: 1646066329-978216
Cc: Meng Tang <tangmeng@uniontech.com>, alsa-devel@alsa-project.org,
 tiwai@suse.com, linux-kernel@vger.kernel.org
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

On Mon, 2022-02-28 at 17:02 +0100, Takashi Iwai wrote:
> On Mon, 28 Feb 2022 06:20:45 +0100, Joe Perches wrote:
> > On Mon, 2022-02-28 at 13:02 +0800, Meng Tang wrote:
> > > Return the result from file->f_op->open() directly instead of
> > > taking this in another redundant variable. Make the typical
> > > return the last statement, return early and reduce the indentation
> > > too.
> > > 
> > > Signed-off-by: Meng Tang <tangmeng@uniontech.com>
> > > Signed-off-by: Joe Perches <joe@perches.com>
> > 
> > Hi Meng Tang.
> > 
> > For the next time: it's not necessary (or even good) to add a sign-off
> > for another person unless they specifically authorize one.
> > 
> > You wrote and are submitting these changes, I merely gave you simple
> > suggestions as to how you could improve them.
> 
> Joe, would you like to drop your S-o-b lines from those two patches?
> Or shall I keep them?
> 
> thanks,
> 
> Takashi

Hi Takashi.

Nominally, the sign-off-by chain shows who pushed these changes upstream
and I did not and I am not an upstream aggregator.

But whatever you choose is OK.
It's not really a concern to me.
I do think these changes are ok.

cheers, Joe

