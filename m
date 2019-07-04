Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0B15F79C
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2019 14:04:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBF1316A8;
	Thu,  4 Jul 2019 14:03:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBF1316A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562241852;
	bh=kkjVSSVpzXoE7RIm+sOz5xdyOwMkdaYr1lJjhmUDrQw=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YgyLBfXL5yszRqJvXvb/EXjZaEkfHv+ZIn+MwvYBZ+Ed2r1Vutyr2OdWGuZSMZ+Pl
	 UzSyF3SpSrWymjUNBsjfgmQC7IadZpAT19BtniV326TBUYbM72+fqK6iHYofA1/PHT
	 FgS2YtmC03UPc828gh5+7UZiInPP93s77EiwPhjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F4CDF80112;
	Thu,  4 Jul 2019 14:02:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0915F80111; Thu,  4 Jul 2019 14:02:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB19CF800E7
 for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2019 14:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB19CF800E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jul 2019 05:02:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,451,1557212400"; d="scan'208";a="187560152"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2019 05:02:20 -0700
Received: from fmsmsx155.amr.corp.intel.com (10.18.116.71) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 4 Jul 2019 05:02:20 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX155.amr.corp.intel.com (10.18.116.71) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 4 Jul 2019 05:02:20 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.110]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.240]) with mapi id 14.03.0439.000;
 Thu, 4 Jul 2019 20:02:18 +0800
From: "He, Bo" <bo.he@intel.com>
To: "kailang@realtek.com" <kailang@realtek.com>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: audio lost from speaker after reboot from windows on the
 device ALC295
Thread-Index: AdUyX8fMiuN0r83nQWCeaW0Sd+ObdQ==
Date: Thu, 4 Jul 2019 12:02:17 +0000
Message-ID: <CD6925E8781EFD4D8E11882D20FC406D52AB58B6@SHSMSX104.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzE4ZTNhZGMtYjQ0NS00OGRmLWJhYjQtZjA5YTdmZDhiMTc2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidFF2MmlOcjU3NmY3VG9Fb3BuMkJnK25uK3VPYWlCa3RcL08xamVKU2o4aEpqUnBlSVNDTlwvbkVWNHAxTUVxOHdEIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "chiu@endlessm.com" <chiu@endlessm.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "drake@endlessm.com" <drake@endlessm.com>,
 "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "jian-hong@endlessm.com" <jian-hong@endlessm.com>
Subject: [alsa-devel] audio lost from speaker after reboot from windows on
 the device ALC295
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

Hi, patch_realtek.c maintainer:
	I see one issue that reboot from windows and boot to ubuntu, the audio lost from speaker, I suspect there are some bugs in patch_realtek.c drivers,  the device is ALC295 and the device id is 0x10ec0295.

I have done the below experiments:
1. reboot from windows to windows, the audio is persist .
2. reboot from windows to ubuntu, the audio lost from speaker, but can hear if I hotplug one earphone.
3. if the issue reproduce after reboot from windows, reboot the ubuntu can't restore the audio, I suspect it's warm reset.
4. if I write the port 0xcf9 with 0xe to do cold reset, the audio can restore.
5. if I do suspend/resume, the audio can restore, I suspect do cold boot and suspend will trigger the platform reset to reset the ALC295.
6. if I do double function reset (write the verb 0x7ff in alc_init), the audio is still can't restore.
snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_CODEC_RESET, 0); /* Function reset */
snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_CODEC_RESET, 0); /* double Function reset */
7. the issue is first found on kernel 4.19.50, I still see the issue with the latest kernel 5.2-rc2, is it possible windows change some default registers, but ALC295 don't initialize the register?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
