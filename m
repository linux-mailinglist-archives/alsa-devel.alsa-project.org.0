Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CBD53B7B5
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 13:22:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5D5E1739;
	Thu,  2 Jun 2022 13:21:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5D5E1739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654168935;
	bh=Eyyn6uZSZk011+e78pZRzhmEG8EmijESpKLexYgXPSY=;
	h=Date:To:Subject:From:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MN/RG/KjbmFTQrR8pqdTxRZQBQUWJ8NKxI3WYAeklVXPYHQQLkx7AZcardgz2+3kT
	 um38Z/Fj/3rW+o/EVUE5atxAtglErYSyyG13c1Fk7CimzhJRNh3GxvV2D1HcVSKRsl
	 ypqwzUivDuaJW92AboeiNLq6WwmHAurj0CdKuEso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 421DAF8025E;
	Thu,  2 Jun 2022 13:21:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08807F80236; Thu,  2 Jun 2022 13:21:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAE76F80149
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 13:21:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAE76F80149
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nwit1-0008VU-3m; Thu, 02 Jun 2022 13:21:07 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nwit0-00013C-BG; Thu, 02 Jun 2022 13:21:06 +0200
Date: Thu, 2 Jun 2022 13:21:06 +0200
To: alsa-devel@alsa-project.org
Subject: Audio mem2mem devices aka asymmetric sample rate converters
Message-ID: <20220602112106.GO2387@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:19:25 up 63 days, 23:49, 80 users,  load average: 0.05, 0.05, 0.09
User-Agent: Mutt/1.10.1 (2018-07-13)
From: Sascha Hauer <sha@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: broonie@kernel.org
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

Hi All,

I am currently looking into getting the asymmetric sample rate converters
(ASRC) found on some i.MX SoCs to do something useful.

The ASRC units are completely independent units, i.e. independent of the rest
of the audio subsystem. They can read from memory using the SDMA engine,
convert sample rates and/or audio formats and write back to memory also using
the SDMA engine. The ASRC on the i.MX8MN has four contexts to convert up to
four streams simultanously. I am not aware of any other non i.MX SoCs having
such a unit, but I am pretty sure they exist on other SoCs as well.

There are likely two usecases for such a unit. First would be to offload sample
rate and format conversions to hardware. The other would be to synchronize
different audio sources/sinks with different master clocks to each other when
the master clocks drift away.

How would such units be integrated into ASoC? I can think of two ways. First
would be to create an separate audio card from them which records on one end
and plays back with a different sample rate / format on the other end, in the
v4l2 world that would be a classical mem2mem device. Is Alsa/ASoc prepared for
something like this? Would it be feasible to go into such a direction? I
haven't found any examples for this in the tree.

The other way is to attach the ASRC to an existing audio card. That is done
with the existing in-tree sound/soc/fsl/fsl_asrc.c and
sound/soc/fsl/fsl_easrc.c drivers.  This approach feels somehow limited as it's
not possible to just do conversions without playing/recording something. OTOH
userspace is unaffected which might be an advantage. What nags me with that
approach is that it's currently not integrated into the simple-audio-card or
audio-graph-card bindings. Currently the driver can only be used in conjunction
with the fsl,imx-audio-* card driver. It seems backward to integrate such a
generic ASRC unit into a special purpose audio card driver. The ASoC core is
fully unaware of the ASRC with this approach currently which also doesn't look
very appealing. OTOH I don't know if ASoC could handle this. Can ASoC handle
for example a chain of DAIs when there are different sample rates and formats
in that chain?

Currently I don't really know how to proceed. It would be great if you could
share some thoughts to this topic.

Thanks,
 Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
