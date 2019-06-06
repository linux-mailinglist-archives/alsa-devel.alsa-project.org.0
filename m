Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD93373AB
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 13:59:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1B471688;
	Thu,  6 Jun 2019 13:58:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1B471688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559822343;
	bh=J+4BW97FhdCz6wpkvILm0acm3HD8bs92KtCVFeBNPlQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H4MaUZwtZoU2MRStzXGebWOTHNBhv5ZZDRWsWW0/3J+1IMh8f1Lc0m0n0OJPdPxMp
	 PS4IASq8QmGo8IG6Tr6EUNvjcODpKGkBu8HwDFu4hF0rEzTBNW5rHNgaILsDUa3w8X
	 zqBIeB9+Kyrc0Y8DImvwfSFbcAJXyQ3Ama6aH9Lw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38778F896EF;
	Thu,  6 Jun 2019 13:57:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9025F896EF; Thu,  6 Jun 2019 13:57:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D34CF80768
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 13:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D34CF80768
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Jun 2019 04:57:10 -0700
X-ExtLoop1: 1
Received: from irsmsx110.ger.corp.intel.com ([163.33.3.25])
 by orsmga001.jf.intel.com with ESMTP; 06 Jun 2019 04:57:08 -0700
Received: from irsmsx111.ger.corp.intel.com (10.108.20.4) by
 irsmsx110.ger.corp.intel.com (163.33.3.25) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 6 Jun 2019 12:57:08 +0100
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.227]) by
 irsmsx111.ger.corp.intel.com ([169.254.2.175]) with mapi id 14.03.0415.000;
 Thu, 6 Jun 2019 12:57:07 +0100
From: "Ser, Simon" <simon.ser@intel.com>
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: Sending DC offsets to an ALSA device: dangerous?
Thread-Index: AQHVHF72q26QQ4sleEaoHSYsE0saUg==
Date: Thu, 6 Jun 2019 11:57:06 +0000
Message-ID: <74b57974c339abb4e45be3bec2364ccf417d2967.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.181]
Content-ID: <A928624AA0EEF9439115F21DB3140290@intel.com>
MIME-Version: 1.0
Cc: "tvrtko.ursulin@linux.intel.com" <tvrtko.ursulin@linux.intel.com>,
 "martin.peres@linux.intel.com" <martin.peres@linux.intel.com>
Subject: [alsa-devel] Sending DC offsets to an ALSA device: dangerous?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

I've been writing some audio HDMI/DisplayPort tests in the IGT test
suite. As part of the tests I send 200ms DC offsets at 90% of the
maximum amplitude.

Do you know whether doing so is dangerous for some TV speakers? Would
sending the same DC offsets at 25% of the max amplitude be better?

Thanks,

Simon Ser
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
