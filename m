Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB0BB0B83
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Sep 2019 11:36:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97BC582E;
	Thu, 12 Sep 2019 11:35:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97BC582E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568280979;
	bh=iouXHhrMYK7WmohIvTFV52sDEAP80sbHTYlwNLPFQI0=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=hqLey5AQ/Wzsqzs/V9/Gj9Nh84bSyQuREMusUR8Qw8Dqlq8IsxBWiUZaTVpT7Eyzo
	 PEm3GBI4XK0Ol0Q0zAZtFnALLZJu8Q9z3COsobVzYIU4U5r8vFmnKeoqA8FXBKgsjG
	 KZpUSdI655ie8pKoznQtROnjLdXAizzfEaWYmxgU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E706F80393;
	Thu, 12 Sep 2019 11:34:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E38FBF80368; Thu, 12 Sep 2019 11:34:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from sonic306-19.consmr.mail.ir2.yahoo.com
 (sonic306-19.consmr.mail.ir2.yahoo.com [77.238.176.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1540BF801ED
 for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2019 11:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1540BF801ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.b="hGRHc21S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1568280868; bh=9sXSruA5nbXJecrNy/5t4onm6ado6rGc4p8jTIWO6lI=;
 h=Date:From:Reply-To:To:Subject:From:Subject;
 b=hGRHc21S7N8ZzG8Zoe2OxFuo3V2GJsNxeqHM/fO4tNDPEkGTKBzAIgrjp4h5Q00Z+ETdtwWh2rQm3BHo0WjD34msmOAAUe9ULTv9HcPFSVgN550gicMAPxfP7zJhL18Qz4ugbdQgu9+jUnxUchZt25wt9A0CeR1TpI2El8WOcF2WtgPbwz5THIN47HEV/66UhnIFon5H4fJQoXi3YnGdgf+WStDHLNCK4JpdKStvDj1Ccp74VvVNHkAFlu9phxyADIkyLDPeuCRnQDpgpNZYvpl7XkjZ45EC53TbFQ7NGarg+aN4A5XxsBCTPP/1TVPMXm+J7gC/oRPMWzpPONyBrQ==
X-YMail-OSG: pXmSYGIVM1l9rorSthdunCEJY05p4IgeeRrEb4_Yw0obVYlSEVU5ZTZCfQzey_X
 md2pYWUheo4Rz9wl9BjCu4BctxJiiOGtSvW38V_p9D3NRg4XkQC2dJrmd0pR0K_Y.NAgwRHPVRNr
 C2WDRwkuzCOvxRQKt8U.0dnwoRrtdDA4Pm.pwZtA1Ve85owsnyInv7ZqdUbF9VC2LPsnvFvG_2qH
 BbQ2r32cQG__w4mloYQsUGtLeA26uWPYM7IZ0sNx9dNfHMvFPuA_jndC6z6ymZ9_9TKdIqboR.bH
 1VADbeY0NgVLo_etVd1rPOy3phFBAiDyfF7GXQGOs1INu2rtcjzmyQxL8wFF.fnwlqWEfZMhMaLw
 9WAIQhi1uaxtWTrEB7ByziHC66kfX98jYR8EXUet2IYDHJMO0XbaqNSe5hu4I7deN4cy4l.jrfrQ
 i0zlRkXTwvlgMVePrCMQlcQ8pcl9istKWBHDcgLkeY3bU4g_gviLqO_JV14bqZAvCqOCKLl2uZXq
 FRbMVNjoHybYPeHI_CxwysvTExn4UYR_SZTRQ9fHMeptMIyqai27vS_QwxGn7tydOYkGagSlGc9x
 iLvGwfiRL16_NP79548aCp2AIwxJxUsWaZKVKXaZUOeq4vIqetm12nxd5mO9OFv0.173PGrdFWQ0
 lRAbawsFqSRsJSsblQcItzIwKPbOFfrwCM6WCIoYlv1NfaTYSrNtiVAGzxNsKIgia.x1IfCPdZ5a
 KhiyEDH3pRcK2IxbGTBWHTYgzurUma0nXbON61PsZBRVyCIoZcn9IQvkuu15pjb37B58DEckgaVT
 CmpXNYjbcyEErgZ5wP6VIxy1FTsIU4h.ZJFx7Thfg1tVfkOoijSbFJq.ziLoXWmb6gCgGHd6YGCT
 8dRotzAd6FxiCYpVaoQVnOnyiAkANc6WA1FdBAE7qx1Q7y6P8Ys5nz376X1fZCkc8GuyamLQ4XZM
 Cq5h0DYLYNIFAHJxmvWhkmfa0CTU.IQ2oZwCwKvbWdT0TWrc7VHn9Uemhg1wfen9ThcSo3Ikl4x9
 nxQOh0sLo4pGc1TUzZRBAYACTRX13zbXCCfT5PNtR0.mMH7KSm4yOitEa_5zhf7PoebVDOEok5cD
 kWNHsKi1bTg3e8ss9_Akd3X3CSGMOCaTdcoFENmggXC7B6fVc5t5lp8im6bctxkFHv9tBcWVprHN
 k_8kCP8jnIzhqS7x4Un7hk05yDenQBF9KOc1xm2NFuIn1TYGujFEZPMAnNknE55ZcJm0BL727Gfd
 81dCvjl_iFOfhu1uudW0dATBfdLAH6CzyFd_TRXW0okdVakU_hzTglKDstTiyp9RtWvrGlWEMWt1
 vT4_l8BrC3X01rFJLxlQ-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ir2.yahoo.com with HTTP; Thu, 12 Sep 2019 09:34:28 +0000
Date: Thu, 12 Sep 2019 09:34:28 +0000 (UTC)
From: Hin-Tak Leung <htl10@users.sourceforge.net>
To: yuhsuan@chromium.org, alsa-devel@alsa-project.org
Message-ID: <1000767908.8406503.1568280868516@mail.yahoo.com>
MIME-Version: 1.0
Subject: [alsa-devel] alsa compliance test: H340 (USB audio) playback /
 capture rate asymmetry bug?
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

I am using Takashi Iwai's tree grafted onto mainline as DKMS ( as in
https://github.com/HinTak/sound-usb-dkms ).

Running the alsa compliance test 
commit f6167eb77d038b5b7a0d39645e7f2ae7fee6fdc0 (origin/stabilize-12464.B, origin/release-R78-12499.B)

Capture all passed, but play back failed a couple, regarding the sample rate.
It is a small head set with stereo head phone and a mic.
ID 046d:0a38 Logitech, Inc. Headset H340

The question is, for such a cheap headset, why would the playback rate and the capture rate to be different? For many applications/ usages, with a device that's most capture and playback capable, we would like the rates to agree - both pass, or both fail in the same direction?

Is this a hardware or software issue? Or, somebody suggested, I haven't looked, issue with the alsa compliance test itself, possibly regarding frame counts of usb devices?

detail below. 

5 passed, 0 failed
Device Information
	Name: hw:CARD=H340
	Stream: CAPTURE
	Format: ['S16_LE']
	Channels range: [2, 2]
	Rate: [44100]
	Period_size range: [45, 131072]
	Buffer_size range: [90, 262144]
Test Params
	Set channels 2: pass
	Set format S16_LE: pass
	Set rate 44100: pass
Test Rates
	Set rate 44100: pass
Test All Pairs
	Set channels 2, format S16_LE, rate 44100: pass

3 passed, 2 failed
Device Information
	Name: hw:CARD=H340
	Stream: PLAYBACK
	Format: ['S16_LE']
	Channels range: [2, 2]
	Rate: [44100]
	Period_size range: [45, 131072]
	Buffer_size range: [90, 262144]
Test Params
	Set channels 2: pass
	Set format S16_LE: pass
	Set rate 44100: pass
Test Rates
	Set rate 44100: fail - Expected rate is 44100.000000, measure 44092.918362, difference 7.081638 > threshold 4.410000
Test All Pairs
	Set channels 2, format S16_LE, rate 44100: fail - Expected rate is 44100.000000, measure 44093.049192, difference 6.950808 > threshold 4.410000
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
