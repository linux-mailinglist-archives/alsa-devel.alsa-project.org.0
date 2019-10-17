Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E4DAFA1
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 16:16:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73E0F168C;
	Thu, 17 Oct 2019 16:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73E0F168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571321808;
	bh=PYHRzbQH0dLqSUM4EMFFoW26B9XIZknuM3+v2rjmjM0=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=gxsSSJwxxA2Vxm4r1wBGQreCqLNbdiv3HvfefnbrKRd7YHFEHvbizbmbWyo9+JKlY
	 LHGTNdR3Djz/54G+WdoMgC0rxBKh7ywZE4Afj1DqbEsDsGMVYxr5h1Wl4fxy5+S+CO
	 iuF5OidlCCWt0HeskzwJUnuYYSAsYyrlL4A8fbLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8AB7F80528;
	Thu, 17 Oct 2019 16:15:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0B19F804AA; Thu, 17 Oct 2019 16:15:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from sonic306-20.consmr.mail.ir2.yahoo.com
 (sonic306-20.consmr.mail.ir2.yahoo.com [77.238.176.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2D08F80322
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 16:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2D08F80322
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="QsnbepNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1571321697; bh=zPFvFTzIRDMZdY5qPfOlDdD4Q/S1NBRVvOIWNjqXh0w=;
 h=Date:From:Reply-To:To:Cc:Subject:From:Subject;
 b=QsnbepNLbpDNGnm1ONcJj9uYLpeJ6FEoVNa7uDckkwGdUvTDdb5TsDFIG0fD/JRsFqDcim7Tyrv7tOGmMiJbKH6WqfKDnnrEGQwloQNtX8c4JjvxdJRouNuSdwVSa8QE/kw92mJasrMQDKfxojCcHCuzeRa8OYKxMVN+MK5ZwqQr5rGrvY+LBgsRcCa05+CSFf9BfH9XWKKFHC0Mh5E24aABqjJyb0BRwOfjFV+FluQguZqCrFjuE3BWg/peDH6+EFUkZCavQ0TFt8XOc4doOfaKfczwycN10PKLNafGpw1mGRwisOHTBMFD4D8VL0K0f6AdRyPb0pVRzbv6uUOApg==
X-YMail-OSG: nya0Oy4VM1kmzB1.5JJdWuR9Je3Y6rwAgGWoeVr5xTcFL9EXeUP_WGgTOBXhdtw
 SgkrKwOt1qeGvpG3Ey_CuZ5hpCMmyKpe_wPXN92pJpw3NdDyXAwC1BueHkf4rWbTq0Cbc06EF5Kt
 UL9M5.hsp9pwzOg_A4lEQuG_qj8wKWnKjQV3TwPAQGBlLnoGhSZjHPLD2SGLcuaQhShbraN7US.P
 eku1vvpYM25XCcWNRTBD734T3uKij.kf7tzz1H.p0XjpOx2lAoOZkYuSyEDrMNDLTGTBe3wp1oxi
 bDMFTPr5k7GGpNkzlWVtH3wnxOwfmV2yMNXb_PLMYp7_KtAh80cCFmymAXLwwuKYv6xYwxfx04VT
 O__wHvGYSJF5LZWvRtdevmE21cyH3Lo.wkNo2AmO1QAWa08K18md_oZqoSk5z4BS2k34VjmsobvG
 4qXN54NvtmfHSL1VHj.xCDvKE4nT4zhL2hn5CkToOPtuv9CU4Ctf8ilL5S7rVwQ.Zg3wpydgRsZA
 Di72KHT0QqlJwEG53OMd3Yp8M9izP7bR6_wSsmKGF5JXJIaQRyfOOgT3uiRJQ5qgGeO27ERuL49e
 SIoaq1_asvIZpooY1R01jHXrWFUypwLdlxU8lk_ofTtgdN4wZX2h_JY_9Nb4nOyMUf9p_OoRqdrP
 vcfJblPKYfT5CaXlu0z7e23KukOnSqjhAOh5lraWUo5fT8WmjhAba.FUaEK.0tc0aPaYjfgY64Fl
 SBeRuPeU8TjB3yk1l0eQm6.gOnyRfahBrToXBTuBv8hblcoCS_B5MBQsN0WHdkWQlaqrTlZ609G2
 cc.xaBitHnClKUeKZeEqsrN3guXDTXyNdwUP8hlOyVIg_UXEhtfHxUL2iJivREvw0XOqJjOiC4lr
 CsEiS5m0kDg_01vJdepC81XUi5Ez3Jpz6.DTBrRJW5OWNE929VWhUome8lfmR9HBIjr_wRVos231
 gMD1EZUePLA9EVW.dGAzttlwYO7wNSTCDr4oidVOfi5Rz_cf1wqyjbs8Xxi_xqRpcCkJFZAdm1d_
 NgnHfnoXa9MBnq_vHm7utfNDVhTf8MVBwyTx6TDNmvHUTR3slq3FpYthfHa7FWu5H_zF_gc1Kxf4
 8Gwtc9rSa40CF6brRvmtodmh7O_qz.JFqmD28fRV5PE3r9xDJjGGkwL3GS0wuRa0NABlraG2VRcL
 G8w7jV.sdPmQa6FZeE7sGpmhz1.ci.rlYvqFL44f0Me_7I3q4_p89Uq.cIlBlhc6JXAAkbY4hmaX
 jxWruvxQOg0lrssqLy._PXtbffrissHdUu8PSvdAGyNDZMdbyORhILDvohNXNqCoeU8ya_qbBMxM
 RAWqMhPCj1SMd3ZM7lNoh7Fq6j.iAMoYbFp1Q.6Va2fRmZNUi_yn3BI1ysWeYCx3272uK8QyLb0O
 mjfGWlqXNTf3Tw5AjEg9D5h7RWBbyqY2vmho-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ir2.yahoo.com with HTTP; Thu, 17 Oct 2019 14:14:57 +0000
Date: Thu, 17 Oct 2019 14:14:56 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: Yu-Hsuan Hsu <yuhsuan@chromium.org>
Message-ID: <2146461867.4835752.1571321696465@mail.yahoo.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] alsa conformance test fails to run for playback (and
 works for capture)
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

Hi Yu-Hsuan,

I have encountered another problem with the alsa conformance test. It works for capture, but not for playback.

The device is - 

http://wiki.seeedstudio.com/ReSpeaker_6-Mic_Circular_Array_kit_for_Raspberry_Pi/

and running on a pi / raspbian buster.

The actual message is:

Fail - ALSA lib pcm_hw.c:1822:(_snd_pcm_hw_open) Invalid value for card
snd_pcm_open hw:CARD=seeed8micvoi: No such device

I think the truncation is harmless .

The actual device name according to aplay -L is "hw:CARD=seeed8micvoicec,DEV=0" and as I noted earlier, arecord -L shows it as "hw:CARD=seeed8micvoicec,DEV=0" also, and the comformance test running in CAPTURE mode works, just not in PLAYBACK mode.

Is there anything I can do to look further?

Since it says "invalid value", I tried deleting the parameters around line 190 of src/alsa_conformance_helper.c, but perhaps I should do something else?

src/alsa_conformance_helper.c-191-    conformance_timer_start(timer, SND_PCM_OPEN);
src/alsa_conformance_helper.c:192:    rc = snd_pcm_open(handle,
src/alsa_conformance_helper.c-193-                      dev_name,
src/alsa_conformance_helper.c-194-                      stream,
src/alsa_conformance_helper.c-195-                      SND_PCM_NONBLOCK |
src/alsa_conformance_helper.c-196-                      SND_PCM_NO_AUTO_RESAMPLE |
src/alsa_conformance_helper.c-197-                      SND_PCM_NO_AUTO_CHANNELS |
src/alsa_conformance_helper.c-198-                      SND_PCM_NO_AUTO_FORMAT);
src/alsa_conformance_helper.c-199-    conformance_timer_stop(timer, SND_PCM_OPEN);


Regards,
Hin-Tak

 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
