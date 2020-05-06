Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C58351C740B
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 17:17:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45AE51762;
	Wed,  6 May 2020 17:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45AE51762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588778249;
	bh=6RPlapQvlpHLioo4KHEivayhdcbVAT/eqklux13+Irc=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mi7Z4KpeZT3v9apwIMb5rloRIIsYKbMCX+KfyTV9pQMueEvV7tnXsOdkMDSCmFwMS
	 272TKkiAcvOnRSWhLRdyJNWHdYG/cFp8iV/ES7zzT30yiKUStSItF+wmbcQcCP8daz
	 yHv7IgRqUA6jaCN/PBm/nse60MDeRn2onAxmeoOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F4B7F80253;
	Wed,  6 May 2020 17:15:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B406FF80249; Wed,  6 May 2020 17:15:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1218F800AD
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 17:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1218F800AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="SZ4s8CkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; l=1096; q=dns/txt; s=axis-central1;
 t=1588778140; x=1620314140;
 h=date:from:to:subject:message-id:mime-version;
 bh=1A5Xu+qwbB6TnYwgMZ13eHjS8HcwXjwImV3qCZILRvw=;
 b=SZ4s8CkA92P2W2zq4A8pLU8p5SA4pQo0I9PfOJt07iQ3mY/YmJjG85vg
 CF4MAmG2aKSFJgWuqcRybwcpvwIfMbXAPhaFG7+kpImcjLr5Ipe85Q27d
 ojhBcG17Nvzt/tzNC++xXinGHM/67898dpYq60vkQZz9/w/1Ff+hUkXt+
 vSxVg/mm4v6fupd0Je1aY/34/xAxjyZ9Z8GomPnIacT/h0dgpvDdjgt60
 3DN7HrJyGAChCAx/cO4Ml9HrLdtQHe+n26vagqPPmEISQosh54s02Oj6m
 Wd523q9RciJJ+wEhWWkta+97j67NmRPsjbBit6T4SWoUgPVfNqz687kzx Q==;
IronPort-SDR: jKYgtEEk/QGFYjs+gw3TeN2tk4svpPZtpe4sBwpsxhKPMEOhkvWBpHCJd6/lE1VPzBtVwZ87fa
 WMGajTubt3HR46C9frWRr7HoW0kpi3823VFbaV4VOxvseakWHjRaBhcAiRsc6Jxw9ZKwprqAZi
 UlYQG59kiAzDCRhmnTTwl2qHTmWuzp2uI9R9V8Paq/bvU95Nng9zWohR1t+ouypQNjLkRRf1ed
 VqdSKMX1b4lDI5rqQxqViWTa0UdszJIzdcHkqVWfSjBiQZwDW2oCZRAw83ftTWGCBM6YordsFd
 qMw=
X-IronPort-AV: E=Sophos;i="5.73,359,1583190000"; 
   d="scan'208";a="8454512"
Date: Wed, 6 May 2020 17:15:27 +0200
From: Ricard Wanderlof <ricardw@axis.com>
X-X-Sender: ricardw@lnxricardw1.se.axis.com
To: alsa-devel <alsa-devel@alsa-project.org>
Subject: Keeping the codec running at all times
Message-ID: <alpine.DEB.2.20.2005061709110.12526@lnxricardw1.se.axis.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX03.axis.com (10.0.5.17)
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


In certain system-on-chip systems, with separate ADCs and DACs for 
instance, the ADC could generate clocks for the DAC, where it not for the 
fact that ALSA shuts down whatever device is not being used in order to 
conserve power. Is it possible to instruct ALSA not to do this, i.e. once 
a codec has been configured to operate at a given sample rate, it will 
continue to do so, even after all streams have stopped.

I suppose one way to do this would be to change the codec set_bias_level() 
callback so that the BIAS_OFF and BIAS_STANDBY cases don't do anything but 
leave the codec running. But it doesn't sound like a clean way of doing 
this.

Of course, one complication is that at system startup, before any capture 
or playback operations have been attempted, ALSA doesn't know which sample 
rate should be configured, as there is no concept of a 'default sample 
rate'; the sample rate is always set when a stream is opened.

/Ricard
-- 
Ricard Wolf Wanderlof                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
