Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E7EA5930
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Sep 2019 16:22:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CCE616D5;
	Mon,  2 Sep 2019 16:21:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CCE616D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567434153;
	bh=WI6DKa28mV7P9C3HcCd/r1j7jEiWaqAgyeC4H1PxBaE=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=hLOvAFFwdMyymhy6Lgy9cWgQUTihW+LWFJjIIIPWEVo9qlpv580hcgTODGYuIfjUq
	 s+oFsiAuHOJzok2Riwb24uOA7K3x4aUrYtLbYFA0CdvjA1Vw4ggjVS9SbuYlJtefv6
	 sn64WgflWRrHVqMwsBRCkbVhG05bM/qwVEqxIYRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A8DC2F80447;
	Mon,  2 Sep 2019 16:20:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E95F6F803D0; Mon,  2 Sep 2019 16:20:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sonic314-19.consmr.mail.ir2.yahoo.com
 (sonic314-19.consmr.mail.ir2.yahoo.com [77.238.177.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D9A7F802E0
 for <alsa-devel@alsa-project.org>; Mon,  2 Sep 2019 16:20:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D9A7F802E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="n55zAY43"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1567434042; bh=TQWACQe+YsQ5P5DlFZfELiEiXbMrtPX6wDRGbouosr8=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=n55zAY43tMsTLwBs9qLgAqNEIWc+yGv/sStV+lRhOq0mZGZFsQdTH4LP3g3umAiwDOfnQJTIiz2yLJ4f9ilTh/TNlyKIzYv0FAcyQ4EJy4QdUZHFqTtg+Fb9dx1hk5W2NrMkQKDFc6lGMqJIJdujsi57Zbj85pvC6fcR7jDdrlsMV2QWuG9aSftE83EWAk8gLwz6CHPufSGvNEyyBz3rlKasGfs95wY4tL53vL8+H9Z66pfQrAr5iRy/fMac+23d89RXPoyMW9YJKwupGclP11lmN1fnI4kocqluObur3JDPDr+fLcALSW1xijnEJb3pOz6arkFSFzyOagEt2xsqgw==
X-YMail-OSG: B5OrVE4VM1lqxwB2Sgo0.ebbJ4APS0DqHcy.Eu.NNihx2I9.obK4DP18lTpxLoJ
 O52kTQj9FKqR4uMocdPnmOsmsA2ixIZ346BGUxGusMWPpox5zpHl72BKSBI6w0hq0DgNQ7a9QkT8
 y_yNS2qU3_rgZAKOQJ7_b0ZloZ0SOQlsOT8YM0q5aRk86BVoEOzp0nT6Wl40r7yGYDKrXU8MLwhF
 fLVKiNJOfKj.UM3zgG8VU_jhWapny3pn7VB6nYqV6BH4fL.IymZe6lIFaAiIGY7ViRtEdZH1aL24
 vGKrhFGb.dw6LiNUDGQfvH4gRZrMug0HI3Kq.ze9HQq29aE1..xb5SaeR8FwsIAVBhS1ajXSb2_o
 rfFcCEpK5VDUBbJIhHbcjwSoFiCVez9nGzfgcAg1Gi5Ubuwxw4stGKr6eBL6VNGgzTGtoyDszbyo
 KMlgWmNPyv3cLU3o6ajV2iPS1YccleNPCs9exX82vvUvTPdy_NTgPJfTLS8VC5fYVHvE9UgpmNaQ
 hMqJRt_HQWjqARO_Iiyer45Wpr7nQ2szZGcSO_84JfBfaJR5w7vVFnw93.HvwAvFdMIfZ7fdYFxK
 W36Xm4ntEQy_s8g.0qYbWTdIM39nkMVTZscydosRtvn.XUnsnkC1oyxZZ8tWAyU5VGtVCygWY1wR
 PpgguKSNcyHC5_CHzghUu8_eVouEF.lK2IRxW7WY6iYw1YEL40bwPOX6WeFwksqfeP_5Z7t2u7KN
 alSWNkQXsVlf1DCKASS8TmhFT2jeLnqPtks0h95XZFNA4luIr3zetGUco3JwQxv.yoRGKsWhOABk
 eT9mLWyW94hu7Aawdtc1Pr0diOqnvzc6qzalqK2V.eoYNks2nTdZshwp0sGsNJGeVXbIUfLh4Opu
 QtokckIo4hpCSenf5pt.xBDOna3zZ_kv1EMJzfbaQ_O2gseY3uLg95ftlS0b4gUT9HZss9ng4gnZ
 q84LAJYQF55fC1pQLieePCBEslbgFP20ErP.TJTRoQfAlcboITjFSby2dIMtba1q2L9MoYz6hQm6
 hiCNYuB4QuBYEy1RmkCcPis7fUwj.QmJUrVQeQDFaUSZ71EX.LRptGawR4zmEOshzihcHDSQkEj7
 GqU16oRMo5Uswy48eRh5okDV_HImODHPn70r72sAyCe1xNBj36Dzfh4rnxdHKiOIgdd42uAGz9.t
 NGsNNa.BC971zyD59X1VdihOc.xyz_wJ3sKiGd.8nHcsUELBKTQKQ4Qn6p_rQWb4ByURBiqSIkvL
 CZWUNEk1llIN9jeAU.rYjT_sxdDAtCuYFBuzXQOnEDPBmb4OXswBznUrpHghXug--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ir2.yahoo.com with HTTP; Mon, 2 Sep 2019 14:20:42 +0000
Date: Mon, 2 Sep 2019 14:20:38 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Message-ID: <958663156.1940472.1567434038770@mail.yahoo.com>
In-Reply-To: <20190902130606.GA4911@workstation>
References: <1091462655.1815609.1567426196596@mail.yahoo.com>
 <20190902130606.GA4911@workstation>
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, g@b4.vu
Subject: Re: [alsa-devel] sound/usb kernel modules as a DKMS package.
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
Reply-To: htl10@users.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

 

On Monday, 2 September 2019, 14:31:24 BST, Takashi Sakamoto <o-takashi@sakamocchi.jp> wrote:

...
> > https://github.com/HinTak/sound-usb-dkms
...

> As a quick glance, the repository is just for deb-based distributions.
> From my experience, users who eager to use the latest source codes tend
> to use Arch Linux and Gentoo Linux. It's helpful for the users to
> include some instructions just to use the code with DKMS system. Then
> you could get any feedback from them as well.

I added some quick instructions for non-Ubuntu/Debian systems. On the whole, it doesn't really add much to the work, as the debian packaging process really just auto-generates/insert the module version into the dkms.conf template I wrote. So for non-Ubuntu/Debian system, it is a matter of deciding on a version and edit/insert it manually, and copy the rest into the right place onto a system.  
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
