Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DADB93C1F62
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jul 2021 08:32:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 564AB15F2;
	Fri,  9 Jul 2021 08:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 564AB15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625812372;
	bh=a96ifugY96GIiMqWrKhYo2QPPlTIaaW3p6yXtSoBa48=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cd1lHnLi7CYtPPWDeDEEmtz0sv8yVhgI3Ac/6MxCb6ErnSixuU9iqP7pgbzBl2cWK
	 QxRVIYnfv5ab66LQNN2+m4+NLR8o7SV4yQIUQ3NyyJSsIRouKGgKLMGXESXbfMoGv2
	 LLc407O/IIg0sWgAzoRBo7poZOAHg7OTgM3ZBlMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBA34F8025C;
	Fri,  9 Jul 2021 08:31:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 243BBF80224; Fri,  9 Jul 2021 08:31:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from muru.com (muru.com [72.249.23.125])
 by alsa1.perex.cz (Postfix) with ESMTP id 65BC5F80059
 for <alsa-devel@alsa-project.org>; Fri,  9 Jul 2021 08:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65BC5F80059
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 5E2BC80AF;
 Fri,  9 Jul 2021 06:31:22 +0000 (UTC)
Date: Fri, 9 Jul 2021 09:31:05 +0300
From: Tony Lindgren <tony@atomide.com>
To: =?utf-8?B?UMOpdGVy?= Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH v2 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and
 OMAP4 support
Message-ID: <YOftKVAsRaxtEY8n@atomide.com>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
 <20210707173245.GK4394@sirena.org.uk>
 <b800e9ff-c8dc-ca09-8b2d-a750f05edb12@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b800e9ff-c8dc-ca09-8b2d-a750f05edb12@gmail.com>
Cc: hns@goldelico.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com,
 linux-omap@vger.kernel.org
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

* Péter Ujfalusi <peter.ujfalusi@gmail.com> [210708 18:44]:
> Hi Mark, Tony,
> 
> On 07/07/2021 20:32, Mark Brown wrote:
> > On Mon, Jul 05, 2021 at 10:42:44PM +0300, Peter Ujfalusi wrote:
> > 
> >> Mark, Tony:
> >> The ASoC and dts patches can go via separate tree I felt that it is better if
> >> they are together, at least initially.
> > 
> > I'm happy to take both through ASoC?  The patches look fine to me.
> 
> Tony prefers if I leave the TRM documented (but not working) Smart-idle
> mode intact in DT for the McASP and add some quirk via
> drivers/bus/ti-sysc.c.
> Tony, can you confirm it?

Yes let's keep the smart-idle in dts if it's documented in the TRM. And
let's just add a line to drivers/bus/ti-sysc.c for a McASP quirk.

> The ASoC patches are not affected by this, it is just that we need to
> block SIDLE mode in a different way than how I did it in the last patch.
> 
> I'll take a look on how to implement the needed quirk for the McASP
> module, then I can send the dts+ti-sysc patch to linux-omap.

OK sounds good to me.

Regards,

Tony
