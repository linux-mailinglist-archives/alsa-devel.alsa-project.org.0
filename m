Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EAD34B90
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2019 17:06:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3674716A6;
	Tue,  4 Jun 2019 17:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3674716A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559660817;
	bh=I/jxjht1x0zBb2YejibTbdEHFU0qM+gU8V5nwfrTbEs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JHXiiMqkHG0KKt+WffXQaxPIsBhwLEbEH+sybuQn2cnfo97cBIkBiYFyi0qE9Ujl0
	 CJnt3ZMMUFttWt2hKYogmgXtEtPwkvrIwQGV+hhSwwAOf1TgyCCxEsd7Q352dI9OsI
	 6rWIP7KQPah61HeM7pL+niNF5TtInYfzUsHQdZao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEA28F896F8;
	Tue,  4 Jun 2019 17:05:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5DBDF896F7; Tue,  4 Jun 2019 17:05:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3AF2DF89673
 for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2019 17:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AF2DF89673
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2019 08:05:39 -0700
X-ExtLoop1: 1
Received: from irsmsx107.ger.corp.intel.com ([163.33.3.99])
 by orsmga006.jf.intel.com with ESMTP; 04 Jun 2019 08:05:39 -0700
Received: from irsmsx104.ger.corp.intel.com ([169.254.5.93]) by
 IRSMSX107.ger.corp.intel.com ([169.254.10.142]) with mapi id 14.03.0415.000;
 Tue, 4 Jun 2019 16:05:38 +0100
From: "Ser, Simon" <simon.ser@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: Linking ALSA playback devices and DRM connectors
Thread-Index: AQHVGub3qPpDIp0ZmkGUsrmQWEy2vg==
Date: Tue, 4 Jun 2019 15:05:37 +0000
Message-ID: <f69f48bd4b9b2dc6f8228cd47406882c71758cdf.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.72.181]
Content-ID: <391125E733B4D941BB49D82C9C9A0F19@intel.com>
MIME-Version: 1.0
Subject: [alsa-devel] Linking ALSA playback devices and DRM connectors
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

I'm trying to link ALSA playback devices and DRM connectors. In other
words, I'd like to be able to know which ALSA device I should open to
play audio on a given connector.

Unfortunately, I haven't found a way to extract this information. I
know /proc/asound/cardN/eld* expose the EDID-like data. However by
looking at the ALSA API (also: aplay -l and -L) I can't find a way to
figure out which PCM device maps to the ELD.

Am I missing something?

If not, what would be the best way to expose this?

- A symlink to the ALSA audio PCM device in
  /sys/class/drm/cardN-CONNECTOR?
- A symlink to the DRM connector in /sys/class/sound/pcm*?
- A DRM connector property?
- Somehow expose the connector name via the ALSA API?
- Expose the connector EDID via ALSA?
- Other ideas?

Thanks!

Simon Ser
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
