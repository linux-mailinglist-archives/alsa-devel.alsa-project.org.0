Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8491AE12A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 17:32:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCD5B1669;
	Fri, 17 Apr 2020 17:31:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCD5B1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587137545;
	bh=3C44VZclBvJOz46coRvYR9QWzORm+X9CAir4li1DL90=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oAB6urp7PmtB5Apl2MI7XWHA/dDKxpPerpuPQjoBbspJASxkk68zHiJT4oal8j3Eo
	 fhvX5zImlklaAkS70413KVgk15T5TF9X8mQvuIa6uZZywkVm3n+s/PHVmQ7nX/JioM
	 VLhrNZ52C06BkK4CVXIEripoOhu8h7zlg5ityEtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C7B0F80266;
	Fri, 17 Apr 2020 17:30:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25EE5F80264; Fri, 17 Apr 2020 17:30:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1CA21F800DE
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 17:30:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1CA21F800DE
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mbzdn-1ipIWA0C5f-00da7d; Fri, 17 Apr 2020 17:30:29 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
 by mail.cetitecgmbh.com (Postfix) with ESMTP id CA23C650CBC;
 Fri, 17 Apr 2020 15:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
 by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com
 [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aO044AulWpIr; Fri, 17 Apr 2020 17:30:27 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
 by mail.cetitecgmbh.com (Postfix) with ESMTPS id 7911A64ECEB;
 Fri, 17 Apr 2020 17:30:27 +0200 (CEST)
Received: from pflmmbl.corp.cetitec.com (10.8.5.29) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 17 Apr 2020 17:30:27 +0200
From: Matthias Blankertz <matthias.blankertz@cetitec.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 0/2] ASoC: rsnd: multi-SSI setup fixes
Date: Fri, 17 Apr 2020 17:30:15 +0200
Message-ID: <20200417153017.1744454-1-matthias.blankertz@cetitec.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.8.5.29]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536B64766A
X-Provags-ID: V03:K1:QNcV6Oturueaw/p4lzF3+WWTDTwDcZBnAuBryfo+i2N5dtxH2uq
 +t6Sz/ge4PJmiEuMN90KdNq2xXZ02NBWyuFHv8I9ot/+JtE/D+grmpZfFzqFM502cVrvtu6
 72WW2x5rokNOhTsiB5Ai2akfPhkovaE+x71vXV/8Zo4fpAKfbQbfJOkgW/ah5b5dIjHLY1d
 T5V2ieylNwuNfLpoY2BOw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZY7ZuWAKTR0=:uSfd8DHZnxk85uOJoy4lG4
 3z1WmRTTkv5hQ3LHl/G5PQoBzvji083+YMfUQDrjh8UdZPwapZPXRt4vE5Qg2cHZDw3t1koAZ
 hnYuvEbfX4TPfrnkp6Cwl58P0Z+6Rqb/MYcvMVAu8hFB1rp+J7QKSnfqUGIoDZ+FatOOsnAEZ
 03qJnzM77w0l7Tbsm8liZkYq2HDubdQd9LVkBmavBjNWbV76KZ11bK/sO8ztXDznbTy1DRdow
 rT4RVJG/mRTXXH5q4ixDdETbcPGREjvCDIgWStP7q976pMz40zfuqHdliOMlr/kELehOdZrUi
 PjEI21j6VWkt05BB4bcKoOOdEkEwHRrP2DfWFdMh68EWfuXmxIVjj8qK+G6dEgGCTVt7u8uc7
 wyH6yyvzlHY0vopeqrmCs6TCt3nEtkQ5GTtspI9skT+KBljm0lVTw7bR6ozJwwUNezT4ohQO8
 ONTGib4Sg1+Ew7lM4i1ZGwO9JnKGna9Rx++EVCy+OIoi659eoz1OqejL4VtZFW92bXsLTdYE5
 BDYFi0N7lZSV3BwW7C1T/v8QuJJjY2NeIWSeU7Z5K6AbISYY2tqb583x3zoahfn3UbZktmq6k
 Kn1WOp/SbbtsGC/1GoRf+itfCocvfEefCSNLC5l4XDpbGHW91C23PpC20zNsYbNbeJhlLzxap
 NRDqRwRfjLycKOQ1uQCzUu0e4OhIjs4i7B7Sd+fEnCa11+/sKglNfr4/xTiXgZzygfgFPObT5
 JyMaABfvJYPSflI1XHwWod1bBpoloPaBCjV1Wu8gPceiVJGjCqyNJcrTnCia4EH6sQeofyaZ0
 lenyy2Krirp5kkoB2gelXn1Y1lqjrGHE2tcMUEYu7cG+z5RZlXboz+WSLy/XmqDldzJetU7dE
 k/+OAsmI/bTPWkOQuSkw==
Cc: alsa-devel@alsa-project.org, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-renesas-soc@vger.kernel.org
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

Fix rsnd_dai_call() operations being performed twice for the master SSI
in multi-SSI setups, and fix the rsnd_ssi_stop operation for multi-SSI
setups.
The only visible effect of these issues was some "status check failed"
spam when the rsnd_ssi_stop was called, but overall the code is cleaner
now, and some questionable writes to the SSICR register which did not
lead to any observable misbehaviour but were contrary to the datasheet
are fixed.

Mark:
The first patch kind of reverts my "ASoC: rsnd: Fix parent SSI
start/stop in multi-SSI mode" from a few days ago and achieves the same
effect in a simpler fashion, if you would prefer a clean patch series
based on v5.6 drop me a note.

Greetings,
	Matthias


Matthias Blankertz (2):
  ASoC: rsnd: Don't treat master SSI in multi SSI setup as parent
  ASoC: rsnd: Fix "status check failed" spam for multi-SSI

 sound/soc/sh/rcar/ssi.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

base-commit: 15a5760cb8b6d5c1ebbf1d2e1f0b77380ab68a82
-- 
2.26.1

